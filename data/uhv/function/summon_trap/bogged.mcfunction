fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace fire
data modify entity @s Invulnerable set value 0
item replace entity @s saddle with saddle
tag @s remove bogged_horse_trap
tag @s remove uhv_trap
tag @s add from_uhv_trap

summon bogged ~ ~ ~ {Tags:["bogged_horse_rider"],equipment:{mainhand:{id:"minecraft:bow",count:1},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":7286317}}}}
ride @n[tag=bogged_horse_rider] mount @s

summon skeleton_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0.5d,0d,0d],Team:shorn_bog_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:bogged,sheared:1b,Tags:["bogged_horse_rider"],equipment:{head:{id:"minecraft:flowering_azalea",count:1,components:{"minecraft:enchantments":{"thorns":1},"minecraft:enchantment_glint_override":false}},mainhand:{id:"minecraft:bow",count:1}},drop_chances:{head:0.000}}]}

summon skeleton_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0.5d,0d,0.5d],Team:shorn_bog_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:bogged,Tags:["bogged_horse_rider"],equipment:{mainhand:{id:"minecraft:bow",count:1},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":13408632}}}}]}

summon skeleton_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0d,0d,0.5d],Team:bogged_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:bogged,sheared:1b,Tags:["bogged_horse_rider"],equipment:{mainhand:{id:"minecraft:bow",count:1},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":12852518}}}}]}

item modify entity @e[type=bogged,tag=bogged_horse_rider,distance=..3] weapon.mainhand {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}
item modify entity @e[type=bogged,tag=bogged_horse_rider,distance=..3] armor.head {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}

execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=skeleton_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run random value 15..30
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=skeleton_horse,tag=from_uhv_trap,distance=..3] run data modify entity @s Health set from entity @s attributes[{id:"minecraft:max_health"}].base
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=skeleton_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:movement_speed"}].base double 0.0001 run random value 1125..3375
execute as @e[type=skeleton_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:jump_strength"}].base double 0.1 run random value 4..10

effect clear @e[type=skeleton_horse,tag=from_uhv_trap,distance=..3] fire_resistance



# Gotta say, I love the variety in appearance I was able to give this group. The flowering azalea looks so good too!
# What I'm NOT a fan of is the fact that bogged won't use crossbows. None of the skeletons will! I wanted to give some weapon variety to these guys, but nooooo.