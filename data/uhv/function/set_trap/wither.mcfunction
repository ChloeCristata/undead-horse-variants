advancement revoke @s only uhv:normal/wither_trap

execute at @e[type=lightning_bolt] if predicate uhv:ruined_portal unless entity @e[type=#uhv:undead_horses,distance=..5] run summon skeleton_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Invulnerable:1,Team:wither_horse,Tags:["uhv_trap","wither_horse_trap","uhv_tracker"]}