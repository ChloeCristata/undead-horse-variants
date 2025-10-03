# (Note: For enchantments, the lowest tier is 1, but for effects the lowest tier is 0)


# Zombie horses get a lvl 1 speed boost during the night.

execute if predicate uhv:is_night run effect give @e[type=zombie_horse,team=zombie_horse] speed 1 0 true


# Drowned horses get lvl 3 depth strider booties and a lvl 1 speed boost while in ocean, river, and beach biomes! If submerged in water, they get a lvl 2 jump boost effect as well, useful for scaling steep underwater dropoffs.

execute as @e[type=zombie_horse,team=drowned_horse] at @s if block ~ ~ ~ water run effect give @s speed 1 0 true
execute as @e[type=zombie_horse,team=drowned_horse] at @s if biome ~ ~ ~ #uhv:spawns_drowned_horses unless block ~ ~ ~ water run effect give @s speed 1 0 true
execute as @e[type=zombie_horse,team=drowned_horse] at @s if block ~ ~1 ~ water run effect give @s jump_boost 1 1 true

execute as @e[type=zombie_horse,team=drowned_horse,tag=from_uhv_trap] at @s unless entity @n[type=drowned,tag=drowned_horse_rider,distance=..2] run item replace entity @s armor.feet with golden_boots[custom_name="UHV Booties",enchantments={binding_curse:1,depth_strider:3,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]

execute as @a on vehicle if entity @s[type=zombie_horse,team=drowned_horse,tag=from_uhv_trap] run item replace entity @s armor.feet with golden_boots[custom_name="UHV Booties",enchantments={binding_curse:1,depth_strider:3,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]

execute as @e[type=zombie_horse,team=drowned_horse,tag=!drowned_horse_trap,tag=!from_uhv_trap] run item replace entity @s armor.feet with golden_boots[custom_name="UHV Booties",enchantments={binding_curse:1,depth_strider:3,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]


# Husk horses get a lvl 2 speed boost while in the desert or while standing on sandy blocks.

execute as @e[type=zombie_horse,team=husk_horse] at @s if biome ~ ~ ~ #uhv:spawns_husk_horses run effect give @s speed 1 1 true
execute as @e[type=zombie_horse,team=husk_horse] at @s if block ~ ~-1 ~ #uhv:husk_horse_boost run effect give @s speed 1 1 true


# Skeleton horses get a lvl 1 speed boost during the night.

execute if predicate uhv:is_night run effect give @e[type=skeleton_horse,team=skeleton_horse] speed 1 0 true


# Stray horses get lvl 1 frost walker booties and a lvl 1 speed boost while on snowy and icy terrain! Since their boots are leather, they also aren't able to sink in powder snow.

execute as @e[type=skeleton_horse,team=stray_horse] at @s if block ~ ~-1 ~ #uhv:stray_horse_boost run effect give @s speed 1 0 true
execute as @e[type=skeleton_horse,team=stray_horse] run item replace entity @s armor.feet with leather_boots[custom_name="UHV Booties",enchantments={binding_curse:1,frost_walker:1,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]

execute as @e[type=skeleton_horse,team=stray_horse] if items entity @s armor.chest leather_chestplate[custom_name="UHV Tunic"] run item replace entity @s armor.chest with air


# Bogged horses get lvl 3 depth strider booties and a lvl 2 speed boost while in swamp biomes or while standing on certain blocks.

execute as @e[type=skeleton_horse,team=bogged_horse] at @s if biome ~ ~ ~ #uhv:spawns_bogged_horses run effect give @s speed 1 1 true
execute as @e[type=skeleton_horse,team=bogged_horse] at @s if block ~ ~-1 ~ #uhv:bogged_horse_boost run effect give @s speed 1 1 true
execute as @e[type=skeleton_horse,team=bogged_horse] run item replace entity @s armor.feet with golden_boots[custom_name="UHV Booties",enchantments={binding_curse:1,depth_strider:3,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]


# Wither skeleton horses get lvl 2 soul speed booties and will apply a lvl 1 wither effect to any entites within 16 blocks which aggro on the player riding them.
# They also have a custom enchantment on their boots which provides the wearer with immunity to fire, withering, and wither skull projectiles.

execute as @e[type=skeleton_horse,team=wither_horse] run item replace entity @s armor.feet with golden_boots[custom_name="UHV Booties",enchantments={binding_curse:1,soul_speed:2,wither_horse_immunity:1,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]
execute at @a[predicate=uhv:wth_rider] run effect give @e[predicate=uhv:attacking_wth_rider,distance=..16] wither 10 0 false