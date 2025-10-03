scoreboard players add toggle uhv_horses_swim 1
execute if score toggle uhv_horses_swim matches 2 run scoreboard players set toggle uhv_horses_swim 0

tellraw @a ""
execute if score toggle uhv_horses_swim matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UVH:"}]},"\n",{color:"#f2a89b",text:"Zombie, husk, & living horses kick players off upon being submerged underwater."}]
execute if score toggle uhv_horses_swim matches 1 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UVH:"}]},"\n",{color:"#9dc890",text:"Zombie, husk, & living horses are all able to swim while a player is riding on them."}]