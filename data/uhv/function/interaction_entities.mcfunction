advancement revoke @s only uhv:interaction_entities

execute at @e[type=#uhv:undead_horses,tag=!uhv_non_interactable,distance=..5] unless entity @e[type=interaction,distance=..0.1] run summon interaction ~ ~ ~ {Tags:["uhv_interaction"],width:1.5,height:1.7,response:1}

execute at @e[type=skeleton_horse,team=bogged_horse] run tag @n[type=interaction,distance=..0.1] add interact_uhv_bog
execute at @e[type=skeleton_horse,team=shorn_bog_horse] run tag @n[type=interaction,distance=..0.1] add interact_uhv_shorn
execute at @e[type=skeleton_horse,team=skeleton_horse] run tag @n[type=interaction,distance=..0.1] add interact_uhv_wth
execute at @e[type=zombie_horse,team=!husk_horse] run tag @n[type=interaction,distance=..0.1] add interact_uhv_sponge
execute at @e[type=zombie_horse,predicate=uhv:weakened] run tag @n[type=interaction,distance=..0.1] add interact_uhv_cure