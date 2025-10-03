advancement revoke @s only uhv:float1

execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-1 ~ water if block ~ ~ ~ water unless block ~ ~2 ~ water run effect give @s slow_falling 1 1 true
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-1 ~ water if block ~ ~0.7 ~ water unless block ~ ~2 ~ water run tp @s ~ ~0.4 ~
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-1 ~ water if block ~ ~ ~ water if block ~ ~0.7 ~ water unless block ~ ~2 ~ water run particle minecraft:bubble ~ ~-0.8 ~ 0.4 0.4 0.4 0 300
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-1 ~ water if block ~ ~ ~ water unless block ~ ~2 ~ water run particle minecraft:splash ~ ~-0.3 ~ 0.5 0.4 0.5 0 100
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-0.5 ~ water if block ~ ~ ~ water unless block ~ ~2 ~ water run playsound minecraft:entity.skeleton_horse.swim neutral @a ~ ~ ~ 0.1


# The float1 advancement will trigger every 20 ticks, aka once per second, as long as the player is riding on a horse which has the "able_to_swim" tag, is in water, and is not moving.
# When the advancement is triggered, it rewards the player with this function.
# In turn, this function checks the position of the player's horse and decides whether or not to do the following:
# One, apply slow falling. Two, teleport the mount up 0.4 blocks. Three, add splashing/bubble particles. And four, play a swimming sound effect.