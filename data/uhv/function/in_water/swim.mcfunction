advancement revoke @s only uhv:swim

execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-1 ~ water if block ~ ~ ~ water unless block ~ ~2 ~ water run effect give @s slow_falling 1 1 true
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-1 ~ water if block ~ ~1 ~ water unless block ~ ~2 ~ water run data modify entity @s Motion[1] set value 0.15d
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~ ~ water unless block ~ ~2 ~ water run particle minecraft:splash ^ ^-0.2 ^0.8 0.5 0.4 0.5 0 5
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~ ~ water unless block ~ ~2 ~ water run particle minecraft:bubble_pop ^ ^ ^0.8 0.5 0.4 0.5 0 15
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-1 ~ water if block ~ ~1 ~ water unless block ~ ~2 ~ water run playsound minecraft:entity.skeleton_horse.swim neutral @a ~ ~ ~ 0.4


# The swim advancement will trigger once every tick as long as the player is riding on a horse which has the "able_to_swim" tag, is in water, and is moving.
# When the advancement is triggered, it rewards the player with this function.
# In turn, this function checks the position of the player's horse and decides whether or not to do the following:
# One, apply slow falling. Two, set the Y motion value of the mount to 0.15. Three, add splashing/bubble popping particles. And four, play a swimming sound effect.
# You have to get relatively deep before the function moves you upward. Unfortunately, it can interrupt your momentum, hence the attempt to limit the frequency.
# For this function, I chose to change the motion value instead of using a teleport command since I think it might feel a tiny bit smoother?
# It's really hard to tell, for all I know there might not be any real difference at all.

# ALSO, I am very annoyed that the levitation effect doesn't work on entities which are in water. Surely it should work even better since it's obviously easier to float in water than to float in mid-air, right?
# I thought it would be such a good way to implement swimming which would be less disruptive than teleportation, but no, of course not!