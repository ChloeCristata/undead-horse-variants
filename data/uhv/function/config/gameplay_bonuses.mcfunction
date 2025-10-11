scoreboard players add toggle uhv_bonuses 1
execute if score toggle uhv_bonuses matches 2 run scoreboard players set toggle uhv_bonuses 0


# If gameplay bonuses are toggled, un-undead horses will either have their regeneration effect removed or applied.

execute if score toggle uhv_bonuses matches 0 run effect clear @e[type=horse,tag=cured_from_zombie] regeneration
execute if score toggle uhv_bonuses matches 1 run effect give @e[type=horse,tag=cured_from_zombie] regeneration infinite 1 true


tellraw @a ""
execute if score toggle uhv_bonuses matches 0 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#f2a89b",text:"Gameplay bonuses will no longer be applied to undead horses."}]
execute if score toggle uhv_bonuses matches 1 run tellraw @a ["",{bold:true,text:"",extra:[{color:"#9dc890",text:"> "},{color:"#6a9d5a",text:"UHV:"}]},"\n",{color:"#9dc890",text:"Gameplay bonuses will now be applied to all undead horses."}]