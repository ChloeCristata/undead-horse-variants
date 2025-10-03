advancement revoke @s only uhv:interaction_entities

execute at @e[type=#uhv:undead_horses,tag=uhv_interactable,distance=..5] unless entity @e[type=interaction,distance=..0.1] run summon interaction ~ ~ ~ {Tags:["uhv_interaction"],width:1.5,height:1.7,response:1}

execute as @e[type=skeleton_horse,team=bogged_horse] at @s if entity @e[type=interaction,distance=..0.1] run tag @n[type=interaction,distance=..0.1] add interact_uhv_bog
execute as @e[type=skeleton_horse,team=shorn_bog_horse] at @s if entity @e[type=interaction,distance=..0.1] run tag @n[type=interaction,distance=..0.1] add interact_uhv_shorn
execute as @e[type=skeleton_horse,team=skeleton_horse] at @s if entity @e[type=interaction,distance=..0.1] run tag @n[type=interaction,distance=..0.1] add interact_uhv_wth
execute as @e[type=zombie_horse,team=!husk_horse] at @s if entity @e[type=interaction,distance=..0.1] run tag @n[type=interaction,distance=..0.1] add interact_uhv_sponge