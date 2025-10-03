	# - CHECK AND STORE DIFFICULTY -

execute store result score @p current_difficulty run difficulty



	# - MISC BOGGED LOGIC -

execute as @a if items entity @s weapon.mainhand minecraft:shears run tag @s add hold_shears
execute as @a unless items entity @s weapon.mainhand minecraft:shears run tag @s remove hold_shears
execute as @e[type=skeleton_horse,team=bogged_horse] at @s if entity @p[tag=hold_shears,distance=..5] run effect give @s slowness 1 255 true

execute as @a if items entity @s weapon.mainhand minecraft:bone_meal run tag @s add hold_bonemeal
execute as @a unless items entity @s weapon.mainhand minecraft:bone_meal run tag @s remove hold_bonemeal
execute as @e[type=skeleton_horse,team=shorn_bog_horse] at @s if entity @p[tag=hold_bonemeal,distance=..5] run effect give @s slowness 1 255 true



	# - MISC SKELETON -> WITHER SKELETON LOGIC -

execute as @a if items entity @s weapon.mainhand minecraft:wither_rose run tag @s add hold_wth_rose
execute as @a unless items entity @s weapon.mainhand minecraft:wither_rose run tag @s remove hold_wth_rose
execute as @e[type=skeleton_horse,team=skeleton_horse] at @s if entity @p[tag=hold_wth_rose,distance=..5] run effect give @s slowness 1 255 true



	# - WITHER SKELETON EFFECTS -

# Wither skeleton horses are given golden boots with a custom enchantment which provides the wearer with immunity to fire, withering, and also the projectiles shot by the Wither itself.

