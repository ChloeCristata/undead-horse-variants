advancement revoke @s only uhv:sponge_your_horse

scoreboard players add @n[type=zombie_horse,team=!husk_horse] sponge_counter 1
execute at @n[type=zombie_horse,team=!husk_horse] run playsound minecraft:block.sponge.absorb player @a ~ ~ ~
item modify entity @s[tag=hold_sponge,nbt=!{playerGameType:1}] weapon.mainhand {"function":"minecraft:set_count","count": -1,"add": true}
give @s[tag=hold_sponge,nbt=!{playerGameType:1}] wet_sponge 1

execute at @n[type=zombie_horse,team=!husk_horse,scores={sponge_counter=1}] run particle minecraft:dolphin ^ ^1 ^ 0.5 0.5 0.5 0.5 7

execute at @n[type=zombie_horse,team=!husk_horse,scores={sponge_counter=2}] run particle minecraft:cloud ~ ~1 ~ 0.3 0.5 0.3 0 2
execute at @n[type=zombie_horse,team=!husk_horse,scores={sponge_counter=2}] run particle minecraft:dolphin ^ ^1 ^ 0.3 0.3 0.3 0.5 5

execute at @n[type=zombie_horse,team=!husk_horse,scores={sponge_counter=3}] run particle minecraft:cloud ~ ~1 ~ 0.3 0.5 0.3 0 5

execute at @n[type=zombie_horse,team=zombie_horse,scores={sponge_counter=3}] run playsound minecraft:entity.husk.ambient neutral @a ~ ~ ~ 1 0.7
execute at @n[type=zombie_horse,team=drowned_horse,scores={sponge_counter=3}] run playsound minecraft:entity.zombie.ambient neutral @a ~ ~ ~ 1 0.7
execute at @n[type=zombie_horse,team=!husk_horse,scores={sponge_counter=3}] run playsound minecraft:entity.zombie_villager.converted neutral @a ~ ~ ~ 1 0.7
tag @n[team=drowned_horse,scores={sponge_counter=3}] add convert_to_zombie

execute as @n[type=zombie_horse,team=zombie_horse,tag=!convert_to_zombie,scores={sponge_counter=3}] run team join husk_horse
execute as @n[type=zombie_horse,team=drowned_horse,scores={sponge_counter=3}] run team join zombie_horse
scoreboard players reset @n[type=zombie_horse,team=husk_horse] sponge_counter
scoreboard players reset @n[type=zombie_horse,team=zombie_horse,tag=convert_to_zombie,scores={sponge_counter=3}] sponge_counter
execute as @n[type=zombie_horse,team=zombie_horse,tag=convert_to_zombie] unless entity @s[scores={sponge_counter=3}] run tag @s remove convert_to_zombie