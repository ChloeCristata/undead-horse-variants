advancement revoke @s only uhv:snowstorm

execute if score toggle uhv_snowstorms matches 1 run summon minecraft:marker ~ ~ ~ {Tags:["snowstorm_rng"]}
execute if score toggle uhv_snowstorms matches 1 run spreadplayers ~ ~ 0 70 false @e[type=marker,tag=snowstorm_rng]
execute as @n[type=marker,tag=snowstorm_rng] at @s if score toggle uhv_snowstorms matches 1 run summon lightning_bolt ~ ~ ~

# To prevent lag/excess entities, these markers are deleted every time that "spawning.mcfunction" runs.


# execute if score toggle uhv_debugging matches 1 run tellraw @a ""
# execute if score toggle uhv_debugging matches 1 run tellraw @a "uhv:snowstorm function has been triggered."
# execute if score toggle uhv_debugging matches 1 run scoreboard objectives add trigger_snowstorm trigger
# execute if score toggle uhv_debugging matches 1 run scoreboard players add @p trigger_snowstorm 1
# execute if score toggle uhv_debugging matches 1 run tellraw @a ""