scoreboard players add toggle uhv_snowstorms 1
execute if score toggle uhv_snowstorms matches 2 run scoreboard players set toggle uhv_snowstorms 0

tellraw @a ""
execute if score toggle uhv_snowstorms matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#A7C9D8",text:"Lightning strikes during snowstorms are now "},{color:"#f2a89b",bold:true,text:"disabled."}]
execute if score toggle uhv_snowstorms matches 1 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#A7C9D8",text:"Lightning strikes during snowstorms are now "},{color:"#b3dca7",bold:true,text:"enabled."}]