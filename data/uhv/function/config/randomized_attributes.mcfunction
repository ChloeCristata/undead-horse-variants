scoreboard players add toggle uhv_attribute_randomizer 1
execute if score toggle uhv_attribute_randomizer matches 2 run scoreboard players set toggle uhv_attribute_randomizer 0

tellraw @a ""
execute if score toggle uhv_attribute_randomizer matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#f2a89b",text:"The maximum health and movement speed of undead horses is no longer randomized."}]
tellraw @a ""
execute if score toggle uhv_attribute_randomizer matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9DC890",text:"> "},{color:"#6A9D5A",text:"UVH:"}]},"\n",{color:"#e3e3e3",text:"Click below to reset the base stats of all currently spawned undead horses:"},"\n\n",{color:"#f2a89b",bold:true,underlined:true,text:"Reset Max Health",click_event:{action:"run_command",command:"/execute as @e[tag=uhv_tracker] run attribute @s minecraft:max_health base reset"}},"\n\n",{color:"#f2a89b",bold:true,underlined:true,text:"Reset Movement Speed",click_event:{action:"run_command",command:"/execute as @e[tag=uhv_tracker] run attribute @s minecraft:movement_speed base reset"}}]

execute if score toggle uhv_attribute_randomizer matches 1 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#9dc890",text:"The maximum health and movement speed of undead horses will now be randomized upon spawning."}]