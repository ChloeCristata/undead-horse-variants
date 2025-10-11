advancement revoke @s only uhv:cure_zombie_horse

execute at @n[type=zombie_horse] run playsound minecraft:entity.horse.eat neutral @a ~ ~ ~
execute at @n[type=zombie_horse] run playsound minecraft:entity.zombie_villager.cure neutral @a ~ ~ ~ 1 1
item modify entity @s[tag=hold_golden_carrot,nbt=!{playerGameType:1}] weapon.mainhand {"function":"minecraft:set_count","count": -1,"add": true}

execute store result score @n[type=zombie_horse] cure_counter run random value 3600..6000

execute as @e[type=zombie_horse,scores={cure_counter=1..6000}] run data modify entity @s TicksFrozen set value 140
execute as @e[type=zombie_horse,scores={cure_counter=1..6000}] run effect give @s strength 1 1 false
execute as @e[type=zombie_horse,scores={cure_counter=1..6000}] run effect clear @s weakness