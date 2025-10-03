# This function is called by the "boardwalk_boots" enchantment. The only way to get this enchantment is with commands such as /data, /item, or /enchant.

# Took a frustrating amount of time to figure this out!
# Basically, this checks the area that is going to be filled with water and only does so if there isn't another drowned horse within that area.
# First, align xyz so the coordinates will be accurate. Then, we use "positioned" combined with "dx" and "dz" to specify the area that needs to be checked. This area corresponds to the coordinates listed for the fill command.
# Speaking of which, we have to use "at @s" to reset the origin position prior to running the fill command since the origin position was modified earlier.

execute align xyz positioned ~-3 ~ ~-4 unless entity @e[type=zombie_horse,team=drowned_horse,dx=6,dz=1] at @s run fill ~-3 ~-6 ~-3 ~3 ~ ~-4 water replace spruce_slab[type=top,waterlogged=true]
execute align xyz positioned ~4 ~ ~-3 unless entity @n[type=zombie_horse,team=drowned_horse,dx=-1,dz=6] at @s run fill ~3 ~-6 ~-3 ~4 ~ ~3 water replace spruce_slab[type=top,waterlogged=true]
execute align xyz positioned ~3 ~ ~4 unless entity @n[type=zombie_horse,team=drowned_horse,dx=-6,dz=-1] at @s run fill ~3 ~-6 ~3 ~-3 ~ ~4 water replace spruce_slab[type=top,waterlogged=true]
execute align xyz positioned ~-4 ~ ~3 unless entity @n[type=zombie_horse,team=drowned_horse,dx=1,dz=-6] at @s run fill ~-3 ~-6 ~3 ~-4 ~ ~-3 water replace spruce_slab[type=top,waterlogged=true]