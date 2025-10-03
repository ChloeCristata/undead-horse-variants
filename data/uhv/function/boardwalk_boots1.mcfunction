# Double check that drowned horses have boardwalks.

execute if block ~ ~ ~ #minecraft:air run fill ~1 ~-1 ~1 ~-1 ~-1 ~-1 spruce_slab[type=top,waterlogged=true] replace #uhv:always_waterlogged


# If a nearby player is beneath a drowned horseman which is currently standing on a boardwalk, the boardwalk will be removed and their boots will be swapped out for ones without that enchantment.
# This is done to prevent the horsemen from just trapping the player underwater and drowning them.

execute positioned ~ ~-3 ~ as @a[distance=0..2] at @s store result score @s uhv_pos_y run data get entity @s Pos[1]
execute positioned ~ ~-3 ~ if entity @a[distance=0..2] store result score @s uhv_pos_y run data get entity @s Pos[1]
execute as @a at @s positioned ~ ~3 ~ unless entity @e[type=zombie_horse,tag=boardwalk_boots,distance=0..2] run scoreboard players reset @s uhv_pos_y

execute positioned ~ ~-3 ~ if score @s uhv_pos_y > @p[distance=0..2] uhv_pos_y run item replace entity @s armor.feet with golden_boots[custom_name="UHV Booties",enchantments={binding_curse:1,depth_strider:3,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]
execute if block ~ ~-1 ~ spruce_slab if score @s uhv_pos_y > @p uhv_pos_y run fill ~4 ~-4 ~4 ~-4 ~ ~-4 water replace spruce_slab[type=top,waterlogged=true]


# If a drowned horse no longer has boardwalk boots, replace their boardwalk with water and then remove their "boardwalk_boots" tag.

execute unless items entity @s armor.feet golden_boots[minecraft:enchantments={binding_curse:1,boardwalk_boots:1,depth_strider:3,vanishing_curse:1}] run fill ~4 ~-4 ~4 ~-4 ~ ~-4 water replace spruce_slab[type=top,waterlogged=true]
execute unless items entity @s armor.feet golden_boots[minecraft:enchantments={binding_curse:1,boardwalk_boots:1,depth_strider:3,vanishing_curse:1}] run tag @s remove boardwalk_boots