item replace entity @e[type=skeleton_horse,team=wither_horse] armor.feet with golden_boots[custom_name="UHV Booties - Wither Immunity",enchantments={binding_curse:1,vanishing_curse:1,wither_horse_immunity:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]



	# - MISC DROWNED LOGIC -

# If a zombie, husk, or drowned horse tries to go underwater and is being riden by a non-player entity, their passenger will be kicked off.

execute as @e[type=zombie_horse] on passengers at @s if entity @s[type=!player] if block ~ ~1.5 ~ #uhv:always_waterlogged run ride @s dismount



	# - TRAP CONVERSION -

# If a trapped skeleton horse converts into a stray or bogged horse, their "SkeletonTrap" value will be set to 0 and the appropriate trap tag will be added.
# For stray horses, there's an additional command which will give them a saddle.

tag @e[type=skeleton_horse,team=stray_horse,tag=vanilla_trap] add stray_horse_trap
item replace entity @e[type=skeleton_horse,team=stray_horse,tag=vanilla_trap] saddle with saddle
execute as @e[type=skeleton_horse,team=stray_horse,tag=vanilla_trap] run data modify entity @s SkeletonTrap set value 0
tag @e[type=skeleton_horse,team=stray_horse,tag=vanilla_trap] remove vanilla_trap

tag @e[type=skeleton_horse,team=bogged_horse,tag=vanilla_trap] add bogged_horse_trap
execute as @e[type=skeleton_horse,team=bogged_horse,tag=vanilla_trap] run data modify entity @s SkeletonTrap set value 0
tag @e[type=skeleton_horse,team=bogged_horse,tag=vanilla_trap] remove vanilla_trap



	# - MISC SPONGE YOUR HORSE LOGIC -

# Zombie horses and drowned horses look at players if they are holding a sponge.

execute as @a if items entity @s weapon.mainhand minecraft:sponge run tag @s add hold_sponge
execute as @a unless items entity @s weapon.mainhand minecraft:sponge run tag @s remove hold_sponge
execute as @e[type=zombie_horse,team=!husk_horse] at @s if entity @p[tag=hold_sponge,distance=..5] run effect give @s slowness 1 255 true


# If a zombie horse or drowned horse enters water, their sponge_counter will be reset to zero.

execute as @e[type=zombie_horse,team=!husk_horse,scores={sponge_counter=1..}] at @s if block ~ ~ ~ #uhv:always_waterlogged run particle minecraft:dolphin ~ ~ ~ 0.5 0.5 0.5 0.1 50
execute as @e[type=zombie_horse,team=!husk_horse,scores={sponge_counter=1..}] at @s if block ~ ~ ~ #uhv:always_waterlogged run playsound minecraft:block.bubble_column.upwards_ambient neutral @a ~ ~ ~ 1 1
execute as @e[type=zombie_horse,team=!husk_horse,scores={sponge_counter=1..}] at @s if block ~ ~ ~ #uhv:always_waterlogged run scoreboard players reset @s sponge_counter



	# - INTERACTION ENTITIES -

# This has been hair-tuggingly annoying and finicky to get working...
# For some unknown reason, the exact same functions would behave differently depending on the specific variables used?
# Like, using a sponge on a zombie horse would work fine, but with any of the others, their respective interaction entities refused to summon properly despite their functions working fine when called manually.
# Or sometimes the interaction would show up fine for one of the bogged horses, but for another, identical bogged horse (except for the UUID) it wouldn't work?
# Sometimes they would work for a while and then just... stop? Or the interactions would flicker? I still don't know why any of these issues occurred.

# HOWEVER, I did get things to work! Somehow! Sooooo...uh.. problem solved, I guess!


# Put simply, the functions below keep track of two things:
# One, whether or not a player is currently holding an item which allows for them to interact with one of the undead horses, and-
# Two, whether or not an undead horse is able to be interacted with.
# Using this information, the "interaction_entities" function/advancement is able to summon interaction entities when needed.
# Afterwards, "clear_interactions" cleans up the mess it leaves behind, killing interaction entities once they're no longer necessary.
# When a player interacts with an interaction entity, the appropriate function/advancement combo is called.
# These combos are "shear_bog_horse", "bonemeal_bog_horse", "feed_wither_rose", and "sponge_your_horse".

scoreboard players set @a[predicate=uhv:target_bog] target_bog 1
scoreboard players set @a[predicate=uhv:target_shorn] target_shorn 1
scoreboard players set @a[predicate=uhv:target_held_rose] target_held_rose 1
scoreboard players set @a[predicate=uhv:target_held_sponge] target_held_sponge 1

scoreboard players reset @a[predicate=!uhv:target_bog] target_bog
scoreboard players reset @a[predicate=!uhv:target_shorn] target_shorn
scoreboard players reset @a[predicate=!uhv:target_held_rose] target_held_rose
scoreboard players reset @a[predicate=!uhv:target_held_sponge] target_held_sponge

tag @e[type=skeleton_horse,team=bogged_horse] add uhv_interactable
tag @e[type=skeleton_horse,team=shorn_bog_horse] add uhv_interactable
tag @e[type=skeleton_horse,team=skeleton_horse] add uhv_interactable
tag @e[type=zombie_horse,team=!husk_horse] add uhv_interactable

tag @e[type=skeleton_horse,team=stray_horse] remove uhv_interactable
tag @e[type=skeleton_horse,team=wither_horse] remove uhv_interactable
tag @e[type=zombie_horse,team=husk_horse] remove uhv_interactable



	# - APPLY EFFECTS/BEHAVIOR MODIFIERS TO MOUNTS -

# Since I removed zombie horses from the vanilla tag, "dismounts_underwater", drowned horses are now able to be ridden while submerged underwater.
# However, this means that a command had to be added which replicates the vanilla underwater dismount behavior but ONLY applies it to zombie horses and husk horses, NOT drowned horses.
# There's also another command which will apply this same behavior to the drowned horses if the score responsible for enabling it has been set to 2.

execute unless score toggle uhv_horses_swim matches 1 as @e[type=zombie_horse,team=!drowned_horse] on passengers at @s if block ~ ~1.5 ~ #uhv:always_waterlogged run ride @s dismount
execute if score toggle drowned_horses_swim matches 2 as @e[type=zombie_horse,team=drowned_horse] on passengers at @s if block ~ ~1.5 ~ #uhv:always_waterlogged run ride @s dismount


# Giving entities leather armor prevents them from taking freeze damage. As such, skeleton horses are given leather tunics while in powder snow.
# Their tunic will be removed if they're converted into a bogged horse or a wither skeleton horse. If bonus effects are disabled, stray horses will also be given a leather tunic.

item replace entity @e[type=skeleton_horse,team=skeleton_horse] armor.chest with leather_chestplate[custom_name="UHV Tunic - Skeleton Horse",enchantments={binding_curse:1,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvtunic",operation:add_value}]]
execute as @e[type=skeleton_horse,team=!skeleton_horse] if items entity @s armor.chest leather_chestplate[custom_name="UHV Tunic - Skeleton Horse"] run item replace entity @s armor.chest with air

execute if score toggle uhv_bonuses matches 0 run item replace entity @e[type=skeleton_horse,team=stray_horse] armor.chest with leather_chestplate[custom_name="UHV Tunic",enchantments={binding_curse:1,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvtunic",operation:add_value}]]


# If gameplay bonuses are enabled, the function responsible for those will also run.

execute if score toggle uhv_bonuses matches 1 run function uhv:effects

# If not, then any UHV Booties will be obliterated except for boardwalk boots.

execute if score toggle uhv_bonuses matches 0 as @a on vehicle if items entity @s[type=#uhv:undead_horses] armor.feet *[custom_name="UHV Booties"] run item replace entity @s armor.feet with air
execute if score toggle uhv_bonuses matches 0 as @e[type=#uhv:undead_horses,team=!drowned_horse] if items entity @s armor.feet *[custom_name="UHV Booties"] run item replace entity @s armor.feet with air
execute if score toggle uhv_bonuses matches 0 as @e[type=zombie_horse,team=drowned_horse] unless data entity @s Passengers if items entity @s armor.feet *[custom_name="UHV Booties"] run item replace entity @s armor.feet with air



	# - TRIGGER TRAPS -

execute at @e[type=#uhv:undead_horses,tag=uhv_trap] if entity @p[distance=..10] run summon lightning_bolt ~ ~-10 ~

execute as @e[type=skeleton_horse,tag=stray_horse_trap] at @s if entity @p[distance=..10] run function uhv:summon_trap/stray
execute as @e[type=skeleton_horse,tag=bogged_horse_trap] at @s if entity @p[distance=..10] run function uhv:summon_trap/bogged
execute as @e[type=skeleton_horse,tag=wither_horse_trap] at @s if entity @p[distance=..10] run function uhv:summon_trap/wither
execute as @e[type=zombie_horse,tag=zombie_horse_trap] at @s if entity @p[distance=..10] run function uhv:summon_trap/zombie
execute as @e[type=zombie_horse,tag=drowned_horse_trap] at @s if entity @p[distance=..10] run function uhv:summon_trap/drowned
execute as @e[type=zombie_horse,tag=husk_horse_trap] at @s if entity @p[distance=..10] run function uhv:summon_trap/husk



execute if score toggle uhv_enabled matches 1 run schedule function uhv:run_if_enabled_4t 4t