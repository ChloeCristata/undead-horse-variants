advancement revoke @s only uhv:easy/drowned_trap
advancement revoke @s only uhv:normal/drowned_trap
advancement revoke @s only uhv:hard/drowned_trap

execute at @n[type=lightning_bolt] if biome ~ ~ ~ #uhv:spawns_drowned_horses if block ~ ~-1 ~ water unless entity @e[type=#uhv:undead_horses,distance=..5] run fill ~1 ~-1 ~1 ~-1 ~-1 ~-1 spruce_slab[type=top,waterlogged=true] replace water
execute at @n[type=lightning_bolt] if biome ~ ~ ~ #uhv:spawns_drowned_horses unless entity @e[type=#uhv:undead_horses,distance=..5] run summon zombie_horse ~ ~ ~ {Tame:1,PersistenceRequired:1b,Invulnerable:1,Team:drowned_horse,Tags:["uhv_trap","drowned_horse_trap","uhv_tracker"],active_effects:[{id:fire_resistance,duration:-1,amplifier:10,show_particles:0b}],Passengers:[{id:marker,Tags:["boardwalk_marker"]}]}
execute as @e[type=zombie_horse,tag=drowned_horse_trap] run item replace entity @s armor.feet with golden_boots[custom_name="UHV Booties",enchantments={binding_curse:1,boardwalk_boots:1,depth_strider:3,vanishing_curse:1},attribute_modifiers=[{type:armor,amount:0,id:"uhvboots",operation:add_value}]]