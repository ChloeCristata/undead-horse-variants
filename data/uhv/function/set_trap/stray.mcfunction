advancement revoke @s only uhv:easy/stray_trap
advancement revoke @s only uhv:normal/stray_trap
advancement revoke @s only uhv:hard/stray_trap

execute at @n[type=lightning_bolt] if biome ~ ~ ~ #uhv:spawns_stray_horses unless entity @e[type=#uhv:undead_horses,distance=..5] run summon skeleton_horse ~ ~0.1 ~ {Tame:1,PersistenceRequired:1b,Invulnerable:1,Team:stray_horse,Tags:["uhv_trap","stray_horse_trap","uhv_tracker"],active_effects:[{id:fire_resistance,duration:-1,amplifier:10,show_particles:0b}],equipment:{saddle:{id:saddle,count:1}}}