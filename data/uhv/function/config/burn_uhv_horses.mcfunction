scoreboard players add toggle burn_uhv_horses 1
execute if score toggle burn_uhv_horses matches 2 run scoreboard players set toggle burn_uhv_horses 0

execute as @e[type=#uhv:undead_horses] run data modify entity @s Fire set value 0s

tellraw @a ""
execute if score toggle burn_uhv_horses matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#effec2",text:"Undead horses burning when in daylight is now "},{color:"#f2a89b",bold:true,text:"disabled."}]
execute if score toggle burn_uhv_horses matches 1 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#effec2",text:"Undead horses burning when in daylight is now "},{color:"#b3dca7",bold:true,text:"enabled."}]