	# - UNDEAD HORSES BURN IN DAYLIGHT -

# If "burn_uhv_horses" is enabled, then skeleton and zombie horses will be set on fire if the predicate "uhv:burn_undead" is true.
# This predicate checks three things. One, if it's daytime. Two, if the sky is visible. Three, the entity's periodic tick. This last part means that the predicate will only be true every 20 ticks (1 second).

execute if score toggle burn_uhv_horses matches 1 as @e[type=#uhv:undead_horses,team=!husk_horse,team=!wither_horse,predicate=uhv:burn_undead] run data modify entity @s Fire set value 160s



	# - MISC ZOMBIE CURING LOGIC -

# If a zombie, drowned, or husk horse has started being cured into a regular horse (handled by the "cure_zombie_horse" function), finish the conversion.

scoreboard players remove @e[type=zombie_horse,scores={cure_counter=1..6000}] cure_counter 1
execute as @e[type=zombie_horse,scores={cure_counter=1..6000}] run data modify entity @s TicksFrozen set value 140
execute as @e[type=zombie_horse,scores={cure_counter=1..6000}] run effect give @s strength 1 1 false
execute as @e[type=zombie_horse,scores={cure_counter=..1}] at @s run function uhv:zombie_horse_cured



	# - CONVERT SKELETON TO STRAY -

# If a skeleton horse is in powder snow, 1 will be added to their "stray_counter" objective each tick.
# Upon leaving the powder snow, this value will begin to drop by 2 each tick.
# Once submerged for more than 7s but less than 22s, their "TicksFrozen" value will be set to 130, causing them to shake.
# After being submerged for 22s, the skeleton horse will be added to the "stray_horse" team. This causes the resource pack to change the texture accordingly.
# Next time the tracker function runs, it will remove the "stray_counter" since it's no longer needed.

# To prevent the skeleton horses and stray horses from taking freeze damage, they're both given leather gear by "run_if_enabled_4t".

execute as @e[type=skeleton_horse,team=skeleton_horse] at @s if block ~ ~ ~ powder_snow run scoreboard players add @s stray_counter 1
execute as @e[type=skeleton_horse,team=skeleton_horse,scores={stray_counter=2..}] at @s unless block ~ ~ ~ powder_snow run scoreboard players remove @s stray_counter 2
execute as @e[type=skeleton_horse,team=skeleton_horse,scores={stray_counter=140..}] run data modify entity @s TicksFrozen set value 140
execute as @e[type=skeleton_horse,team=skeleton_horse,scores={stray_counter=440..}] at @s run playsound minecraft:entity.skeleton.converted_to_stray neutral @a ~ ~ ~ 1 0.5
team join stray_horse @e[type=skeleton_horse,team=skeleton_horse,scores={stray_counter=440..}]



	# - CONVERT SKELETON TO BOGGED -

# If a skeleton horse is submerged in swamp water, 1 will be added to their "bog_counter" objective each tick.
# Upon leaving the water, their "bog_counter" objective will be reset to 0.
# Once submerged for more than 30s but less than 45s, "TicksFrozen" will be set to 140, causing them to shake.
# Since they aren't in powder snow, this value will automatically lower by 2 every tick, preventing them from taking damage.
# After being submerged for 45s, the skeleton horse will be added to the "bogged_horse" team. This causes the resource pack to change the texture accordingly.
# Next time the tracker function runs, it will remove the "bog_counter" since it's no longer needed.

execute as @e[type=skeleton_horse,team=skeleton_horse] at @s if biome ~ ~ ~ #uhv:spawns_bogged_horses if block ~ ~1 ~ #uhv:always_waterlogged run scoreboard players add @s bog_counter 1
execute as @e[type=skeleton_horse,team=skeleton_horse] at @s if block ~ ~1 ~ air run scoreboard players set @s bog_counter 0
execute as @e[type=skeleton_horse,team=skeleton_horse,scores={bog_counter=600..900}] run data modify entity @s TicksFrozen set value 140
execute as @e[type=skeleton_horse,team=skeleton_horse,scores={bog_counter=900..}] run playsound minecraft:entity.bogged.ambient neutral @a ~ ~ ~ 3 0.5
execute as @e[type=skeleton_horse,team=skeleton_horse,scores={bog_counter=900..}] run playsound minecraft:entity.zombie_villager.converted neutral @a ~ ~ ~ 0.5 0.7
execute as @e[type=skeleton_horse,team=skeleton_horse,scores={bog_counter=900..}] run playsound minecraft:block.bubble_column.whirlpool_ambient neutral @a ~ ~ ~ 1 1
team join bogged_horse @e[type=skeleton_horse,team=skeleton_horse,scores={bog_counter=900..}]



	# - MISC SKELETON -> WITHER SKELETON LOGIC -

# If a skeleton horse has started being converted to a wither skeleton horse (handled by the "feed_wither_rose" function), finish the conversion.

scoreboard players add @e[type=skeleton_horse,team=skeleton_horse,scores={wth_counter=1..}] wth_counter 1
execute as @e[type=skeleton_horse,team=skeleton_horse,scores={wth_counter=1..140}] run data modify entity @s TicksFrozen set value 140
execute at @e[type=skeleton_horse,team=skeleton_horse,scores={wth_counter=1..140}] run particle entity_effect{color:[0.45,0.38,0.34,1.0]} ~ ~1 ~ 0.3 0.3 0.3 0 1
execute at @e[type=skeleton_horse,team=skeleton_horse,scores={wth_counter=140..}] run playsound minecraft:entity.zombie_villager.converted neutral @a ~ ~ ~ 1 0.7
team join wither_horse @e[type=skeleton_horse,team=skeleton_horse,scores={wth_counter=140..}]



	# - WITHER SKELETON SCALE -

execute as @e[type=skeleton_horse,team=wither_horse,tag=!wither_scale] run attribute @s minecraft:scale base set 1.1
tag @e[type=skeleton_horse,team=wither_horse] add wither_scale



	# - CONVERT HUSK TO ZOMBIE -

# If a husk horse is submerged in water, 1 will be added to their "hydr_counter" objective each tick.
# Upon leaving the water, their "hydr_counter" objective will be reset to 0.
# Once submerged for more than 30s but less than 45s, "TicksFrozen" will be set to 140, causing them to shake.
# Since they aren't in powder snow, this value will automatically lower by 2 every tick, preventing them from taking damage.
# After being submerged for 45s, the husk horse will be added to the "zombie_horse" team. This causes the resource pack to change the texture accordingly.
# The "hydr_counter" will then be removed since it's no longer needed.

execute as @e[type=zombie_horse,team=husk_horse,tag=!uhv_trap] at @s if block ~ ~1 ~ #uhv:always_waterlogged run scoreboard players add @s hydr_counter 1
execute as @e[type=zombie_horse,team=husk_horse] at @s if block ~ ~1 ~ air run scoreboard players set @s hydr_counter 0
execute as @e[type=zombie_horse,team=husk_horse,scores={hydr_counter=600..900}] run data modify entity @s TicksFrozen set value 140
execute at @e[type=zombie_horse,team=husk_horse,scores={hydr_counter=900..}] run playsound minecraft:entity.husk.converted_to_zombie neutral @a ~ ~ ~ 1 0.7
team join zombie_horse @e[type=zombie_horse,team=husk_horse,scores={hydr_counter=900..}]



	# - CONVERT ZOMBIE TO DROWNED -

# If a zombie horse is submerged in water, 1 will be added to their "drw_counter" objective each tick.
# Upon leaving the water, their "drw_counter" objective will be reset to 0.
# Once submerged for more than 30s but less than 45s, "TicksFrozen" will be set to 140, causing them to shake.
# Since they aren't in powder snow, this value will automatically lower by 2 every tick, preventing them from taking damage.
# After being submerged for 45s, the zombie horse will be added to the "drowned_horse" team. This causes the resource pack to change the texture accordingly.
# The "drw_counter" will then be removed since it's no longer needed.

execute as @e[type=zombie_horse,team=zombie_horse,tag=!uhv_trap] at @s if block ~ ~1 ~ #uhv:always_waterlogged run scoreboard players add @s drw_counter 1
execute as @e[type=zombie_horse,team=zombie_horse] at @s if block ~ ~1 ~ air run scoreboard players set @s drw_counter 0
execute as @e[type=zombie_horse,team=zombie_horse,scores={drw_counter=600..900}] run data modify entity @s TicksFrozen set value 140
execute at @e[type=zombie_horse,team=zombie_horse,scores={drw_counter=900..}] run playsound minecraft:entity.zombie.converted_to_drowned neutral @a ~ ~ ~ 1 0.7
team join drowned_horse @e[type=zombie_horse,team=zombie_horse,scores={drw_counter=900..}]



	# - MISC DROWNED LOGIC -

# Prior to their drowned riders either dying or being despawned, drowned horses have golden boots with a custom enchantment, "boardwalk boots", which acts similarly to frost walker.
# I would've preferred to have the drowned ride their steeds underwater, but the annoying buggers flail their limbs around the second they're submerged. It looks ridiculous. Their legs literally clip through their mounts.
# Then I tried to make the horses swim while being riden by drowned, but their pathfinding did NOT like that. In protest, they started spinning in circles wildly.
# ...They didn't sink though!

# I started working on this well before "Mounts of Mayhem" was announced and I suspect that once it's released, I'll update this datapack/mod to implement underwater drowned horsemen as a toggleable option.
# Chances are, once the update is out, drowned will no longer flail around when riding zombie horses underwater. I expect this to be the case for two reasons...
# One, drowned will be able to ride nautilus underwater, which means that their riding animation will need to be prioritized over their swimming animation.
# Two, zombie horsemen will finally be added to vanilla! And what will happen if a zombie horseman drowns? We'd end up with a drowned riding on a zombie horse.


# If a trapped drowned horse is underwater and there's a player within 11 blocks of them, their trap tags will be removed.

execute as @e[type=zombie_horse,tag=drowned_horse_trap] at @s if entity @a[distance=..11] if block ~ ~1 ~ #uhv:always_waterlogged run tag @s remove uhv_trap
execute as @e[type=zombie_horse,tag=drowned_horse_trap] at @s if entity @a[distance=..11] if block ~ ~1 ~ #uhv:always_waterlogged run tag @s remove drowned_horse_trap


# If a drowned horse has boardwalk boots, add "boardwalk_boots" tag to them.
execute as @e[type=zombie_horse,team=drowned_horse,tag=!boardwalk_boots] if items entity @s armor.feet golden_boots[minecraft:enchantments={binding_curse:1,boardwalk_boots:1,depth_strider:3,vanishing_curse:1}] run tag @s add boardwalk_boots

# Once a drowned horse stops wearing boardwalk boots, their "uhv_pos_y" score will be reset since we no longer need to store their Y value.
execute as @e[type=zombie_horse,tag=!boardwalk_boots] run scoreboard players reset @s uhv_pos_y


# Drowned horses spawned from traps all have a marker entity riding them. If a marker detects that it is no longer riding a drowned horse with boardwalk boots, the boardwalk is replaced with water and the marker is killed.

execute as @e[type=marker,tag=boardwalk_marker,predicate=uhv:boardwalk_horse_not_found] at @s run fill ~4 ~-6 ~4 ~-4 ~ ~-4 water replace spruce_slab[type=top,waterlogged=true]
execute as @e[type=marker,tag=boardwalk_marker,predicate=uhv:boardwalk_horse_not_found] run kill @s


# Everything else is handled by the boardwalk_boots1 and boardwalk_boots2 functions. The former is called by "run_if_enabled_1t" while the latter is called by the "boardwalk_boots" enchantment.
# Speaking of which, it turns out that the only command that actually works with custom enchantments is "/enchant". Solution: just lie and tell the game that the custom enchantment is vanilla!

execute as @e[type=zombie_horse,tag=boardwalk_boots] at @s run function uhv:boardwalk_boots1



	# - LOOKING BEHAVIOR -

execute as @e[type=skeleton_horse,team=bogged_horse] at @s if entity @p[tag=hold_shears,distance=..5] run rotate @s facing entity @p[tag=hold_shears]
execute as @e[type=skeleton_horse,team=shorn_bog_horse] at @s if entity @p[tag=hold_bonemeal,distance=..5] run rotate @s facing entity @p[tag=hold_bonemeal]
execute as @e[type=skeleton_horse,team=skeleton_horse] at @s if entity @p[tag=hold_wth_rose,distance=..5] run rotate @s facing entity @p[tag=hold_wth_rose]
execute as @e[type=zombie_horse,team=!husk_horse] at @s if entity @p[tag=hold_sponge,distance=..5] run rotate @s facing entity @p[tag=hold_sponge]
execute as @e[type=zombie_horse,predicate=uhv:weakened] at @s if entity @p[tag=hold_golden_carrot,distance=..5] run rotate @s facing entity @p[tag=hold_golden_carrot]