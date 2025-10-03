fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace fire
data modify entity @s Invulnerable set value 0
item replace entity @s saddle with saddle
tag @s remove husk_horse_trap
tag @s remove uhv_trap
tag @s add from_uhv_trap

summon husk ~ ~ ~ {Tags:["husk_horse_rider"],equipment:{mainhand:{id:"minecraft:golden_sword",count:1},offhand:{id:"minecraft:shield",count:1},head:{id:"minecraft:golden_helmet",count:1,components:{"minecraft:trim":{material:"minecraft:gold",pattern:"minecraft:dune"}}}}}
ride @n[tag=husk_horse_rider] mount @s

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0.5d,0d,0d],Team:husk_horse,Tags:["uhv_tracker","from_uhv_trap","map_holder"]}
summon husk ~ ~ ~ {Tags:["husk_horse_rider","map_holder"],equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":13875325}},mainhand:{id:"minecraft:golden_pickaxe",count:1},offhand:{id:"minecraft:map",count:1}},drop_chances:{offhand:2.000}}
ride @n[type=husk,tag=map_holder] mount @n[type=zombie_horse,tag=map_holder]

item modify entity @n[type=husk,tag=husk_horse_rider,nbt={equipment:{offhand:{id:"minecraft:map"}}}] weapon.offhand {"function":"minecraft:exploration_map","destination":"desert_pyramid","decoration":"banner_orange"}
item modify entity @n[type=husk,tag=husk_horse_rider,nbt={equipment:{offhand:{id:"minecraft:map"}}}] weapon.offhand {"function":"minecraft:exploration_map","destination":"mineshaft","decoration":"target_x"}
item modify entity @n[type=husk,tag=husk_horse_rider,nbt={equipment:{offhand:{id:"minecraft:map"}}}] weapon.offhand {"function":"minecraft:exploration_map","destination":"desert_village","decoration":"village_desert"}

execute as @n[type=husk,tag=map_holder,nbt=!{equipment:{offhand:{id:"minecraft:map"}}}] on vehicle run tag @s remove map_holder
execute as @n[type=husk,tag=map_holder,nbt=!{equipment:{offhand:{id:"minecraft:map"}}}] run tag @s remove map_holder

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0.5d,0d,0.5d],Team:husk_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:husk,Tags:["husk_horse_rider"],equipment:{mainhand:{id:"minecraft:golden_axe",count:1},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":13875325}}}}]}

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0d,0d,0.5d],Team:husk_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:husk,Tags:["husk_horse_rider"],equipment:{mainhand:{id:"minecraft:golden_sword",count:1},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":13875325}}}}]}

item modify entity @e[type=husk,tag=husk_horse_rider,distance=..3] weapon.mainhand {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}
item modify entity @e[type=husk,tag=husk_horse_rider,distance=..3] weapon.offhand {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}
item modify entity @e[type=husk,tag=husk_horse_rider,distance=..3] armor.head {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}

execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run random value 15..30
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] run data modify entity @s Health set from entity @s attributes[{id:"minecraft:max_health"}].base
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:movement_speed"}].base double 0.0001 run random value 1125..3375
execute as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:jump_strength"}].base double 0.1 run random value 4..10

effect clear @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] fire_resistance



# We are husks and we're digging a hole! Diggy diggy hole! Diggy, diggy hole!