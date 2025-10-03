advancement revoke @s only uhv:bonemeal_bog_horse

execute at @n[type=skeleton_horse,team=shorn_bog_horse] run playsound minecraft:item.bone_meal.use player @a ~ ~ ~
execute at @n[type=skeleton_horse,team=shorn_bog_horse] run particle minecraft:composter ^ ^1.3 ^-0.5 0.2 0.2 0.2 1 5
execute at @n[type=skeleton_horse,team=shorn_bog_horse] run item modify entity @p[tag=hold_bonemeal,nbt=!{playerGameType:1}] weapon.mainhand {"function":"minecraft:set_count","count": -1,"add": true}
execute as @n[type=skeleton_horse,team=shorn_bog_horse] run team join bogged_horse