advancement revoke @s only uhv:shear_bog_horse

execute at @n[type=skeleton_horse,team=bogged_horse] run playsound minecraft:entity.bogged.shear player @a ~ ~ ~
item modify entity @s[tag=hold_shears,nbt=!{playerGameType:1}] weapon.mainhand {"function":"minecraft:set_damage","damage": -0.01,"add": true}
execute as @n[type=skeleton_horse,team=bogged_horse] run team join shorn_bog_horse
execute at @n[type=skeleton_horse,team=shorn_bog_horse] run loot spawn ^ ^1.3 ^-0.5 loot blocks/red_mushroom
execute at @n[type=skeleton_horse,team=shorn_bog_horse] run loot spawn ^ ^1.3 ^-0.5 loot blocks/brown_mushroom
execute at @n[type=skeleton_horse,team=shorn_bog_horse] run loot spawn ^ ^1.3 ^-0.5 loot blocks/moss_carpet


# Fun fact: when shearing a bogged, you're given two totally random mushrooms! A bit silly if you ask me. They always have one red and one brown, so why doesn't their loot table reflect that?
# Also, I really dislike that they made the red mushrooms on the boggeds' heads have mirrored symmetry. It looks weird and doesn't match with the actual item at all.