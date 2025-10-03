fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace fire
data modify entity @s Invulnerable set value 0
item replace entity @s saddle with saddle
tag @s remove drowned_horse_trap
tag @s remove uhv_trap
tag @s add from_uhv_trap

summon drowned ~ ~ ~ {Tags:["drowned_horse_rider"],equipment:{mainhand:{id:"minecraft:trident",count:1},head:{id:"minecraft:iron_helmet",count:1,components:{"minecraft:trim":{material:"minecraft:diamond",pattern:"minecraft:coast"}}}}}
ride @n[type=drowned,tag=drowned_horse_rider] mount @s

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0.5d,0d,0d],Team:drowned_horse,Tags:["uhv_tracker","from_uhv_trap","map_holder"],Passengers:[{id:marker,Tags:["boardwalk_marker"]}],equipment:{saddle:{id:saddle,count:1}}}
summon drowned ~ ~ ~ {Tags:["drowned_horse_rider","map_holder"],equipment:{head:{id:"minecraft:golden_helmet",count:1},mainhand:{id:"minecraft:spyglass",count:1},offhand:{id:"minecraft:map",count:1}},drop_chances:{offhand:2.000}}
ride @n[type=drowned,tag=map_holder] mount @n[type=zombie_horse,tag=map_holder]

item modify entity @n[type=drowned,tag=drowned_horse_rider,nbt={equipment:{offhand:{id:"minecraft:map"}}}] weapon.offhand {"function":"minecraft:exploration_map","destination":"monument","decoration":"monument"}
item modify entity @n[type=drowned,tag=drowned_horse_rider,nbt={equipment:{offhand:{id:"minecraft:map"}}}] weapon.offhand {"function":"minecraft:exploration_map","destination":"on_treasure_maps","decoration":"red_x"}
item modify entity @n[type=drowned,tag=drowned_horse_rider,nbt={equipment:{offhand:{id:"minecraft:map"}}}] weapon.offhand {"function":"minecraft:exploration_map","destination":"ocean_ruin","decoration":"banner_white"}

execute as @n[type=drowned,tag=map_holder,nbt=!{equipment:{offhand:{id:"minecraft:map"}}}] on vehicle run tag @s remove map_holder
tag @n[type=drowned,tag=map_holder,nbt=!{equipment:{offhand:{id:"minecraft:map"}}}] remove map_holder

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0.5d,0d,0.5d],Team:drowned_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:marker,Tags:["boardwalk_marker"]},{id:drowned,Tags:["drowned_horse_rider"],equipment:{mainhand:{id:"minecraft:golden_sword",count:1},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":3037792}}}}]}

summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Motion:[0d,0d,0.5d],Team:drowned_horse,Tags:["uhv_tracker","from_uhv_trap"],Passengers:[{id:marker,Tags:["boardwalk_marker"]},{id:drowned,Tags:["drowned_horse_rider"],equipment:{mainhand:{id:"minecraft:golden_sword",count:1},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":3037792}}}}]}

item modify entity @e[type=drowned,tag=drowned_horse_rider,distance=..3] weapon.mainhand {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}
item modify entity @e[type=drowned,tag=drowned_horse_rider,distance=..3] armor.head {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}
item modify entity @e[type=drowned,tag=drowned_horse_rider,distance=..3] armor.legs {"function":"minecraft:enchant_randomly","options":"#minecraft:on_mob_spawn_equipment"}

execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run random value 15..30
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] run data modify entity @s Health set from entity @s attributes[{id:"minecraft:max_health"}].base
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:movement_speed"}].base double 0.0001 run random value 1125..3375
execute as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] store result entity @s attributes[{id:"minecraft:jump_strength"}].base double 0.1 run random value 4..10

execute as @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] run item replace entity @s armor.feet with golden_boots[custom_name="UHV Booties",enchantments={binding_curse:1,boardwalk_boots:1,depth_strider:3,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]

effect clear @e[type=zombie_horse,tag=from_uhv_trap,distance=..3] fire_resistance



# Most of this is pretty simple: summon zombie horses which are being ridden by drowned, set their equipment, blah blah. There's definitely some interesting bits though...

# For starters, the "Motion" data is added to ensure that the horses don't get all bunched up. They still can if they spawn in a really enclosed space, but that's the same as in vanilla.
# Just summoning them at different coordinates doesn't work very well because then there's no way to guarantee that they won't spawn inside a block and suffocate.

# The "enchant_randomly" part is really simple, but I'm so glad I learned about it, it's extremely helpful!

# And then there's the map... At first, I actually used a different method:
# I made a loot table which would always give a randomized treasure map, used /loot to summon it, /data to copy it into the offhand of one of the drowned, and then killed the map entity once the process was completed.
# ...Then I found out that there's an item modifier for turning empty maps into explorer maps. Wayyyy less messy, so I swapped over to that.

# You might also notice that the jump strength of the horses is being randomized via a command, even though it should be randomized automatically in vanilla.
# For some reason it seems like the ones summoned by these functions just... don't? No clue why. I assume that it's an obscure bug, so I just patched over it.