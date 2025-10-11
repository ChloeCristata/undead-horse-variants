advancement revoke @s only uhv:easy/bogged_trap
advancement revoke @s only uhv:normal/bogged_trap
advancement revoke @s only uhv:hard/bogged_trap

execute at @n[type=lightning_bolt] if biome ~ ~ ~ #uhv:spawns_bogged_horses unless entity @e[type=#uhv:undead_horses,distance=..5] run summon skeleton_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Invulnerable:1,Team:bogged_horse,Tags:["uhv_trap","bogged_horse_trap","uhv_tracker"],active_effects:[{id:fire_resistance,duration:-1,amplifier:10,show_particles:0b}]}