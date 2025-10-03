advancement revoke @s only uhv:clear_interactions

execute as @e[type=interaction,tag=uhv_interaction] at @s unless entity @n[type=#uhv:undead_horses,tag=uhv_interactable,predicate=uhv:slowed,distance=..0.1] run kill @s