# 1. Get the Client
Download the client from here:

https://www.wowdl.net/download/3.3.5a-win-us

# 2. Swap the Realmlist
Replace the realmlist.wtf in the WoW_Directory/data/enUS folder.
The realmlist is available on Discord.

# 3. Apply the Application Patch
This is required to prevent the client from caching items and reading the internal items.dbc file.
This allows for server side item modifications to be made without the need for client patches or cache clearing.

 1. Replace the wow.exe file with the one provided in this GitHub repository.
 2. Run the WoWPatcher program and select the settings as per the screenshot below:

![image](https://user-images.githubusercontent.com/5217306/206838045-e2261791-9745-47b2-9a75-43a412760d4c.png)

# 4. Download the Mandatory MPQ Patches
This is where it gets complicated. There is a large mandatory MPQ set for the custom maps. 

Downlod it here:
https://drive.google.com/drive/folders/1ydFeKNugdBlzKHPf7fqL30oidcyCxOr_?usp=sharing

Extract the zip and look inside, notice there are two files. The first goes into the WOW_Directory/Data/ folder and the other in the WOW_Directory/Data/enUS folder.
It should be pretty clear which goes where. If not ask for help.

The other mandatory patch is for spell tweaks and other customisations, and is kept in this GitHub repository.
Download the Patch-5.MPQ files from this repository containing custom spells. Place the MPQ in the client WOW_Directory/Data/
Without this patch custom spells will not function correctly in your client.

To Summarise:
Patch-4.MPQ - Custom Maps

Patch-enUS-4.MPQ - Custom Maps

patch-5.MPQ - Custom Spells

See screenshots below for MPQ file reference.
![MPQ files](https://user-images.githubusercontent.com/5217306/219009374-9360b7f4-e385-42cd-8fe8-41bfc6aa8bf6.png)
![MPQ files2](https://user-images.githubusercontent.com/5217306/219007099-52f58ebb-b1d7-4fad-82ea-d079afa12532.png)

# 4.b. Download the Optional MPQ Patches
These patches provide an upgraded UI and graphic models used in later versions of the game.
Download from the link below and put them in the same folder as above.

https://drive.google.com/drive/folders/1n8AqZTaeb8x8-aWFkWZ-nc0jvaGCJ9TI?usp=sharing

Download and save in the client WOW_Directory/Data/

patch-6.MPQ - Music

patch-7.MPQ - Cleaner login page and password Saving

patch-8.MPQ - High Resolution Classic Armors

patch-9.MPQ - High Resolution Classic Shields

patch-C.MPQ - HD Character Creator and Login

patch-D.MPQ - HD Goblins

patch-F.MPQ - Mounts, Druid forms & NPCs Part 1(won't work without P2)

patch-G.MPQ - Mounts, Druid forms & NPCs Part 2(won't work without P1)

patch-H.MPQ - HD Character Models

patch-M.MPQ - Loading Screens

patch-S.MPQ - Sunlight

patch-T.MPQ - Tilesets, Grass & Buildings

patch-V.MPQ - Updated character and spell book UI

patch-W.MPQ - HD Water

patch-X.MPQ - HD Trees & Flowers

patch-Y.MPQ - Blood Splatters

patch-Z.MPQ - Darker Nights

# Info - Custom Items

Some of the custom items added to the server, so far.

![WoWScrnShot_122622_144701](https://user-images.githubusercontent.com/5217306/209514341-fe68ff04-a423-48c0-b775-cf1564be2cc5.jpg)

![WoWScrnShot_122622_144717](https://user-images.githubusercontent.com/5217306/209514348-5aa92d3e-7aec-4353-a1a3-faa233e7cc13.jpg)

![WoWScrnShot_122622_145708](https://user-images.githubusercontent.com/5217306/209514899-4c7ed90a-8849-4a7c-938a-caaba1eeb86c.jpg)

![WoWScrnShot_122622_145810](https://user-images.githubusercontent.com/5217306/209514998-88e5485e-cbf4-418d-87ab-fa83af813605.jpg)

# Info - Server Modules

The extra modules used on the server, these are used to further customise the game.

![image](https://user-images.githubusercontent.com/5217306/209515282-0454a0f3-ff56-469e-b7f2-234f48b91406.png)

## Info - Racial Trait Swap
Players can select the racials from a second race to add to their own. The module is meant to be a swap, but removal of the original racial is bugged. What racial ability combinations will be the most overpowered?

The NPC to complete the swap is located in Booty Bay Inn, and can also be spawned by a GM account using NPC ID 98888.
A small fee 100G is charged for the second racial.

https://github.com/azerothcore/mod-racial-trait-swap

## Info - Individual Progression:
Player progression is locked until certain milestones are met. All Vanilla raids must be cleared before access to Outland is possible. Similarly all TBC raids must be cleared before access to Northrend is unlocked. Progress is recorded against each character, so the progression must be repeated on each alt created as well.

https://github.com/ZhengPeiRu21/mod-individual-progression

## Info - Congrats on Level:
players receive bonus rewards at level milestones. Mostly quality of life custom items shown above.


