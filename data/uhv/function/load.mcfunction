scoreboard objectives add current_difficulty trigger

scoreboard objectives add uhv_enabled trigger
scoreboard players set toggle uhv_enabled 1

# scoreboard objectives add uhv_debugging trigger
# execute unless score toggle uhv_debugging matches 1 run scoreboard players set toggle uhv_debugging 0

scoreboard objectives add uhv_snowstorms trigger
execute unless score toggle uhv_snowstorms matches 0 run scoreboard players set toggle uhv_snowstorms 1

scoreboard objectives add uhv_arid_storms trigger
execute unless score toggle uhv_arid_storms matches 0 run scoreboard players set toggle uhv_arid_storms 1

scoreboard objectives add drowned_horses_swim trigger
execute unless score toggle drowned_horses_swim matches 1 unless score toggle drowned_horses_swim matches 2 run scoreboard players set toggle drowned_horses_swim 0

scoreboard objectives add uhv_horses_swim trigger
execute unless score toggle uhv_horses_swim matches 1 run scoreboard players set toggle uhv_horses_swim 0

scoreboard objectives add uhv_bonuses trigger
execute unless score toggle uhv_bonuses matches 0 run scoreboard players set toggle uhv_bonuses 1

scoreboard objectives add uhv_attribute_randomizer trigger
execute unless score toggle uhv_attribute_randomizer matches 0 run scoreboard players set toggle uhv_attribute_randomizer 1

scoreboard objectives add target_bog trigger
scoreboard objectives add target_shorn trigger
scoreboard objectives add target_held_rose trigger
scoreboard objectives add target_held_sponge trigger

advancement revoke @a only uhv:interaction_entities
advancement revoke @a only uhv:clear_interactions
advancement revoke @a only uhv:debug_lightning_strike
advancement revoke @a only uhv:shear_bog_horse
advancement revoke @a only uhv:bonemeal_bog_horse
advancement revoke @a only uhv:feed_wither_rose
advancement revoke @a only uhv:sponge_your_horse
advancement revoke @a only uhv:snowstorm
advancement revoke @a only uhv:arid_storm
advancement revoke @a only uhv:stray_trap
advancement revoke @a only uhv:bogged_trap
advancement revoke @a only uhv:wither_trap
advancement revoke @a only uhv:zombie_trap
advancement revoke @a only uhv:drowned_trap
advancement revoke @a only uhv:husk_trap
advancement revoke @a only uhv:drw_swim
advancement revoke @a only uhv:drw_float1
advancement revoke @a only uhv:drw_float2

team add zombie_horse
team add drowned_horse
team add husk_horse
team add skeleton_horse
team add stray_horse
team add bogged_horse
team add shorn_bog_horse
team add wither_horse

scoreboard objectives add uhv_pos_y trigger
scoreboard players reset @e[type=zombie_horse] uhv_pos_y
scoreboard players reset @a uhv_pos_y

scoreboard objectives add drw_counter trigger
scoreboard players reset @e[type=zombie_horse] drw_counter

scoreboard objectives add hydr_counter trigger
scoreboard players reset @e[type=zombie_horse] hydr_counter

scoreboard objectives add sponge_counter trigger
scoreboard players reset @e[type=zombie_horse] sponge_counter

scoreboard objectives add stray_counter trigger
scoreboard players reset @e[type=skeleton_horse] stray_counter

scoreboard objectives add bog_counter trigger
scoreboard players reset @e[type=skeleton_horse] bog_counter

scoreboard objectives add wth_counter trigger
scoreboard players reset @e[type=skeleton_horse] wth_counter

team join zombie_horse @e[type=zombie_horse,tag=!uhv_tracker]
team join skeleton_horse @e[type=skeleton_horse,tag=!uhv_tracker]
tag @e[type=#uhv:undead_horses,tag=!uhv_tracker] add uhv_tracker

function uhv:spawning
function uhv:run_if_enabled_4t



tellraw @a ""
tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"Undead Horse Variants"}]},{color:"#6a9d5a",text:" "},{color:"#9dc890",text:"has been reloaded!"},"\n",{color:"#e3e3e3",text:"If you need help, try ",click_event:{action:"suggest_command",command:"/function uhv:info"}},{bold:true,underlined:true,color:"#e3e3e3",text:"/function uhv:info",click_event:{action:"suggest_command",command:"/function uhv:info"}},"."]
tellraw @a ""