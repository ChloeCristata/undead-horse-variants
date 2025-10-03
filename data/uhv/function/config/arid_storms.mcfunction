scoreboard players add toggle uhv_arid_storms 1
execute if score toggle uhv_arid_storms matches 2 run scoreboard players set toggle uhv_arid_storms 0

tellraw @a ""
execute if score toggle uhv_arid_storms matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#d3b87d",text:"Lightning strikes in dry-weather biomes are now "},{color:"#f2a89b",bold:true,text:"disabled."}]
execute if score toggle uhv_arid_storms matches 1 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#d3b87d",text:"Lightning strikes in dry-weather biomes are now "},{color:"#b3dca7",bold:true,text:"enabled."}]