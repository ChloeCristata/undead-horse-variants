# I better not have forgotten anything...


scoreboard players reset @a current_difficulty
scoreboard players reset @a uhv_pos_y
scoreboard players reset @e[type=#uhv:undead_horses] uhv_pos_y
scoreboard players reset @e[type=#uhv:undead_horses] drw_counter
scoreboard players reset @e[type=#uhv:undead_horses] hydr_counter
scoreboard players reset @e[type=#uhv:undead_horses] husk_counter
scoreboard players reset @e[type=#uhv:undead_horses] stray_counter
scoreboard players reset @e[type=#uhv:undead_horses] bog_counter
scoreboard players reset @e[type=#uhv:undead_horses] wth_counter
scoreboard players reset @a target_bog
scoreboard players reset @a target_shorn
scoreboard players reset @a target_held_rose
scoreboard players reset @a target_held_sponge

scoreboard objectives remove current_difficulty
scoreboard objectives remove uhv_pos_y
scoreboard objectives remove drw_counter
scoreboard objectives remove hydr_counter
scoreboard objectives remove husk_counter
scoreboard objectives remove stray_counter
scoreboard objectives remove bog_counter
scoreboard objectives remove wth_counter
scoreboard objectives remove target_bog
scoreboard objectives remove target_shorn
scoreboard objectives remove target_held_rose
scoreboard objectives remove target_held_sponge

scoreboard players reset toggle uhv_snowstorms
scoreboard objectives remove uhv_snowstorms
kill @e[type=marker,tag=snowstorm_rng]

scoreboard players reset toggle uhv_arid_storms
scoreboard objectives remove uhv_arid_storms
kill @e[type=marker,tag=arid_storm_rng]

kill @e[type=marker,tag=boardwalk_marker]

scoreboard players reset toggle drowned_horses_swim
scoreboard objectives remove drowned_horses_swim

scoreboard players reset toggle uhv_horses_swim
scoreboard objectives remove uhv_horses_swim
tag @e[type=#uhv:fleshy_horses] remove able_to_swim

scoreboard players reset toggle uhv_bonuses
scoreboard objectives remove uhv_bonuses

scoreboard players reset toggle uhv_attribute_randomizer
scoreboard objectives remove uhv_attribute_randomizer
execute as @e[type=#uhv:undead_horses] run attribute @s minecraft:max_health base reset
execute as @e[type=#uhv:undead_horses] run attribute @s minecraft:movement_speed base reset

kill @e[type=interaction,tag=uhv_interaction]

execute as @e[type=stray,tag=stray_horse_rider] run ride @s dismount
execute as @e[type=bogged,tag=bogged_horse_rider] run ride @s dismount
execute as @e[type=wither_skeleton,tag=wither_horse_rider] run ride @s dismount
execute as @e[type=#minecraft:zombies,tag=zombie_horse_rider] run ride @s dismount
execute as @e[type=#minecraft:zombies,tag=drowned_horse_rider] run ride @s dismount
execute as @e[type=#minecraft:zombies,tag=husk_horse_rider] run ride @s dismount

# "THAT'S IT, GO TO SPACE" - Shadow Dub
# No but really, rather than kill them, it's way easier to just tp them below bedrock where they'll die and all of their loot will despawn.

tp @e[type=stray,tag=stray_horse_rider] 0 -2032 0
tp @e[type=bogged,tag=bogged_horse_rider] 0 -2032 0
tp @e[type=wither_skeleton,tag=wither_horse_rider] 0 -2032 0
tp @e[type=#minecraft:zombies,tag=zombie_horse_rider] 0 -2032 0
tp @e[type=#minecraft:zombies,tag=drowned_horse_rider] 0 -2032 0
tp @e[type=#minecraft:zombies,tag=husk_horse_rider] 0 -2032 0

kill @e[type=stray,tag=stray_horse_rider]
kill @e[type=bogged,tag=bogged_horse_rider]
kill @e[type=wither_skeleton,tag=wither_horse_rider]
kill @e[type=#minecraft:zombies,tag=zombie_horse_rider]
kill @e[type=#minecraft:zombies,tag=drowned_horse_rider]
kill @e[type=#minecraft:zombies,tag=husk_horse_rider]

scoreboard players reset toggle uhv_enabled
scoreboard objectives remove uhv_enabled

execute as @e[type=skeleton_horse,team=wither_horse] run attribute @s minecraft:scale base reset

execute as @e[type=skeleton_horse] if items entity @s armor.chest leather_chestplate[custom_name="UHV Tunic - Skeleton Horse"] run item replace entity @s armor.chest with air
execute as @e[type=skeleton_horse] if items entity @s armor.chest leather_chestplate[custom_name="UHV Tunic"] run item replace entity @s armor.chest with air
execute as @e[type=skeleton_horse,team=stray_horse] if items entity @s armor.feet leather_boots[custom_name="UHV Booties"] run item replace entity @s armor.feet with air
execute as @e[type=skeleton_horse,team=wither_horse] if items entity @s armor.feet golden_boots[custom_name="UHV Booties - Wither Immunity"] run item replace entity @s armor.feet with air
execute as @e[type=#uhv:undead_horses] if items entity @s armor.feet golden_boots[custom_name="UHV Booties"] run item replace entity @s armor.feet with air

advancement revoke @a only uhv:interaction_entities
advancement revoke @a only uhv:clear_interactions
advancement revoke @a only uhv:debug_lightning_tracker
advancement revoke @a only uhv:shear_bog_horse
advancement revoke @a only uhv:bonemeal_bog_horse
advancement revoke @a only uhv:feed_wither_rose
advancement revoke @a only uhv:sponge_your_horse
advancement revoke @a only uhv:snowstorm
advancement revoke @a only uhv:arid_storm
advancement revoke @a only uhv:easy/stray_trap
advancement revoke @a only uhv:normal/stray_trap
advancement revoke @a only uhv:hard/stray_trap
advancement revoke @a only uhv:easy/bogged_trap
advancement revoke @a only uhv:normal/bogged_trap
advancement revoke @a only uhv:normal/bogged_trap2
advancement revoke @a only uhv:hard/bogged_trap
advancement revoke @a only uhv:normal/wither_trap
advancement revoke @a only uhv:easy/zombie_trap
advancement revoke @a only uhv:normal/zombie_trap
advancement revoke @a only uhv:hard/zombie_trap
advancement revoke @a only uhv:easy/drowned_trap
advancement revoke @a only uhv:normal/drowned_trap
advancement revoke @a only uhv:hard/drowned_trap
advancement revoke @a only uhv:easy/husk_trap
advancement revoke @a only uhv:normal/husk_trap
advancement revoke @a only uhv:hard/husk_trap
advancement revoke @a only uhv:swim
advancement revoke @a only uhv:float1
advancement revoke @a only uhv:float2

team empty zombie_horse
team empty drowned_horse
team empty husk_horse
team empty skeleton_horse
team empty stray_horse
team empty bogged_horse
team empty shorn_bog_horse
team empty wither_horse

team remove zombie_horse
team remove drowned_horse
team remove husk_horse
team remove skeleton_horse
team remove stray_horse
team remove bogged_horse
team remove shorn_bog_horse
team remove wither_horse

tag @e[type=#uhv:undead_horses] remove uhv_tracker
tag @e[type=#uhv:undead_horses] remove uhv_interactable
tag @e[type=#uhv:undead_horses] remove uhv_trap
tag @e[type=#uhv:undead_horses] remove from_uhv_trap
tag @e[type=skeleton_horse] remove vanilla_trap
tag @e[type=skeleton_horse] remove stray_horse_trap
tag @e[type=skeleton_horse] remove bogged_horse_trap
tag @e[type=skeleton_horse] remove wither_horse_trap
tag @e[type=zombie_horse] remove zombie_horse_trap
tag @e[type=zombie_horse] remove drowned_horse_trap
tag @e[type=zombie_horse] remove husk_horse_trap
tag @e[type=skeleton_horse] remove shorn_bog
tag @e[type=skeleton_horse] remove wither_scale
tag @e[type=#uhv:fleshy_horses] remove able_to_swim
tag @e[type=zombie_horse] remove boardwalk_boots
tag @a remove hold_shears
tag @a remove hold_bonemeal
tag @a remove hold_wither_rose
tag @a remove hold_sponge


tellraw @a ""
tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"Undead Horse Variants"}]},{color:"#6a9d5a",text:" "},{color:"#9dc890",text:"has been uninstalled!"},"\n",{color:"#e3e3e3",text:"You can now disable and/or remove the data pack."}]
tellraw @a ""