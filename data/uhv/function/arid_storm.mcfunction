advancement revoke @s only uhv:arid_storm

execute if score toggle uhv_arid_storms matches 1 run summon minecraft:marker ~ ~ ~ {Tags:["arid_storm_rng"]}
execute if score toggle uhv_arid_storms matches 1 run spreadplayers ~ ~ 0 70 false @e[type=marker,tag=arid_storm_rng]
execute as @n[type=marker,tag=arid_storm_rng] at @s if score toggle uhv_arid_storms matches 1 run summon lightning_bolt ~ ~ ~

# To prevent lag/excess entities, these markers are deleted every time that "spawning.mcfunction" runs.


# execute if score toggle uhv_debugging matches 1 run tellraw @a ""
# execute if score toggle uhv_debugging matches 1 run tellraw @a "uhv:arid_storm function has been triggered."
# execute if score toggle uhv_debugging matches 1 run scoreboard objectives add trigger_arid_storm trigger
# execute if score toggle uhv_debugging matches 1 run scoreboard players add @p trigger_arid_storm 1
# execute if score toggle uhv_debugging matches 1 run tellraw @a ""