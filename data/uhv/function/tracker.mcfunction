# This and "spawning.mcfunction" work together to register what variant an entity is in order to apply effects and ensure that only the base variants can be converted into a drowned or a stray.
# First, "spawning" checks whether or not the entity has a "uhv_tracker" tag. If it doesn't, then it checks the entity's current biome and adds it to the appropriate team.
# With its job done, "spawning" sends it off to "tracker" which then checks the entities to see if they're in a team. If so, it adds the tracking tag. Then it schedules "spawning" to run again in 2 ticks.

execute as @e[type=#uhv:undead_horses] at @s if entity @s[team=!] run tag @s add uhv_tracker


scoreboard players reset @e[type=zombie_horse,team=zombie_horse] hydr_counter
scoreboard players reset @e[type=zombie_horse,team=drowned_horse] drw_counter
scoreboard players reset @e[type=zombie_horse,team=husk_horse] husk_counter

scoreboard players reset @e[type=skeleton_horse,team=stray_horse] stray_counter
scoreboard players reset @e[type=skeleton_horse,team=bogged_horse] bog_counter
scoreboard players reset @e[type=skeleton_horse,team=wither_horse] wth_counter


execute if score toggle uhv_enabled matches 1 run schedule function uhv:spawning 2t append