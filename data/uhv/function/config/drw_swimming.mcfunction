scoreboard players add toggle drowned_horses_swim 1
execute if score toggle drowned_horses_swim matches 3 run scoreboard players set toggle drowned_horses_swim 0

tellraw @a ""
execute if score toggle drowned_horses_swim matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9DC890",text:"> "},{color:"#6A9D5A",text:"UVH:"}]},"\n",{color:"#65e0dd",text:"Drowned horses "},{color:"#9dc890",bold:true,text:"sink in water"},{color:"#65e0dd",text:", allowing for underwater travel."}]
execute if score toggle drowned_horses_swim matches 1 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9DC890",text:"> "},{color:"#6A9D5A",text:"UVH:"}]},"\n",{color:"#65e0dd",text:"Drowned horses will "},{color:"#9dc890",bold:true,text:"float/swim"},{color:"#65e0dd",text:" if a player rides them into water."}]
execute if score toggle drowned_horses_swim matches 2 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9DC890",text:"> "},{color:"#6A9D5A",text:"UVH:"}]},"\n",{color:"#65e0dd",text:"Drowned horses will "},{color:"#f2a89b",bold:true,text:"kick players off"},{color:"#65e0dd",text:" if a player rides them into deep water."}]