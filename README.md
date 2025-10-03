## [< Download via Modrinth >](https://modrinth.com/project/dZ11pJyA)

---
---

This mod/datapack adds in five new skeleton & zombie horse variants based off of their humanoid counterparts!

All of these new variants — as well as the previously unused zombie horses — have been implemented into the game via vanilla-flavored mechanics reminiscent of how skeleton horses work.

**New Undead Horses:**
- Stray Horse
- Bogged Horse
- Wither Skeleton Horse
- Drowned Horse
- Husk Horse

**If you enjoy this mod/datapack, consider trying out [Saddles Squared](https://modrinth.com/project/eB9bMeol) as well!** The latest version has built-in compatabilty with Undead Horse Variants.

<details>
<summary>Installing / Uninstalling</summary>

**NOTE: [Entity Texture Features](https://modrinth.com/project/BVzZfTc1) and [Entity Model Features](https://modrinth.com/project/4I1XuqiY) are both required for this datapack/mod to function correctly.**

---

### Install As Mod

**Either...**
1. Download the correct version and drop the JAR file into your mods folder, **OR-**
2. Install the mod via Modrinth.

---

### Install As Datapack

1. Download the correct version and place the main ZIP file into your world's datapacks folder.
2. Place the resources ZIP file into your resource packs folder.

If you placed the files in the correct locations but it still isn't working, try running the "**/datapack enable...**" command and make sure that the required resource pack is enabled.

---

### Uninstallation

**To fully uninstall this mod/datapack and remove all traces of it...**

1. Type in this command: "**/function uhv:uninstall**"
2. Remove the mod/datapack from the folder you put it in during installation, or uninstall it via Modrinth.

</details>

<details>
<summary>Configuration</summary>

**The commands listed below can be used to configure certain features.**

> **/function uhv:config/snowstorms**
>
> Toggles whether or not lightning can strike during thunderstorms in snowy biomes. By default, this is toggled ON.

> **/function uhv:config/arid_storms**
>
> Toggles whether or not lightning can strike during thunderstorms in arid/dry-weather biomes. By default, this is toggled ON.

> **/function uhv:config/drw_swimming**
> 
> Cycles through three options:
> 
> 1. Drowned horses allow players to ride on them while underwater.
> 2. Drowned horses will swim if a player is riding on them while in deep water.
> 3. Drowned horses will kick players off upon being submerged underwater.
> 
> By default, option one is enabled.

> **/function uhv:config/non_drw_swimming**
>
> Cycles between two options:
>
> 1. Zombie, husk, & living horses will kick players off upon being submerged underwater.
> 2. Zombie, husk, & living horses are able to swim while a player is riding on them.
>
> By default, option one is enabled.

> **/function uhv:config/randomized_attributes**
> 
> Toggles whether or not undead horses the maximum health and movement speed of undead horses will be randomized upon spawning. When toggled off, you're also able to choose whether or not to reset the stats of currently spawned undead horses.
> 
> _When toggled off, you will also be given you option to reset the maximum health and speed stats of all undead horses to the default values._

> **/function uhv:config/gameplay_bonuses**
> 
> Toggles whether or not undead horses will receive gameplay bonuses when certain conditions are fulfilled.
> 
> _Turning off gameplay bonuses will **not** affect the fire resistance given to wither skeleton horses._

> **/function uhv:config/debugging**
>
> Toggles debug mode. If enabled, certain information will be logged in chat as well as in scoreboards. This primarily includes lightning strikes and undead horse spawning.

</details>

**Check the gallery for images, or keep reading for in-depth info!**

---

## Spawning

**Each time lightning strikes, there's a chance for an undead horse to spawn.**

How likely this is depends on several factors: the specific type of undead, the location where the lightning struck, and the current difficulty.

<details>
<summary>INFO - Spawning</summary>

For most of the undead horses, they each have a **1.125%** chance to spawn while on **easy** or **peaceful**. On **normal** difficulty, this percentage is boosted to **2.75%**, and on **hard** it's **4.5%**.

**The exceptions to this rule are the bogged horses, wither skeleton horses, and husk horses.**

**Bogged horses** have two different spawn rates:

If lightning strikes in a swamp, mangrove swamp, or mushroom fields biome, the chances are the same as previously mentioned. However, if lightning strikes a mushroom, mushroom block, or mycelium and it is **not** in a mushroom fields biome, a bogged horse will **always** spawn.

**Wither skeleton horses** have a **100%** chance to spawn whenever lightning strikes a ruined portal.

**Husk horses** have a **2.25%** chance on **easy** or **peaceful**, a **5.5%** chance on **normal**, and a **9%** chance on **hard**. This is to account for the less frequent lightning strikes in the dry-weather biomes where husk horses can spawn.

In vanilla, it actually isn't possible for lightning to strike in snowy or arid regions, however, this data pack changes that. It's now **equally as likely** for lightning to spawn during thunderstorms in snowy regions as in rainy ones, however, it's only **half as likely** for lightning to strike while in a dry-weather biome.

If you don't want to change the vanilla weather patterns at all, this feature can be toggled by using "**/function uhv:config/snowstorms**" and "**/function uhv:config/arid_storms**".

**The secondary requirements for the other undead horses are as follows:**

- **Drowned horses** spawn in ocean, river, and beach biomes.
- **Stray horses** spawn in snowy areas.
- And **zombie horses** will spawn anywhere.

</details>

_[(Skeleton horse spawning is unchanged, check the wiki for information)](https://minecraft.wiki/w/Skeleton_Horse#Spawning)_

## Undead Horse Traps

**If a player approaches an undead horse, they'll soon be in for a fight!**

Each undead variant will spawn a cavalry of four horsemen, each with varying equipment depending on the type of undead. All of their armor and weapons will be randomly enchanted as well.

**The drowned horsemen and the husk horsemen also come with a unique reward: explorer maps!** _**Where might these maps lead?**_

<details>
<summary>Where These Maps Might Lead</summary>

The map held by the **drowned** can lead to an **ocean monument, buried treasure, or ocean ruins.**

The map held by the **husks** can lead to a **desert temple, a mineshaft, or a desert village.**

When the horsemen first spawn, the map will check if the first option can be found within 50 chunks and has not yet been generated. If not, it'll check the second option, and if that fails, it'll check the third option. If all three options are unviable, the map will be left empty.

</details>

---

## "Boardwalks"

Drowned horsemen have an ability similar to the frost walker enchantment — except instead of creating frosted ice, they create a "boardwalk" made of spruce slabs. This boardwalk will disappear behind them as they move.

<details>
<summary>INFO - "Boardwalks"</summary>

Drowned horses will only create a boardwalk in these two situations:

1. They're a trapped horse which hasn't yet been approached by a player.
2. A drowned horseman is currently riding on them.

Any boardwalks created will be destroyed if either the drowned horse or their passenger dies.

If a player swims close below a drowned horse, the boardwalk will be removed, allowing the drowned to attack and preventing the player from being trapped underwater.

</details>
  
<details>
<summary>Why do these boardwalks exist?</summary>

Initially, I wanted the drowned horsemen to ride their horses underwater, however, drowned will **always** use their swimming animation while underwater — even if they're riding another entity. This looks incredibly silly, hence the decision to give them platforms instead of allowing them underwater.

I'm anticipating that once the _Mounts of Mayhem_ game drop is released, drowned will be updated to prioritize their riding animation over their swimming animation. If so, this mod/datapack will be updated as well, finally allowing drowned horsemen to ride underwater as I originally wanted them to.

If underwater horsemen are ever implemented, the boardwalks will remain as a toggleable option but will not be the default.

</details>

---

## Conversion

Like their humanoid counterparts, it's possible to convert certain types of undead horses into other variants. This includes all of the same conversions possible for humanoid undead, however, there's also certain methods which are exclusive to the undead horses.

<details>
<summary>INFO - Conversion</summary>

**Husk Horse -> Zombie Horse -> Drowned Horse:**

Submerge the horse underwater for 45 seconds. After the first 30 seconds the horse will begin to shake. Once 15 more seconds pass, they will be converted.

**Drowned Horse -> Zombie Horse -> Husk Horse:**

Use a sponge to dry out the horse. Each conversion requires 3 sponges. If the horse enters the water, the amount of sponges needed will be reset.

**Skeleton Horse -> Stray Horse:**

The horse needs to stand in powder snow for 22 total seconds. After the first 7 seconds they'll start shaking, and after the next 15 seconds the conversion will be completed.

**Skeleton Horse -> Bogged Horse:**

While in a swamp, submerge the horse underwater for 45 seconds. After the first 30 seconds the horse will begin to shake. Once 15 more seconds pass, they will be converted.

**Skeleton Horse -> Wither Skeleton Horse:**

Feed your horse a wither rose. They'll begin to shake and emit particles. After 7 seconds, the conversion will be completed.

</details>

---

## Shearing / Bone Mealing

Using shears, you can harvest the mushrooms & the mossy "tails" which grow on the backs of bogged horses. Unlike with humanoid bogged, this isn't a permanent change! If you ever want to return your bogged horse to their former appearance, using bonemeal will do the trick nicely.

---

## Underwater Horses / Swimming Horses / Vanilla Horses

Two functions have been added which allow players to choose how horses interact with water. Using these functions will cycle through the available options, with the first option listed below being the default option.

"**/function uhv:config/drw_swimming**" toggles the behavior of **drowned horses**.
1. Drowned horses allow players to ride on them while underwater.
2. Drowned horses will swim if a player is riding on them while in deep water.
3. Drowned horses will kick players off upon being submerged underwater.

**NOTE:** If option 2 is enabled, drowned horses can still be ridden underwater. To do so, they'll need to already be submerged before mounting them.

"**/function uhv:config/non_drw_swimming**" toggles the behavior of **zombie horses**, **husk horses**, and **living horses**.
1. Zombie, husk, & living horses will kick players off upon being submerged underwater.
2. Zombie, husk, & living horses are able to swim while a player is riding on them.

---

## Randomized Attributes

In vanilla, skeleton and zombie horses will **always** have a maximum health of **15 points (7.5 hearts)** and a base speed stat of **0.2 units**. This differs greatly from living horses which can have a maximum health of **15 to 30 points** and a speed stat of **0.1125 to 0.3375 units**.

This mod/datapack gets rid of this disparity, changing it so that undead horses will have their attributes randomized upon spawning. The maximum and minimum values possible are the same as for their living counterparts.

Using "**/function uhv:config/randomized_attributes**" will toggle this feature on and off. Toggling it off will also give you the option to reset the maximum health and speed stats of all undead horses to the default values.

---

## Gameplay Bonuses

All of the undead horses have different gameplay bonuses which will give them an edge under certain circumstances.

<details>
<summary>INFO - Gameplay Bonuses</summary>

- **Zombie horses** and **skeleton horses** both receive a level 1 speed boost during the night. _Night lasts from the moment that undead stop burning (12,542 ticks) until they start burning again in the morning (23,460 ticks)._

- **Drowned horses** have been given level 3 depth strider and a level 1 speed boost while in ocean, river, or beach biomes, as well as when they're in water. If submerged, they get a level 2 jump boost effect as well, useful for scaling steep underwater dropoffs.

- **Husk horses** receive a level 2 speed boost while in the desert or on sandy terrain. _This includes all variants of sand, sandstone, and terracotta._

- **Stray horses** have been given level 1 frost walker as well as a level 1 speed boost while on snowy or icy terrain. They also won't sink in powder snow!

- **Bogged horses** receive level 3 depth strider as well as a level 2 speed boost while in swamp biomes or on certain types of terrain. _This includes mushroom blocks, mycelium, mud, rooted dirt, podzol, moss, farmland/crops, and everything mangrove related._

- **Wither skeleton horses** have been given level 2 soul speed as well as applying a level 1 wither effect to any entites within 16 blocks which attempt to attack the player currently riding on them.

---

If you're not a fan of these bonuses, that's fine too: just turn them off by using "**/function uhv:config/remove_bonuses**".

Doing so will remove _almost_ all gameplay bonuses — however, certain "inherent" abilities will not be removed. These abilities include **wither skeleton horses being immune to fire & withering** as well as **stray horses & skeleton horses being immune to freeze damage.**

</details>

---

## Emissive Textures

Some of the new undead horses have emissive eyes and other such glowing details. In vanilla, none of their humanoid counterparts utilize emissive layers despite their designs suggesting that they should. 

For consistency, I'd suggest using a resource pack such as **[Glowing Entities](https://modrinth.com/project/pCcNx1Zg)** which makes these details emissive! Alternatively, you can disable the emissive layers via ETF/EMF's configuration screen.

---
---

Special thanks to the **[Minecraft Wiki](https://minecraft.wiki/)**, the **[Datapack Hub](https://datapack.wiki/)**, and all of the datapacks that I studied while putting this together! In particular, shout out to **[Horses Can Float](https://modrinth.com/project/MKFXH430)**, which helped a lot when I was figuring out how to get the drowned horses to swim consistently.

If anyone wants to take a peek at how this mod/datapack works, I've added notes to some of the mcfunction files to help clarify what each of the commands do!
