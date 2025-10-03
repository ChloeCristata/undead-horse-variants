advancement revoke @s only uhv:feed_wither_rose

execute at @n[type=skeleton_horse,team=skeleton_horse] run playsound minecraft:entity.horse.eat neutral @a ~ ~ ~
execute at @n[type=skeleton_horse,team=skeleton_horse] run playsound minecraft:entity.wither.ambient neutral @a ~ ~ ~ 0.2 0.7
execute at @n[type=skeleton_horse,team=skeleton_horse] run playsound minecraft:entity.wither_skeleton.ambient neutral @a ~ ~ ~ 1 0.7
item modify entity @s[tag=hold_wth_rose,nbt=!{playerGameType:1}] weapon.mainhand {"function":"minecraft:set_count","count": -1,"add": true}

scoreboard players add @n[type=skeleton_horse,team=skeleton_horse] wth_counter 1
execute as @e[type=skeleton_horse,scores={wth_counter=1..140}] run data modify entity @s TicksFrozen set value 140
execute at @e[type=skeleton_horse,scores={wth_counter=1..140}] run particle entity_effect{color:[0.45,0.38,0.34,1.0]} ~ ~1 ~ 0.3 0.3 0.3 0 1