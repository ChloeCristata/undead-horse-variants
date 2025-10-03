fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace fire
data modify entity @s Invulnerable set value 0
item replace entity @s saddle with saddle
tag @s remove zombie_horse_trap
tag @s remove uhv_trap
tag @s add from_uhv_trap

summon zombie ~ ~ ~ {Tags:["zombie_horse_rider"],equipment:{mainhand:{id:"minecraft:stone_axe",count:1},offhand:{id:"minecraft:shield",count:1},head:{id:"minecraft:iron_helmet",count:1}}}
ride @n[tag=zombie_horse_rider] mount @s

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0.5d,0d,0d],Team:zombie_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:zombie,Tags:["zombie_horse_rider"],equipment:{mainhand:{id:"minecraft:stone_sword",count:1},head:{id:"minecraft:iron_helmet",count:1}}}]}

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0.5d,0d,0.5d],Team:zombie_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:zombie,Tags:["zombie_horse_rider"],equipment:{mainhand:{id:"minecraft:stone_sword",count:1},head:{id:"minecraft:iron_helmet",count:1}}}]}

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0d,0d,0.5d],Team:zombie_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:zombie,Tags:["zombie_horse_rider"],equipment:{mainhand:{id:"minecraft:stone_sword",count:1},head:{id:"minecraft:iron_helmet",count:1}}}]}

item modify entity @e[type=zombie,tag=zombie_horse_rider,distance=..3] weapon.mainhand {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}
item modify entity @e[type=zombie,tag=zombie_horse_rider,distance=..3] weapon.offhand {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}
item modify entity @e[type=zombie,tag=zombie_horse_rider,distance=..3] armor.head {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}

execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run random value 15..30
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] run data modify entity @s Health set from entity @s attributes[{id:"minecraft:max_health"}].base
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:movement_speed"}].base double 0.0001 run random value 1125..3375
execute as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:jump_strength"}].base double 0.1 run random value 4..10

effect clear @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] fire_resistance