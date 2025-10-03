advancement revoke @s only uhv:float2

execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-1 ~ water if block ~ ~ ~ water unless block ~ ~2 ~ water run effect give @s slow_falling 1 1 true
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~1 ~ water unless block ~ ~2 ~ water run tp @s ~ ~0.2 ~
execute on vehicle at @s anchored feet rotated ~ 0 if block ~ ~-0.2 ~ water if block ~ ~1 ~ water unless block ~ ~2 ~ water run tp @s ~ ~0.1 ~


# The float2 advancement will trigger once every tick as long as the player is riding on a horse which has the "able_to_swim" tag, is in water, and is not moving.
# When the advancement is triggered, it rewards the player with this function.
# In turn, this function checks the position of the player's horse and decides whether or not to teleport the player's mount upwards, and if so, then how much.
# This is basically a panic mode. Float1 handles most of the actual floating, but if things go wrong and the horse ends up a bit too deep, Float2 kicks in.