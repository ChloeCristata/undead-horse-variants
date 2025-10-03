advancement revoke @s only uhv:easy/husk_trap
advancement revoke @s only uhv:normal/husk_trap
advancement revoke @s only uhv:hard/husk_trap

execute as @n[type=lightning_bolt] at @s unless block ~ ~ ~ water unless block ~ ~-1 ~ water unless entity @e[type=#uhv:undead_horses,distance=..5] run summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Invulnerable:1,Team:husk_horse,Tags:["uhv_trap","husk_horse_trap","uhv_tracker"],active_effects:[{id:fire_resistance,duration:-1,amplifier:10,show_particles:0b}]}