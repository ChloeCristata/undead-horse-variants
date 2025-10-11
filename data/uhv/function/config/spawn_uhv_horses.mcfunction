scoreboard players add toggle spawn_uhv_horses 1
execute if score toggle spawn_uhv_horses matches 4 run scoreboard players set toggle spawn_uhv_horses 0

tellraw @a ""
execute if score toggle spawn_uhv_horses matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9DC890",text:"> "},{color:"#6A9D5A",text:"UVH:"}]},"\n",{color:"#f2a89b",text:"Undead horses will no longer spawn in abandoned villages or underwater ruins."}]
execute if score toggle spawn_uhv_horses matches 1 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9DC890",text:"> "},{color:"#6A9D5A",text:"UVH:"}]},"\n",{color:"#9dc890",text:"Zombie, husk, & drowned horses will sometimes spawn in abandoned villages."},"\n",{color:"#65e0dd",text:"Drowned horses will sometimes spawn in large underwater ruins."}]
execute if score toggle spawn_uhv_horses matches 2 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9DC890",text:"> "},{color:"#6A9D5A",text:"UVH:"}]},"\n",{color:"#65e0dd",text:"Drowned horses will sometimes spawn in large underwater ruins."}]
execute if score toggle spawn_uhv_horses matches 3 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9DC890",text:"> "},{color:"#6A9D5A",text:"UVH:"}]},"\n",{color:"#9dc890",text:"Zombie, husk, & drowned horses will sometimes spawn in abandoned villages."}]