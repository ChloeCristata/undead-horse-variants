# Kick off any passengers.
execute on passengers run ride @s dismount

# Conjure an un-undead vessel for the zombie horse's soul to call home.
summon horse ~ ~ ~ {Tags:[cured_from_zombie]}

# Randomize the horse variant. Yes, there's 1030 color/marking combinations.
execute store result entity @n[type=horse,tag=cured_from_zombie,distance=..1] Variant float 1 run random value 0..1030

# And now for the main reason why this was sectioned off into a different function!
# These commands handle the tedious, annoying ritual of transferring the zombie horse's soul to its new body.
# Some of this info is way more important than other bits, but I chose to only omit the most irrelevent/ephemeral data.

data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Pos set from entity @s Pos
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Rotation set from entity @s Rotation
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] CustomName set from entity @s CustomName
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Owner set from entity @s Owner
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] leash set from entity @s leash
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Age set from entity @s Age
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Motion set from entity @s Motion
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] equipment set from entity @s equipment
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] EatingHaystack set from entity @s EatingHaystack
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Invulnerable set from entity @s Invulnerable
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] PersistenceRequired set from entity @s PersistenceRequired
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Glowing set from entity @s Glowing
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] HasVisualFire set from entity @s HasVisualFire
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] NoGravity set from entity @s NoGravity
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Silent set from entity @s Silent
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] attributes set from entity @s attributes
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Health set from entity @s Health
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] AbsorptionAmount set from entity @s AbsorptionAmount
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Fire set from entity @s Fire
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] FallFlying set from entity @s FallFlying
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] LeftHanded set from entity @s LeftHanded
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] CanPickUpLoot set from entity @s CanPickUpLoot
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Tags append from entity @s Tags[]

# Apparently being de-zombified is a nauseating experience!
effect give @n[type=horse,tag=cured_from_zombie,distance=..1] nausea 10 1 false

# Play the zombie villager conversion sound.
execute at @n[type=horse,tag=cured_from_zombie,distance=..1] run playsound minecraft:entity.zombie_villager.converted neutral @a ~ ~ ~ 1 1

# Any UHV boots need to be removed.
execute as @n[type=horse,tag=cured_from_zombie,distance=..1] if items entity @s armor.feet golden_boots[custom_name="UHV Booties"] run item replace entity @s armor.feet with air

# If gameplay bonuses are enabled, un-undead horses will be given a lvl 2 regeneration effect.
execute if score toggle uhv_bonuses matches 1 run effect give @n[type=horse,tag=cured_from_zombie,distance=..1] regeneration infinite 1 true

# Awwww, they love you!
data modify entity @n[type=horse,tag=cured_from_zombie,distance=..1] Tame set value 1b
execute at @n[type=horse,tag=cured_from_zombie,distance=..1] run particle minecraft:heart ~ ~2.5 ~ 0.3 0.3 0.3 1 3

# Banish the empty corpse to oblivion.
tp @s 0 -2032 0