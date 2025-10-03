tag @e[type=skeleton_horse,tag=!uhv_tracker,nbt={SkeletonTrap:1b}] add vanilla_trap


execute as @e[type=zombie_horse,tag=!uhv_tracker] at @s unless biome ~ ~ ~ #uhv:spawns_zombie_horse_variants run team join zombie_horse
execute as @e[type=zombie_horse,tag=!uhv_tracker] at @s if biome ~ ~ ~ #uhv:spawns_drowned_horses run team join drowned_horse
execute as @e[type=zombie_horse,tag=!uhv_tracker] at @s if biome ~ ~ ~ #uhv:spawns_husk_horses run team join husk_horse

execute as @e[type=skeleton_horse,tag=!uhv_tracker] at @s unless biome ~ ~ ~ #uhv:spawns_skeleton_horse_variants run team join skeleton_horse
execute as @e[type=skeleton_horse,tag=!uhv_tracker,tag=!vanilla_trap] at @s if biome ~ ~ ~ #uhv:spawns_stray_horses run team join stray_horse
execute as @e[type=skeleton_horse,tag=!uhv_tracker,tag=!vanilla_trap] at @s if biome ~ ~ ~ #uhv:spawns_bogged_horses run team join bogged_horse
execute as @e[type=skeleton_horse,tag=!uhv_tracker,tag=!vanilla_trap] at @s if biome ~ ~ ~ #uhv:spawns_wither_skeleton_horses run team join wither_horse


execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=!uhv_tracker] at @s store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run random value 15..30
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=!uhv_tracker] at @s run data modify entity @s Health set from entity @s attributes[{id:"minecraft:max_health"}].base
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=zombie_horse,tag=!uhv_tracker] at @s store result entity @s attributes[{id:"minecraft:movement_speed"}].base double 0.0001 run random value 1125..3375

execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=skeleton_horse,tag=!uhv_tracker] at @s store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run random value 15..30
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=skeleton_horse,tag=!uhv_tracker] at @s run data modify entity @s Health set from entity @s attributes[{id:"minecraft:max_health"}].base
execute if score toggle uhv_attribute_randomizer matches 1 as @e[type=skeleton_horse,tag=!uhv_tracker] at @s store result entity @s attributes[{id:"minecraft:movement_speed"}].base double 0.0001 run random value 1125..3375


team join skeleton_horse @e[type=skeleton_horse,team=!skeleton_horse,tag=vanilla_trap]
execute as @e[type=skeleton,predicate=uhv:skeleton_horseman] on vehicle run team join skeleton_horse @s


execute as @e[type=zombie_horse,team=drowned_horse] if score toggle drowned_horses_swim matches 1 run tag @s add able_to_swim
execute as @e[type=zombie_horse,team=drowned_horse] unless score toggle drowned_horses_swim matches 1 run tag @s remove able_to_swim

execute as @e[type=#uhv:fleshy_horses,team=!drowned_horse] if score toggle uhv_horses_swim matches 1 run tag @s add able_to_swim
execute as @e[type=#uhv:fleshy_horses,team=!drowned_horse] unless score toggle uhv_horses_swim matches 1 run tag @s remove able_to_swim


kill @e[type=marker,tag=snowstorm_rng]
kill @e[type=marker,tag=arid_storm_rng]


# execute if score toggle uhv_debugging matches 1 if entity @e[nbt={SkeletonTrap:1b},tag=!uhv_tracker] run tellraw @a "Skeleton horse has spawned."
# execute if score toggle uhv_debugging matches 1 if entity @e[nbt={SkeletonTrap:1b},tag=!uhv_tracker] run scoreboard objectives add trigger_skeleton trigger
# execute if score toggle uhv_debugging matches 1 if entity @e[nbt={SkeletonTrap:1b},tag=!uhv_tracker] run scoreboard players add @p trigger_skeleton 1


execute if score toggle uhv_enabled matches 1 run schedule function uhv:tracker 3t append