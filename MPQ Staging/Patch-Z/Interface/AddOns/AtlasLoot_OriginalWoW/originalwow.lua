local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")


-- Index
--- Dungeons & Raids
---- Keys
---- Ahn'Qiraj: The Ruins of Ahn'Qiraj
---- Ahn'Qiraj: The Temple of Ahn'Qiraj
---- AQ Enchants
---- Blackfathom Deeps
---- Blackrock Mountain: Blackrock Dephts
---- Blackrock Mountain: Lower Blackrock Spire
---- Blackrock Mountain: Upper Blackrock Spire
---- Blackrock Mountain: Molten Core
---- Blackrock Mountain: Blackwing Lair
---- Dire Maul Books
---- Dire Maul East
---- Dire Maul North
---- Dire Maul West
---- Gnomeregan
---- Maraudon
---- Ragefire Chasm
---- Razorfen Downs
---- Razorfen Kraul
---- Scarlet Monastery
---- Scholomance
---- Shadowfang Keep
---- Stratholme
---- The Deadmines
---- The Stockade
---- The Sunken Temple
---- Uldaman
---- Wailing Caverns
---- Zul'Farrak
---- Zul'Gurub
--- Sets & Collections
---- Dungeon 1 and 2 Sets (D1/D2)
---- Tier 1/2 Sets (T1/T2)
---- Tier 3 Sets (T3)
---- Vanilla WoW Sets
---- ZG Sets
---- AQ20 Sets
---- AQ40 Sets
---- BoE World Epics
--- PvP
---- Alterac Valley
---- Arathi Basin
---- Warsong Gulch
---- PvP Level 60 Rare and Epic Sets
---- PvP Level 60 Weapons
---- PvP Level 60 Accessories
--- Factions
---- Misc
---- Argent Dawn
---- Bloodsail Buccaneers & Hydraxian Waterlords
---- Brood of Nozdormu
---- Cenarion Circle
---- Stormpike Guard & Frostwolf Clan
---- Thorium Brotherhood
---- Timbermaw Hold
---- Zandalar Tribe
--- World Bosses
---- Dragons of Nightmare
---- Azuregos

	------------------------
	--- Dungeons & Raids ---
	------------------------

		------------
		--- Keys ---
		------------

	AtlasLoot_Data["OldKeys"] = {
		{ 1, 0, "INV_Box_01", "=q6=#e9#", ""};
		{ 2, 7146, "", "=q2=The Scarlet Key", "=ds=#e9#"};
		{ 3, 12382, "", "=q2=Key to the City", "=ds=#e9#"};
		{ 4, 6893, "", "=q1=Workshop Key", "=ds=#e9#"};
		{ 5, 11000, "", "=q1=Shadowforge Key", "=ds=#e9#"};
		{ 6, 11140, "", "=q1=Prison Cell Key", "=ds=#e9#"};
		{ 7, 18249, "", "=q1=Crescent Key", "=ds=#e9#"};
		{ 8, 13704, "", "=q1=Skeleton Key", "=ds=#e9#"};
		{ 10, 0, "INV_Box_01", "=q6=#j7#", ""};
		{ 11, 22057, "", "=q1=Brazier of Invocation", "=ds=#m27#"};
		{ 12, 21986, "", "=q1=Banner of Provocation", "=ds=#m27#"};
		{ 16, 0, "INV_Box_01", "=q6=#m20#", ""};
		{ 17, 19931, "", "=q3=Gurubashi Mojo Madness", "=ds=#m27#"};
		{ 18, 13523, "", "=q1=Blood of Innocents", "=ds=#m27#"};
		{ 19, 18746, "", "=q1=Divination Scryer", "=ds=#m27#"};
		{ 20, 18663, "", "=q1=J'eevee's Jar", "=ds=#m27#"};
		{ 21, 19974, "", "=q1=Mudskunk Lure", "=ds=#m27#"};
		{ 22, 7733, "", "=q1=Staff of Prehistoria", "=ds=#m27#"};
		{ 23, 10818, "", "=q1=Yeh'kinya's Scroll", "=ds=#m27#"};
	};

		-----------------------------------------
		--- Ahn'Qiraj: The Ruins of Ahn'Qiraj ---
		-----------------------------------------

	AtlasLoot_Data["AQ20Kurinnaxx"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 22217, "", "=q1=Kurinnaxx's Venom Sac", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 20884, "", "=q3=Qiraji Magisterial Ring", "=ds=#m3#", "", "" };
    { 6, 20885, "", "=q3=Qiraji Martial Drape", "=ds=#m3#", "", "" };
    { 7, 20888, "", "=q3=Qiraji Ceremonial Ring", "=ds=#m3#", "", "" };
    { 8, 20889, "", "=q3=Qiraji Regal Drape", "=ds=#m3#", "", "" };
    { 9, 21498, "", "=q4=Qiraji Sacrificial Dagger", "=ds=#w4#", "", "10.0%" };
    { 10, 21499, "", "=q4=Vestments of the Shifting Sands", "=ds=#a1#", "", "10.0%" };
    { 11, 21500, "", "=q3=Belt of the Inquisition", "=ds=#a1#", "", "" };
    { 12, 21501, "", "=q3=Toughened Silithid Hide Gloves", "=ds=#a2#", "", "" };
    { 13, 21502, "", "=q3=Sand Reaver Wristguards", "=ds=#a3#", "", "" };
    { 14, 21503, "", "=q3=Belt of the Sand Reaver", "=ds=#a4#", "", "" };
    { 15, 21302, "", "=q3=Handbook of Deadly Poison V", "=ds=#e2#", "", "3.85%" };
    { 16, 20727, "", "=q3=Formula: Enchant Gloves - Shadow Power", "=ds=#e2#", "", "14.3%" };
    { 17, 20728, "", "=q3=Formula: Enchant Gloves - Frost Power", "=ds=#e2#", "", "14.3%" };
    { 18, 20729, "", "=q3=Formula: Enchant Gloves - Fire Power", "=ds=#e2#", "", "14.3%" };
    { 19, 20730, "", "=q3=Formula: Enchant Gloves - Healing Power", "=ds=#e2#", "", "14.3%" };
    { 20, 20731, "", "=q3=Formula: Enchant Gloves - Superior Agility", "=ds=#e2#", "", "14.3%" };
    { 21, 20734, "", "=q3=Formula: Enchant Cloak - Stealth", "=ds=#e2#", "", "14.3%" };
    { 22, 20736, "", "=q3=Formula: Enchant Cloak - Dodge", "=ds=#e2#", "", "14.3%" };
    { 23, 21214, "", "=q3=Tome of Frostbolt XI", "=ds=#e2#", "", "4.00%" };
    { 24, 21279, "", "=q3=Tome of Fireball XII", "=ds=#e2#", "", "4.00%" };
    { 25, 21280, "", "=q3=Tome of Arcane Missiles VIII", "=ds=#e2#", "", "4.00%" };
    { 26, 21281, "", "=q3=Grimoire of Shadow Bolt X", "=ds=#e2#", "", "4.00%" };
    { 27, 21282, "", "=q3=Grimoire of Immolate VIII", "=ds=#e2#", "", "4.00%" };
    { 28, 21283, "", "=q3=Grimoire of Corruption VII", "=ds=#e2#", "", "4.00%" };
    { 29, 21284, "", "=q3=Codex of Greater Heal V", "=ds=#e2#", "", "4.00%" };
    { 30, 21285, "", "=q3=Codex of Renew X", "=ds=#e2#", "", "4.00%" };
    { 31, 21287, "", "=q3=Codex of Prayer of Healing V", "=ds=#e2#", "", "4.00%" };
    { 32, 21288, "", "=q3=Libram: Blessing of Wisdom VI", "=ds=#e2#", "", "4.00%" };
    { 33, 21289, "", "=q3=Libram: Blessing of Might VII", "=ds=#e2#", "", "4.00%" };
    { 34, 21290, "", "=q3=Libram: Holy Light IX", "=ds=#e2#", "", "4.00%" };
    { 35, 21291, "", "=q3=Tablet of Healing Wave X", "=ds=#e2#", "", "4.00%" };
    { 36, 21292, "", "=q3=Tablet of Strength of Earth Totem V", "=ds=#e2#", "", "4.00%" };
    { 37, 21294, "", "=q3=Book of Healing Touch XI", "=ds=#e2#", "", "4.00%" };
    { 38, 21295, "", "=q3=Book of Starfire VII", "=ds=#e2#", "", "4.00%" };
    { 39, 21296, "", "=q3=Book of Rejuvenation XI", "=ds=#e2#", "", "4.00%" };
    { 40, 21297, "", "=q3=Manual of Heroic Strike IX", "=ds=#e2#", "", "4.00%" };
    { 41, 21298, "", "=q3=Manual of Battle Shout VII", "=ds=#e2#", "", "4.00%" };
    { 42, 21299, "", "=q3=Manual of Revenge VI", "=ds=#e2#", "", "4.00%" };
    { 43, 21300, "", "=q3=Handbook of Backstab IX", "=ds=#e2#", "", "4.00%" };
    { 44, 21303, "", "=q3=Handbook of Feint V", "=ds=#e2#", "", "4.00%" };
    { 45, 21304, "", "=q3=Guide: Multi-Shot V", "=ds=#e2#", "", "4.00%" };
    { 46, 21306, "", "=q3=Guide: Serpent Sting IX", "=ds=#e2#", "", "4.00%" };
    { 47, 21307, "", "=q3=Guide: Aspect of the Hawk VII", "=ds=#e2#", "", "4.00%" };
	};

	AtlasLoot_Data["AQ20Rajaxx"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 20884, "", "=q3=Qiraji Magisterial Ring", "=ds=#m3#", "", "" };
    { 3, 20885, "", "=q3=Qiraji Martial Drape", "=ds=#m3#", "", "" };
    { 4, 20888, "", "=q3=Qiraji Ceremonial Ring", "=ds=#m3#", "", "" };
    { 5, 20889, "", "=q3=Qiraji Regal Drape", "=ds=#m3#", "", "" };
    { 6, 21492, "", "=q4=Manslayer of the Qiraji", "=ds=#w10#", "", "10.0%" };
    { 7, 21493, "", "=q4=Boots of the Vanguard", "=ds=#a2#", "", "10.0%" };
    { 8, 21494, "", "=q3=Southwind's Grasp", "=ds=#a2#", "", "" };
    { 9, 21495, "", "=q3=Legplates of the Qiraji Command", "=ds=#a4#", "", "" };
    { 10, 21496, "", "=q3=Bracers of Qiraji Command", "=ds=#a1#", "", "" };
    { 11, 21497, "", "=q3=Boots of the Qiraji General", "=ds=#a3#", "", "" };
    { 12, 21302, "", "=q3=Handbook of Deadly Poison V", "=ds=#e2#", "", "3.85%" };
    { 13, 20727, "", "=q3=Formula: Enchant Gloves - Shadow Power", "=ds=#e2#", "", "14.3%" };
    { 14, 20728, "", "=q3=Formula: Enchant Gloves - Frost Power", "=ds=#e2#", "", "14.3%" };
    { 15, 20729, "", "=q3=Formula: Enchant Gloves - Fire Power", "=ds=#e2#", "", "14.3%" };
    { 16, 20730, "", "=q3=Formula: Enchant Gloves - Healing Power", "=ds=#e2#", "", "14.3%" };
    { 17, 20731, "", "=q3=Formula: Enchant Gloves - Superior Agility", "=ds=#e2#", "", "14.3%" };
    { 18, 20734, "", "=q3=Formula: Enchant Cloak - Stealth", "=ds=#e2#", "", "14.3%" };
    { 19, 20736, "", "=q3=Formula: Enchant Cloak - Dodge", "=ds=#e2#", "", "14.3%" };
    { 20, 21214, "", "=q3=Tome of Frostbolt XI", "=ds=#e2#", "", "4.00%" };
    { 21, 21279, "", "=q3=Tome of Fireball XII", "=ds=#e2#", "", "4.00%" };
    { 22, 21280, "", "=q3=Tome of Arcane Missiles VIII", "=ds=#e2#", "", "4.00%" };
    { 23, 21281, "", "=q3=Grimoire of Shadow Bolt X", "=ds=#e2#", "", "4.00%" };
    { 24, 21282, "", "=q3=Grimoire of Immolate VIII", "=ds=#e2#", "", "4.00%" };
    { 25, 21283, "", "=q3=Grimoire of Corruption VII", "=ds=#e2#", "", "4.00%" };
    { 26, 21284, "", "=q3=Codex of Greater Heal V", "=ds=#e2#", "", "4.00%" };
    { 27, 21285, "", "=q3=Codex of Renew X", "=ds=#e2#", "", "4.00%" };
    { 28, 21287, "", "=q3=Codex of Prayer of Healing V", "=ds=#e2#", "", "4.00%" };
    { 29, 21288, "", "=q3=Libram: Blessing of Wisdom VI", "=ds=#e2#", "", "4.00%" };
    { 30, 21289, "", "=q3=Libram: Blessing of Might VII", "=ds=#e2#", "", "4.00%" };
    { 31, 21290, "", "=q3=Libram: Holy Light IX", "=ds=#e2#", "", "4.00%" };
    { 32, 21291, "", "=q3=Tablet of Healing Wave X", "=ds=#e2#", "", "4.00%" };
    { 33, 21292, "", "=q3=Tablet of Strength of Earth Totem V", "=ds=#e2#", "", "4.00%" };
    { 34, 21294, "", "=q3=Book of Healing Touch XI", "=ds=#e2#", "", "4.00%" };
    { 35, 21295, "", "=q3=Book of Starfire VII", "=ds=#e2#", "", "4.00%" };
    { 36, 21296, "", "=q3=Book of Rejuvenation XI", "=ds=#e2#", "", "4.00%" };
    { 37, 21297, "", "=q3=Manual of Heroic Strike IX", "=ds=#e2#", "", "4.00%" };
    { 38, 21298, "", "=q3=Manual of Battle Shout VII", "=ds=#e2#", "", "4.00%" };
    { 39, 21299, "", "=q3=Manual of Revenge VI", "=ds=#e2#", "", "4.00%" };
    { 40, 21300, "", "=q3=Handbook of Backstab IX", "=ds=#e2#", "", "4.00%" };
    { 41, 21303, "", "=q3=Handbook of Feint V", "=ds=#e2#", "", "4.00%" };
    { 42, 21304, "", "=q3=Guide: Multi-Shot V", "=ds=#e2#", "", "4.00%" };
    { 43, 21306, "", "=q3=Guide: Serpent Sting IX", "=ds=#e2#", "", "4.00%" };
    { 44, 21307, "", "=q3=Guide: Aspect of the Hawk VII", "=ds=#e2#", "", "4.00%" };
	};

	AtlasLoot_Data["AQ20Moam"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22220, "", "=q3=Plans: Black Grasp of the Destroyer", "=ds=#e2#", "", "15.0%" };
    { 3, 20884, "", "=q3=Qiraji Magisterial Ring", "=ds=#m3#", "", "" };
    { 4, 20888, "", "=q3=Qiraji Ceremonial Ring", "=ds=#m3#", "", "" };
    { 5, 21467, "", "=q4=Thick Silithid Chestguard", "=ds=#a2#", "", "" };
    { 6, 21471, "", "=q4=Talon of Furious Concentration", "=ds=#e15#", "", "" };
    { 7, 21472, "", "=q4=Dustwind Turban", "=ds=#a1#", "", "" };
    { 8, 21479, "", "=q4=Gauntlets of the Immovable", "=ds=#a4#", "", "" };
    { 9, 21455, "", "=q3=Southwind Helm", "=ds=#a2#", "", "" };
    { 10, 21468, "", "=q3=Mantle of Maz'Nadir", "=ds=#a1#", "", "" };
    { 11, 21469, "", "=q3=Gauntlets of Southwind", "=ds=#a2#", "", "" };
    { 12, 21470, "", "=q3=Cloak of the Savior", "=ds=#a1#", "", "" };
    { 13, 21473, "", "=q3=Eye of Moam", "=ds=#e15#", "", "" };
    { 14, 21474, "", "=q3=Chitinous Shoulderguards", "=ds=#a2#", "", "" };
    { 15, 21475, "", "=q3=Legplates of the Destroyer", "=ds=#a4#", "", "" };
    { 16, 21476, "", "=q3=Obsidian Scaled Leggings", "=ds=#a3#", "", "" };
    { 17, 21477, "", "=q3=Ring of Fury", "=ds=#e15#", "", "" };
    { 18, 21302, "", "=q3=Handbook of Deadly Poison V", "=ds=#e2#", "", "3.85%" };
    { 19, 20727, "", "=q3=Formula: Enchant Gloves - Shadow Power", "=ds=#e2#", "", "14.3%" };
    { 20, 20728, "", "=q3=Formula: Enchant Gloves - Frost Power", "=ds=#e2#", "", "14.3%" };
    { 21, 20729, "", "=q3=Formula: Enchant Gloves - Fire Power", "=ds=#e2#", "", "14.3%" };
    { 22, 20730, "", "=q3=Formula: Enchant Gloves - Healing Power", "=ds=#e2#", "", "14.3%" };
    { 23, 20731, "", "=q3=Formula: Enchant Gloves - Superior Agility", "=ds=#e2#", "", "14.3%" };
    { 24, 20734, "", "=q3=Formula: Enchant Cloak - Stealth", "=ds=#e2#", "", "14.3%" };
    { 25, 20736, "", "=q3=Formula: Enchant Cloak - Dodge", "=ds=#e2#", "", "14.3%" };
    { 26, 21214, "", "=q3=Tome of Frostbolt XI", "=ds=#e2#", "", "4.00%" };
    { 27, 21279, "", "=q3=Tome of Fireball XII", "=ds=#e2#", "", "4.00%" };
    { 28, 21280, "", "=q3=Tome of Arcane Missiles VIII", "=ds=#e2#", "", "4.00%" };
    { 29, 21281, "", "=q3=Grimoire of Shadow Bolt X", "=ds=#e2#", "", "4.00%" };
    { 30, 21282, "", "=q3=Grimoire of Immolate VIII", "=ds=#e2#", "", "4.00%" };
    { 31, 21283, "", "=q3=Grimoire of Corruption VII", "=ds=#e2#", "", "4.00%" };
    { 32, 21284, "", "=q3=Codex of Greater Heal V", "=ds=#e2#", "", "4.00%" };
    { 33, 21285, "", "=q3=Codex of Renew X", "=ds=#e2#", "", "4.00%" };
    { 34, 21287, "", "=q3=Codex of Prayer of Healing V", "=ds=#e2#", "", "4.00%" };
    { 35, 21288, "", "=q3=Libram: Blessing of Wisdom VI", "=ds=#e2#", "", "4.00%" };
    { 36, 21289, "", "=q3=Libram: Blessing of Might VII", "=ds=#e2#", "", "4.00%" };
    { 37, 21290, "", "=q3=Libram: Holy Light IX", "=ds=#e2#", "", "4.00%" };
    { 38, 21291, "", "=q3=Tablet of Healing Wave X", "=ds=#e2#", "", "4.00%" };
    { 39, 21292, "", "=q3=Tablet of Strength of Earth Totem V", "=ds=#e2#", "", "4.00%" };
    { 40, 21294, "", "=q3=Book of Healing Touch XI", "=ds=#e2#", "", "4.00%" };
    { 41, 21295, "", "=q3=Book of Starfire VII", "=ds=#e2#", "", "4.00%" };
    { 42, 21296, "", "=q3=Book of Rejuvenation XI", "=ds=#e2#", "", "4.00%" };
    { 43, 21297, "", "=q3=Manual of Heroic Strike IX", "=ds=#e2#", "", "4.00%" };
    { 44, 21298, "", "=q3=Manual of Battle Shout VII", "=ds=#e2#", "", "4.00%" };
    { 45, 21299, "", "=q3=Manual of Revenge VI", "=ds=#e2#", "", "4.00%" };
    { 46, 21300, "", "=q3=Handbook of Backstab IX", "=ds=#e2#", "", "4.00%" };
    { 47, 21303, "", "=q3=Handbook of Feint V", "=ds=#e2#", "", "4.00%" };
    { 48, 21304, "", "=q3=Guide: Multi-Shot V", "=ds=#e2#", "", "4.00%" };
    { 49, 21306, "", "=q3=Guide: Serpent Sting IX", "=ds=#e2#", "", "4.00%" };
    { 50, 21307, "", "=q3=Guide: Aspect of the Hawk VII", "=ds=#e2#", "", "4.00%" };
	};

	AtlasLoot_Data["AQ20Buru"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 20884, "", "=q3=Qiraji Magisterial Ring", "=ds=#m3#", "", "" };
    { 3, 20885, "", "=q3=Qiraji Martial Drape", "=ds=#m3#", "", "" };
    { 4, 20888, "", "=q3=Qiraji Ceremonial Ring", "=ds=#m3#", "", "" };
    { 5, 20889, "", "=q3=Qiraji Regal Drape", "=ds=#m3#", "", "" };
    { 6, 21485, "", "=q4=Buru's Skull Fragment", "=ds=#e16#", "", "6.67%" };
    { 7, 21486, "", "=q4=Gloves of the Swarm", "=ds=#a4#", "", "6.67%" };
    { 8, 21487, "", "=q4=Slimy Scaled Gauntlets", "=ds=#a3#", "", "6.67%" };
    { 9, 21488, "", "=q3=Fetish of Chitinous Spikes", "=ds=#e15#", "", "" };
    { 10, 21489, "", "=q3=Quicksand Waders", "=ds=#a1#", "", "" };
    { 11, 21490, "", "=q3=Slime Kickers", "=ds=#a4#", "", "" };
    { 12, 21491, "", "=q3=Scaled Bracers of the Gorger", "=ds=#a2#", "", "" };
    { 13, 21302, "", "=q3=Handbook of Deadly Poison V", "=ds=#e2#", "", "3.85%" };
    { 14, 20727, "", "=q3=Formula: Enchant Gloves - Shadow Power", "=ds=#e2#", "", "14.3%" };
    { 15, 20728, "", "=q3=Formula: Enchant Gloves - Frost Power", "=ds=#e2#", "", "14.3%" };
    { 16, 20729, "", "=q3=Formula: Enchant Gloves - Fire Power", "=ds=#e2#", "", "14.3%" };
    { 17, 20730, "", "=q3=Formula: Enchant Gloves - Healing Power", "=ds=#e2#", "", "14.3%" };
    { 18, 20731, "", "=q3=Formula: Enchant Gloves - Superior Agility", "=ds=#e2#", "", "14.3%" };
    { 19, 20734, "", "=q3=Formula: Enchant Cloak - Stealth", "=ds=#e2#", "", "14.3%" };
    { 20, 20736, "", "=q3=Formula: Enchant Cloak - Dodge", "=ds=#e2#", "", "14.3%" };
    { 21, 21214, "", "=q3=Tome of Frostbolt XI", "=ds=#e2#", "", "4.00%" };
    { 22, 21279, "", "=q3=Tome of Fireball XII", "=ds=#e2#", "", "4.00%" };
    { 23, 21280, "", "=q3=Tome of Arcane Missiles VIII", "=ds=#e2#", "", "4.00%" };
    { 24, 21281, "", "=q3=Grimoire of Shadow Bolt X", "=ds=#e2#", "", "4.00%" };
    { 25, 21282, "", "=q3=Grimoire of Immolate VIII", "=ds=#e2#", "", "4.00%" };
    { 26, 21283, "", "=q3=Grimoire of Corruption VII", "=ds=#e2#", "", "4.00%" };
    { 27, 21284, "", "=q3=Codex of Greater Heal V", "=ds=#e2#", "", "4.00%" };
    { 28, 21285, "", "=q3=Codex of Renew X", "=ds=#e2#", "", "4.00%" };
    { 29, 21287, "", "=q3=Codex of Prayer of Healing V", "=ds=#e2#", "", "4.00%" };
    { 30, 21288, "", "=q3=Libram: Blessing of Wisdom VI", "=ds=#e2#", "", "4.00%" };
    { 31, 21289, "", "=q3=Libram: Blessing of Might VII", "=ds=#e2#", "", "4.00%" };
    { 32, 21290, "", "=q3=Libram: Holy Light IX", "=ds=#e2#", "", "4.00%" };
    { 33, 21291, "", "=q3=Tablet of Healing Wave X", "=ds=#e2#", "", "4.00%" };
    { 34, 21292, "", "=q3=Tablet of Strength of Earth Totem V", "=ds=#e2#", "", "4.00%" };
    { 35, 21294, "", "=q3=Book of Healing Touch XI", "=ds=#e2#", "", "4.00%" };
    { 36, 21295, "", "=q3=Book of Starfire VII", "=ds=#e2#", "", "4.00%" };
    { 37, 21296, "", "=q3=Book of Rejuvenation XI", "=ds=#e2#", "", "4.00%" };
    { 38, 21297, "", "=q3=Manual of Heroic Strike IX", "=ds=#e2#", "", "4.00%" };
    { 39, 21298, "", "=q3=Manual of Battle Shout VII", "=ds=#e2#", "", "4.00%" };
    { 40, 21299, "", "=q3=Manual of Revenge VI", "=ds=#e2#", "", "4.00%" };
    { 41, 21300, "", "=q3=Handbook of Backstab IX", "=ds=#e2#", "", "4.00%" };
    { 42, 21303, "", "=q3=Handbook of Feint V", "=ds=#e2#", "", "4.00%" };
    { 43, 21304, "", "=q3=Guide: Multi-Shot V", "=ds=#e2#", "", "4.00%" };
    { 44, 21306, "", "=q3=Guide: Serpent Sting IX", "=ds=#e2#", "", "4.00%" };
    { 45, 21307, "", "=q3=Guide: Aspect of the Hawk VII", "=ds=#e2#", "", "4.00%" };
	};

	AtlasLoot_Data["AQ20Ayamiss"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 20884, "", "=q3=Qiraji Magisterial Ring", "=ds=#m3#", "", "" };
    { 3, 20885, "", "=q3=Qiraji Martial Drape", "=ds=#m3#", "", "" };
    { 4, 20888, "", "=q3=Qiraji Ceremonial Ring", "=ds=#m3#", "", "" };
    { 5, 20889, "", "=q3=Qiraji Regal Drape", "=ds=#m3#", "", "" };
    { 6, 21466, "", "=q4=Stinger of Ayamiss", "=ds=#w6#", "", "6.67%" };
    { 7, 21478, "", "=q4=Bow of Taut Sinew", "=ds=#w2#", "", "6.67%" };
    { 8, 21479, "", "=q4=Gauntlets of the Immovable", "=ds=#a4#", "", "6.67%" };
    { 9, 21480, "", "=q3=Scaled Silithid Gauntlets", "=ds=#a3#", "", "" };
    { 10, 21481, "", "=q3=Boots of the Desert Protector", "=ds=#a4#", "", "" };
    { 11, 21482, "", "=q3=Boots of the Fiery Sands", "=ds=#a3#", "", "" };
    { 12, 21483, "", "=q3=Ring of the Desert Winds", "=ds=#e15#", "", "" };
    { 13, 21484, "", "=q3=Helm of Regrowth", "=ds=#a2#", "", "" };
    { 14, 21302, "", "=q3=Handbook of Deadly Poison V", "=ds=#e2#", "", "3.85%" };
    { 15, 20727, "", "=q3=Formula: Enchant Gloves - Shadow Power", "=ds=#e2#", "", "14.3%" };
    { 16, 20728, "", "=q3=Formula: Enchant Gloves - Frost Power", "=ds=#e2#", "", "14.3%" };
    { 17, 20729, "", "=q3=Formula: Enchant Gloves - Fire Power", "=ds=#e2#", "", "14.3%" };
    { 18, 20730, "", "=q3=Formula: Enchant Gloves - Healing Power", "=ds=#e2#", "", "14.3%" };
    { 19, 20731, "", "=q3=Formula: Enchant Gloves - Superior Agility", "=ds=#e2#", "", "14.3%" };
    { 20, 20734, "", "=q3=Formula: Enchant Cloak - Stealth", "=ds=#e2#", "", "14.3%" };
    { 21, 20736, "", "=q3=Formula: Enchant Cloak - Dodge", "=ds=#e2#", "", "14.3%" };
    { 22, 21214, "", "=q3=Tome of Frostbolt XI", "=ds=#e2#", "", "4.00%" };
    { 23, 21279, "", "=q3=Tome of Fireball XII", "=ds=#e2#", "", "4.00%" };
    { 24, 21280, "", "=q3=Tome of Arcane Missiles VIII", "=ds=#e2#", "", "4.00%" };
    { 25, 21281, "", "=q3=Grimoire of Shadow Bolt X", "=ds=#e2#", "", "4.00%" };
    { 26, 21282, "", "=q3=Grimoire of Immolate VIII", "=ds=#e2#", "", "4.00%" };
    { 27, 21283, "", "=q3=Grimoire of Corruption VII", "=ds=#e2#", "", "4.00%" };
    { 28, 21284, "", "=q3=Codex of Greater Heal V", "=ds=#e2#", "", "4.00%" };
    { 29, 21285, "", "=q3=Codex of Renew X", "=ds=#e2#", "", "4.00%" };
    { 30, 21287, "", "=q3=Codex of Prayer of Healing V", "=ds=#e2#", "", "4.00%" };
    { 31, 21288, "", "=q3=Libram: Blessing of Wisdom VI", "=ds=#e2#", "", "4.00%" };
    { 32, 21289, "", "=q3=Libram: Blessing of Might VII", "=ds=#e2#", "", "4.00%" };
    { 33, 21290, "", "=q3=Libram: Holy Light IX", "=ds=#e2#", "", "4.00%" };
    { 34, 21291, "", "=q3=Tablet of Healing Wave X", "=ds=#e2#", "", "4.00%" };
    { 35, 21292, "", "=q3=Tablet of Strength of Earth Totem V", "=ds=#e2#", "", "4.00%" };
    { 36, 21294, "", "=q3=Book of Healing Touch XI", "=ds=#e2#", "", "4.00%" };
    { 37, 21295, "", "=q3=Book of Starfire VII", "=ds=#e2#", "", "4.00%" };
    { 38, 21296, "", "=q3=Book of Rejuvenation XI", "=ds=#e2#", "", "4.00%" };
    { 39, 21297, "", "=q3=Manual of Heroic Strike IX", "=ds=#e2#", "", "4.00%" };
    { 40, 21298, "", "=q3=Manual of Battle Shout VII", "=ds=#e2#", "", "4.00%" };
    { 41, 21299, "", "=q3=Manual of Revenge VI", "=ds=#e2#", "", "4.00%" };
    { 42, 21300, "", "=q3=Handbook of Backstab IX", "=ds=#e2#", "", "4.00%" };
    { 43, 21303, "", "=q3=Handbook of Feint V", "=ds=#e2#", "", "4.00%" };
    { 44, 21304, "", "=q3=Guide: Multi-Shot V", "=ds=#e2#", "", "4.00%" };
    { 45, 21306, "", "=q3=Guide: Serpent Sting IX", "=ds=#e2#", "", "4.00%" };
    { 46, 21307, "", "=q3=Guide: Aspect of the Hawk VII", "=ds=#e2#", "", "4.00%" };
	};

	AtlasLoot_Data["AQ20Ossirian"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 21220, "", "=q4=Head of Ossirian the Unscarred", "=ds=#m3#", "", "100%" };
    { 3, 57604, "", "=q3=Pattern: Drums of Intellect", "=ds=#e2#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 20884, "", "=q3=Qiraji Magisterial Ring", "=ds=#m3#", "", "" };
    { 7, 20888, "", "=q3=Qiraji Ceremonial Ring", "=ds=#m3#", "", "" };
    { 8, 20886, "", "=q4=Qiraji Spiked Hilt", "=ds=#m3#", "", "" };
    { 9, 20890, "", "=q4=Qiraji Ornate Hilt", "=ds=#m3#", "", "" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 21214, "", "=q3=Tome of Frostbolt XI", "=ds=#e2#", "", "11.1%" };
    { 18, 21279, "", "=q3=Tome of Fireball XII", "=ds=#e2#", "", "11.1%" };
    { 19, 21280, "", "=q3=Tome of Arcane Missiles VIII", "=ds=#e2#", "", "11.1%" };
    { 20, 21281, "", "=q3=Grimoire of Shadow Bolt X", "=ds=#e2#", "", "11.1%" };
    { 21, 21282, "", "=q3=Grimoire of Immolate VIII", "=ds=#e2#", "", "11.1%" };
    { 22, 21283, "", "=q3=Grimoire of Corruption VII", "=ds=#e2#", "", "11.1%" };
    { 23, 21288, "", "=q3=Libram: Blessing of Wisdom VI", "=ds=#e2#", "", "11.1%" };
    { 24, 21291, "", "=q3=Tablet of Healing Wave X", "=ds=#e2#", "", "11.1%" };
    { 25, 21297, "", "=q3=Manual of Heroic Strike IX", "=ds=#e2#", "", "11.1%" };
    { 27, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 28, 21284, "", "=q3=Codex of Greater Heal V", "=ds=#e2#", "", "11.1%" };
    { 29, 21285, "", "=q3=Codex of Renew X", "=ds=#e2#", "", "11.1%" };
    { 30, 21287, "", "=q3=Codex of Prayer of Healing V", "=ds=#e2#", "", "11.1%" };
    { 31, 21289, "", "=q3=Libram: Blessing of Might VII", "=ds=#e2#", "", "11.1%" };
    { 32, 21292, "", "=q3=Tablet of Strength of Earth Totem V", "=ds=#e2#", "", "11.1%" };
    { 33, 21294, "", "=q3=Book of Healing Touch XI", "=ds=#e2#", "", "11.1%" };
    { 34, 21295, "", "=q3=Book of Starfire VII", "=ds=#e2#", "", "11.1%" };
    { 35, 21296, "", "=q3=Book of Rejuvenation XI", "=ds=#e2#", "", "11.1%" };
    { 36, 21298, "", "=q3=Manual of Battle Shout VII", "=ds=#e2#", "", "11.1%" };
    { 38, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 39, 21290, "", "=q3=Libram: Holy Light IX", "=ds=#e2#", "", "12.5%" };
    { 40, 21299, "", "=q3=Manual of Revenge VI", "=ds=#e2#", "", "12.5%" };
    { 41, 21300, "", "=q3=Handbook of Backstab IX", "=ds=#e2#", "", "12.5%" };
    { 42, 21302, "", "=q3=Handbook of Deadly Poison V", "=ds=#e2#", "", "12.5%" };
    { 43, 21303, "", "=q3=Handbook of Feint V", "=ds=#e2#", "", "12.5%" };
    { 44, 21304, "", "=q3=Guide: Multi-Shot V", "=ds=#e2#", "", "12.5%" };
    { 45, 21306, "", "=q3=Guide: Serpent Sting IX", "=ds=#e2#", "", "12.5%" };
    { 46, 21307, "", "=q3=Guide: Aspect of the Hawk VII", "=ds=#e2#", "", "12.5%" };
    { 48, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 49, 20727, "", "=q3=Formula: Enchant Gloves - Shadow Power", "=ds=#e2#", "", "14.3%" };
    { 50, 20728, "", "=q3=Formula: Enchant Gloves - Frost Power", "=ds=#e2#", "", "14.3%" };
    { 51, 20729, "", "=q3=Formula: Enchant Gloves - Fire Power", "=ds=#e2#", "", "14.3%" };
    { 52, 20730, "", "=q3=Formula: Enchant Gloves - Healing Power", "=ds=#e2#", "", "14.3%" };
    { 53, 20731, "", "=q3=Formula: Enchant Gloves - Superior Agility", "=ds=#e2#", "", "14.3%" };
    { 54, 20734, "", "=q3=Formula: Enchant Cloak - Stealth", "=ds=#e2#", "", "14.3%" };
    { 55, 20736, "", "=q3=Formula: Enchant Cloak - Dodge", "=ds=#e2#", "", "14.3%" };
	};

	AtlasLoot_Data["AQ20Trash"] = {
		{ 1, 20873, "", "=q3=Alabaster Idol", "=ds=#e15#", "", "0.39%"};
		{ 2, 20869, "", "=q3=Amber Idol", "=ds=#e15#", "", "0.36%"};
		{ 3, 20866, "", "=q3=Azure Idol", "=ds=#e15#", "", "0.48%"};
		{ 4, 20870, "", "=q3=Jasper Idol", "=ds=#e15#", "", "0.52%"};
		{ 5, 20868, "", "=q3=Lambent Idol", "=ds=#e15#", "", "0.48%"};
		{ 6, 20871, "", "=q3=Obsidian Idol", "=ds=#e15#", "", "0.41%"};
		{ 7, 20867, "", "=q3=Onyx Idol", "=ds=#e15#", "", "0.36%"};
		{ 8, 20872, "", "=q3=Vermillion Idol", "=ds=#e15#", "", "0.31%"};
		{ 10, 22202, "", "=q1=Small Obsidian Shard", "=ds=#e8#"};
		{ 11, 22203, "", "=q1=Large Obsidian Shard", "=ds=#e8#"};
		{ 16, 20864, "", "=q2=Bone Scarab", "=ds=#e15#", "", "0.84%"};
		{ 17, 20861, "", "=q2=Bronze Scarab", "=ds=#e15#", "", "0.88%"};
		{ 18, 20863, "", "=q2=Clay Scarab", "=ds=#e15#", "", "0.95%"};
		{ 19, 20862, "", "=q2=Crystal Scarab", "=ds=#e15#", "", "0.99%"};
		{ 20, 20859, "", "=q2=Gold Scarab", "=ds=#e15#", "", "0.96%"};
		{ 21, 20865, "", "=q2=Ivory Scarab", "=ds=#e15#", "", "0.93%"};
		{ 22, 20860, "", "=q2=Silver Scarab", "=ds=#e15#", "", "1.82%"};
		{ 23, 20858, "", "=q2=Stone Scarab", "=ds=#e15#", "", "0.86%"};
		{ 25, 21761, "", "=q1=Scarab Coffer Key", "=ds=#e9#", "", "7.27%"};
	};

	AtlasLoot_Data["AQ20ClassBooks"] = {
		{ 1, 21294, "", "=q3=Book of Healing Touch XI", "=q1=#m1# =ds=#c1#", "", "4.12%"};
		{ 2, 21296, "", "=q3=Book of Rejuvenation XI", "=q1=#m1# =ds=#c1#", "", "4.20%"};
		{ 3, 21295, "", "=q3=Book of Starfire VII", "=q1=#m1# =ds=#c1#", "", "4.00%"};
		{ 4, 21306, "", "=q3=Guide: Serpent Sting IX", "=q1=#m1# =ds=#c2#", "", "4.85%"};
		{ 5, 21304, "", "=q3=Guide: Multi-Shot V", "=q1=#m1# =ds=#c2#", "", "4.66%"};
		{ 6, 21307, "", "=q3=Guide: Aspect of the Hawk VII", "=q1=#m1# =ds=#c2#", "", "4.65%"};
		{ 7, 21279, "", "=q3=Tome of Fireball XII", "=q1=#m1# =ds=#c3#", "", "5.15%"};
		{ 8, 21214, "", "=q3=Tome of Frostbolt XI", "=q1=#m1# =ds=#c3#", "", "5.10%"};
		{ 9, 21280, "", "=q3=Tome of Arcane Missiles VIII", "=q1=#m1# =ds=#c3#", "", "5.03%"};
		{ 10, 21288, "", "=q3=Libram: Blessing of Wisdom VI", "=q1=#m1# =ds=#c4#", "", "3.50%"};
		{ 11, 21289, "", "=q3=Libram: Blessing of Might VII", "=q1=#m1# =ds=#c4#", "", "3.07%"};
		{ 12, 21290, "", "=q3=Libram: Holy Light IX", "=q1=#m1# =ds=#c4#", "", "3.09%"};
		{ 13, 21284, "", "=q3=Codex of Greater Heal V", "=q1=#m1# =ds=#c5#", "", "5.15%"};
		{ 14, 21287, "", "=q3=Codex of Prayer of Healing V", "=q1=#m1# =ds=#c5#", "", "4.89%"};
		{ 15, 21285, "", "=q3=Codex of Renew X", "=q1=#m1# =ds=#c5#", "", "4.91%"};
		{ 16, 21300, "", "=q3=Handbook of Backstab IX", "=q1=#m1# =ds=#c6#", "", "4.29%"};
		{ 17, 21303, "", "=q3=Handbook of Feint V", "=q1=#m1# =ds=#c6#", "", "4.79%"};
		{ 18, 21302, "", "=q3=Handbook of Deadly Poison V", "=q1=#m1# =ds=#c6#", "", "5.47%"};
		{ 19, 21291, "", "=q3=Tablet of Healing Wave X", "=q1=#m1# =ds=#c7#", "", "2.05%"};
		{ 20, 21292, "", "=q3=Tablet of Strength of Earth Totem V", "=q1=#m1# =ds=#c7#", "", "1.67%"};
		{ 21, 21293, "", "=q3=Tablet of Grace of Air Totem III", "=q1=#m1# =ds=#c7#", "", "1.81%"};
		{ 22, 21281, "", "=q3=Grimoire of Shadow Bolt X", "=q1=#m1# =ds=#c8#", "", "4.23%"};
		{ 23, 21283, "", "=q3=Grimoire of Corruption VII", "=q1=#m1# =ds=#c8#", "", "3.82%"};
		{ 24, 21282, "", "=q3=Grimoire of Immolate VIII", "=q1=#m1# =ds=#c8#", "", "4.51%"};
		{ 25, 21298, "", "=q3=Manual of Battle Shout VII", "=q1=#m1# =ds=#c9#", "", "4.84%"};
		{ 26, 21299, "", "=q3=Manual of Revenge VI", "=q1=#m1# =ds=#c9#", "", "4.78%"};
		{ 27, 21297, "", "=q3=Manual of Heroic Strike IX", "=q1=#m1# =ds=#c9#", "", "4.83%"};
	};

		------------------------------------------
		--- Ahn'Qiraj: The Temple of Ahn'Qiraj ---
		------------------------------------------

	AtlasLoot_Data["AQ40Skeram"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 57610, "", "=q3=Pattern: Drums of the Raid Leader", "=ds=#e2#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 17, 22222, "", "=q3=Plans: Thick Obsidian Breastplate", "=ds=#e2#", "", "15.0%" };
    { 18, 21128, "", "=q4=Staff of the Qiraji Prophets", "=ds=#w9#", "", "10.0%" };
    { 19, 21698, "", "=q4=Leggings of Immersion", "=ds=#a2#", "", "" };
    { 20, 21699, "", "=q4=Barrage Shoulders", "=ds=#a3#", "", "" };
    { 21, 21700, "", "=q4=Pendant of the Qiraji Guardian", "=ds=#e15#", "", "" };
    { 22, 21701, "", "=q4=Cloak of Concentrated Hatred", "=ds=#a1#", "", "" };
    { 23, 21702, "", "=q4=Amulet of Foul Warding", "=ds=#e15#", "", "" };
    { 24, 21703, "", "=q4=Hammer of Ji'zhi", "=ds=#w6#", "", "10.0%" };
    { 25, 21704, "", "=q4=Boots of the Redeemed Prophecy", "=ds=#a4#", "", "" };
    { 26, 21705, "", "=q4=Boots of the Fallen Prophet", "=ds=#a3#", "", "" };
    { 27, 21706, "", "=q4=Boots of the Unwavering Will", "=ds=#a4#", "", "" };
    { 28, 21707, "", "=q4=Ring of Swarming Thought", "=ds=#e15#", "", "" };
    { 29, 21708, "", "=q4=Beetle Scaled Wristguards", "=ds=#a2#", "", "" };
    { 30, 21814, "", "=q4=Breastplate of Annihilation", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["AQ40Vem"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 21682, "", "=q4=Bile-Covered Gauntlets", "=ds=#a2#", "", "" };
    { 3, 21683, "", "=q4=Mantle of the Desert Crusade", "=ds=#a4#", "", "" };
    { 4, 21684, "", "=q4=Mantle of the Desert's Fury", "=ds=#a3#", "", "" };
    { 5, 21686, "", "=q4=Mantle of Phrenic Power", "=ds=#a1#", "", "" };
    { 6, 21687, "", "=q4=Ukko's Ring of Darkness", "=ds=#e15#", "", "" };
    { 7, 21692, "", "=q4=Triad Girdle", "=ds=#a4#", "", "" };
    { 8, 21693, "", "=q4=Guise of the Devourer", "=ds=#a2#", "", "" };
    { 9, 21694, "", "=q4=Ternary Mantle", "=ds=#a1#", "", "" };
    { 10, 21695, "", "=q4=Angelista's Touch", "=ds=#e15#", "", "" };
    { 11, 21696, "", "=q4=Robes of the Triumvirate", "=ds=#a1#", "", "" };
    { 12, 21697, "", "=q4=Cape of the Trinity", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["AQ40Sartura"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 21666, "", "=q4=Sartura's Might", "=ds=#e15#", "", "7.70%" };
    { 3, 21667, "", "=q4=Legplates of Blazing Light", "=ds=#a4#", "", "" };
    { 4, 21668, "", "=q4=Scaled Leggings of Qiraji Fury", "=ds=#a3#", "", "" };
    { 5, 21669, "", "=q4=Creeping Vine Helm", "=ds=#a2#", "", "" };
    { 6, 21670, "", "=q4=Badge of the Swarmguard", "=ds=#e15#", "", "" };
    { 7, 21671, "", "=q4=Robes of the Battleguard", "=ds=#a1#", "", "" };
    { 8, 21672, "", "=q4=Gloves of Enforcement", "=ds=#a2#", "", "" };
    { 9, 21673, "", "=q4=Silithid Claw", "=ds=#w13#", "", "9.09%" };
    { 10, 21648, "", "=q4=Recomposed Boots", "=ds=#a1#", "", "" };
    { 11, 21674, "", "=q4=Gauntlets of Steadfast Determination", "=ds=#a4#", "", "" };
    { 12, 21675, "", "=q4=Thick Qirajihide Belt", "=ds=#a2#", "", "" };
    { 13, 21676, "", "=q4=Leggings of the Festering Swarm", "=ds=#a1#", "", "" };
    { 14, 21678, "", "=q4=Necklace of Purity", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["AQ40Fankriss"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 21650, "", "=q4=Ancient Qiraji Ripper", "=ds=#w10#", "", "10.0%" };
    { 3, 21639, "", "=q4=Pauldrons of the Unrelenting", "=ds=#a4#", "", "" };
    { 4, 21651, "", "=q4=Scaled Sand Reaver Leggings", "=ds=#a3#", "", "" };
    { 5, 21652, "", "=q4=Silithid Carapace Chestguard", "=ds=#a4#", "", "" };
    { 6, 21663, "", "=q4=Robes of the Guardian Saint", "=ds=#a1#", "", "" };
    { 7, 21664, "", "=q4=Barbed Choker", "=ds=#e15#", "", "" };
    { 8, 21665, "", "=q4=Mantle of Wicked Revenge", "=ds=#a2#", "", "" };
    { 9, 21635, "", "=q4=Barb of the Sand Reaver", "=ds=#w7#", "", "10.0%" };
    { 10, 21627, "", "=q4=Cloak of Untold Secrets", "=ds=#a1#", "", "" };
    { 11, 21645, "", "=q4=Hive Tunneler's Boots", "=ds=#a2#", "", "" };
    { 12, 21647, "", "=q4=Fetish of the Sand Reaver", "=ds=#e15#", "", "" };
    { 13, 22396, "", "=q4=Totem of Life", "", "", "" };
    { 14, 22402, "", "=q4=Libram of Grace", "", "", "" };
	};

	AtlasLoot_Data["AQ40Viscidus"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 20928, "", "=q4=Qiraji Bindings of Command", "=ds=#e10#", "", "100%" };
    { 3, 20932, "", "=q4=Qiraji Bindings of Dominance", "=ds=#e10#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 21622, "", "=q4=Sharpened Silithid Femur", "=ds=#w10#", "", "" };
    { 7, 21623, "", "=q4=Gauntlets of the Righteous Champion", "=ds=#a4#", "", "" };
    { 8, 21624, "", "=q4=Gauntlets of Kalimdor", "=ds=#a3#", "", "" };
    { 9, 21625, "", "=q4=Scarab Brooch", "=ds=#e15#", "", "" };
    { 10, 21626, "", "=q4=Slime-coated Leggings", "=ds=#a3#", "", "" };
    { 11, 21677, "", "=q4=Ring of the Qiraji Fury", "=ds=#e15#", "", "" };
    { 12, 22399, "", "=q4=Idol of Health", "", "", "" };
	};

	AtlasLoot_Data["AQ40Huhuran"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 20928, "", "=q4=Qiraji Bindings of Command", "=ds=#e10#", "", "100%" };
    { 3, 20932, "", "=q4=Qiraji Bindings of Dominance", "=ds=#e10#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 21616, "", "=q4=Huhuran's Stinger", "=ds=#w2#", "", "" };
    { 7, 21617, "", "=q4=Wasphide Gauntlets", "=ds=#a2#", "", "" };
    { 8, 21618, "", "=q4=Hive Defiler Wristguards", "=ds=#a4#", "", "" };
    { 9, 21619, "", "=q4=Gloves of the Messiah", "=ds=#a1#", "", "" };
    { 10, 21620, "", "=q4=Ring of the Martyr", "=ds=#e15#", "", "" };
    { 11, 21621, "", "=q4=Cloak of the Golden Hive", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["AQ40Emperors"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 20930, "", "=q4=Vek'lor's Diadem", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 20735, "", "=q3=Formula: Enchant Cloak - Subtlety", "=ds=#e2#", "", "6.50%" };
    { 6, 21597, "", "=q4=Royal Scepter of Vek'lor", "=ds=#e15#", "", "" };
    { 7, 21598, "", "=q4=Royal Qiraji Belt", "=ds=#a4#", "", "" };
    { 8, 21599, "", "=q4=Vek'lor's Gloves of Devastation", "=ds=#a3#", "", "" };
    { 9, 21600, "", "=q4=Boots of Epiphany", "=ds=#a1#", "", "" };
    { 10, 21601, "", "=q4=Ring of Emperor Vek'lor", "=ds=#e15#", "", "" };
    { 11, 21602, "", "=q4=Qiraji Execution Bracers", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["AQ40Ouro"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 20927, "", "=q4=Ouro's Intact Hide", "=ds=#m3#", "", "100%" };
    { 3, 20931, "", "=q4=Skin of the Great Sandworm", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 21610, "", "=q4=Wormscale Blocker", "=ds=#e16#", "", "" };
    { 7, 21611, "", "=q4=Burrower Bracers", "=ds=#a1#", "", "" };
    { 8, 21615, "", "=q4=Don Rigoberto's Lost Hat", "=ds=#a1#", "", "" };
    { 9, 23557, "", "=q4=Larvae of the Great Worm", "=ds=#w5#", "", "" };
    { 10, 23558, "", "=q4=The Burrower's Shell", "=ds=#e15#", "", "" };
    { 11, 23570, "", "=q4=Jom Gabbar", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["AQ40CThun"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 20929, "", "=q4=Carapace of the Old God", "=ds=#e10#", "", "100%" };
    { 3, 20933, "", "=q4=Husk of the Old God", "=ds=#e10#", "", "100%" };
    { 4, 21221, "", "=q4=Eye of C'Thun", "=ds=#m3#", "", "100%" };
    { 5, 22734, "", "=q5=Base of Atiesh", "=ds=#m3#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 17, 21579, "", "=q4=Vanquished Tentacle of C'Thun", "=ds=#e15#", "", "20.0%" };
    { 18, 21126, "", "=q4=Death's Sting", "=ds=#w4#", "", "8.00%" };
    { 19, 21585, "", "=q4=Dark Storm Gauntlets", "=ds=#a1#", "", "" };
    { 20, 21586, "", "=q4=Belt of Never-ending Agony", "=ds=#a2#", "", "" };
    { 21, 21596, "", "=q4=Ring of the Godslayer", "=ds=#e15#", "", "" };
    { 22, 22730, "", "=q4=Eyestalk Waist Cord", "=ds=#a1#", "", "" };
    { 23, 22731, "", "=q4=Cloak of the Devoured", "=ds=#a1#", "", "" };
    { 24, 21134, "", "=q4=Dark Edge of Insanity", "=ds=#w1#", "", "8.00%" };
    { 25, 21839, "", "=q4=Scepter of the False Prophet", "=ds=#w6#", "", "8.00%" };
    { 26, 21581, "", "=q4=Gauntlets of Annihilation", "=ds=#a4#", "", "" };
    { 27, 21582, "", "=q4=Grasp of the Old God", "=ds=#a1#", "", "" };
    { 28, 21583, "", "=q4=Cloak of Clarity", "=ds=#a1#", "", "" };
    { 29, 22732, "", "=q4=Mark of C'Thun", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["AQ40Trash1"] = {
		{ 1, 21838, "", "=q4=Garb of Royal Ascension", "=ds=#s5#, #a1#", "", "0.20%"};
		{ 2, 21888, "", "=q4=Gloves of the Immortal", "=ds=#s9#, #a1#", "", "0.16%"};
		{ 3, 21889, "", "=q4=Gloves of the Redeemed Prophecy", "=ds=#s9#, #a4# =q1=#m1# =ds=#c4#", "", "0.39%"};
		{ 4, 21836, "", "=q4=Ritssyn's Ring of Chaos", "=ds=#s13#", "", "0.18%"};
		{ 5, 21891, "", "=q4=Shard of the Fallen Star", "=ds=#s14#", "", "0.59%"};
		{ 6, 21856, "", "=q4=Neretzek, The Blood Drinker", "=ds=#h2#, #w1#", "", "0.20%"};
		{ 7, 21837, "", "=q4=Anubisath Warhammer", "=ds=#h1#, #w6#", "", "0.21%"};
		{ 9, 22202, "", "=q1=Small Obsidian Shard", "=ds=#e8#"};
		{ 10, 22203, "", "=q1=Large Obsidian Shard", "=ds=#e8#"};
		{ 16, 21218, "", "=q3=Blue Qiraji Resonating Crystal", "=ds=#e12#", "", "10.64%"};
		{ 17, 21324, "", "=q3=Yellow Qiraji Resonating Crystal", "=ds=#e12#", "", "12.15%"};
		{ 18, 21323, "", "=q3=Green Qiraji Resonating Crystal", "=ds=#e12#", "", "11.62%"};
		{ 19, 21321, "", "=q3=Red Qiraji Resonating Crystal", "=ds=#e12#", "", "1.39%"};
		Next = "AQ40Trash2";
	};

	AtlasLoot_Data["AQ40Trash2"] = {
		{ 1, 20876, "", "=q3=Idol of Death", "=ds=#e15#", "", "0.26%"};
		{ 2, 20879, "", "=q3=Idol of Life", "=ds=#e15#", "", "0.29%"};
		{ 3, 20875, "", "=q3=Idol of Night", "=ds=#e15#", "", "0.29%"};
		{ 4, 20878, "", "=q3=Idol of Rebirth", "=ds=#e15#", "", "0.28%"};
		{ 5, 20881, "", "=q3=Idol of Strife", "=ds=#e15#", "", "0.21%"};
		{ 6, 20877, "", "=q3=Idol of the Sage", "=ds=#e15#", "", "0.33%"};
		{ 7, 20874, "", "=q3=Idol of the Sun", "=ds=#e15#", "", "0.21%"};
		{ 8, 20882, "", "=q3=Idol of War", "=ds=#e15#", "", "0.30%"};
		{ 10, 21230, "", "=q1=Ancient Qiraji Artifact", "=ds=#m2#"};
		{ 12, 21762, "", "=q1=Greater Scarab Coffer Key", "=ds=#e9#", "", "7.03%"};
		{ 16, 20864, "", "=q2=Bone Scarab", "=ds=#e15#", "", "0.84%"};
		{ 17, 20861, "", "=q2=Bronze Scarab", "=ds=#e15#", "", "0.88%"};
		{ 18, 20863, "", "=q2=Clay Scarab", "=ds=#e15#", "", "0.95%"};
		{ 19, 20862, "", "=q2=Crystal Scarab", "=ds=#e15#", "", "0.99%"};
		{ 20, 20859, "", "=q2=Gold Scarab", "=ds=#e15#", "", "0.96%"};
		{ 21, 20865, "", "=q2=Ivory Scarab", "=ds=#e15#", "", "0.93%"};
		{ 22, 20860, "", "=q2=Silver Scarab", "=ds=#e15#", "", "1.82%"};
		{ 23, 20858, "", "=q2=Stone Scarab", "=ds=#e15#", "", "0.86%"};
		Prev = "AQ40Trash1";
	};

		-------------------
		--- AQ Enchants ---
		-------------------

	AtlasLoot_Data["AQEnchants"] = {
		{ 1, 20728, "", "=q3=Formula: Enchant Gloves - Frost Power", "=ds=#p4# (300)"};
		{ 2, 20731, "", "=q3=Formula: Enchant Gloves - Superior Agility", "=ds=#p4# (300)"};
		{ 3, 20734, "", "=q3=Formula: Enchant Cloak - Stealth", "=ds=#p4# (300)"};
		{ 4, 20729, "", "=q3=Formula: Enchant Gloves - Fire Power", "=ds=#p4# (300)"};
		{ 5, 20736, "", "=q3=Formula: Enchant Cloak - Dodge", "=ds=#p4# (300)"};
		{ 6, 20730, "", "=q3=Formula: Enchant Gloves - Healing Power", "=ds=#p4# (300)"};
		{ 7, 20727, "", "=q3=Formula: Enchant Gloves - Shadow Power", "=ds=#p4# (300)"};
	};

	AtlasLoot_Data["AQOpening"] = {
		{ 1, 21138, "", "=q1=Red Scepter Shard", "=ds=#m3#"};
		{ 2, 21530, "", "=q4=Onyx Embedded Leggings", "=ds=#s11#, #a3#"};
		{ 3, 21529, "", "=q4=Amulet of Shadow Shielding", "=ds=#s2#"};
		{ 5, 21139, "", "=q1=Green Scepter Shard", "=ds=#m3#"};
		{ 6, 21532, "", "=q4=Drudge Boots", "=ds=#s12#, #a2#"};
		{ 7, 21531, "", "=q4=Drake Tooth Necklace", "=ds=#s2#"};
		{ 9, 21137, "", "=q1=Blue Scepter Shard", "=ds=#m3#"};
		{ 10, 21517, "", "=q4=Gnomish Turban of Psychic Might", "=ds=#s1#, #a1#"};
		{ 11, 21527, "", "=q4=Darkwater Robes", "=ds=#s5#, #a1#"};
		{ 12, 21526, "", "=q4=Band of Icy Depths", "=ds=#s13#"};
		{ 13, 21025, "", "=q4=Recipe: Dirge's Kickin' Chimaerok Chops", "=ds=#p3# (300)"};
		{ 16, 21175, "", "=q1=The Scepter of the Shifting Sands", "=ds=#m3#"};
		{ 17, 21176, "", "=q5=Black Qiraji Resonating Crystal", "=ds=#e12#"};
		{ 18, 21522, "", "=q4=Shadowsong's Sorrow", "=ds=#h1#, #w4#"};
		{ 19, 21523, "", "=q4=Fang of Korialstrasz", "=ds=#h3#, #w4#"};
		{ 20, 21520, "", "=q4=Ravencrest's Legacy", "=ds=#h1#, #w10#"};
		{ 21, 21521, "", "=q4=Runesword of the Red", "=ds=#h3#, #w10#"};
	};

		-------------------------
		--- Blackfathom Deeps ---
		-------------------------

	AtlasLoot_Data["BlackfathomDeeps1"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Ghamoo-ra"], "" };
    { 2, 6908, "", "=q2=Ghamoo-ra's Bind", "=ds=#a1#", "", "60.0%" };
    { 3, 6907, "", "=q3=Tortoise Armor", "=ds=#a3#", "", "40.0%" };
    { 5, 0, "INV_Box_01", "=q6="..BabbleBoss["Lady Sarevess"], "" };
    { 6, 5952, "", "=q1=Corrupted Brain Stem", "=ds=#m3#", "", "80.0%" };
    { 8, 888, "", "=q3=Naga Battle Gloves", "=ds=#a2#", "", "40.0%" };
    { 9, 11121, "", "=q2=Darkwater Talwar", "=ds=#w10#", "", "40.0%" };
    { 10, 3078, "", "=q2=Naga Heartpiercer", "=ds=#w2#", "", "20.0%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Gelihast"], "" };
    { 17, 6905, "", "=q2=Reef Axe", "=ds=#w1#", "", "50.0%" };
    { 18, 6906, "", "=q3=Algae Fists", "=ds=#a3#", "", "50.0%" };
    { 20, 58100, "", "=q3=Giant Murloc", "=ds=#e10#", "", "50.0%" };
    { 22, 0, "INV_Box_01", "=q6="..BabbleBoss["Baron Aquanis"], "" };
    { 23, 16782, "", "=q2=Strange Water Globe", "=ds=#m3#", "", "100%" };
    { 25, 0, "INV_Box_01", "=q6="..BabbleBoss["Twilight Lord Kelris"], "" };
    { 26, 5881, "", "=q1=Head of Kelris", "=ds=#m3#", "", "100%" };
    { 28, 1155, "", "=q3=Rod of the Sleepwalker", "=ds=#w9#", "", "60.0%" };
    { 29, 6903, "", "=q2=Gaze Dreamer Pants", "=ds=#a1#", "", "40.0%" };
    { 31, 0, "INV_Box_01", "=q6="..BabbleBoss["Old Serra'kis"], "" };
    { 32, 6901, "", "=q3=Glowing Thresher Cape", "=ds=#a1#", "", "40.0%" };
    { 33, 6902, "", "=q2=Bands of Serra'kis", "=ds=#a2#", "", "30.0%" };
    { 34, 6904, "", "=q3=Bite of Serra'kis", "=ds=#w4#", "", "30.0%" };
	};
	
	AtlasLoot_Data["BlackfathomDeeps2"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Aku'mai"], "" };
    { 2, 901709, "", "=q1=Void Pearl", "=ds=#m3#", "", "100%" };
    { 4, 6910, "", "=q3=Leech Pants", "=ds=#a1#", "", "40.0%" };
    { 5, 6911, "", "=q3=Moss Cinch", "=ds=#a2#", "", "40.0%" };
    { 6, 6909, "", "=q3=Strike of the Hydra", "=ds=#w10#", "", "20.0%" };
	};

		--------------------------------------------
		--- Blackrock Mountain: Blackrock Dephts ---
		--------------------------------------------

	AtlasLoot_Data["BRDPyron"] = {
		{ 1, 14486, "", "=q3=Pattern: Cloak of Fire", "=ds=#p8# (275)", "", "17.95%"};
	};

	AtlasLoot_Data["BRDLordRoccor"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11129, "", "=q1=Essence of the Elements", "=ds=#m3#", "", "80.0%" };
    { 3, 22527, "", "=q1=Core of Elements", "=ds=#m3#", "", "55.0%" };
    { 4, 11630, "", "=q3=Rockshard Pellets", "=ds=#e6#", "", "16.0%" };
    { 5, 11813, "", "=q2=Formula: Smoking Heart of the Mountain", "=ds=#e2#", "", "15.0%" };
    { 6, 11631, "", "=q3=Stoneshell Guard", "=ds=#e16#", "", "" };
    { 7, 11632, "", "=q3=Earthslag Shoulders", "=ds=#a4#", "", "" };
    { 8, 22234, "", "=q3=Mantle of Lost Hope", "=ds=#a1#", "", "" };
    { 9, 22397, "", "=q3=Idol of Ferocity", "", "", "" };
	};

	AtlasLoot_Data["BRDHighInterrogatorGerstahn"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11624, "", "=q3=Kentic Amice", "=ds=#a1#", "", "" };
    { 3, 11625, "", "=q3=Enthralled Sphere", "=ds=#e15#", "", "" };
    { 4, 11626, "", "=q3=Blackveil Cape", "=ds=#a1#", "", "" };
    { 5, 22240, "", "=q3=Greaves of Withering Despair", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["BRDArena"] = {
		{ 1, 11677, "", "=q3=Graverot Cape", "=ds=#s4# =q2=#brd1#", "", "23.07%"};
		{ 2, 11675, "", "=q3=Shadefiend Boots", "=ds=#s12#, #a2# =q2=#brd1#", "", "25.84%"};
		{ 3, 11731, "", "=q3=Savage Gladiator Greaves", "=ds=#s12#, #a3# =q2=#brd1#", "", "15.14%"};
		{ 4, 11678, "", "=q3=Carapace of Anub'shiah", "=ds=#s5#, #a4# =q2=#brd1#", "", "15.78%"};
		{ 6, 11685, "", "=q3=Splinthide Shoulders", "=ds=#s3#, #a2# =q2=#brd2#", "", "24.49%"};
		{ 7, 11686, "", "=q3=Girdle of Beastial Fury", "=ds=#s10#, #a2# =q2=#brd2#", "", "15.85%"};
		{ 8, 11679, "", "=q3=Rubicund Armguards", "=ds=#s8#, #a3# =q2=#brd2#", "", "25.13%"};
		{ 9, 11730, "", "=q3=Savage Gladiator Grips", "=ds=#s9#, #a3# =q2=#brd2#", "", "14.12%"};
		{ 11, 11726, "", "=q4=Savage Gladiator Chain", "=ds=#s5#, #a3# =q2=#brd3#", "", "14.52%"};
		{ 12, 22271, "", "=q3=Leggings of Frenzied Magic", "=ds=#s11#, #a2# =q2=#brd3#", "", "23.24%"};
		{ 13, 11729, "", "=q3=Savage Gladiator Helm", "=ds=#s1#, #a3# =q2=#brd3#, #brd5#", "", "10.08%"};
		{ 14, 11722, "", "=q3=Dregmetal Spaulders", "=ds=#s3#, #a3# =q2=#brd4#", "", "15.07%"};
		{ 15, 11703, "", "=q3=Stonewall Girdle", "=ds=#s10#, #a4# =q2=#brd4#", "", "31.45%"};
		{ 16, 22270, "", "=q3=Entrenching Boots", "=ds=#s12#, #a4# =q2=#brd4#", "", "11.97%"};
		{ 17, 22257, "", "=q3=Bloodclot Band", "=ds=#s13# =q2=#brd3#", "", "26.28%"};
		{ 18, 22266, "", "=q3=Flarethorn", "=ds=#h1#, #w4# =q2=#brd3#", "", "17.98%"};
		{ 19, 11702, "", "=q3=Grizzle's Skinner", "=ds=#h1#, #w1# =q2=#brd4#", "", "20.62%"};
		{ 20, 11610, "", "=q3=Plans: Dark Iron Pulverizer", "=ds=#p2# (265) =q2=#brd4#", "", "69.76%"};
		{ 22, 11634, "", "=q3=Silkweb Gloves", "=ds=#s9#, #a1# =q2=#brd5#", "", "24.02%"};
		{ 23, 11633, "", "=q3=Spiderfang Carapace", "=ds=#s5#, #a4# =q2=#brd5#", "", "20.61%"};
		{ 24, 11635, "", "=q3=Hookfang Shanker", "=ds=#h1#, #w4# =q2=#brd5#", "", "17.26%"};
		{ 26, 11662, "", "=q3=Ban'thok Sash", "=ds=#s10#, #a1# =q2=#brd6#", "", "23.77%"};
		{ 27, 11665, "", "=q3=Ogreseer Fists", "=ds=#s9#, #a2# =q2=#brd6#", "", "28.16%"};
		{ 28, 11728, "", "=q3=Savage Gladiator Leggings", "=ds=#s11#, #a3# =q2=#brd6#", "", "14.95%"};
		{ 29, 11824, "", "=q3=Cyclopean Band", "=ds=#s13# =q2=#brd6#", "", "18.37%"};
	};

	AtlasLoot_Data["BRDTheldren"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 22047, "", "=q1=Top Piece of Lord Valthalak's Amulet", "=ds=#m3#", "", "100%" };
	};

	AtlasLoot_Data["BRDHoundmaster"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11628, "", "=q3=Houndmaster's Bow", "=ds=#w2#", "", "15.0%" };
    { 3, 11629, "", "=q3=Houndmaster's Rifle", "=ds=#w5#", "", "15.0%" };
    { 4, 11623, "", "=q3=Spritecaster Cape", "=ds=#a1#", "", "" };
    { 5, 11627, "", "=q3=Fleetfoot Greaves", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["BRDForgewright"] = {
		{ 1, 11000, "", "=q1=Shadowforge Key", "=q1=#m4#: =ds=#e9#"};
	};

	AtlasLoot_Data["BRDPyromantLoregrain"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11207, "", "=q2=Formula: Enchant Weapon - Fiery Weapon", "=ds=#e2#", "", "16.0%" };
    { 3, 11750, "", "=q3=Kindling Stave", "=ds=#w9#", "", "20.0%" };
    { 4, 11747, "", "=q3=Flamestrider Robes", "=ds=#a2#", "", "" };
    { 5, 11748, "", "=q3=Pyric Caduceus", "=ds=#w12#", "", "" };
    { 6, 11749, "", "=q3=Searingscale Leggings", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["BRDTheVault"] = {
		{ 1, 0, "INV_Box_01", "=q6=#x3#", ""};
		{ 2, 11309, "", "=q1=The Heart of the Mountain", "=ds=#m3#", "", "100%"};
		{ 4, 0, "INV_Box_01", "=q6=#x5#", ""};
		{ 5, 22256, "", "=q3=Mana Shaping Handwraps", "=ds=#s9#, #a1#", "", "4.49%"};
		{ 6, 11929, "", "=q3=Haunting Specter Leggings", "=ds=#s11#, #a1#", "", "21.12%"};
		{ 7, 11926, "", "=q3=Deathdealer Breastplate", "=ds=#s5#, #a3#", "", "21.57%"};
		{ 8, 22205, "", "=q3=Black Steel Bindings", "=ds=#s8#, #a4#", "", "4.24%"};
		{ 9, 22255, "", "=q3=Magma Forged Band", "=ds=#s13#", "", "4.02%"};
		{ 10, 11920, "", "=q3=Wraith Scythe", "=ds=#h1#, #w1#", "", "21.12%"};
		{ 11, 11923, "", "=q3=The Hammer of Grace", "=ds=#h3#, #w6#", "", "19.84%"};
		{ 12, 22254, "", "=q3=Wand of Eternal Light", "=ds=#w12#", "", "3.65%"};
		{ 16, 0, "INV_Box_01", "=q6=#x4#", ""};
		{ 17, 11752, "", "=q1=Black Blood of the Tormented", "=ds=#m3#", "", "44.48%"};
		{ 18, 11751, "", "=q1=Burning Essence", "=ds=#m3#", "", "39.35%"};
		{ 19, 11753, "", "=q1=Eye of Kajal", "=ds=#m3#", "", "39.95%"};
	};

	AtlasLoot_Data["BRDWarderStilgiss"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11782, "", "=q3=Boreal Mantle", "=ds=#a1#", "", "" };
    { 3, 11783, "", "=q3=Chillsteel Girdle", "=ds=#a3#", "", "" };
    { 4, 11784, "", "=q3=Arbiter's Blade", "=ds=#w10#", "", "" };
    { 5, 22241, "", "=q3=Dark Warder's Pauldrons", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["BRDVerek"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22242, "", "=q3=Verek's Leash", "=ds=#a3#", "", "13.0%" };
    { 3, 11755, "", "=q3=Verek's Collar", "=ds=#e15#", "", "12.0%" };
	};

	AtlasLoot_Data["BRDFineousDarkvire"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 10999, "", "=q1=Ironfel", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 11468, "", "=q1=Dark Iron Fanny Pack", "=ds=#m3#", "", "80.0%" };
    { 6, 11839, "", "=q3=Chief Architect's Monocle", "=ds=#a1#", "", "" };
    { 7, 11841, "", "=q3=Senior Designer's Pantaloons", "=ds=#a1#", "", "" };
    { 8, 11842, "", "=q3=Lead Surveyor's Mantle", "=ds=#a3#", "", "" };
    { 9, 22223, "", "=q3=Foreman's Head Protector", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["BRDLordIncendius"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 11126, "", "=q1=Tablet of Kurniya", "=ds=#m3#", "", "100%" };
    { 3, 21987, "", "=q1=Incendicite of Incendius", "=ds=#m3#", "", "100%" };
    { 4, 901714, "", "=q1=Incendiary Core", "=ds=#m3#", "", "100%" };
    { 6, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 7, 11129, "", "=q1=Essence of the Elements", "=ds=#m3#", "", "80.0%" };
    { 8, 22527, "", "=q1=Core of Elements", "=ds=#m3#", "", "55.0%" };
    { 9, 57458, "", "=q2=Technique: Scroll of Fire Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 10, 11764, "", "=q3=Cinderhide Armsplints", "=ds=#a2#", "", "" };
    { 11, 11765, "", "=q3=Pyremail Wristguards", "=ds=#a3#", "", "" };
    { 12, 11766, "", "=q3=Flameweave Cuffs", "=ds=#a1#", "", "" };
    { 13, 11767, "", "=q3=Emberplate Armguards", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["BRDBaelGar"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11805, "", "=q3=Rubidium Hammer", "=ds=#w6#", "", "18.0%" };
    { 3, 11807, "", "=q3=Sash of the Burning Heart", "=ds=#a1#", "", "18.0%" };
    { 4, 11802, "", "=q3=Lavacrest Leggings", "=ds=#a4#", "", "" };
    { 5, 11803, "", "=q3=Force of Magma", "=ds=#w6#", "", "" };
	};

	AtlasLoot_Data["BRDGeneralAngerforge"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 11464, "", "=q1=Marshal Windsor's Lost Information", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 11468, "", "=q1=Dark Iron Fanny Pack", "=ds=#m3#", "", "80.0%" };
    { 6, 11810, "", "=q3=Force of Will", "=ds=#e15#", "", "" };
    { 7, 11816, "", "=q3=Angerforge's Battle Axe", "=ds=#w1#", "", "" };
    { 8, 11817, "", "=q3=Lord General's Sword", "=ds=#w10#", "", "" };
    { 9, 11820, "", "=q3=Royal Decorated Armor", "=ds=#a3#", "", "" };
    { 10, 11821, "", "=q3=Warstrife Leggings", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["BRDGolemLordArgelmach"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 11268, "", "=q1=Head of Argelmach", "=ds=#m3#", "", "100%" };
    { 3, 11465, "", "=q1=Marshal Windsor's Lost Information", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 11468, "", "=q1=Dark Iron Fanny Pack", "=ds=#m3#", "", "80.0%" };
    { 7, 21956, "", "=q2=Design: Dark Iron Scorpid", "=ds=#e2#", "", "60.0%" };
    { 8, 11819, "", "=q3=Second Wind", "=ds=#e15#", "", "8.00%" };
    { 9, 11669, "", "=q3=Naglering", "=ds=#e15#", "", "" };
    { 10, 11822, "", "=q3=Omnicast Boots", "=ds=#a1#", "", "" };
    { 11, 11823, "", "=q3=Luminary Kilt", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["BRDGuzzler"] = {
		{ 1, 0, "INV_Box_01", "=q6=#n48#", ""};
		{ 2, 11735, "", "=q3=Ragefury Eyepatch", "=ds=#s1#, #a2#", "", "8.11%"};
		{ 3, 18043, "", "=q3=Coal Miner Boots", "=ds=#s12#, #a2#", "", "23.87%"};
		{ 4, 22275, "", "=q3=Firemoss Boots", "=ds=#s12#, #a2#", "", "23.87%"};
		{ 5, 18044, "", "=q3=Hurley's Tankard", "=ds=#h1#, #w6#", "", "31.02%"};
		{ 6, 11312, "", "=q1=Lost Thunderbrew Recipe", "=ds=#m3#"};
		{ 8, 0, "INV_Box_01", "=q6=#n49#", ""};
		{ 9, 22212, "", "=q3=Golem Fitted Pauldrons", "=ds=#s3#, #a3#", "", "26.04%"};
		{ 10, 11745, "", "=q3=Fists of Phalanx", "=ds=#s9#, #a4#", "", "29.79%"};
		{ 11, 11744, "", "=q3=Bloodfist", "=ds=#h1#, #w13#", "", "28.48%"};
		{ 16, 0, "INV_Box_01", "=q6=#n50#", ""};
		{ 17, 11612, "", "=q3=Plans: Dark Iron Plate", "=ds=#p2# (285)", "", "22.20%"};
		{ 18, 2662, "", "=q2=Ribbly's Quiver", "=ds=#m13# #w19#", "", "17.03%"};
		{ 19, 2663, "", "=q2=Ribbly's Bandolier", "=ds=#m13# #w20#", "", "15.73%"};
		{ 20, 11742, "", "=q2=Wayfarer's Knapsack", "=ds=#m13# #e1#", "", "25.07%"};
		{ 21, 11313, "", "=q1=Ribbly's Head", "=ds=#m3#"};
		{ 23, 0, "INV_Box_01", "=q6=#n51#", ""};
		{ 24, 12793, "", "=q3=Mixologist's Tunic", "=ds=#s5#, #a2#", "", "24.87%"};
		{ 25, 12791, "", "=q3=Barman Shanker", "=ds=#h1#, #w4#", "", "6.97%"};
		{ 26, 13483, "", "=q2=Recipe: Transmute Fire to Earth", "=ds=#p1# (275)"};
		{ 27, 18653, "", "=q2=Schematic: Goblin Jumper Cables XL", "=ds=#p5# (265)", "", "14.13%"};
		{ 28, 15759, "", "=q1=Pattern: Black Dragonscale Breastplate", "=ds=#p7# (290)"};
		{ 29, 11602, "", "=q1=Grim Guzzler Key", "=ds=#e9#"};
		{ 30, 11325, "", "=q1=Dark Iron Ale Mug", "=ds=#m3#"};
	};

	AtlasLoot_Data["BRDFlamelash"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11129, "", "=q1=Essence of the Elements", "=ds=#m3#", "", "80.0%" };
    { 3, 57458, "", "=q2=Technique: Scroll of Fire Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 4, 11809, "", "=q3=Flame Wrath", "=ds=#w7#", "", "20.0%" };
    { 5, 11832, "", "=q3=Burst of Knowledge", "=ds=#e15#", "", "17.0%" };
    { 6, 11808, "", "=q4=Circle of Flame", "=ds=#a1#", "", "1.00%" };
    { 7, 11812, "", "=q3=Cape of the Fire Salamander", "=ds=#a1#", "", "" };
    { 8, 11814, "", "=q3=Molten Fists", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["BRDPanzor"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11129, "", "=q1=Essence of the Elements", "=ds=#m3#", "", "80.0%" };
    { 3, 11785, "", "=q3=Rock Golem Bulwark", "=ds=#e16#", "", "" };
    { 4, 11786, "", "=q3=Stone of the Earth", "=ds=#w10#", "", "" };
    { 5, 11787, "", "=q3=Shalehusk Boots", "=ds=#a4#", "", "" };
    { 6, 22245, "", "=q3=Soot Encrusted Footwear", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["BRDTomb"] = {
		{ 1, 0, "INV_Box_01", "=q6=#x2#", ""};
		{ 2, 11929, "", "=q3=Haunting Specter Leggings", "=ds=#s11#, #a1#", "", "22.60%"};
		{ 3, 11925, "", "=q3=Ghostshroud", "=ds=#s1#, #a2#", "", "21.63%"};
		{ 4, 11926, "", "=q3=Deathdealer Breastplate", "=ds=#s5#, #a3#", "", "22.08%"};
		{ 5, 11927, "", "=q3=Legplates of the Eternal Guardian", "=ds=#s11#, #a4#", "", "65.45%"};
		{ 6, 11922, "", "=q3=Blood-etched Blade", "=ds=#h3#, #w4#", "", "22.05%"};
		{ 7, 11920, "", "=q3=Wraith Scythe", "=ds=#h1# #w1#", "", "22.61%"};
		{ 8, 11923, "", "=q3=The Hammer of Grace", "=ds=#h3#, #w6#", "", "21.29%"};
		{ 9, 11921, "", "=q3=Impervious Giant", "=ds=#h2#, #w6#", "", "22.23%"};
	};

	AtlasLoot_Data["BRDLyceum"] = {
		{ 1, 0, "INV_Box_01", "=q6=#n44#", ""};
		{ 2, 11885, "", "=q1=Shadowforge Torch", "=ds=#m20#"};
	};

	AtlasLoot_Data["BRDMagmus"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11746, "", "=q3=Golem Skull Helm", "=ds=#a4#", "", "" };
    { 3, 11935, "", "=q3=Magmus Stone", "=ds=#e15#", "", "" };
    { 4, 22208, "", "=q3=Lavastone Hammer", "=ds=#w6#", "", "" };
    { 5, 22395, "", "=q3=Totem of Rage", "", "", "" };
    { 6, 22400, "", "=q3=Libram of Truth", "", "", "" };
	};

	AtlasLoot_Data["BRDImperatorDagranThaurissan"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 57206, "", "=q3=Schematic: Thorium Headed Arrows", "=ds=#e2#", "", "100%" };
    { 3, 57502, "", "=q3=Design: Black Diamond Dragonling", "=ds=#e2#", "", "100%" };
    { 4, 901725, "", "=q1=Emperor's Dark Iron Seal", "=ds=#m3#", "", "100%" };
    { 6, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 7, 11468, "", "=q1=Dark Iron Fanny Pack", "=ds=#m3#", "", "80.0%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 11815, "", "=q3=Hand of Justice", "=ds=#e15#", "", "9.90%" };
    { 18, 11924, "", "=q3=Robes of the Royal Crown", "=ds=#a1#", "", "9.90%" };
    { 19, 11928, "", "=q3=Thaurissan's Royal Scepter", "=ds=#e15#", "", "9.90%" };
    { 20, 11930, "", "=q3=The Emperor's New Cape", "=ds=#a1#", "", "9.90%" };
    { 21, 11931, "", "=q3=Dreadforge Retaliator", "=ds=#w1#", "", "9.90%" };
    { 22, 11932, "", "=q3=Guiding Stave of Wisdom", "=ds=#w9#", "", "9.90%" };
    { 23, 11933, "", "=q3=Imperial Jewel", "=ds=#e15#", "", "9.90%" };
    { 24, 11934, "", "=q3=Emperor's Seal", "=ds=#e15#", "", "9.90%" };
    { 25, 22204, "", "=q3=Wristguards of Renown", "=ds=#a2#", "", "9.90%" };
    { 26, 22207, "", "=q3=Sash of the Grand Hunt", "=ds=#a3#", "", "9.90%" };
    { 27, 11684, "", "=q4=Ironfoe", "=ds=#w6#", "", "1.00%" };
	};

	AtlasLoot_Data["BRDPrincess"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11468, "", "=q1=Dark Iron Fanny Pack", "=ds=#m3#", "", "80.0%" };
    { 3, 12553, "", "=q3=Swiftwalker Boots", "=ds=#a2#", "", "" };
    { 4, 12554, "", "=q3=Hands of the Exalted Herald", "=ds=#a1#", "", "" };
    { 5, 12556, "", "=q3=High Priestess Boots", "=ds=#a1#", "", "" };
    { 6, 12557, "", "=q3=Ebonsteel Spaulders", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["BRDBSPlans"] = {
		{ 1, 11614, "", "=q2=Plans: Dark Iron Mail", "=ds=#p2# (270)", "", "13.38%"};
		{ 2, 11615, "", "=q2=Plans: Dark Iron Shoulders", "=ds=#p2# (280)", "", "7.65%"};
	};

	AtlasLoot_Data["BRDTrash"] = {
		{ 1, 12552, "", "=q3=Blisterbane Wrap", "=ds=#s4#", "", "0.01%"};
		{ 2, 12551, "", "=q3=Stoneshield Cloak", "=ds=#s4#", "", "0.01%"};
		{ 3, 12542, "", "=q3=Funeral Pyre Vestment", "=ds=#s5#, #a1#", "", "0.02%"};
		{ 4, 12546, "", "=q3=Aristocratic Cuffs", "=ds=#s8#, #a1#", "", "0.01%"};
		{ 5, 12550, "", "=q3=Runed Golem Shackles", "=ds=#s8#, #a2#", "", "0.02%"};
		{ 6, 12547, "", "=q3=Mar Alom's Grip", "=ds=#s9#, #a2#", "", "0.01%"};
		{ 7, 12549, "", "=q3=Braincage", "=ds=#s1#, #a3#", "", "0.02%"};
		{ 8, 12555, "", "=q3=Battlechaser's Greaves", "=ds=#s12#, #a4#", "", "0.01%"};
		{ 9, 12531, "", "=q3=Searing Needle", "=ds=#h1#, #w4#", "", "0.02%"};
		{ 10, 12535, "", "=q3=Doomforged Straightedge", "=ds=#h1#, #w10#", "", "0.01%"};
		{ 11, 12527, "", "=q3=Ribsplitter", "=ds=#h1#, #w1# =q2=#m16#", "", "0.02%"};
		{ 12, 12528, "", "=q3=The Judge's Gavel", "=ds=#h2#, #w6#", "", "0.02%"};
		{ 13, 12532, "", "=q3=Spire of the Stoneshaper", "=ds=#w9#", "", "0.01%"};
		{ 16, 15781, "", "=q3=Pattern: Black Dragonscale Leggings", "=ds=#p7# (300) =q1=#n75#", "", "1.93%"};
		{ 17, 15770, "", "=q3=Pattern: Black Dragonscale Shoulders", "=ds=#p7# (300) =q1=#n76#", "", "1.88%"};
		{ 18, 16053, "", "=q2=Schematic: Master Engineer's Goggles", "=ds=#p5# (290) =q1=#n77#", "", "0.45%"};
		{ 19, 16049, "", "=q2=Schematic: Dark Iron Bomb", "=ds=#p5# (285) =q1=#n78#", "", "1.02%"};
		{ 20, 16048, "", "=q2=Schematic: Dark Iron Rifle", "=ds=#p5# (275) =q1=#n79#", "", "0.98%"};
		{ 21, 18654, "", "=q2=Schematic: Gnomish Alarm-O-Bot", "=ds=#p5# (265) =q1=#n78#", "", "1.88%"};
		{ 22, 18661, "", "=q2=Schematic: World Enlarger", "=ds=#p5# (260) =q1=#n78#", "", "2.00%"};
		{ 24, 11754, "", "=q2=Black Diamond", "#e8#", "", "5.0%"};
		{ 25, 11078, "", "=q1=Relic Coffer Key", "=ds=#e9#"};
		{ 26, 18945, "", "=q1=Dark Iron Residue", "=ds=#m3#"};
		{ 27, 11468, "", "=q1=Dark Iron Fanny Pack", "=ds=#m3#"};
		{ 28, 11446, "", "=q1=A Crumpled Up Note", "=ds=#m2#"};
	};

		-------------------------------------------------
		--- Blackrock Mountain: Lower Blackrock Spire ---
		-------------------------------------------------

	AtlasLoot_Data["BRMScarshieldQuartermaster"] = {
		{ 1, 18987, "", "=q1=Blackhand's Command", "=ds=#m2#", "", "100%"};
	};

	AtlasLoot_Data["LBRSQuestItems"] = {
		{ 1, 12812, "", "=q3=Unfired Plate Gauntlets", "=ds=#m3#", "", "100%"};
		{ 2, 12631, "", "=q3=Fiery Plate Gauntlets", "=q1=#m4#: =ds=#s9#, #a4#"};
		{ 3, 12699, "", "=q3=Plans: Fiery Plate Gauntlets", "=q1=#m4#: =ds=#p2# (290)"};
		{ 5, 12533, "", "=q1=Roughshod Pike", "=ds=#m3#"};
		{ 6, 12740, "", "=q1=Fifth Mosh'aru Tablet", "=ds=#m3#"};
		{ 7, 12741, "", "=q1=Sixth Mosh'aru Tablet", "=ds=#m3#"};
		{ 8, 12345, "", "=q1=Bijou's Belongings", "=ds=#m3#"};
	};

	AtlasLoot_Data["LBRSSpirestoneButcher"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 21982, "", "=q1=Ogre Warbeads", "=ds=#m3#", "", "80.0%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 12608, "", "=q3=Butcher's Apron", "=ds=#a1#", "", "60.0%" };
    { 6, 13286, "", "=q3=Rivenspike", "=ds=#w1#", "", "40.0%" };
	};

	AtlasLoot_Data["LBRSOmokk"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12336, "", "=q2=Gemstone of Spirestone", "=ds=#m3#", "", "100%" };
    { 3, 12534, "", "=q1=Omokk's Head", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 21982, "", "=q1=Ogre Warbeads", "=ds=#m3#", "", "80.0%" };
    { 7, 13166, "", "=q3=Slamshot Shoulders", "=ds=#a4#", "", "" };
    { 8, 13167, "", "=q3=Fist of Omokk", "=ds=#w6#", "", "" };
    { 9, 13168, "", "=q3=Plate of the Shaman King", "=ds=#a4#", "", "" };
    { 10, 13169, "", "=q3=Tressermane Leggings", "=ds=#a2#", "", "" };
    { 11, 13170, "", "=q3=Skyshroud Leggings", "=ds=#a1#", "", "" };
    { 12, 16670, "", "=q3=Boots of Elements", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["LBRSSpirestoneLord"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 21982, "", "=q1=Ogre Warbeads", "=ds=#m3#", "", "80.0%" };
    { 3, 13285, "", "=q3=The Blackrock Slicer", "=ds=#w1#", "", "60.0%" };
    { 4, 13284, "", "=q3=Swiftdart Battleboots", "=ds=#a3#", "", "40.0%" };
	};

	AtlasLoot_Data["LBRSLordMagus"] = {
		{ 1, 13282, "", "=q3=Ogreseer Tower Boots", "=ds=#s12#, #a3#", "", "22.95%"};
		{ 2, 13283, "", "=q3=Magus Ring", "=ds=#s13#", "", "38.01%"};
		{ 3, 13261, "", "=q3=Globe of D'sak", "=ds=#s15#", "", "18.07%"};
	};

	AtlasLoot_Data["LBRSVosh"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 13352, "", "=q1=Vosh'gajin's Snakestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 12654, "", "=q3=Doomshot", "=ds=#e6#", "", "30.0%" };
    { 6, 12651, "", "=q3=Blackcrow", "=ds=#w3#", "", "8.00%" };
    { 7, 12653, "", "=q3=Riphook", "=ds=#w2#", "", "8.00%" };
    { 8, 12626, "", "=q3=Funeral Cuffs", "=ds=#a1#", "", "" };
    { 9, 13255, "", "=q3=Trueaim Gauntlets", "=ds=#a3#", "", "" };
    { 10, 13257, "", "=q3=Demonic Runed Spaulders", "=ds=#a2#", "", "" };
    { 11, 16712, "", "=q3=Shadowcraft Gloves", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["LBRSVoone"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12335, "", "=q2=Gemstone of Smolderthorn", "=ds=#m3#", "", "100%" };
    { 3, 28972, "", "=q3=Flightblade Throwing Axe", "=ds=#w11#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 12582, "", "=q3=Keris of Zul'Serak", "=ds=#w4#", "", "" };
    { 7, 13177, "", "=q3=Talisman of Evasion", "=ds=#e15#", "", "" };
    { 8, 13179, "", "=q3=Brazecore Armguards", "=ds=#a3#", "", "" };
    { 9, 16676, "", "=q3=Beaststalker's Gloves", "=ds=#a3#", "", "" };
    { 10, 22231, "", "=q3=Kayser's Boots of Precision", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["LBRSGrayhoof"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 21984, "", "=q1=Left Piece of Lord Valthalak's Amulet", "=ds=#m3#", "", "100%" };
    { 3, 22046, "", "=q1=Right Piece of Lord Valthalak's Amulet", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 22306, "", "=q3=Ironweave Belt", "=ds=#a1#", "", "" };
    { 7, 22319, "", "=q3=Tome of Divine Right", "=ds=#e15#", "", "" };
    { 8, 22322, "", "=q3=The Jaw Breaker", "=ds=#w6#", "", "" };
    { 9, 22325, "", "=q3=Belt of the Trickster", "=ds=#a2#", "", "" };
    { 10, 22398, "", "=q3=Idol of Rejuvenation", "", "", "" };
	};

	AtlasLoot_Data["LBRSGrimaxe"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22138, "", "=q1=Blackrock Bracer", "=ds=#m3#", "", "80.0%" };
    { 3, 12838, "", "=q3=Plans: Arcanite Reaper", "=ds=#e2#", "", "7.00%" };
    { 4, 12621, "", "=q3=Demonfork", "=ds=#w1#", "", "" };
    { 5, 12634, "", "=q3=Chiselbrand Girdle", "=ds=#a3#", "", "" };
    { 6, 12637, "", "=q3=Backusarian Gauntlets", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["LBRSSmolderweb"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 13183, "", "=q3=Venomspitter", "=ds=#w6#", "", "15.0%" };
    { 3, 16715, "", "=q3=Wildheart Boots", "=ds=#a2#", "", "15.0%" };
    { 4, 13213, "", "=q3=Smolderweb's Eye", "=ds=#e15#", "", "" };
    { 5, 13244, "", "=q3=Gilded Gauntlets", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["LBRSCrystalFang"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 13218, "", "=q3=Fang of the Crystal Spider", "=ds=#w4#", "", "14.0%" };
    { 3, 13184, "", "=q3=Fallbrush Handgrips", "=ds=#a2#", "", "" };
    { 4, 13185, "", "=q3=Sunderseer Mantle", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["LBRSDoomhowl"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 21982, "", "=q1=Ogre Warbeads", "=ds=#m3#", "", "80.0%" };
    { 3, 13178, "", "=q3=Rosewine Circle", "=ds=#e15#", "", "" };
    { 4, 13258, "", "=q3=Slaghide Gauntlets", "=ds=#a2#", "", "" };
    { 5, 13259, "", "=q3=Ribsteel Footguards", "=ds=#a4#", "", "" };
    { 6, 22232, "", "=q3=Marksman's Girdle", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["LBRSZigris"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22138, "", "=q1=Blackrock Bracer", "=ds=#m3#", "", "80.0%" };
    { 3, 21955, "", "=q2=Design: Black Diamond Crab", "=ds=#e2#", "", "60.0%" };
    { 4, 12835, "", "=q3=Plans: Annihilator", "=ds=#e2#", "", "13.0%" };
    { 5, 13252, "", "=q3=Cloudrunner Girdle", "=ds=#a2#", "", "20.0%" };
    { 6, 13253, "", "=q3=Hands of Power", "=ds=#a1#", "", "19.0%" };
	};

	AtlasLoot_Data["LBRSSlavener"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 16718, "", "=q3=Wildheart Spaulders", "=ds=#a2#", "", "15.0%" };
    { 3, 13205, "", "=q3=Rhombeard Protector", "=ds=#e16#", "", "" };
    { 4, 13206, "", "=q3=Wolfshear Leggings", "=ds=#a1#", "", "" };
    { 5, 13208, "", "=q3=Bleak Howler Armguards", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["LBRSHalycon"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 13210, "", "=q3=Pads of the Dread Wolf", "=ds=#a2#", "", "14.0%" };
    { 3, 13211, "", "=q3=Slashclaw Bracers", "=ds=#a3#", "", "" };
    { 4, 13212, "", "=q3=Halycon's Spiked Collar", "=ds=#e15#", "", "" };
    { 5, 22313, "", "=q3=Ironweave Bracers", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["LBRSBashguud"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22138, "", "=q1=Blackrock Bracer", "=ds=#m3#", "", "80.0%" };
    { 3, 13198, "", "=q3=Hurd Smasher", "=ds=#w13#", "", "" };
    { 4, 13203, "", "=q3=Armswake Cloak", "=ds=#a1#", "", "" };
    { 5, 13204, "", "=q3=Bashguuder", "=ds=#w6#", "", "" };
	};

	AtlasLoot_Data["LBRSWyrmthalak"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12337, "", "=q2=Gemstone of Bloodaxe", "=ds=#m3#", "", "100%" };
    { 3, 12780, "", "=q1=General Drakkisath's Command", "=ds=#m3#", "", "100%" };
    { 4, 901715, "", "=q1=Wyrmthalak's War Horn", "=ds=#m3#", "", "100%" };
    { 6, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 7, 16786, "", "=q1=Black Dragonspawn Eye", "=ds=#m3#", "", "80.0%" };
    { 8, 13143, "", "=q4=Mark of the Dragon Lord", "=ds=#e15#", "", "2.00%" };
    { 9, 13161, "", "=q3=Trindlehaven Staff", "=ds=#w9#", "", "" };
    { 10, 13162, "", "=q3=Reiver Claws", "=ds=#a4#", "", "" };
    { 11, 13163, "", "=q3=Relentless Scythe", "=ds=#w10#", "", "" };
    { 12, 16679, "", "=q3=Beaststalker's Mantle", "=ds=#a3#", "", "" };
    { 13, 22321, "", "=q3=Heart of Wyrmthalak", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["LBRSFelguard"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 12662, "", "=q2=Demonic Rune", "=ds=#e7#", "", "10.0%" };
    { 3, 13181, "", "=q3=Demonskin Gloves", "=ds=#a1#", "", "14.0%" };
    { 4, 13182, "", "=q3=Phase Blade", "=ds=#w10#", "", "14.0%" };
	};

	AtlasLoot_Data["LBRSTrash"] = {
		{ 1, 14513, "", "=q4=Pattern: Robe of the Archmage", "=ds=#p8# (300) =q1=#m1# =ds=#c3# =q1=#n71#", "", "10.12%"};
		{ 2, 14152, "", "=q4=Robe of the Archmage", "=ds=#s5#, #a1# =q1=#m1# =ds=#c3#"};
		{ 4, 13494, "", "=q2=Recipe: Greater Fire Protection Potion", "=ds=#p1# (290) =q1=#n71#/#n72#", "", "1.94%"};
		{ 5, 16250, "", "=q2=Formula: Enchant Weapon - Superior Striking", "=ds=#p4# (300) =q1=#n75#", "", "1.04%"};
		{ 6, 16244, "", "=q2=Formula: Enchant Gloves - Greater Strength", "=ds=#p4# (295) =q1=#n76#", "", "4.16%"};
		{ 7, 15749, "", "=q2=Pattern: Volcanic Breastplate", "=ds=#p7# (285) =q1=#n73#", "", "2.04%"};
		{ 8, 15775, "", "=q2=Pattern: Volcanic Shoulders", "=ds=#p7# (300) =q1=#n74#", "", "10.56%"};
		{ 10, 12219, "", "=q1=Unadorned Seal of Ascension", "=ds=#m3#"};
		{ 11, 21982, "", "=q1=Ogre Warbeads", "=ds=#m3#"};
	};

		-------------------------------------------------
		--- Blackrock Mountain: Upper Blackrock Spire ---
		-------------------------------------------------

	AtlasLoot_Data["UBRSEmberseer"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 17322, "", "=q1=Eye of the Emberseer", "=ds=#m3#", "", "100%" };
    { 3, 21988, "", "=q1=Ember of Emberseer", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 23320, "", "=q3=Tablet of Flame Shock VI", "=ds=#e2#", "", "8.00%" };
    { 7, 12905, "", "=q3=Wildfire Cape", "=ds=#a1#", "", "" };
    { 8, 12926, "", "=q3=Flaming Band", "=ds=#e15#", "", "" };
    { 9, 12927, "", "=q3=Truestrike Shoulders", "=ds=#a2#", "", "" };
    { 10, 12929, "", "=q3=Emberfury Talisman", "=ds=#e15#", "", "" };
    { 11, 16672, "", "=q3=Gauntlets of Elements", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["UBRSSolakar"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 16786, "", "=q1=Black Dragonspawn Eye", "=ds=#m3#", "", "80.0%" };
    { 3, 12589, "", "=q3=Dustfeather Sash", "=ds=#a1#", "", "" };
    { 4, 12603, "", "=q3=Nightbrace Tunic", "=ds=#a2#", "", "" };
    { 5, 12606, "", "=q3=Crystallized Girdle", "=ds=#a2#", "", "" };
    { 6, 12609, "", "=q3=Polychromatic Visionwrap", "=ds=#a1#", "", "" };
    { 7, 16695, "", "=q3=Devout Mantle", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["UBRSFLAME"] = {
		{ 1, 13371, "", "=q2=Father Flame", "=ds=#s15#", "", "100%"};
	};

	AtlasLoot_Data["UBRSQuestItems"] = {
		{ 1, 12358, "", "=q1=Darkstone Tablet", "=ds=#m3#"};
		{ 2, 12352, "", "=q1=Doomrigger's Clasp", "=ds=#m3#"};
	};

	AtlasLoot_Data["UBRSRunewatcher"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22138, "", "=q1=Blackrock Bracer", "=ds=#m3#", "", "80.0%" };
    { 3, 12604, "", "=q3=Starfire Tiara", "=ds=#a1#", "", "" };
    { 4, 12605, "", "=q3=Serpentine Skuller", "=ds=#w12#", "", "" };
    { 5, 12930, "", "=q3=Briarwood Reed", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["UBRSAnvilcrack"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22138, "", "=q1=Blackrock Bracer", "=ds=#m3#", "", "80.0%" };
    { 3, 12834, "", "=q3=Plans: Arcanite Champion", "=ds=#e2#", "", "5.00%" };
    { 4, 12837, "", "=q3=Plans: Masterwork Stormhammer", "=ds=#e2#", "", "5.00%" };
    { 5, 12728, "", "=q4=Plans: Invulnerable Mail", "=ds=#e2#", "", "2.00%" };
    { 6, 13498, "", "=q3=Handcrafted Mastersmith Leggings", "=ds=#a4#", "", "" };
    { 7, 13502, "", "=q3=Handcrafted Mastersmith Girdle", "=ds=#a4#", "", "" };
    { 8, 18047, "", "=q3=Flame Walkers", "=ds=#a3#", "", "" };
    { 9, 18048, "", "=q3=Mastersmith's Hammer", "=ds=#w6#", "", "" };
	};

	AtlasLoot_Data["UBRSRend"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12630, "", "=q1=Head of Rend Blackhand", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 22138, "", "=q1=Blackrock Bracer", "=ds=#m3#", "", "80.0%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 12587, "", "=q3=Eye of Rend", "=ds=#a2#", "", "9.25%" };
    { 18, 12935, "", "=q3=Warmaster Legguards", "=ds=#a4#", "", "9.25%" };
    { 19, 12936, "", "=q3=Battleborn Armbraces", "=ds=#a4#", "", "9.25%" };
    { 20, 16733, "", "=q3=Spaulders of Valor", "=ds=#a4#", "", "9.25%" };
    { 21, 18102, "", "=q3=Dragonrider Boots", "=ds=#a1#", "", "9.25%" };
    { 22, 18103, "", "=q3=Band of Rumination", "=ds=#e15#", "", "9.25%" };
    { 23, 18104, "", "=q3=Feralsurge Girdle", "=ds=#a3#", "", "9.25%" };
    { 24, 22247, "", "=q3=Faith Healer's Boots", "=ds=#a1#", "", "9.25%" };
    { 25, 12583, "", "=q3=Blackhand Doomsaw", "=ds=#w7#", "", "8.00%" };
    { 26, 12939, "", "=q3=Dal'Rend's Tribal Guardian", "=ds=#w10#", "", "8.00%" };
    { 27, 12940, "", "=q3=Dal'Rend's Sacred Charge", "=ds=#w10#", "", "8.00%" };
    { 28, 12590, "", "=q4=Felstriker", "=ds=#w4#", "", "2.00%" };
	};

	AtlasLoot_Data["UBRSGyth"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 12871, "", "=q4=Chromatic Carapace", "=ds=#e10#", "", "4.00%" };
    { 3, 12952, "", "=q3=Gyth's Skull", "=ds=#a4#", "", "" };
    { 4, 12953, "", "=q3=Dragoneye Coif", "=ds=#a3#", "", "" };
    { 5, 12960, "", "=q3=Tribal War Feathers", "=ds=#a2#", "", "" };
    { 6, 16669, "", "=q3=Pauldrons of Elements", "=ds=#a3#", "", "" };
    { 7, 22225, "", "=q3=Dragonskin Cowl", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["UBRSBeast"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 24101, "", "=q3=Book of Ferocious Bite V", "=ds=#e2#", "", "13.0%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 12964, "", "=q3=Tristam Legguards", "=ds=#a3#", "", "20.0%" };
    { 6, 12967, "", "=q3=Bloodmoon Cloak", "=ds=#a1#", "", "20.0%" };
    { 7, 12709, "", "=q3=Finkle's Skinner", "=ds=#w4#", "", "7.50%" };
    { 8, 12963, "", "=q3=Blademaster Leggings", "=ds=#a2#", "", "7.50%" };
    { 9, 12965, "", "=q3=Spiritshroud Leggings", "=ds=#a1#", "", "7.50%" };
    { 10, 12966, "", "=q3=Blackmist Armguards", "=ds=#a2#", "", "7.50%" };
    { 11, 12968, "", "=q3=Frostweaver Cape", "=ds=#a1#", "", "7.50%" };
    { 12, 12969, "", "=q3=Seeping Willow", "=ds=#w6#", "", "7.50%" };
    { 13, 16729, "", "=q3=Lightforge Spaulders", "=ds=#a4#", "", "7.50%" };
    { 14, 22311, "", "=q3=Ironweave Boots", "=ds=#a1#", "", "7.50%" };
	};

	AtlasLoot_Data["UBRSValthalak"] = {
    { 2, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 3, 22302, "", "=q3=Ironweave Cowl", "=ds=#a1#", "", "12.5%" };
    { 4, 22335, "", "=q3=Lord Valthalak's Staff of Command", "=ds=#w9#", "", "12.5%" };
    { 5, 22336, "", "=q3=Draconian Aegis of the Legion", "=ds=#e16#", "", "12.5%" };
    { 6, 22337, "", "=q3=Shroud of Domination", "=ds=#a1#", "", "12.5%" };
    { 7, 22339, "", "=q3=Rune Band of Wizardry", "=ds=#e15#", "", "12.5%" };
    { 8, 22340, "", "=q3=Pendant of Celerity", "=ds=#e15#", "", "12.5%" };
    { 9, 22342, "", "=q3=Leggings of Torment", "=ds=#a1#", "", "12.5%" };
    { 10, 22343, "", "=q3=Handguards of Savagery", "=ds=#a3#", "", "12.5%" };
	};

	AtlasLoot_Data["UBRSDrakkisath"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 16663, "", "=q1=Blood of the Black Dragon Champion", "=ds=#m3#", "", "100%" };
    { 3, 901720, "", "=q1=Black Dragonflight Cipher", "=ds=#m3#", "", "100%" };
    { 4, 59001, "", "=q3=Drakkisath's Armor Cache - Chest", "=ds=#e10#", "", "100%" };
    { 6, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 7, 15730, "", "=q3=Pattern: Red Dragonscale Breastplate", "=ds=#e2#", "", "4.00%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 12602, "", "=q3=Draconian Deflector", "=ds=#e16#", "", "18.0%" };
    { 18, 13098, "", "=q3=Painweaver Band", "=ds=#e15#", "", "18.0%" };
    { 19, 13142, "", "=q3=Brigam Girdle", "=ds=#a4#", "", "18.0%" };
    { 20, 22269, "", "=q3=Shadow Prowler's Cloak", "=ds=#a1#", "", "18.0%" };
    { 21, 22268, "", "=q3=Draconic Infused Emblem", "=ds=#e15#", "", "8.00%" };
    { 22, 13141, "", "=q3=Tooth of Gnarr", "=ds=#e15#", "", "6.00%" };
    { 23, 22253, "", "=q3=Tome of the Lost", "=ds=#e15#", "", "6.00%" };
    { 24, 22267, "", "=q3=Spellweaver's Turban", "=ds=#a1#", "", "6.00%" };
    { 25, 12592, "", "=q4=Blackblade of Shahram", "=ds=#w10#", "", "2.00%" };
	};

	AtlasLoot_Data["UBRSTrash"] = {
		{ 1, 13260, "", "=q3=Wind Dancer Boots", "=ds=#s12#, #a3#", "", "0.01%"};
		{ 2, 24102, "", "=q3=Manual of Eviscerate IX", "=ds=#e10# =q1=#m1# =ds=#c6# =q1=#n70#", "", "0.94%"};
		{ 4, 16247, "", "=q2=Formula: Enchant 2H Weapon - Superior Impact", "=ds=#p4# (295) =q1=#n69#", "", "1.54%"};
		{ 6, 12607, "", "=q3=Brilliant Chromatic Scale", "=ds=#m3#"};
		{ 7, 12219, "", "=q1=Unadorned Seal of Ascension", "=ds=#m3#"};
	};

		---------------------------------------
		--- Blackrock Mountain: Molten Core ---
		---------------------------------------

	AtlasLoot_Data["MCLucifron"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 16665, "", "=q2=Tome of Tranquilizing Shot", "=ds=#e2#", "", "100%" };
    { 3, 17329, "", "=q1=Hand of Lucifron", "=ds=#m3#", "", "100%" };
    { 4, 59303, "", "=q4=Flamewaker Armor Cache - Gloves", "=ds=#e10#", "", "100%" };
    { 5, 59305, "", "=q4=Flamewaker Armor Cache - Boots", "=ds=#e10#", "", "100%" };
    { 7, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 8, 7078, "", "=q2=Essence of Fire", "=ds=#e7#", "", "40.0%" };
	};

	AtlasLoot_Data["MCMagmadar"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59304, "", "=q4=Flamewaker Armor Cache - Legs", "=ds=#e10#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 17073, "", "=q4=Earthshaker", "=ds=#w6#", "", "20.0%" };
    { 18, 18203, "", "=q4=Eskhandar's Right Claw", "=ds=#w13#", "", "20.0%" };
    { 19, 18820, "", "=q4=Talisman of Ephemeral Power", "=ds=#e15#", "", "5.45%" };
    { 20, 18821, "", "=q4=Quick Strike Ring", "=ds=#e15#", "", "5.45%" };
    { 21, 18822, "", "=q4=Obsidian Edged Blade", "=ds=#w10#", "", "5.45%" };
    { 22, 18823, "", "=q4=Aged Core Leather Gloves", "=ds=#a2#", "", "5.45%" };
    { 23, 18824, "", "=q4=Magma Tempered Boots", "=ds=#a4#", "", "5.45%" };
    { 24, 18829, "", "=q4=Deep Earth Spaulders", "=ds=#a3#", "", "5.45%" };
    { 25, 18861, "", "=q4=Flamewaker Legplates", "=ds=#a4#", "", "5.45%" };
    { 26, 19136, "", "=q4=Mana Igniting Cord", "=ds=#a1#", "", "5.45%" };
    { 27, 19142, "", "=q4=Fire Runed Grimoire", "=ds=#e15#", "", "5.45%" };
    { 28, 19143, "", "=q4=Flameguard Gauntlets", "=ds=#a4#", "", "5.45%" };
    { 29, 19144, "", "=q4=Sabatons of the Flamewalker", "=ds=#a3#", "", "5.45%" };
	};

	AtlasLoot_Data["MCGehennas"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 17331, "", "=q1=Hand of Gehennas", "=ds=#m3#", "", "100%" };
    { 3, 59303, "", "=q4=Flamewaker Armor Cache - Gloves", "=ds=#e10#", "", "100%" };
    { 4, 59305, "", "=q4=Flamewaker Armor Cache - Boots", "=ds=#e10#", "", "100%" };
    { 6, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 7, 7078, "", "=q2=Essence of Fire", "=ds=#e7#", "", "40.0%" };
	};

	AtlasLoot_Data["MCGarr"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59300, "", "=q4=Flamewaker Armor Cache - Helm", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 7076, "", "=q2=Essence of Earth", "=ds=#e7#", "", "40.0%" };
    { 6, 17011, "", "=q3=Lava Core", "=ds=#e7#", "", "14.0%" };
    { 7, 18564, "", "=q5=Bindings of the Windseeker", "=ds=#e10#", "", "3.00%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 17105, "", "=q4=Aurastone Hammer", "=ds=#w6#", "", "20.0%" };
    { 18, 18832, "", "=q4=Brutality Blade", "=ds=#w10#", "", "20.0%" };
    { 19, 18820, "", "=q4=Talisman of Ephemeral Power", "=ds=#e15#", "", "5.45%" };
    { 20, 18821, "", "=q4=Quick Strike Ring", "=ds=#e15#", "", "5.45%" };
    { 21, 18822, "", "=q4=Obsidian Edged Blade", "=ds=#w10#", "", "5.45%" };
    { 22, 18823, "", "=q4=Aged Core Leather Gloves", "=ds=#a2#", "", "5.45%" };
    { 23, 18824, "", "=q4=Magma Tempered Boots", "=ds=#a4#", "", "5.45%" };
    { 24, 18829, "", "=q4=Deep Earth Spaulders", "=ds=#a3#", "", "5.45%" };
    { 25, 18861, "", "=q4=Flamewaker Legplates", "=ds=#a4#", "", "5.45%" };
    { 26, 19136, "", "=q4=Mana Igniting Cord", "=ds=#a1#", "", "5.45%" };
    { 27, 19142, "", "=q4=Fire Runed Grimoire", "=ds=#e15#", "", "5.45%" };
    { 28, 19143, "", "=q4=Flameguard Gauntlets", "=ds=#a4#", "", "5.45%" };
    { 29, 19144, "", "=q4=Sabatons of the Flamewalker", "=ds=#a3#", "", "5.45%" };
	};

	AtlasLoot_Data["MCShazzrah"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59303, "", "=q4=Flamewaker Armor Cache - Gloves", "=ds=#e10#", "", "100%" };
    { 3, 59305, "", "=q4=Flamewaker Armor Cache - Boots", "=ds=#e10#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 6, 57100, "", "=q4=Formula: Mystic Resonator", "=ds=#e2#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 17077, "", "=q4=Crimson Shocker", "=ds=#w12#", "", "10.0%" };
    { 18, 18861, "", "=q4=Flamewaker Legplates", "=ds=#a4#", "", "10.0%" };
    { 19, 18870, "", "=q4=Helm of the Lifegiver", "=ds=#a3#", "", "10.0%" };
    { 20, 18872, "", "=q4=Manastorm Leggings", "=ds=#a1#", "", "10.0%" };
    { 21, 18875, "", "=q4=Salamander Scale Pants", "=ds=#a2#", "", "10.0%" };
    { 22, 18878, "", "=q4=Sorcerous Dagger", "=ds=#w4#", "", "10.0%" };
    { 23, 18879, "", "=q4=Heavy Dark Iron Ring", "=ds=#e15#", "", "10.0%" };
    { 24, 19145, "", "=q4=Robe of Volatile Power", "=ds=#a1#", "", "10.0%" };
    { 25, 19146, "", "=q4=Wristguards of Stability", "=ds=#a2#", "", "10.0%" };
    { 26, 19147, "", "=q4=Ring of Spell Power", "=ds=#e15#", "", "10.0%" };
	};

	AtlasLoot_Data["MCGeddon"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59301, "", "=q4=Flamewaker Armor Cache - Shoulder", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 7078, "", "=q2=Essence of Fire", "=ds=#e7#", "", "50.0%" };
    { 6, 17010, "", "=q3=Fiery Core", "=ds=#e7#", "", "14.0%" };
    { 7, 100002, "", "=q3=Tome: Greater Blessing of Kings", "=ds=#e2#", "", "12.0%" };
    { 8, 18563, "", "=q5=Bindings of the Windseeker", "=ds=#e10#", "", "3.00%" };
	};

	AtlasLoot_Data["MCGolemagg"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59302, "", "=q4=Flamewaker Armor Cache - Chest", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 7076, "", "=q2=Essence of Earth", "=ds=#e7#", "", "40.0%" };
    { 6, 7078, "", "=q2=Essence of Fire", "=ds=#e7#", "", "40.0%" };
    { 7, 17203, "", "=q4=Sulfuron Ingot", "=ds=#e7#", "", "20.0%" };
    { 8, 17011, "", "=q3=Lava Core", "=ds=#e7#", "", "14.0%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 17072, "", "=q4=Blastershot Launcher", "=ds=#w5#", "", "25.0%" };
    { 18, 17103, "", "=q4=Azuresong Mageblade", "=ds=#w10#", "", "25.0%" };
    { 19, 18842, "", "=q4=Staff of Dominance", "=ds=#w9#", "", "25.0%" };
    { 20, 18820, "", "=q4=Talisman of Ephemeral Power", "=ds=#e15#", "", "2.27%" };
    { 21, 18821, "", "=q4=Quick Strike Ring", "=ds=#e15#", "", "2.27%" };
    { 22, 18822, "", "=q4=Obsidian Edged Blade", "=ds=#w10#", "", "2.27%" };
    { 23, 18823, "", "=q4=Aged Core Leather Gloves", "=ds=#a2#", "", "2.27%" };
    { 24, 18824, "", "=q4=Magma Tempered Boots", "=ds=#a4#", "", "2.27%" };
    { 25, 18829, "", "=q4=Deep Earth Spaulders", "=ds=#a3#", "", "2.27%" };
    { 26, 18861, "", "=q4=Flamewaker Legplates", "=ds=#a4#", "", "2.27%" };
    { 27, 19136, "", "=q4=Mana Igniting Cord", "=ds=#a1#", "", "2.27%" };
    { 28, 19142, "", "=q4=Fire Runed Grimoire", "=ds=#e15#", "", "2.27%" };
    { 29, 19143, "", "=q4=Flameguard Gauntlets", "=ds=#a4#", "", "2.27%" };
    { 30, 19144, "", "=q4=Sabatons of the Flamewalker", "=ds=#a3#", "", "2.27%" };
	};

	AtlasLoot_Data["MCSulfuron"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 17330, "", "=q1=Hand of Sulfuron", "=ds=#m3#", "", "100%" };
    { 3, 57606, "", "=q3=Pattern: Drums of the Nights Watch", "=ds=#e2#", "", "100%" };
    { 4, 59301, "", "=q4=Flamewaker Armor Cache - Shoulder", "=ds=#e10#", "", "100%" };
    { 6, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 7, 7078, "", "=q2=Essence of Fire", "=ds=#e7#", "", "40.0%" };
	};

	AtlasLoot_Data["MCMajordomo"] = {
    { 1, 0, "INV_Box_01", "=q6="..AL["Cache of the Firelord"], ""};
    { 2, 18646, "", "=q4=The Eye of Divinity", "=ds=#e15#", "", "50.0%" };
    { 3, 18703, "", "=q4=Ancient Petrified Leaf", "=ds=#m3#", "", "50.0%" };
    { 4, 18806, "", "=q4=Core Forged Greaves", "=ds=#a4#", "", "20.0%" };
    { 5, 18809, "", "=q4=Sash of Whispered Secrets", "=ds=#a1#", "", "20.0%" };
    { 6, 18810, "", "=q4=Wild Growth Spaulders", "=ds=#a2#", "", "20.0%" };
    { 7, 18812, "", "=q4=Wristguards of True Flight", "=ds=#a3#", "", "20.0%" };
    { 8, 19140, "", "=q4=Cauterizing Band", "=ds=#e15#", "", "20.0%" };
    { 9, 18803, "", "=q4=Finkle's Lava Dredger", "=ds=#w6#", "", "20.0%" };
    { 10, 18805, "", "=q4=Core Hound Tooth", "=ds=#w4#", "", "20.0%" };
    { 11, 18808, "", "=q4=Gloves of the Hypnotic Flame", "=ds=#a1#", "", "20.0%" };
    { 12, 18811, "", "=q4=Fireproof Cloak", "=ds=#a1#", "", "20.0%" };
    { 13, 19139, "", "=q4=Fireguard Shoulders", "=ds=#a2#", "", "20.0%" };
	};

	AtlasLoot_Data["MCRagnaros"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19017, "", "=q5=Essence of the Firelord", "=ds=#m3#", "", "100%" };
    { 3, 59310, "", "=q4=Firelord's Armor Cache - Legs", "=ds=#e10#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 7078, "", "=q2=Essence of Fire", "=ds=#e7#", "", "40.0%" };
    { 7, 17204, "", "=q5=Eye of Sulfuras", "=ds=#e7#", "", "3.00%" };
    { 8, 12717, "", "=q4=Plans: Lionheart Helm", "=ds=#e2#", "", "1.32%" };
    { 9, 12720, "", "=q4=Plans: Stronghold Gauntlets", "=ds=#e2#", "", "1.32%" };
    { 10, 12728, "", "=q4=Plans: Invulnerable Mail", "=ds=#e2#", "", "1.32%" };
    { 11, 14511, "", "=q4=Pattern: Gloves of Spell Mastery", "=ds=#e2#", "", "1.32%" };
    { 12, 22388, "", "=q4=Plans: Titanic Leggings", "=ds=#e2#", "", "1.32%" };
    { 13, 22389, "", "=q4=Plans: Sageblade", "=ds=#e2#", "", "1.32%" };
    { 14, 22390, "", "=q4=Plans: Persuader", "=ds=#e2#", "", "1.32%" };
    { 15, 17076, "", "=q4=Bonereaver's Edge", "=ds=#w10#", "", "8.00%" };
    { 16, 17082, "", "=q4=Shard of the Flame", "=ds=#e15#", "", "8.00%" };
    { 17, 17104, "", "=q4=Spinal Reaper", "=ds=#w1#", "", "8.00%" };
    { 19, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 20, 18814, "", "=q4=Choker of the Fire Lord", "=ds=#e15#", "", "20.0%" };
    { 21, 18815, "", "=q4=Essence of the Pure Flame", "=ds=#e15#", "", "20.0%" };
    { 22, 18816, "", "=q4=Perdition's Blade", "=ds=#w4#", "", "20.0%" };
    { 23, 18817, "", "=q4=Crown of Destruction", "=ds=#a3#", "", "20.0%" };
    { 24, 19138, "", "=q4=Band of Sulfuras", "=ds=#e15#", "", "20.0%" };
    { 26, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 27, 17063, "", "=q4=Band of Accuria", "=ds=#e15#", "", "20.0%" };
    { 28, 17102, "", "=q4=Cloak of the Shrouded Mists", "=ds=#a1#", "", "20.0%" };
    { 29, 17106, "", "=q4=Malistar's Defender", "=ds=#e16#", "", "20.0%" };
    { 30, 17107, "", "=q4=Dragon's Blood Cape", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["MCTrashMobs"] = {
		{ 1, 16802, "", "=q4=Arcanist Belt", "=q1=#m1# =ds=#c3# (T1)", "", "0.16%"};
		{ 2, 16817, "", "=q4=Girdle of Prophecy", "=q1=#m1# =ds=#c5# (T1)", "", "0.18%"};
		{ 3, 16806, "", "=q4=Felheart Belt", "=q1=#m1# =ds=#c8# (T1)", "", "0.19%"};
		{ 4, 16827, "", "=q4=Nightslayer Belt", "=q1=#m1# =ds=#c6# (T1)", "", "0.15%"};
		{ 5, 16828, "", "=q4=Cenarion Belt", "=q1=#m1# =ds=#c1# (T1)", "", "0.16%"};
		{ 6, 16851, "", "=q4=Giantstalker's Belt", "=q1=#m1# =ds=#c2# (T1)", "", "0.17%"};
		{ 7, 16838, "", "=q4=Earthfury Belt", "=q1=#m1# =ds=#c7# (T1)", "", "0.07%"};
		{ 8, 16864, "", "=q4=Belt of Might", "=q1=#m1# =ds=#c9# (T1)", "", "0.16%"};
		{ 9, 16858, "", "=q4=Lawbringer Belt", "=q1=#m1# =ds=#c4# (T1)", "", "0.10%"};
		{ 11, 17010, "", "=q3=Fiery Core", "=ds=#e8#"};
		{ 12, 17011, "", "=q3=Lava Core", "=ds=#e8#"};
		{ 13, 11382, "", "=q2=Blood of the Mountain", "=ds=#e8#"};
		{ 14, 17012, "", "=q1=Core Leather", "=ds=#e8#"};
		{ 16, 16799, "", "=q4=Arcanist Bindings", "=q1=#m1# =ds=#c3# (T1)", "", "0.16%"};
		{ 17, 16819, "", "=q4=Vambraces of Prophecy", "=q1=#m1# =ds=#c5# (T1)", "", "0.16%"};
		{ 18, 16804, "", "=q4=Felheart Bracers", "=q1=#m1# =ds=#c8# (T1)", "", "0.16%"};
		{ 19, 16825, "", "=q4=Nightslayer Bracelets", "=q1=#m1# =ds=#c6# (T1)", "", "0.17%"};
		{ 20, 16830, "", "=q4=Cenarion Bracers", "=q1=#m1# =ds=#c1# (T1)", "", "0.17%"};
		{ 21, 16850, "", "=q4=Giantstalker's Bracers", "=q1=#m1# =ds=#c2# (T1)", "", "0.18%"};
		{ 22, 16840, "", "=q4=Earthfury Bracers", "=q1=#m1# =ds=#c7# (T1)", "", "0.06%"};
		{ 23, 16861, "", "=q4=Bracers of Might", "=q1=#m1# =ds=#c9# (T1)", "", "0.16%"};
		{ 24, 16857, "", "=q4=Lawbringer Bracers", "=q1=#m1# =ds=#c4# (T1)", "", "0.11%"};
	};

	AtlasLoot_Data["MCRANDOMBOSSDROPPS"] = {
		{ 1, 18264, "", "=q3=Plans: Elemental Sharpening Stone", "=ds=#p2# (300)", "", "1.02%"};
		{ 2, 18262, "", "=q2=Elemental Sharpening Stone", "=ds=#e6#"};
		{ 4, 18292, "", "=q3=Schematic: Core Marksman Rifle", "=ds=#p5# (300)", "", "0.96%"};
		{ 5, 18282, "", "=q4=Core Marksman Rifle", "=ds=#w5#"};
		{ 7, 18291, "", "=q3=Schematic: Force Reactive Disk", "=ds=#p5# (300)", "", "0.92%"};
		{ 8, 18168, "", "=q4=Force Reactive Disk", "=ds=#w8#"};
		{ 10, 18290, "", "=q3=Schematic: Biznicks 247x128 Accurascope", "=ds=#p5# (300)", "", "0.11%"};
		{ 11, 18283, "", "=q3=Biznicks 247x128 Accurascope", "=ds=#e11#"};
		{ 13, 18259, "", "=q3=Formula: Enchant Weapon - Spell Power", "=ds=#p4# (300)", "", "0.85%"};
		{ 16, 18252, "", "=q3=Pattern: Core Armor Kit", "=ds=#p7# (300)", "", "0.85%"};
		{ 17, 18251, "", "=q3=Core Armor Kit", "=ds=#e6#"};
		{ 19, 18265, "", "=q3=Pattern: Flarecore Wraps", "=ds=#p8# (300)", "", "0.72%"};
		{ 20, 18263, "", "=q4=Flarecore Wraps", "=ds=#s8#, #a1#"};
		{ 22, 21371, "", "=q3=Pattern: Core Felcloth Bag", "=ds=#p8# (300)", "", "0.33%"};
		{ 23, 21342, "", "=q4=Core Felcloth Bag", "=ds=#m11# #e1# =q1=#m1# #c8#"};
		{ 25, 18257, "", "=q3=Recipe: Major Rejuvenation Potion", "=ds=#p1# (300)", "", "0.76%"};
		{ 26, 18253, "", "=q1=Major Rejuvenation Potion", "=ds=#e2#"};
		{ 28, 18260, "", "=q3=Formula: Enchant Weapon - Healing Power", "=ds=#p4# (300)", "", "0.75%"};
	};

		------------------------------------------
		--- Blackrock Mountain: Blackwing Lair ---
		------------------------------------------

	AtlasLoot_Data["BWLRazorgore"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59312, "", "=q4=Blackwing Armor Cache - Bracers", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 19336, "", "=q4=Arcane Infused Gem", "=ds=#e15#", "", "20.0%" };
    { 6, 19337, "", "=q4=The Black Book", "=ds=#e15#", "", "20.0%" };
    { 7, 19369, "", "=q4=Gloves of Rapid Evolution", "=ds=#a1#", "", "20.0%" };
    { 8, 19370, "", "=q4=Mantle of the Blackwing Cabal", "=ds=#a1#", "", "20.0%" };
    { 9, 19334, "", "=q4=The Untamed Blade", "=ds=#w10#", "", "10.0%" };
    { 10, 19335, "", "=q4=Spineshatter", "=ds=#w6#", "", "10.0%" };
	};

	AtlasLoot_Data["BWLVaelastrasz"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59309, "", "=q4=Blackwing Armor Cache - Belt", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 19339, "", "=q4=Mind Quickening Gem", "=ds=#e15#", "", "20.0%" };
    { 6, 19340, "", "=q4=Rune of Metamorphosis", "=ds=#e15#", "", "20.0%" };
    { 7, 19371, "", "=q4=Pendant of the Fallen Dragon", "=ds=#e15#", "", "20.0%" };
    { 8, 19372, "", "=q4=Helm of Endless Rage", "=ds=#a4#", "", "20.0%" };
    { 9, 19346, "", "=q4=Dragonfang Blade", "=ds=#w4#", "", "10.0%" };
    { 10, 19348, "", "=q4=Red Dragonscale Protector", "=ds=#e16#", "", "10.0%" };
	};

	AtlasLoot_Data["BWLLashlayer"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 20383, "", "=q4=Head of the Broodlord Lashlayer", "=ds=#m3#", "", "100%" };
    { 3, 59311, "", "=q4=Blackwing Armor Cache - Boots", "=ds=#e10#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 100002, "", "=q3=Tome: Greater Blessing of Kings", "=ds=#e2#", "", "12.0%" };
    { 8, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 9, 19341, "", "=q4=Lifegiving Gem", "=ds=#e15#", "", "20.0%" };
    { 10, 19342, "", "=q4=Venomous Totem", "=ds=#e15#", "", "20.0%" };
    { 11, 19373, "", "=q4=Black Brood Pauldrons", "=ds=#a3#", "", "20.0%" };
    { 12, 19374, "", "=q4=Bracers of Arcane Accuracy", "=ds=#a1#", "", "20.0%" };
    { 13, 19350, "", "=q4=Heartstriker", "=ds=#w2#", "", "10.0%" };
    { 14, 19351, "", "=q4=Maladath, Runed Blade of the Black Flight", "=ds=#w10#", "", "10.0%" };
	};

	AtlasLoot_Data["BWLFiremaw"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59313, "", "=q4=Blackwing Armor Cache - Gloves", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 19343, "", "=q4=Scrolls of Blinding Light", "=ds=#e15#", "", "12.5%" };
    { 6, 19344, "", "=q4=Natural Alignment Crystal", "=ds=#e15#", "", "12.5%" };
    { 7, 19365, "", "=q4=Claw of the Black Drake", "=ds=#w13#", "", "12.5%" };
    { 8, 19398, "", "=q4=Cloak of Firemaw", "=ds=#a1#", "", "12.5%" };
    { 9, 19399, "", "=q4=Black Ash Robe", "=ds=#a1#", "", "12.5%" };
    { 10, 19400, "", "=q4=Firemaw's Clutch", "=ds=#a1#", "", "12.5%" };
    { 11, 19401, "", "=q4=Primalist's Linked Legguards", "=ds=#a3#", "", "12.5%" };
    { 12, 19402, "", "=q4=Legguards of the Fallen Crusader", "=ds=#a4#", "", "12.5%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 57001, "", "=q4=Plans: Elementium Aegis", "=ds=#e2#", "", "33.3%" };
    { 18, 57204, "", "=q4=Schematic: Elementium Targeting Matrix", "=ds=#e2#", "", "33.3%" };
    { 19, 57500, "", "=q4=Design: Elementium Talisman", "=ds=#e2#", "", "33.3%" };
	};

	AtlasLoot_Data["BWLEbonroc"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59313, "", "=q4=Blackwing Armor Cache - Gloves", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 19345, "", "=q4=Aegis of Preservation", "=ds=#e15#", "", "18.0%" };
    { 6, 19403, "", "=q4=Band of Forced Concentration", "=ds=#e15#", "", "18.0%" };
    { 7, 19405, "", "=q4=Malfurion's Blessed Bulwark", "=ds=#a2#", "", "18.0%" };
    { 8, 19406, "", "=q4=Drake Fang Talisman", "=ds=#e15#", "", "18.0%" };
    { 9, 19407, "", "=q4=Ebony Flame Gloves", "=ds=#a1#", "", "18.0%" };
    { 10, 19368, "", "=q4=Dragonbreath Hand Cannon", "=ds=#w5#", "", "10.0%" };
    { 12, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 13, 57001, "", "=q4=Plans: Elementium Aegis", "=ds=#e2#", "", "33.3%" };
    { 14, 57204, "", "=q4=Schematic: Elementium Targeting Matrix", "=ds=#e2#", "", "33.3%" };
    { 15, 57500, "", "=q4=Design: Elementium Talisman", "=ds=#e2#", "", "33.3%" };
	};

	AtlasLoot_Data["BWLFlamegor"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59313, "", "=q4=Blackwing Armor Cache - Gloves", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 19430, "", "=q4=Shroud of Pure Thought", "=ds=#a1#", "", "20.0%" };
    { 6, 19431, "", "=q4=Styleen's Impeding Scarab", "=ds=#e15#", "", "20.0%" };
    { 7, 19432, "", "=q4=Circle of Applied Force", "=ds=#e15#", "", "20.0%" };
    { 8, 19433, "", "=q4=Emberweave Leggings", "=ds=#a3#", "", "20.0%" };
    { 9, 19357, "", "=q4=Herald of Woe", "=ds=#w6#", "", "10.0%" };
    { 10, 19367, "", "=q4=Dragon's Touch", "=ds=#w12#", "", "10.0%" };
    { 12, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 13, 57001, "", "=q4=Plans: Elementium Aegis", "=ds=#e2#", "", "33.3%" };
    { 14, 57204, "", "=q4=Schematic: Elementium Targeting Matrix", "=ds=#e2#", "", "33.3%" };
    { 15, 57500, "", "=q4=Design: Elementium Talisman", "=ds=#e2#", "", "33.3%" };
	};

	AtlasLoot_Data["BWLChromaggus"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 59307, "", "=q4=Blackwing Armor Cache - Shoulder", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 19385, "", "=q4=Empowered Leggings", "=ds=#a1#", "", "20.0%" };
    { 6, 19387, "", "=q4=Chromatic Boots", "=ds=#a4#", "", "20.0%" };
    { 7, 19388, "", "=q4=Angelista's Grasp", "=ds=#a1#", "", "20.0%" };
    { 8, 19389, "", "=q4=Taut Dragonhide Shoulderpads", "=ds=#a2#", "", "20.0%" };
    { 9, 19349, "", "=q4=Elementium Reinforced Bulwark", "=ds=#e16#", "", "10.0%" };
    { 10, 19352, "", "=q4=Chromatically Tempered Sword", "=ds=#w10#", "", "10.0%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 19386, "", "=q4=Elementium Threaded Cloak", "=ds=#a1#", "", "16.0%" };
    { 18, 19390, "", "=q4=Taut Dragonhide Gloves", "=ds=#a2#", "", "16.0%" };
    { 19, 19391, "", "=q4=Shimmering Geta", "=ds=#a1#", "", "16.0%" };
    { 20, 19392, "", "=q4=Girdle of the Fallen Crusader", "=ds=#a4#", "", "16.0%" };
    { 21, 19393, "", "=q4=Primalist's Linked Waistguard", "=ds=#a3#", "", "16.0%" };
    { 22, 19347, "", "=q4=Claw of Chromaggus", "=ds=#w4#", "", "10.0%" };
    { 23, 19361, "", "=q4=Ashjre'thul, Crossbow of Smiting", "=ds=#w3#", "", "10.0%" };
	};

	AtlasLoot_Data["BWLNefarian1"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19002, "", "=q4=Head of Nefarian", "=ds=#m3#", "", "100%" };
    { 3, 19003, "", "=q4=Head of Nefarian", "=ds=#m3#", "", "100%" };
    { 4, 21138, "", "=q1=Red Scepter Shard", "=ds=#m3#", "", "100%" };
    { 5, 59308, "", "=q4=Blackwing Armor Cache - Chest", "=ds=#e10#", "", "100%" };
    { 6, 58309, "", "=q3=Nefarian's Massive Sack", "=ds=#e10#", "", "100%" };
    { 8, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 9, 100002, "", "=q3=Tome: Greater Blessing of Kings", "=ds=#e2#", "", "15.0%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 19375, "", "=q4=Mish'undare, Circlet of the Mind Flayer", "=ds=#a1#", "", "20.0%" };
    { 18, 19376, "", "=q4=Archimtiros' Ring of Reckoning", "=ds=#e15#", "", "20.0%" };
    { 19, 19377, "", "=q4=Prestor's Talisman of Connivery", "=ds=#e15#", "", "20.0%" };
    { 20, 19378, "", "=q4=Cloak of the Brood Lord", "=ds=#a1#", "", "20.0%" };
    { 21, 19360, "", "=q4=Lok'amir il Romathis", "=ds=#w6#", "", "10.0%" };
    { 22, 19363, "", "=q4=Crul'shorukh, Edge of Chaos", "=ds=#w1#", "", "10.0%" };
    { 24, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 25, 19379, "", "=q4=Neltharion's Tear", "=ds=#e15#", "", "20.0%" };
    { 26, 19380, "", "=q4=Therazane's Link", "=ds=#a3#", "", "20.0%" };
    { 27, 19381, "", "=q4=Boots of the Shadow Flame", "=ds=#a2#", "", "20.0%" };
    { 28, 19382, "", "=q4=Pure Elementium Band", "=ds=#e15#", "", "20.0%" };
    { 29, 19356, "", "=q4=Staff of the Shadow Flame", "=ds=#w9#", "", "10.0%" };
    { 30, 19364, "", "=q4=Ashkandi, Greatsword of the Brotherhood", "=ds=#w10#", "", "10.0%" };
	};

	AtlasLoot_Data["BWLNefarian2"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19002, "", "=q4=Head of Nefarian", "=ds=#m3#", "", "100%" };
    { 3, 19003, "", "=q4=Head of Nefarian", "=ds=#m3#", "", "100%" };
    { 4, 21138, "", "=q1=Red Scepter Shard", "=ds=#m3#", "", "100%" };
    { 5, 59308, "", "=q4=Blackwing Armor Cache - Chest", "=ds=#e10#", "", "100%" };
    { 6, 58309, "", "=q3=Nefarian's Massive Sack", "=ds=#e10#", "", "100%" };
    { 8, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 9, 100002, "", "=q3=Tome: Greater Blessing of Kings", "=ds=#e2#", "", "15.0%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 19375, "", "=q4=Mish'undare, Circlet of the Mind Flayer", "=ds=#a1#", "", "20.0%" };
    { 18, 19376, "", "=q4=Archimtiros' Ring of Reckoning", "=ds=#e15#", "", "20.0%" };
    { 19, 19377, "", "=q4=Prestor's Talisman of Connivery", "=ds=#e15#", "", "20.0%" };
    { 20, 19378, "", "=q4=Cloak of the Brood Lord", "=ds=#a1#", "", "20.0%" };
    { 21, 19360, "", "=q4=Lok'amir il Romathis", "=ds=#w6#", "", "10.0%" };
    { 22, 19363, "", "=q4=Crul'shorukh, Edge of Chaos", "=ds=#w1#", "", "10.0%" };
    { 24, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 25, 19379, "", "=q4=Neltharion's Tear", "=ds=#e15#", "", "20.0%" };
    { 26, 19380, "", "=q4=Therazane's Link", "=ds=#a3#", "", "20.0%" };
    { 27, 19381, "", "=q4=Boots of the Shadow Flame", "=ds=#a2#", "", "20.0%" };
    { 28, 19382, "", "=q4=Pure Elementium Band", "=ds=#e15#", "", "20.0%" };
    { 29, 19356, "", "=q4=Staff of the Shadow Flame", "=ds=#w9#", "", "10.0%" };
    { 30, 19364, "", "=q4=Ashkandi, Greatsword of the Brotherhood", "=ds=#w10#", "", "10.0%" };
	};

	AtlasLoot_Data["BWLTrashMobs"] = {
		{ 1, 19436, "", "=q4=Cloak of Draconic Might", "=ds=#s4#", "", "2.53%"};
		{ 2, 19437, "", "=q4=Boots of Pure Thought", "=ds=#s12#, #a1#", "", "2.33%"};
		{ 3, 19438, "", "=q4=Ringo's Blizzard Boots", "=ds=#s12#, #a1#", "", "4.42%"};
		{ 4, 19439, "", "=q4=Interlaced Shadow Jerkin", "=ds=#s5#, #a2#", "", "4.62%"};
		{ 5, 19434, "", "=q4=Band of Dark Dominion", "=ds=#s13#", "", "1.57%"};
		{ 6, 19362, "", "=q4=Doom's Edge", "=ds=#h1#, #w1#", "", "1.67%"};
		{ 7, 19354, "", "=q4=Draconic Avenger", "=ds=#h2#, #w1#", "", "5.96%"};
		{ 8, 19358, "", "=q4=Draconic Maul", "=ds=#h2#, #w6#", "", "2.30%"};
		{ 9, 19435, "", "=q4=Essence Gatherer", "=ds=#w12#", "", "1.61%"};
		{ 16, 18562, "", "=q4=Elementium Ore", "=ds=#e8#", "", "4.75%"};
		{ 18, 21109, "", "=q1=Draconic for Dummies", "=ds=#m3#"};
		Prev = "BWLNefarian2";
	};

		-----------------------
		--- Dire Maul Books ---
		-----------------------

	AtlasLoot_Data["DMBooks"] = {
		{ 1, 18364, "", "=q3=The Emerald Dream", "=ds=#e10#, =q1=#m1# =ds=#c1#"};
		{ 2, 18361, "", "=q3=The Greatest Race of Hunters", "=ds=#e10#, =q1=#m1# =ds=#c2#"};
		{ 3, 18358, "", "=q3=The Arcanist's Cookbook", "=ds=#e10#, =q1=#m1# =ds=#c3#"};
		{ 4, 18359, "", "=q3=The Light and How to Swing It", "=ds=#e10#, =q1=#m1# =ds=#c4#"};
		{ 5, 18362, "", "=q3=Holy Bologna: What the Light Won't Tell You", "=ds=#e10#, =q1=#m1# =ds=#c5#"};
		{ 6, 18356, "", "=q3=Garona: A Study on Stealth and Treachery", "=ds=#e10#, =q1=#m1# =ds=#c6#"};
		{ 7, 18363, "", "=q3=Frost Shock and You", "=ds=#e10#, =q1=#m1# =ds=#c7#"};
		{ 8, 18360, "", "=q3=Harnessing Shadows", "=ds=#e10#, =q1=#m1# =ds=#c8#"};
		{ 9, 18357, "", "=q3=Codex of Defense", "=ds=#e10#, =q1=#m1# =ds=#c9#"};
		{ 11, 18333, "", "=q2=Libram of Focus", "=ds=#e10#"};
		{ 12, 18334, "", "=q2=Libram of Protection", "=ds=#e10#"};
		{ 13, 18332, "", "=q2=Libram of Rapidity", "=ds=#e10#"};
		{ 16, 18470, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c1#"};
		{ 17, 18473, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c2#"};
		{ 18, 18468, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c3#"};
		{ 19, 18472, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c4#"};
		{ 20, 18469, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c5#"};
		{ 21, 18465, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c6#"};
		{ 22, 18471, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c7#"};
		{ 23, 18467, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c8#"};
		{ 24, 18466, "", "=q3=Royal Seal of Eldre'Thalas", "=ds=#s14#, =q1=#m1# =ds=#c9#"};
		{ 26, 18401, "", "=q4=Foror's Compendium of Dragon Slaying", "=ds=#e10#, =q1=#m1# =ds=#c9#, #c4#"};
		{ 27, 18348, "", "=q4=Quel'Serrar", "=ds=#h3#, #w10#, =q1=#m1# =ds=#c9#, #c4#"};
	};

		----------------------
		--- Dire Maul East ---
		----------------------

	AtlasLoot_Data["DMEPusillin"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 18261, "", "=q1=Book of Incantations", "=ds=#m3#", "", "100%" };
    { 3, 18267, "", "=q2=Recipe: Runn Tum Tuber Surprise", "=ds=#e2#", "", "100%" };
	};

	AtlasLoot_Data["DMEZevrimThornhoof"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18313, "", "=q3=Helm of Awareness", "=ds=#a4#", "", "20.0%" };
    { 3, 18323, "", "=q3=Satyr's Bow", "=ds=#w2#", "", "20.0%" };
    { 4, 18319, "", "=q3=Fervent Helm", "=ds=#a3#", "", "8.00%" };
    { 5, 18306, "", "=q2=Gloves of Shadowy Mist", "=ds=#a1#", "", "" };
    { 6, 18308, "", "=q2=Clever Hat", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["DMELethtendris"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 18426, "", "=q1=Lethtendris's Web", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 18311, "", "=q3=Quel'dorei Channeling Rod", "=ds=#w9#", "", "10.0%" };
    { 6, 18301, "", "=q2=Lethtendris's Wand", "=ds=#w12#", "", "" };
    { 7, 18302, "", "=q2=Band of Vigor", "=ds=#e15#", "", "" };
    { 8, 18325, "", "=q3=Felhide Cap", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["DMEPimgib"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18354, "", "=q3=Pimgib's Collar", "=ds=#e15#", "", "14.0%" };
	};

	AtlasLoot_Data["DMEHydro"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 18299, "", "=q1=Hydrospawn Essence", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 22527, "", "=q1=Core of Elements", "=ds=#m3#", "", "63.0%" };
    { 6, 7080, "", "=q2=Essence of Water", "=ds=#e7#", "", "11.0%" };
    { 7, 18317, "", "=q3=Tempest Talisman", "=ds=#e15#", "", "20.0%" };
    { 8, 18322, "", "=q3=Waterspout Boots", "=ds=#a2#", "", "20.0%" };
    { 9, 18324, "", "=q3=Waveslicer", "=ds=#w1#", "", "10.0%" };
    { 10, 18305, "", "=q2=Breakwater Legguards", "=ds=#a4#", "", "" };
    { 11, 18307, "", "=q2=Riptide Shoes", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["DMEAlzzin"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 901716, "", "=q1=Scepter of Sylvan Corruption", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 18309, "", "=q3=Gloves of Restoration", "=ds=#a2#", "", "10.0%" };
    { 6, 18310, "", "=q3=Fiendish Machete", "=ds=#w10#", "", "10.0%" };
    { 7, 18312, "", "=q3=Energized Chestplate", "=ds=#a4#", "", "10.0%" };
    { 8, 18314, "", "=q3=Ring of Demonic Guile", "=ds=#e15#", "", "10.0%" };
    { 9, 18315, "", "=q3=Ring of Demonic Potency", "=ds=#e15#", "", "10.0%" };
    { 10, 18318, "", "=q3=Merciful Greaves", "=ds=#a3#", "", "10.0%" };
    { 11, 18321, "", "=q3=Energetic Rod", "=ds=#w6#", "", "10.0%" };
    { 12, 18326, "", "=q3=Razor Gauntlets", "=ds=#a4#", "", "10.0%" };
    { 13, 18327, "", "=q3=Whipvine Cord", "=ds=#a1#", "", "10.0%" };
    { 14, 18328, "", "=q3=Shadewood Cloak", "=ds=#a1#", "", "10.0%" };
	};

	AtlasLoot_Data["DMEIsalien"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 21984, "", "=q1=Left Piece of Lord Valthalak's Amulet", "=ds=#m3#", "", "100%" };
    { 3, 22046, "", "=q1=Right Piece of Lord Valthalak's Amulet", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 22304, "", "=q3=Ironweave Gloves", "=ds=#a1#", "", "" };
    { 7, 22314, "", "=q3=Huntsman's Harpoon", "=ds=#w7#", "", "" };
    { 8, 22315, "", "=q3=Hammer of Revitalization", "=ds=#w6#", "", "" };
    { 9, 22345, "", "=q3=Totem of Rebirth", "", "", "" };
    { 10, 22401, "", "=q3=Libram of Hope", "", "", "" };
    { 11, 22472, "", "=q3=Boots of Ferocity", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["DMETrash"] = {
		{ 1, 18295, "", "=q3=Phasing Boots", "=ds=#s12#, #a1# =q2=#m16#", "", "1.26%"};
		{ 2, 18298, "", "=q3=Unbridled Leggings", "=ds=#s11#, #a2#", "", "0.62%"};
		{ 3, 18296, "", "=q3=Marksman Bands", "=ds=#s8#, #a3#", "", "0.59%"};
		{ 4, 18289, "", "=q3=Barbed Thorn Necklace", "=ds=#s2#", "", "0.87%"};
	};

		-----------------------
		--- Dire Maul North ---
		-----------------------

	AtlasLoot_Data["DMNGuardMoldar"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18250, "", "=q2=Gordok Shackle Key", "=ds=#e10#", "", "13.0%" };
    { 3, 18493, "", "=q3=Bulky Iron Spaulders", "=ds=#a4#", "", "7.69%" };
    { 4, 18494, "", "=q3=Denwatcher's Shoulders", "=ds=#a3#", "", "7.69%" };
    { 5, 18496, "", "=q3=Heliotrope Cloak", "=ds=#a1#", "", "7.69%" };
    { 6, 18497, "", "=q3=Sublime Wristguards", "=ds=#a1#", "", "7.69%" };
    { 7, 18498, "", "=q3=Hedgecutter", "=ds=#w1#", "", "7.69%" };
	};

	AtlasLoot_Data["DMNStomperKreeg"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18425, "", "=q2=Kreeg's Mug", "=ds=#e15#", "", "40.0%" };
	};

	AtlasLoot_Data["DMNGuardFengus"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18250, "", "=q2=Gordok Shackle Key", "=ds=#e10#", "", "13.0%" };
    { 3, 18450, "", "=q2=Robe of Combustion", "=ds=#a1#", "", "" };
    { 4, 18451, "", "=q2=Hyena Hide Belt", "=ds=#a2#", "", "" };
    { 5, 18458, "", "=q2=Modest Armguards", "=ds=#a3#", "", "" };
    { 6, 18459, "", "=q2=Gallant's Wristguards", "=ds=#a4#", "", "" };
    { 7, 18460, "", "=q2=Unsophisticated Hand Cannon", "=ds=#w5#", "", "" };
    { 8, 18462, "", "=q2=Jagged Bone Fist", "=ds=#w13#", "", "" };
    { 9, 18463, "", "=q2=Ogre Pocket Knife", "=ds=#w10#", "", "" };
    { 10, 18464, "", "=q2=Gordok Nose Ring", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["DMNThimblejack"] = {
		{ 1, 18517, "", "=q4=Pattern: Chromatic Cloak", "=ds=#p7# (300)", "", "0.92%"};
		{ 2, 18518, "", "=q4=Pattern: Hide of the Wild", "=ds=#p7# (300)", "", "1.29%"};
		{ 3, 18519, "", "=q4=Pattern: Shifting Cloak", "=ds=#p7# (300)", "", "1.14%"};
		{ 4, 18414, "", "=q4=Pattern: Belt of the Archmage", "=ds=#p8# (300)", "", "1.00%"};
		{ 6, 18418, "", "=q3=Pattern: Cloak of Warding", "=ds=#p8# (300)", "", "9.75%"};
		{ 7, 18415, "", "=q3=Pattern: Felcloth Gloves", "=ds=#p8# (300)", "", "9.62%"};
		{ 8, 18416, "", "=q3=Pattern: Inferno Gloves", "=ds=#p8# (300)", "", "10.66%"};
		{ 9, 18417, "", "=q3=Pattern: Mooncloth Gloves", "=ds=#p8# (300)", "", "10.28%"};
		{ 10, 18514, "", "=q3=Pattern: Girdle of Insight", "=ds=#p7# (300)", "", "10.90%"};
		{ 11, 18515, "", "=q3=Pattern: Mongoose Boots", "=ds=#p7# (300)", "", "11.18%"};
		{ 12, 18516, "", "=q3=Pattern: Swift Flight Bracers", "=ds=#p7# (300)", "", "10.26%"};
		{ 14, 0, "INV_Box_01", "=q6=#x6#", ""};
		{ 15, 18240, "", "=q2=Ogre Tannin", "=ds=#m3#", "", "100%"};
		{ 16, 18509, "", "=q4=Chromatic Cloak", "=ds=#s4#"};
		{ 17, 18510, "", "=q4=Hide of the Wild", "=ds=#s4#"};
		{ 18, 18511, "", "=q4=Shifting Cloak", "=ds=#s4#"};
		{ 19, 18405, "", "=q4=Belt of the Archmage", "=ds=#s10#, #a1#"};
		{ 21, 18413, "", "=q3=Cloak of Warding", "=ds=#s4#"};
		{ 22, 18407, "", "=q3=Felcloth Gloves", "=ds=#s9#, #a1#"};
		{ 23, 18408, "", "=q3=Inferno Gloves", "=ds=#s9#, #a1#"};
		{ 24, 18409, "", "=q3=Mooncloth Gloves", "=ds=#s9#, #a1#"};
		{ 25, 18504, "", "=q3=Girdle of Insight", "=ds=#s10#, #a2#"};
		{ 26, 18506, "", "=q3=Mongoose Boots", "=ds=#s12#, #a2#"};
		{ 27, 18508, "", "=q3=Swift Flight Bracers", "=ds=#s8#, #a3#"};
	};

	AtlasLoot_Data["DMNGuardSlipkik"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18250, "", "=q2=Gordok Shackle Key", "=ds=#e10#", "", "13.0%" };
    { 3, 18493, "", "=q3=Bulky Iron Spaulders", "=ds=#a4#", "", "7.69%" };
    { 4, 18494, "", "=q3=Denwatcher's Shoulders", "=ds=#a3#", "", "7.69%" };
    { 5, 18496, "", "=q3=Heliotrope Cloak", "=ds=#a1#", "", "7.69%" };
    { 6, 18497, "", "=q3=Sublime Wristguards", "=ds=#a1#", "", "7.69%" };
    { 7, 18498, "", "=q3=Hedgecutter", "=ds=#w1#", "", "7.69%" };
    { 9, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 10, 18332, "", "=q2=Libram of Rapidity", "=ds=#e2#", "", "50.0%" };
    { 11, 18333, "", "=q2=Libram of Focus", "=ds=#e2#", "", "50.0%" };
	};

	AtlasLoot_Data["DMNCaptainKromcrush"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18250, "", "=q2=Gordok Shackle Key", "=ds=#e10#", "", "13.0%" };
    { 3, 18502, "", "=q3=Monstrous Glaive", "=ds=#w7#", "", "" };
    { 4, 18503, "", "=q3=Kromcrush's Chestplate", "=ds=#a4#", "", "" };
    { 5, 18505, "", "=q3=Mugger's Belt", "=ds=#a2#", "", "" };
    { 6, 18507, "", "=q3=Boots of the Full Moon", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["DMNChoRush"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18483, "", "=q3=Mana Channeling Wand", "=ds=#w12#", "", "" };
    { 3, 18484, "", "=q3=Cho'Rush's Blade", "=ds=#w10#", "", "" };
    { 4, 18485, "", "=q3=Observer's Shield", "=ds=#e16#", "", "" };
    { 5, 18490, "", "=q3=Insightful Hood", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["DMNKingGordok"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 901718, "", "=q1=Gordok's Skull Goblet", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 21982, "", "=q1=Ogre Warbeads", "=ds=#m3#", "", "80.0%" };
    { 6, 57101, "", "=q4=Formula: Nexus Shard", "=ds=#e2#", "", "10.0%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 18520, "", "=q3=Barbarous Blade", "=ds=#w10#", "", "12.5%" };
    { 18, 18521, "", "=q3=Grimy Metal Boots", "=ds=#a4#", "", "12.5%" };
    { 19, 18522, "", "=q3=Band of the Ogre King", "=ds=#e15#", "", "12.5%" };
    { 20, 18523, "", "=q3=Brightly Glowing Stone", "=ds=#e15#", "", "12.5%" };
    { 21, 18524, "", "=q3=Leggings of Destruction", "=ds=#a3#", "", "12.5%" };
    { 22, 18525, "", "=q3=Bracers of Prosperity", "=ds=#a2#", "", "12.5%" };
    { 23, 18526, "", "=q3=Crown of the Ogre King", "=ds=#a1#", "", "12.5%" };
    { 24, 18527, "", "=q3=Harmonious Gauntlets", "=ds=#a3#", "", "12.5%" };
	};

	AtlasLoot_Data["DMNTRIBUTERUN"] = {
		{ 1, 18538, "", "=q4=Treant's Bane", "=ds=#h2#, #w1#"};
		{ 3, 18495, "", "=q3=Redoubt Cloak", "=ds=#s4#"};
		{ 4, 18532, "", "=q3=Mindsurge Robe", "=ds=#s5#, #a1#"};
		{ 5, 18528, "", "=q3=Cyclone Spaulders", "=ds=#s3#, #a2#"};
		{ 6, 18530, "", "=q3=Ogre Forged Hauberk", "=ds=#s5#, #a3#"};
		{ 7, 18533, "", "=q3=Gordok Bracers of Power", "=ds=#s8#, #a4#"};
		{ 8, 18529, "", "=q3=Elemental Plate Girdle", "=ds=#s10#, #a4# =q2=#m16#"};
		{ 9, 18500, "", "=q3=Tarnished Elven Ring", "=ds=#s13#"};
		{ 10, 18537, "", "=q3=Counterattack Lodestone", "=ds=#s14#"};
		{ 11, 18531, "", "=q3=Unyielding Maul", "=ds=#h2#, #w6#"};
		{ 12, 18534, "", "=q3=Rod of the Ogre Magi", "=ds=#w9#"};
		{ 13, 18499, "", "=q3=Barrier Shield", "=ds=#w8#"};
		{ 16, 18475, "", "=q2=Oddly Magical Belt", "=ds=#s10#, #a1#"};
		{ 17, 18478, "", "=q2=Hyena Hide Jerkin", "=ds=#s5#, #a2#"};
		{ 18, 18477, "", "=q2=Shaggy Leggings", "=ds=#s11#, #a2#"};
		{ 19, 18476, "", "=q2=Mud Stained Boots", "=ds=#s12#, #a2#"};
		{ 20, 18479, "", "=q2=Carrion Scorpid Helm", "=ds=#s1#, #a3#"};
		{ 21, 18480, "", "=q2=Scarab Plate Helm", "=ds=#s1#, #a4#"};
		{ 22, 18481, "", "=q2=Skullcracking Mace", "=ds=#h2#, #w6#"};
		{ 23, 18482, "", "=q2=Ogre Toothpick Shooter", "=ds=#w2#"};
		{ 24, 18655, "", "=q2=Schematic: Major Recombobulator", "=ds=#p5# (275)"};
	};

		----------------------
		--- Dire Maul West ---
		----------------------

	AtlasLoot_Data["DMWTendrisWarpwood"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18352, "", "=q2=Petrified Bark Shield", "=ds=#e16#", "", "" };
    { 3, 18353, "", "=q2=Stoneflower Staff", "=ds=#w9#", "", "" };
    { 4, 18390, "", "=q3=Tanglemoss Leggings", "=ds=#a2#", "", "" };
    { 5, 18393, "", "=q3=Warpwood Binding", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["DMWIllyannaRavenoak"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18347, "", "=q2=Well Balanced Axe", "=ds=#w1#", "", "" };
    { 3, 18349, "", "=q2=Gauntlets of Accuracy", "=ds=#a3#", "", "" };
    { 4, 18383, "", "=q3=Force Imbued Gauntlets", "=ds=#a4#", "", "" };
    { 5, 18386, "", "=q3=Padre's Trousers", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["DMWMagisterKalendris"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22309, "", "=q2=Pattern: Big Bag of Enchantment", "=ds=#e2#", "", "15.0%" };
    { 3, 18374, "", "=q3=Flamescarred Shoulders", "=ds=#a2#", "", "20.0%" };
    { 4, 18397, "", "=q3=Elder Magus Pendant", "=ds=#e15#", "", "20.0%" };
    { 5, 18371, "", "=q3=Mindtap Talisman", "=ds=#e15#", "", "9.00%" };
    { 6, 18350, "", "=q2=Amplifying Cloak", "=ds=#a1#", "", "" };
    { 7, 18351, "", "=q2=Magically Sealed Bracers", "=ds=#a4#", "", "" };
	};
	AtlasLoot_Data["DMWTsuzee"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18345, "", "=q2=Murmuring Ring", "=ds=#e15#", "", "" };
    { 3, 18346, "", "=q2=Threadbare Trousers", "=ds=#a1#", "", "" };
    { 4, 18387, "", "=q3=Brightspark Gloves", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["DMWImmolthar"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 901717, "", "=q1=Immol'thar's Fel Essence", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 24345, "", "=q3=Book of Cower IV", "=ds=#e2#", "", "13.0%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 18370, "", "=q3=Vigilance Charm", "=ds=#e15#", "", "10.0%" };
    { 18, 18372, "", "=q3=Blade of the New Moon", "=ds=#w4#", "", "10.0%" };
    { 19, 18377, "", "=q3=Quickdraw Gloves", "=ds=#a2#", "", "10.0%" };
    { 20, 18379, "", "=q3=Odious Greaves", "=ds=#a3#", "", "10.0%" };
    { 21, 18381, "", "=q3=Evil Eye Pendant", "=ds=#e15#", "", "10.0%" };
    { 22, 18384, "", "=q3=Bile-etched Spaulders", "=ds=#a4#", "", "10.0%" };
    { 23, 18385, "", "=q3=Robe of Everlasting Night", "=ds=#a1#", "", "10.0%" };
    { 24, 18389, "", "=q3=Cloak of the Cosmos", "=ds=#a1#", "", "10.0%" };
    { 25, 18391, "", "=q3=Eyestalk Cord", "=ds=#a2#", "", "10.0%" };
    { 26, 18394, "", "=q3=Demon Howl Wristguards", "=ds=#a3#", "", "10.0%" };
	};

	AtlasLoot_Data["DMWHelnurath"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18754, "", "=q3=Fel Hardened Bracers", "=ds=#a4#", "", "" };
    { 3, 18755, "", "=q3=Xorothian Firestick", "=ds=#w5#", "", "" };
    { 4, 18756, "", "=q3=Dreadguard's Protector", "=ds=#e16#", "", "" };
    { 5, 18757, "", "=q3=Diabolic Mantle", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["DMWPrinceTortheldrin"] = {
    { 2, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 3, 18373, "", "=q3=Chestplate of Tranquility", "=ds=#a2#", "", "10.0%" };
    { 4, 18375, "", "=q3=Bracers of the Eclipse", "=ds=#a2#", "", "10.0%" };
    { 5, 18376, "", "=q3=Timeworn Mace", "=ds=#w6#", "", "10.0%" };
    { 6, 18378, "", "=q3=Silvermoon Leggings", "=ds=#a3#", "", "10.0%" };
    { 7, 18380, "", "=q3=Eldritch Reinforced Legplates", "=ds=#a4#", "", "10.0%" };
    { 8, 18382, "", "=q3=Fluctuating Cloak", "=ds=#a1#", "", "10.0%" };
    { 9, 18388, "", "=q3=Stoneshatter", "=ds=#w3#", "", "10.0%" };
    { 10, 18392, "", "=q3=Distracting Dagger", "=ds=#w4#", "", "10.0%" };
    { 11, 18395, "", "=q3=Emerald Flame Ring", "=ds=#e15#", "", "10.0%" };
    { 12, 18396, "", "=q3=Mind Carver", "=ds=#w10#", "", "10.0%" };
	};

	AtlasLoot_Data["DMWShendralarProvisioner"] = {
		{ 1, 18487, "", "=q1=Pattern: Mooncloth Robe", "=ds=#p8# (300)"};
	};

	AtlasLoot_Data["DMWTrash"] = {
		{ 1, 18344, "", "=q3=Stonebark Gauntlets", "=ds=#s9#, #a2#", "", "0.47%"};
		{ 2, 18340, "", "=q3=Eidolon Talisman", "=ds=#s2#", "", "0.58%"};
		{ 3, 18338, "", "=q3=Wand of Arcane Potency", "=ds=#w12#", "", "0.78%"};
	};

		------------------
		--- Gnomeregan ---
		------------------

	AtlasLoot_Data["Gnomeregan1"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Techbot"], "" };
    { 2, 9277, "", "=q1=Techbot's Memory Core", "=ds=#m3#", "", "100%" };
    { 3, 9309, "", "=q1=Robo-mechanical Guts", "=ds=#m3#", "", "100%" };
    { 4, 9444, "", "=q2=Techbot CPU Shell", "=ds=#e16#", "", "69.2%" };
    { 6, 0, "INV_Box_01", "=q6="..BabbleBoss["Grubbis"], "" };
    { 7, 9445, "", "=q3=Grubbis Paws", "=ds=#a3#", "", "10.0%" };
    { 9, 0, "INV_Box_01", "=q6="..BabbleBoss["Viscous Fallout"], "" };
    { 10, 57457, "", "=q2=Technique: Scroll of Fire Resistance III", "=ds=#e2#", "", "15.0%" };
    { 12, 9452, "", "=q3=Hydrocane", "=ds=#w9#", "", "33.3%" };
    { 13, 9453, "", "=q3=Toxic Revenger", "=ds=#w4#", "", "33.3%" };
    { 14, 9454, "", "=q3=Acidic Walkers", "=ds=#a1#", "", "33.3%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Electrocutioner 6000"], "" };
    { 17, 9446, "", "=q3=Electrocutioner Leg", "=ds=#w10#", "", "33.3%" };
    { 18, 9447, "", "=q3=Electrocutioner Lagnut", "=ds=#e15#", "", "33.3%" };
    { 19, 9448, "", "=q2=Spidertank Oilrag", "=ds=#a1#", "", "33.3%" };
    { 21, 0, "INV_Box_01", "=q6="..BabbleBoss["Crowd Pummeler 9-60"], "" };
    { 22, 11827, "", "=q2=Schematic: Lil' Smoky", "=ds=#e2#", "", "50.0%" };
    { 24, 9450, "", "=q2=Gnomebot Operating Boots", "=ds=#a2#", "", "60.0%" };
    { 25, 9449, "", "=q3=Manual Crowd Pummeler", "=ds=#w6#", "", "40.0%" };
    { 27, 0, "INV_Box_01", "=q6="..BabbleBoss["Dark Iron Ambassador"], "" };
    { 28, 9455, "", "=q3=Emissary Cuffs", "=ds=#a2#", "", "33.3%" };
    { 29, 9456, "", "=q3=Glass Shooter", "=ds=#w5#", "", "33.3%" };
    { 30, 9457, "", "=q3=Royal Diplomatic Scepter", "=ds=#w6#", "", "33.3%" };
	};

	AtlasLoot_Data["Gnomeregan2"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Mekgineer Thermaplugg"], "" };
    { 2, 901708, "", "=q1=Plugg Nuts", "=ds=#m3#", "", "100%" };
    { 4, 9459, "", "=q3=Thermaplugg's Left Arm", "=ds=#w1#", "", "20.0%" };
    { 5, 9492, "", "=q3=Electromagnetic Gigaflux Reactivator", "=ds=#a1#", "", "20.0%" };
    { 6, 9458, "", "=q3=Thermaplugg's Central Core", "=ds=#e16#", "", "50.0%" };
    { 7, 9461, "", "=q3=Charged Gear", "=ds=#e15#", "", "50.0%" };
    { 9, 11828, "", "=q2=Schematic: Pet Bombling", "=ds=#e2#", "", "90.0%" };
	};

		----------------
		--- Maraudon ---
		----------------
		
	AtlasLoot_Data["Maraudon1"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Noxxion"], "" };
    { 2, 17702, "", "=q1=Celebrian Rod", "=ds=#m3#", "", "100%" };
    { 3, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 5, 17745, "", "=q3=Noxious Shooter", "=ds=#w12#", "", "20.0%" };
    { 6, 17744, "", "=q3=Heart of Noxxion", "=ds=#e15#", "", "50.0%" };
    { 7, 17746, "", "=q3=Noxxion's Shackles", "=ds=#a4#", "", "50.0%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Razorlash"], "" };
    { 17, 901700, "", "=q1=Razor Petal", "=ds=#m3#", "", "100%" };
    { 18, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 19, 22529, "", "=q1=Savage Frond", "=ds=#m3#", "", "54.0%" };
    { 21, 17748, "", "=q3=Vinerot Sandals", "=ds=#a1#", "", "25.0%" };
    { 22, 17749, "", "=q3=Phytoskin Spaulders", "=ds=#a2#", "", "25.0%" };
    { 23, 17750, "", "=q2=Chloromesh Girdle", "=ds=#a1#", "", "25.0%" };
    { 24, 17751, "", "=q2=Brusslehide Leggings", "=ds=#a2#", "", "25.0%" };
    { 26, 0, "INV_Box_01", "=q6="..BabbleBoss["Lord Vyletongue"], "" };
    { 27, 17703, "", "=q1=Celebrian Diamond", "=ds=#m3#", "", "100%" };
    { 28, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 30, 17752, "", "=q3=Satyr's Lash", "=ds=#w4#", "", "33.3%" };
    { 31, 17754, "", "=q3=Infernal Trickster Leggings", "=ds=#a3#", "", "33.3%" };
    { 32, 17755, "", "=q3=Satyrmane Sash", "=ds=#a1#", "", "33.3%" };
    { 34, 0, "INV_Box_01", "=q6="..BabbleBoss["Meshlok the Harvester"], "" };
    { 35, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 37, 17741, "", "=q3=Nature's Embrace", "=ds=#a1#", "", "33.3%" };
    { 38, 17742, "", "=q3=Fungus Shroud Armor", "=ds=#a2#", "", "33.3%" };
    { 39, 17767, "", "=q3=Bloomsprout Headpiece", "=ds=#a3#", "", "33.3%" };
    { 41, 0, "INV_Box_01", "=q6="..BabbleBoss["Celebras the Cursed"], "" };
    { 42, 901701, "", "=q1=Carved Horn of Remulos", "=ds=#m3#", "", "100%" };
    { 43, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 44, 57478, "", "=q2=Technique: Scroll of Nature Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 46, 17738, "", "=q3=Claw of Celebras", "=ds=#w13#", "", "33.3%" };
    { 47, 17739, "", "=q3=Grovekeeper's Drape", "=ds=#a1#", "", "33.3%" };
    { 48, 17740, "", "=q3=Soothsayer's Headdress", "=ds=#a2#", "", "33.3%" };
	};
	
	AtlasLoot_Data["Maraudon2"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Landslide"], "" };
    { 2, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 4, 17734, "", "=q3=Helm of the Mountain", "=ds=#a4#", "", "25.0%" };
    { 5, 17736, "", "=q3=Rockgrip Gauntlets", "=ds=#a3#", "", "25.0%" };
    { 6, 17737, "", "=q3=Cloud Stone", "=ds=#e15#", "", "25.0%" };
    { 7, 17943, "", "=q3=Fist of Stone", "=ds=#w6#", "", "25.0%" };
    { 9, 0, "INV_Box_01", "=q6="..BabbleBoss["Tinkerer Gizlock"], "" };
    { 10, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 12, 17717, "", "=q3=Megashot Rifle", "=ds=#w5#", "", "33.3%" };
    { 13, 17718, "", "=q3=Gizlock's Hypertech Buckler", "=ds=#e16#", "", "33.3%" };
    { 14, 17719, "", "=q3=Inventor's Focal Sword", "=ds=#w10#", "", "33.3%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Rotgrip"], "" };
    { 17, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 19, 17730, "", "=q3=Gatorbite Axe", "=ds=#w1#", "", "20.0%" };
    { 20, 17728, "", "=q3=Albino Crocscale Boots", "=ds=#a2#", "", "50.0%" };
    { 21, 17732, "", "=q3=Rotgrip Mantle", "=ds=#a1#", "", "50.0%" };
    { 23, 0, "INV_Box_01", "=q6="..BabbleBoss["Princess Theradras"], "" };
    { 24, 901723, "", "=q1=Face of Theradras", "=ds=#m3#", "", "100%" };
    { 25, 17684, "", "=q1=Theradric Crystal Carving", "=ds=#m3#", "", "80.0%" };
    { 26, 57478, "", "=q2=Technique: Scroll of Nature Resistance IV", "=ds=#e2#", "", "15.0%" };
	};

		----------------------
		--- Ragefire Chasm ---
		----------------------

	AtlasLoot_Data["RagefireChasm"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Taragaman the Hungerer"], "" };
    { 2, 14540, "", "=q1=Taragaman the Hungerer's Heart", "=ds=#m3#", "", "100%" };
    { 3, 57456, "", "=q2=Technique: Scroll of Fire Resistance II", "=ds=#e2#", "", "15.0%" };
    { 5, 14148, "", "=q2=Crystalline Cuffs", "=ds=#a1#", "", "40.0%" };
    { 6, 14149, "", "=q2=Subterranean Cape", "=ds=#a1#", "", "40.0%" };
    { 7, 14145, "", "=q2=Cursed Felblade", "=ds=#w10#", "", "20.0%" };
    { 9, 0, "INV_Box_01", "=q6="..BabbleBoss["Jergosh the Invoker"], "" };
    { 10, 901707, "", "=q1=Searing Stone", "=ds=#m3#", "", "100%" };
    { 11, 57456, "", "=q2=Technique: Scroll of Fire Resistance II", "=ds=#e2#", "", "15.0%" };
    { 13, 14147, "", "=q2=Cavedweller Bracers", "=ds=#a3#", "", "40.0%" };
    { 14, 14150, "", "=q2=Robe of Evocation", "=ds=#a1#", "", "40.0%" };
    { 15, 14151, "", "=q2=Chanting Blade", "=ds=#w4#", "", "20.0%" };
	};

		----------------------
		--- Razorfen Downs ---
		----------------------
		
	AtlasLoot_Data["RazorfenDowns1"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Tuten'kash"], "" };
    { 2, 57472, "", "=q2=Technique: Scroll of Shadow Resistance III", "=ds=#e2#", "", "15.0%" };
    { 4, 10775, "", "=q3=Carapace of Tuten'kash", "=ds=#a4#", "", "33.3%" };
    { 5, 10776, "", "=q3=Silky Spider Cape", "=ds=#a1#", "", "33.3%" };
    { 6, 10777, "", "=q3=Arachnid Gloves", "=ds=#a2#", "", "33.3%" };
    { 8, 0, "INV_Box_01", "=q6="..BabbleBoss["Mordresh Fire Eye"], "" };
    { 9, 57472, "", "=q2=Technique: Scroll of Shadow Resistance III", "=ds=#e2#", "", "15.0%" };
    { 11, 10769, "", "=q3=Glowing Eye of Mordresh", "=ds=#e15#", "", "33.3%" };
    { 12, 10770, "", "=q3=Mordresh's Lifeless Skull", "=ds=#e15#", "", "33.3%" };
    { 13, 10771, "", "=q3=Deathmage Sash", "=ds=#a1#", "", "33.3%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Glutton"], "" };
    { 17, 10772, "", "=q2=Glutton's Cleaver", "=ds=#w1#", "", "50.0%" };
    { 18, 10774, "", "=q3=Fleshhide Shoulders", "=ds=#a2#", "", "50.0%" };
    { 20, 0, "INV_Box_01", "=q6="..BabbleBoss["Ragglesnout"], "" };
    { 21, 10758, "", "=q3=X'caliboar", "=ds=#w10#", "", "20.0%" };
    { 22, 10767, "", "=q3=Savage Boar's Guard", "=ds=#e16#", "", "50.0%" };
    { 23, 10768, "", "=q3=Boar Champion's Belt", "=ds=#a3#", "", "50.0%" };
	};

	AtlasLoot_Data["RazorfenDowns2"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Amnennar the Coldbringer"], "" };
    { 2, 10420, "", "=q1=Skull of the Coldbringer", "=ds=#m3#", "", "100%" };
    { 3, 901705, "", "=q1=Frozen Bone", "=ds=#m3#", "", "100%" };
    { 4, 57462, "", "=q2=Technique: Scroll of Frost Resistance III", "=ds=#e2#", "", "20.0%" };
    { 6, 10761, "", "=q3=Coldrage Dagger", "=ds=#w4#", "", "20.0%" };
    { 7, 10762, "", "=q3=Robes of the Lich", "=ds=#a1#", "", "20.0%" };
    { 8, 10763, "", "=q3=Icemetal Barbute", "=ds=#a4#", "", "20.0%" };
    { 9, 10764, "", "=q3=Deathchill Armor", "=ds=#a3#", "", "20.0%" };
    { 10, 10765, "", "=q2=Bonefingers", "=ds=#a2#", "", "20.0%" };
    { 12, 0, "INV_Box_01", "=q6="..BabbleBoss["Plaguemaw the Rotting"], "" };
    { 13, 10760, "", "=q2=Swine Fists", "=ds=#a2#", "", "60.0%" };
    { 14, 10766, "", "=q3=Plaguerot Sprig", "=ds=#w12#", "", "40.0%" };
	};

		----------------------
		--- Razorfen Kraul ---
		----------------------
		
	AtlasLoot_Data["RazorfenKraul1"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Death Speaker Jargba"], "" };
    { 2, 6682, "", "=q2=Death Speaker Robes", "=ds=#a1#", "", "40.0%" };
    { 3, 6685, "", "=q2=Death Speaker Mantle", "=ds=#a1#", "", "40.0%" };
    { 4, 2816, "", "=q3=Death Speaker Scepter", "=ds=#w6#", "", "20.0%" };
    { 6, 0, "INV_Box_01", "=q6="..BabbleBoss["Overlord Ramtusk"], "" };
    { 7, 57477, "", "=q2=Technique: Scroll of Nature Resistance III", "=ds=#e2#", "", "15.0%" };
    { 9, 6686, "", "=q2=Tusken Helm", "=ds=#a3#", "", "60.0%" };
    { 10, 6687, "", "=q3=Corpsemaker", "=ds=#w1#", "", "40.0%" };
    { 12, 0, "INV_Box_01", "=q6="..BabbleBoss["Agathelos the Raging"], "" };
    { 13, 6690, "", "=q2=Ferine Leggings", "=ds=#a2#", "", "60.0%" };
    { 14, 6691, "", "=q3=Swinetusk Shank", "=ds=#w4#", "", "40.0%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Blind Hunter"], "" };
    { 17, 6695, "", "=q3=Stygian Bone Amulet", "=ds=#e15#", "", "33.3%" };
    { 18, 6696, "", "=q3=Nightstalker Bow", "=ds=#w2#", "", "33.3%" };
    { 19, 6697, "", "=q3=Batwing Mantle", "=ds=#a1#", "", "33.3%" };
	};
	
	AtlasLoot_Data["RazorfenKraul2"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Charlga Razorflank"], "" };
    { 2, 5792, "", "=q1=Razorflank's Medallion", "=ds=#m3#", "", "100%" };
    { 3, 5793, "", "=q1=Razorflank's Heart", "=ds=#m3#", "", "100%" };
    { 4, 901704, "", "=q1=Gauntlets of Growth", "=ds=#m3#", "", "100%" };
    { 5, 57477, "", "=q2=Technique: Scroll of Nature Resistance III", "=ds=#e2#", "", "15.0%" };
    { 7, 6693, "", "=q3=Agamaggan's Clutch", "=ds=#e15#", "", "40.0%" };
    { 8, 6694, "", "=q3=Heart of Agamaggan", "=ds=#e16#", "", "40.0%" };
    { 9, 6692, "", "=q3=Pronged Reaver", "=ds=#w1#", "", "20.0%" };
    { 11, 0, "INV_Box_01", "=q6="..BabbleBoss["Earthcaller Halmgar"], "" };
    { 12, 6688, "", "=q2=Whisperwind Headdress", "=ds=#a2#", "", "50.0%" };
    { 13, 6689, "", "=q3=Wind Spirit Staff", "=ds=#w9#", "", "50.0%" };
	};

		-------------------------
		--- Scarlet Monastery ---
		-------------------------

	AtlasLoot_Data["SMHerod"] = {
		{ 1, 7719, "", "=q3=Raging Berserker's Helm", "=ds=#s1#, #a3#", "", "30.62%"};
		{ 2, 7718, "", "=q3=Herod's Shoulder", "=ds=#s3#, #a3#", "", "30.82%"};
		{ 3, 10330, "", "=q3=Scarlet Leggings", "=ds=#s11#, #a3#", "", "12.75%"};
		{ 4, 7717, "", "=q3=Ravager", "=ds=#h2#, #w1#", "", "12.86%"};
		{ 6, 0, "INV_Box_01", "=q6=#n43#", ""};
		{ 7, 23192, "", "=q2=Tabard of the Scarlet Crusade", "=ds=#s7#", "", "0.4%"};
	};

	AtlasLoot_Data["SMCathedral"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["High Inquisitor Fairbanks"], "" };
    { 2, 19507, "", "=q2=Inquisitor's Shawl", "=ds=#a1#", "", "33.3%" };
    { 3, 19508, "", "=q2=Branded Leather Bracers", "=ds=#a2#", "", "33.3%" };
    { 4, 19509, "", "=q2=Dusty Mail Boots", "=ds=#a3#", "", "33.3%" };
    { 6, 0, "INV_Box_01", "=q6="..BabbleBoss["Scarlet Commander Mograine"], "" };
    { 7, 57482, "", "=q2=Technique: Scroll of Holy Resistance III", "=ds=#e2#", "", "15.0%" };
    { 9, 7726, "", "=q3=Aegis of the Scarlet Commander", "=ds=#e16#", "", "40.0%" };
    { 10, 7723, "", "=q3=Mograine's Might", "=ds=#w6#", "", "33.3%" };
    { 11, 7724, "", "=q3=Gauntlets of Divinity", "=ds=#a3#", "", "33.3%" };
    { 12, 10330, "", "=q3=Scarlet Leggings", "=ds=#a3#", "", "33.3%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["High Inquisitor Whitemane"], "" };
    { 17, 901722, "", "=q1=Whitemane's Prayer Book", "=ds=#m3#", "", "100%" };
    { 18, 57482, "", "=q2=Technique: Scroll of Holy Resistance III", "=ds=#e2#", "", "15.0%" };
    { 19, 20976, "", "=q2=Design: Citrine Pendant of Golden Healing", "=ds=#e2#", "", "10.0%" };
    { 21, 7721, "", "=q3=Hand of Righteousness", "=ds=#w6#", "", "20.0%" };
    { 22, 7720, "", "=q3=Whitemane's Chapeau", "=ds=#a1#", "", "50.0%" };
    { 23, 7722, "", "=q3=Triune Amulet", "=ds=#e15#", "", "50.0%" };
	};

	AtlasLoot_Data["SMGraveyard"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Interrogator Vishas"], "" };
    { 2, 7682, "", "=q3=Torturing Poker", "=ds=#w4#", "", "10.0%" };
    { 4, 0, "INV_Box_01", "=q6="..BabbleBoss["Bloodmage Thalnos"], "" };
    { 5, 901710, "", "=q1=Bloodfire Amulet", "=ds=#m3#", "", "100%" };
    { 7, 7684, "", "=q2=Bloodmage Mantle", "=ds=#a1#", "", "50.0%" };
    { 8, 7685, "", "=q3=Orb of the Forgotten Seer", "=ds=#e15#", "", "50.0%" };
    { 10, 0, "INV_Box_01", "=q6="..BabbleBoss["Ironspine"], "" };
    { 11, 7686, "", "=q3=Ironspine's Eye", "=ds=#e15#", "", "33.3%" };
    { 12, 7687, "", "=q3=Ironspine's Fist", "=ds=#w6#", "", "33.3%" };
    { 13, 7688, "", "=q3=Ironspine's Ribcage", "=ds=#a3#", "", "33.3%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Azshir the Sleepless"], "" };
    { 17, 7708, "", "=q3=Necrotic Wand", "=ds=#w12#", "", "33.3%" };
    { 18, 7709, "", "=q3=Blighted Leggings", "=ds=#a1#", "", "33.3%" };
    { 19, 7731, "", "=q3=Ghostshard Talisman", "=ds=#e15#", "", "33.3%" };
    { 21, 0, "INV_Box_01", "=q6="..BabbleBoss["Fallen Champion"], "" };
    { 22, 7689, "", "=q3=Morbid Dawn", "=ds=#w10#", "", "33.3%" };
    { 23, 7690, "", "=q3=Ebon Vise", "=ds=#a2#", "", "33.3%" };
    { 24, 7691, "", "=q3=Embalmed Shroud", "=ds=#a1#", "", "33.3%" };
	};

	AtlasLoot_Data["SMLibrary"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Houndmaster Loksey"], "" };
    { 2, 7756, "", "=q2=Dog Training Gloves", "=ds=#a2#", "", "60.0%" };
    { 3, 3456, "", "=q2=Dog Whistle", "=ds=#e0#", "", "30.0%" };
    { 4, 7710, "", "=q3=Loksey's Training Stick", "=ds=#w9#", "", "10.0%" };
    { 6, 0, "INV_Box_01", "=q6="..BabbleBoss["Arcanist Doan"], "" };
    { 7, 901723, "", "=q1=Face of Theradras", "=ds=#m3#", "", "100%" };
    { 8, 57467, "", "=q2=Technique: Scroll of Arcane Resistance III", "=ds=#e2#", "", "15.0%" };
    { 10, 34227, "", "=q4=Deadman's Hand", "=ds=#e15#", "", "4.00%" };
    { 11, 7711, "", "=q2=Robe of Doan", "=ds=#a1#", "", "25.0%" };
    { 12, 7712, "", "=q2=Mantle of Doan", "=ds=#a1#", "", "25.0%" };
    { 13, 7713, "", "=q3=Illusionary Rod", "=ds=#w9#", "", "25.0%" };
    { 14, 7714, "", "=q3=Hypnotic Blade", "=ds=#w4#", "", "25.0%" };
	};

	AtlasLoot_Data["SMTrash"] = {
		{ 1, 7728, "", "=q3=Beguiler Robes", "=ds=#s5#, #a1#", "", "0.01%"};
		{ 2, 7755, "", "=q3=Flintrock Shoulders", "=ds=#s3#, #a2#", "", "0.00%"};
		{ 3, 7727, "", "=q3=Watchman Pauldrons", "=ds=#s3#, #a2#", "", "0.01%"};
		{ 4, 7760, "", "=q3=Warchief Kilt", "=ds=#s11#, #a2#", "", "0.00%"};
		{ 5, 7754, "", "=q3=Harbinger Boots", "=ds=#s12#, #a2#", "", "0.01%"};
		{ 6, 5819, "", "=q3=Sunblaze Coif", "=ds=#s1#, #a3#", "", "0.01%"};
		{ 7, 7759, "", "=q3=Archon Chestpiece", "=ds=#s5#, #a3#", "", "0.00%"};
		{ 8, 10328, "", "=q3=Scarlet Chestpiece", "=ds=#s5#, #a3#", "", "0.3%"};
		{ 9, 10332, "", "=q3=Scarlet Boots", "=ds=#s12#, #a3#", "", "0.1%"};
		{ 10, 2262, "", "=q3=Mark of Kern", "=ds=#s13#", "", "0.01%"};
		{ 11, 1992, "", "=q3=Swampchill Fetish", "=ds=#s15#", "", "0.00%"};
		{ 13, 10333, "", "=q2=Scarlet Wristguards", "=ds=#s8#, #a3#", "", "1.6%"};
		{ 14, 10331, "", "=q2=Scarlet Gauntlets", "=ds=#s9#, #a3#", "", "1.7%"};
		{ 15, 10329, "", "=q2=Scarlet Belt", "=ds=#s10#, #a3#", "", "1.6%"};
		{ 16, 5756, "", "=q3=Sliverblade", "=ds=#h1#, #w4#", "", "0.01%"};
		{ 17, 8225, "", "=q3=Tainted Pierce", "=ds=#h1#, #w10#", "", "0.01%"};
		{ 18, 8226, "", "=q3=The Butcher", "=ds=#h1#, #w10#", "", "0.01%"};
		{ 19, 7786, "", "=q3=Headsplitter", "=ds=#h1#, #w1#", "", "0.01%"};
		{ 20, 7761, "", "=q3=Steelclaw Reaver", "=ds=#h1#, #w1#", "", "0.01%"};
		{ 21, 7753, "", "=q3=Bloodspiller", "=ds=#h2#, #w1#", "", "0.01%"};
		{ 22, 7752, "", "=q3=Dreamslayer", "=ds=#h1#, #w6#", "", "0.01%"};
		{ 23, 7736, "", "=q3=Fight Club", "=ds=#h1#, #w6#", "", "0.00%"};
		{ 24, 7730, "", "=q3=Cobalt Crusher", "=ds=#h2#, #w6#", "", "0.01%"};
		{ 25, 7758, "", "=q3=Ruthless Shiv", "=ds=#w7#", "", "0.00%"};
		{ 26, 7757, "", "=q3=Windweaver Staff", "=ds=#w9#", "", "0.01%"};
		{ 27, 7787, "", "=q3=Resplendent Guardian", "=ds=#w8#", "", "0.01%"};
		{ 28, 7729, "", "=q3=Chesterfall Musket", "=ds=#w5#", "", "0.01%"};
	};

	AtlasLoot_Data["SCHOLOGandling"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 3, 901726, "", "=q1=Gandling's Plague Formula", "=ds=#m3#", "", "100%" };
    { 4, 59000, "", "=q3=Gandling's Armor Cache - Helm", "=ds=#e10#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 17, 57473, "", "=q2=Technique: Scroll of Shadow Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 18, 13501, "", "=q2=Recipe: Major Mana Potion", "=ds=#e2#", "", "10.0%" };
    { 19, 14514, "", "=q4=Pattern: Robe of the Void", "=ds=#e2#", "", "7.00%" };
    { 20, 13937, "", "=q4=Headmaster's Charge", "=ds=#w9#", "", "2.00%" };
    { 21, 13398, "", "=q3=Boots of the Shrieker", "=ds=#a2#", "", "" };
    { 22, 13938, "", "=q3=Bonecreeper Stylus", "=ds=#w12#", "", "" };
    { 23, 13944, "", "=q3=Tombstone Breastplate", "=ds=#a2#", "", "" };
    { 24, 13951, "", "=q3=Vigorsteel Vambraces", "=ds=#a4#", "", "" };
    { 25, 13953, "", "=q3=Silent Fang", "=ds=#w10#", "", "" };
    { 26, 13964, "", "=q3=Witchblade", "=ds=#w4#", "", "" };
    { 27, 22433, "", "=q3=Don Mauricio's Band of Domination", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["SCHOLOBloodStewardofKirtonos"] = {
		{ 1, 13523, "", "=q1=Blood of Innocents", "=ds=#m3#", "", "100%"};
	};

	AtlasLoot_Data["SCHOLOKirtonostheHerald"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 13955, "", "=q3=Stoneform Shoulders", "=ds=#a4#", "", "" };
    { 6, 13956, "", "=q3=Clutch of Andros", "=ds=#a1#", "", "" };
    { 7, 13957, "", "=q3=Gargoyle Slashers", "=ds=#a2#", "", "" };
    { 8, 13960, "", "=q3=Heart of the Fiend", "=ds=#e15#", "", "" };
    { 9, 13967, "", "=q3=Windreaver Greaves", "=ds=#a3#", "", "" };
    { 10, 13969, "", "=q3=Loomguard Armbraces", "=ds=#a3#", "", "" };
    { 11, 13983, "", "=q3=Gravestone War Axe", "=ds=#w1#", "", "" };
    { 12, 14024, "", "=q3=Frightalon", "=ds=#w4#", "", "" };
    { 13, 16734, "", "=q3=Boots of Valor", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["SCHOLOJandiceBarov"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 3, 13523, "", "=q1=Blood of Innocents", "=ds=#m3#", "", "100%" };
    { 4, 13725, "", "=q1=Krastinov's Bag of Horrors", "=ds=#m3#", "", "100%" };
    { 6, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 7, 16701, "", "=q3=Dreadmist Mantle", "=ds=#a1#", "", "17.0%" };
    { 8, 14541, "", "=q3=Barovian Family Sword", "=ds=#w10#", "", "" };
    { 9, 14545, "", "=q3=Ghostloom Leggings", "=ds=#a2#", "", "" };
    { 10, 14548, "", "=q3=Royal Cap Spaulders", "=ds=#a3#", "", "" };
    { 11, 18689, "", "=q3=Phantasmal Cloak", "=ds=#a1#", "", "" };
    { 12, 18690, "", "=q3=Wraithplate Leggings", "=ds=#a4#", "", "" };
    { 13, 22394, "", "=q3=Staff of Metanoia", "=ds=#w9#", "", "" };
	};

	AtlasLoot_Data["SCHOLORattlegore"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 57473, "", "=q2=Technique: Scroll of Shadow Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 3, 16711, "", "=q3=Shadowcraft Boots", "=ds=#a2#", "", "16.0%" };
    { 4, 14528, "", "=q3=Rattlecage Buckler", "=ds=#e16#", "", "" };
    { 5, 14531, "", "=q3=Frightskull Shaft", "=ds=#w6#", "", "" };
    { 6, 14537, "", "=q3=Corpselight Greaves", "=ds=#a4#", "", "" };
    { 7, 14538, "", "=q3=Deadwalker Mantle", "=ds=#a1#", "", "" };
    { 8, 14539, "", "=q3=Bone Ring Helm", "=ds=#a2#", "", "" };
    { 9, 18686, "", "=q3=Bone Golem Shoulders", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["SCHOLODeathKnight"] = {
		{ 1, 18760, "", "=q3=Necromantic Band", "=ds=#s13#", "", "24.75%"};
		{ 2, 18758, "", "=q3=Specter's Blade", "=ds=#h1#, #w4#", "", "15.72%"};
		{ 3, 18759, "", "=q3=Malicious Axe", "=ds=#h2#, #w1#", "", "24.75%"};
		{ 4, 18761, "", "=q3=Oblivion's Touch", "=ds=#w12#", "", "17.17%"};
		{ 6, 18749, "", "=q1=Charger's Lost Soul", "=ds=#m3#", "", "10.93%"};
	};

	AtlasLoot_Data["SCHOLOVectus"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 22526, "", "=q1=Bone Fragments", "=ds=#m3#", "", "50.0%" };
    { 6, 14577, "", "=q3=Skullsmoke Pants", "=ds=#a1#", "", "7.00%" };
    { 7, 18691, "", "=q3=Dark Advisor's Pendant", "=ds=#e15#", "", "7.00%" };
	};

	AtlasLoot_Data["SCHOLOMarduk"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 14576, "", "=q3=Ebon Hilt of Marduk", "=ds=#w10#", "", "8.00%" };
    { 6, 18692, "", "=q3=Death Knight Sabatons", "=ds=#a4#", "", "5.00%" };
	};

	AtlasLoot_Data["SCHOLORasFrostwhisper"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 3, 13626, "", "=q1=Human Head of Ras Frostwhisper", "=ds=#m3#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 13952, "", "=q3=Iceblade Hacker", "=ds=#w1#", "", "8.30%" };
    { 18, 14340, "", "=q3=Freezing Lich Robes", "=ds=#a1#", "", "8.30%" };
    { 19, 14487, "", "=q3=Bonechill Hammer", "=ds=#w6#", "", "8.30%" };
    { 20, 14502, "", "=q3=Frostbite Girdle", "=ds=#a2#", "", "8.30%" };
    { 21, 14503, "", "=q3=Death's Clutch", "=ds=#a2#", "", "8.30%" };
    { 22, 14522, "", "=q3=Maelstrom Leggings", "=ds=#a3#", "", "8.30%" };
    { 23, 14525, "", "=q3=Boneclenched Gauntlets", "=ds=#a4#", "", "8.30%" };
    { 24, 16689, "", "=q3=Magister's Mantle", "=ds=#a1#", "", "8.30%" };
    { 25, 18693, "", "=q3=Shivery Handwraps", "=ds=#a1#", "", "8.30%" };
    { 26, 18694, "", "=q3=Shadowy Mail Greaves", "=ds=#a3#", "", "8.30%" };
    { 27, 18695, "", "=q3=Spellbound Tome", "=ds=#e15#", "", "8.30%" };
    { 28, 18696, "", "=q3=Intricately Runed Shield", "=ds=#e16#", "", "8.30%" };
	};

	AtlasLoot_Data["SCHOLOKormok"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 21984, "", "=q1=Left Piece of Lord Valthalak's Amulet", "=ds=#m3#", "", "100%" };
    { 3, 22046, "", "=q1=Right Piece of Lord Valthalak's Amulet", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 22303, "", "=q3=Ironweave Pants", "=ds=#a1#", "", "" };
    { 7, 22326, "", "=q3=Amalgam's Band", "=ds=#e15#", "", "" };
    { 8, 22331, "", "=q3=Band of the Steadfast Hero", "=ds=#e15#", "", "" };
    { 9, 22332, "", "=q3=Blade of Necromancy", "=ds=#w10#", "", "" };
    { 10, 22333, "", "=q3=Hammer of Divine Might", "=ds=#w6#", "", "" };
	};

	AtlasLoot_Data["SCHOLOInstructorMalicia"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 20520, "", "=q2=Dark Rune", "=ds=#e7#", "", "44.0%" };
    { 6, 16710, "", "=q3=Shadowcraft Bracers", "=ds=#a2#", "", "5.00%" };
	};

	AtlasLoot_Data["SCHOLODoctorTheolenKrastinov"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 3, 13523, "", "=q1=Blood of Innocents", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 16684, "", "=q3=Magister's Gloves", "=ds=#a1#", "", "14.0%" };
	};

	AtlasLoot_Data["SCHOLOLorekeeperPolkelt"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 20520, "", "=q2=Dark Rune", "=ds=#e7#", "", "44.0%" };
    { 3, 16705, "", "=q3=Dreadmist Wraps", "=ds=#a1#", "", "17.0%" };
	};

	AtlasLoot_Data["SCHOLOTheRavenian"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 20520, "", "=q2=Dark Rune", "=ds=#e7#", "", "44.0%" };
    { 6, 16716, "", "=q3=Wildheart Belt", "=ds=#a2#", "", "4.00%" };
	};

	AtlasLoot_Data["SCHOLOLordAlexeiBarov"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 16722, "", "=q3=Lightforge Bracers", "=ds=#a4#", "", "5.00%" };
	};

	AtlasLoot_Data["SCHOLOLadyIlluciaBarov"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 20520, "", "=q2=Dark Rune", "=ds=#e7#", "", "48.0%" };
	};

	AtlasLoot_Data["SCHOLODarkmasterGandling"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 3, 901726, "", "=q1=Gandling's Plague Formula", "=ds=#m3#", "", "100%" };
    { 4, 59000, "", "=q3=Gandling's Armor Cache - Helm", "=ds=#e10#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 17, 57473, "", "=q2=Technique: Scroll of Shadow Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 18, 13501, "", "=q2=Recipe: Major Mana Potion", "=ds=#e2#", "", "10.0%" };
    { 19, 14514, "", "=q4=Pattern: Robe of the Void", "=ds=#e2#", "", "7.00%" };
    { 20, 13937, "", "=q4=Headmaster's Charge", "=ds=#w9#", "", "2.00%" };
    { 21, 13398, "", "=q3=Boots of the Shrieker", "=ds=#a2#", "", "" };
    { 22, 13938, "", "=q3=Bonecreeper Stylus", "=ds=#w12#", "", "" };
    { 23, 13944, "", "=q3=Tombstone Breastplate", "=ds=#a2#", "", "" };
    { 24, 13951, "", "=q3=Vigorsteel Vambraces", "=ds=#a4#", "", "" };
    { 25, 13953, "", "=q3=Silent Fang", "=ds=#w10#", "", "" };
    { 26, 13964, "", "=q3=Witchblade", "=ds=#w4#", "", "" };
    { 27, 22433, "", "=q3=Don Mauricio's Band of Domination", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["SCHOLOTrash"] = {
		{ 1, 18697, "", "=q3=Coldstone Slippers", "=ds=#s12#, #a1#", "", "0.01%"};
		{ 2, 18698, "", "=q3=Tattered Leather Hood", "=ds=#s1#, #a2#", "", "0.01%"};
		{ 3, 18699, "", "=q3=Icy Tomb Spaulders", "=ds=#s3#, #a2#", "", "0.01%"};
		{ 4, 18700, "", "=q3=Malefic Bracers", "=ds=#s8#, #a2#", "", "0.01%"};
		{ 5, 14536, "", "=q3=Bonebrace Hauberk", "=ds=#s5#, #a3#", "", "0.01%"};
		{ 6, 18702, "", "=q3=Belt of the Ordained", "=ds=#s10#, #a4#", "", "0.01%"};
		{ 7, 18701, "", "=q3=Innervating Band", "=ds=#s13#", "", "0.01%"};
		{ 9, 16254, "", "=q3=Formula: Enchant Weapon - Lifestealing", "=ds=#p4# (300) =q1=#n66#", "", "0.93%"};
		{ 10, 16255, "", "=q2=Formula: Enchant 2H Weapon - Major Spirit", "=ds=#p4# (300) =q1=#n67#", "", "0.88%"};
		{ 11, 15773, "", "=q2=Pattern: Wicked Leather Armor", "=ds=#p7# (300) =q1=#n66#", "", "3.03%"};
		{ 12, 15776, "", "=q2=Pattern: Runic Leather Armor", "=ds=#p7# (300) =q1=#n68#", "", "1.62%"};
		{ 14, 12753, "", "=q2=Skin of Shadow", "=ds=#m3#"};
		{ 15, 13920, "", "=q1=Healthy Dragon Scale", "=ds=#m2#"};
		{ 16, 16705, "", "=q3=Dreadmist Wraps", "=ds=#s9#, #a1# (D1)", "", "0.03%"};
		{ 17, 16684, "", "=q3=Magister's Gloves", "=ds=#s9#, #a1# (D1)", "", "1.27%"};
		{ 18, 16685, "", "=q3=Magister's Belt", "=ds=#s8#, #a1# (D1)", "", "0.22%"};
		{ 19, 16710, "", "=q3=Shadowcraft Bracers", "=ds=#s8#, #a2# (D1)", "", "1.53%"};
		{ 20, 16716, "", "=q3=Wildheart Belt", "=ds=#s8#, #a2# (D1)", "", "1.84%"};
		{ 21, 16722, "", "=q3=Lightforge Bracers", "=ds=#s8#, #a4# (D1)", "", "2.72%"};
	};

		-----------------------
		--- Shadowfang Keep ---
		-----------------------

	AtlasLoot_Data["ShadowfangKeep1"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Deathsworn Captain"], "" };
    { 2, 6641, "", "=q2=Haunting Blade", "=ds=#w10#", "", "60.0%" };
    { 3, 6642, "", "=q3=Phantom Armor", "=ds=#a3#", "", "40.0%" };
    { 5, 0, "INV_Box_01", "=q6="..BabbleBoss["Razorclaw the Butcher"], "" };
    { 6, 6226, "", "=q2=Bloody Apron", "=ds=#a1#", "", "45.0%" };
    { 7, 6633, "", "=q2=Butcher's Slicer", "=ds=#w10#", "", "45.0%" };
    { 8, 1292, "", "=q3=Butcher's Cleaver", "=ds=#w1#", "", "10.0%" };
    { 10, 0, "INV_Box_01", "=q6="..BabbleBoss["Baron Silverlaine"], "" };
    { 11, 57461, "", "=q2=Technique: Scroll of Frost Resistance II", "=ds=#e2#", "", "15.0%" };
    { 13, 6323, "", "=q2=Baron's Scepter", "=ds=#w6#", "", "70.0%" };
    { 14, 6321, "", "=q3=Silverlaine's Family Seal", "=ds=#e15#", "", "30.0%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Commander Springvale"], "" };
    { 17, 57481, "", "=q2=Technique: Scroll of Holy Resistance II", "=ds=#e2#", "", "15.0%" };
    { 19, 3191, "", "=q2=Arced War Axe", "=ds=#w1#", "", "50.0%" };
    { 20, 6320, "", "=q3=Commander's Crest", "=ds=#e16#", "", "50.0%" };
    { 22, 0, "INV_Box_01", "=q6="..BabbleBoss["Odo the Blindwatcher"], "" };
    { 23, 6319, "", "=q2=Girdle of the Blindwatcher", "=ds=#a2#", "", "60.0%" };
    { 24, 6318, "", "=q3=Odo's Ley Staff", "=ds=#w9#", "", "40.0%" };
    { 26, 0, "INV_Box_01", "=q6="..BabbleBoss["Fenrus the Devourer"], "" };
    { 27, 6340, "", "=q2=Fenrus' Hide", "=ds=#a1#", "", "70.0%" };
    { 28, 3230, "", "=q2=Black Wolf Bracers", "=ds=#a2#", "", "30.0%" };
	};
	
	AtlasLoot_Data["ShadowfangKeep2"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Wolf Master Nandos"], "" };
    { 2, 3748, "", "=q3=Feline Mantle", "=ds=#a1#", "", "60.0%" };
    { 3, 6314, "", "=q2=Wolfmaster Cape", "=ds=#a1#", "", "40.0%" };
    { 5, 0, "INV_Box_01", "=q6="..BabbleBoss["Archmage Arugal"], "" };
    { 6, 5442, "", "=q1=Head of Arugal", "=ds=#m3#", "", "100%" };
    { 7, 901703, "", "=q1=Fangfire Amulet", "=ds=#m3#", "", "100%" };
    { 8, 57466, "", "=q2=Technique: Scroll of Arcane Resistance II", "=ds=#e2#", "", "15.0%" };
    { 9, 57471, "", "=q2=Technique: Scroll of Shadow Resistance II", "=ds=#e2#", "", "15.0%" };
    { 11, 6324, "", "=q3=Robes of Arugal", "=ds=#a1#", "", "40.0%" };
    { 12, 6392, "", "=q3=Belt of Arugal", "=ds=#a1#", "", "40.0%" };
    { 13, 6220, "", "=q3=Meteor Shard", "=ds=#w4#", "", "20.0%" };
	};

		------------------
		--- Stratholme ---
		------------------

	AtlasLoot_Data["STRATSkull"] = {
		{ 1, 13395, "", "=q3=Skul's Fingerbone Claws", "=ds=#s9#, #a2#", "", "36.52%"};
		{ 2, 13394, "", "=q3=Skul's Cold Embrace", "=ds=#s5#, #a4#", "", "24.16%"};
		{ 3, 13396, "", "=q3=Skul's Ghastly Touch", "=ds=#w12#", "", "16.85%"};
	};

	AtlasLoot_Data["STRATStratholmeCourier"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 13306, "", "=q1=King's Square Postbox Key", "=ds=#e5#", "", "" };
    { 3, 13307, "", "=q1=Fras Siabi's Postbox Key", "=ds=#e5#", "", "" };
    { 4, 13303, "", "=q1=Crusaders' Square Postbox Key", "=ds=#e5#", "", "" };
    { 5, 13305, "", "=q1=Elders' Square Postbox Key", "=ds=#e5#", "", "" };
    { 6, 13302, "", "=q1=Market Row Postbox Key", "=ds=#e5#", "", "" };
    { 7, 13304, "", "=q1=Festival Lane Postbox Key", "=ds=#e5#", "", "" };
	};

	AtlasLoot_Data["STRATFrasSiabi"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 3, 13172, "", "=q1=Siabi's Premium Tobacco", "=ds=#m3#", "", "100%" };
	};

	AtlasLoot_Data["STRATAtiesh"] = {
		{ 1, 22736, "", "=q5=Andonisus, Reaper of Souls", "=q1=#m26#: =ds=#h3#, #w10#", "", "100%"};
	};

	AtlasLoot_Data["STRATHearthsingerForresten"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 13174, "", "=q1=Plagued Flesh Sample", "=ds=#m3#", "", "80.0%" };
    { 6, 13378, "", "=q3=Songbird Blouse", "=ds=#a2#", "", "" };
    { 7, 13379, "", "=q3=Piccolo of the Flaming Fire", "=ds=#e15#", "", "" };
    { 8, 13383, "", "=q3=Woollies of the Prancing Minstrel", "=ds=#a3#", "", "" };
    { 9, 13384, "", "=q3=Rainbow Girdle", "=ds=#a4#", "", "" };
    { 10, 16682, "", "=q3=Magister's Boots", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["STRATTheUnforgiven"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 13174, "", "=q1=Plagued Flesh Sample", "=ds=#m3#", "", "80.0%" };
    { 6, 13404, "", "=q3=Mask of the Unforgiven", "=ds=#a2#", "", "" };
    { 7, 13405, "", "=q3=Wailing Nightbane Pauldrons", "=ds=#a4#", "", "" };
    { 8, 13408, "", "=q3=Soul Breaker", "=ds=#w1#", "", "" };
    { 9, 13409, "", "=q3=Tearfall Bracers", "=ds=#a1#", "", "" };
    { 10, 16717, "", "=q3=Wildheart Gloves", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["STRATTimmytheCruel"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 13174, "", "=q1=Plagued Flesh Sample", "=ds=#m3#", "", "80.0%" };
    { 6, 13400, "", "=q3=Vambraces of the Sadist", "=ds=#a4#", "", "" };
    { 7, 13401, "", "=q3=The Cruel Hand of Timmy", "=ds=#w6#", "", "" };
    { 8, 13402, "", "=q3=Timmy's Galoshes", "=ds=#a3#", "", "" };
    { 9, 13403, "", "=q3=Grimgore Noose", "=ds=#a1#", "", "" };
    { 10, 16724, "", "=q3=Lightforge Gauntlets", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["STRATMalorsStrongbox"] = {
		{ 1, 0, "INV_Box_01", "=q6=#x13#", ""};
		{ 2, 12845, "", "=q1=Medallion of Faith", "=ds=#m3#", "", "100%"};
	};

	AtlasLoot_Data["STRATCrimsonHammersmith"] = {
		{ 1, 18781, "", "=q3=Bottom Half of Advanced Armorsmithing: Volume II", "=ds=#m3#", "", "41.6%"};
		{ 2, 12726, "", "=q3=Plans: Enchanted Thorium Leggings", "=q1=#m4#: =ds=#p2# (300)"};
		{ 4, 13351, "", "=q1=Crimson Hammersmith's Apron", "=ds=#m3#", "", "100%"};
		{ 5, 12824, "", "=q2=Plans: Enchanted Battlehammer", "=q1=#m4#: =ds=#p2# (280)"};
	};

	AtlasLoot_Data["STRATBSPlansSerenity"] = {
		{ 1, 12827, "", "=q2=Plans: Serenity", "=ds=#p2# (285)", "", "100%"};
	};

	AtlasLoot_Data["STRATCannonMasterWilley"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 13377, "", "=q3=Miniature Cannon Balls", "=ds=#e6#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 12839, "", "=q3=Plans: Heartseeker", "=ds=#e2#", "", "6.00%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 13380, "", "=q3=Willey's Portable Howitzer", "=ds=#w5#", "", "10.0%" };
    { 18, 13381, "", "=q3=Master Cannoneer Boots", "=ds=#a4#", "", "10.0%" };
    { 19, 13382, "", "=q3=Cannonball Runner", "=ds=#e15#", "", "10.0%" };
    { 20, 16708, "", "=q3=Shadowcraft Spaulders", "=ds=#a2#", "", "10.0%" };
    { 21, 18721, "", "=q3=Barrage Girdle", "=ds=#a3#", "", "10.0%" };
    { 22, 22403, "", "=q3=Diana's Pearl Necklace", "=ds=#e15#", "", "10.0%" };
    { 23, 22404, "", "=q3=Willey's Back Scratcher", "=ds=#w13#", "", "10.0%" };
    { 24, 22405, "", "=q3=Mantle of the Scarlet Crusade", "=ds=#a1#", "", "10.0%" };
    { 25, 22406, "", "=q3=Redemption", "=ds=#w9#", "", "10.0%" };
    { 26, 22407, "", "=q3=Helm of the New Moon", "=ds=#a2#", "", "10.0%" };
	};

	AtlasLoot_Data["STRATArchivistGalford"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 12811, "", "=q2=Righteous Orb", "=ds=#e7#", "", "66.0%" };
    { 3, 22897, "", "=q3=Tome of Conjure Food VII", "=ds=#e2#", "", "14.0%" };
    { 4, 13385, "", "=q3=Tome of Knowledge", "=ds=#e15#", "", "12.0%" };
    { 5, 13386, "", "=q3=Archivist Cape", "=ds=#a1#", "", "" };
    { 6, 13387, "", "=q3=Foresight Girdle", "=ds=#a3#", "", "" };
    { 7, 16692, "", "=q3=Devout Gloves", "=ds=#a1#", "", "" };
    { 8, 18716, "", "=q3=Ash Covered Boots", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["STRATBalnazzar"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 13250, "", "=q1=Head of Balnazzar", "=ds=#m3#", "", "100%" };
    { 3, 901719, "", "=q1=Dathrohan's Tainted Medallion", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 57483, "", "=q2=Technique: Scroll of Holy Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 7, 14512, "", "=q4=Pattern: Truefaith Vestments", "=ds=#e2#", "", "6.00%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 12103, "", "=q3=Star of Mystaria", "=ds=#e15#", "", "9.80%" };
    { 18, 13348, "", "=q3=Demonshear", "=ds=#w10#", "", "9.80%" };
    { 19, 13358, "", "=q3=Wyrmtongue Shoulders", "=ds=#a2#", "", "9.80%" };
    { 20, 13359, "", "=q3=Crown of Tyranny", "=ds=#a3#", "", "9.80%" };
    { 21, 13360, "", "=q3=Gift of the Elven Magi", "=ds=#w4#", "", "9.80%" };
    { 22, 13369, "", "=q3=Fire Striders", "=ds=#a1#", "", "9.80%" };
    { 23, 16725, "", "=q3=Lightforge Boots", "=ds=#a4#", "", "9.80%" };
    { 24, 18717, "", "=q3=Hammer of the Grand Crusader", "=ds=#w6#", "", "9.80%" };
    { 25, 18718, "", "=q3=Grand Crusader's Helm", "=ds=#a4#", "", "9.80%" };
    { 26, 18720, "", "=q3=Shroud of the Nathrezim", "=ds=#a1#", "", "9.80%" };
    { 27, 13353, "", "=q4=Book of the Dead", "=ds=#e15#", "", "2.00%" };
	};

	AtlasLoot_Data["STRATSothosJarien"] = {
		{ 1, 0, "INV_Misc_Bag_09", "=q6=#j5#", "=q5=#n18#"};
		{ 2, 22301, "", "=q3=Ironweave Robe", "=ds=#s5#, #a1#", "", "19.00%"};
		{ 3, 22328, "", "=q3=Legplates of Vigilance", "=ds=#s11#, #a4#", "", "21.27%"};
		{ 4, 22327, "", "=q3=Amulet of the Redeemed", "=ds=#s2#", "", "14.03%"};
		{ 5, 22334, "", "=q3=Band of Mending", "=ds=#s13#", "", "17.19%"};
		{ 6, 22329, "", "=q3=Scepter of Interminable Focus", "=ds=#s15#", "", "28.51%"};
		{ 8, 21984, "", "=q1=Left Piece of Lord Valthalak's Amulet", "=ds=#m3#"};
		{ 9, 22046, "", "=q1=Right Piece of Lord Valthalak's Amulet", "=ds=#m3#"};
	};

	AtlasLoot_Data["STRATStonespine"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 13397, "", "=q3=Stoneskin Gargoyle Cape", "=ds=#a1#", "", "" };
    { 6, 13399, "", "=q3=Gargoyle Shredder Talons", "=ds=#w13#", "", "" };
    { 7, 13954, "", "=q3=Verdant Footpads", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["STRATBaronessAnastari"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 17, 13174, "", "=q1=Plagued Flesh Sample", "=ds=#m3#", "", "80.0%" };
    { 18, 100003, "", "=q3=Codex: Prayer of Spirit", "=ds=#e2#", "", "12.0%" };
    { 19, 13534, "", "=q3=Banshee Finger", "=ds=#w12#", "", "" };
    { 20, 16704, "", "=q3=Dreadmist Sandals", "=ds=#a1#", "", "" };
    { 21, 18728, "", "=q3=Anastari Heirloom", "=ds=#e15#", "", "" };
    { 22, 18729, "", "=q3=Screeching Bow", "=ds=#w2#", "", "" };
    { 23, 18730, "", "=q3=Shadowy Laced Handwraps", "=ds=#a1#", "", "" };
    { 24, 13514, "", "=q2=Wail of the Banshee", "=ds=#e0#", "", "" };
    { 25, 13535, "", "=q2=Coldtouch Phantom Wraps", "=ds=#a1#", "", "" };
    { 26, 13537, "", "=q2=Chillhide Bracers", "=ds=#a2#", "", "" };
    { 27, 13538, "", "=q2=Windshrieker Pauldrons", "=ds=#a3#", "", "" };
    { 28, 13539, "", "=q2=Banshee's Touch", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["STRATBlackGuardSwordsmith"] = {
		{ 1, 18783, "", "=q3=Bottom Half of Advanced Armorsmithing: Volume III", "=ds=#m3#", "", "23.5%"};
		{ 2, 12725, "", "=q3=Plans: Enchanted Thorium Helm", "=q1=#m4#: =ds=#p2# (300)"};
		{ 4, 13350, "", "=q1=Insignia of the Black Guard", "=ds=#m3#", "", "100%"};
		{ 5, 12825, "", "=q2=Plans: Blazing Rapier", "=q1=#m4#: =ds=#p2# (280)"};
	};

	AtlasLoot_Data["STRATBSPlansCorruption"] = {
		{ 1, 12830, "", "=q1=Plans: Corruption", "=ds=#p2# (290)", "", "100%"};
	};

	AtlasLoot_Data["STRATNerubenkan"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 13174, "", "=q1=Plagued Flesh Sample", "=ds=#m3#", "", "80.0%" };
    { 6, 13529, "", "=q3=Husk of Nerub'enkan", "=ds=#e16#", "", "" };
    { 7, 16675, "", "=q3=Beaststalker's Boots", "=ds=#a3#", "", "" };
    { 8, 18738, "", "=q3=Carapace Spine Crossbow", "=ds=#w3#", "", "" };
    { 9, 18739, "", "=q3=Chitinous Plate Legguards", "=ds=#a4#", "", "" };
    { 10, 18740, "", "=q3=Thuzadin Sash", "=ds=#a1#", "", "" };
    { 11, 13508, "", "=q2=Eye of Arachnida", "=ds=#e0#", "", "" };
    { 12, 13530, "", "=q2=Fangdrip Runners", "=ds=#a1#", "", "" };
    { 13, 13531, "", "=q2=Crypt Stalker Leggings", "=ds=#a2#", "", "" };
    { 14, 13532, "", "=q2=Darkspinner Claws", "=ds=#a3#", "", "" };
    { 15, 13533, "", "=q2=Acid-etched Pauldrons", "=ds=#a4#", "", "" };
	};

	AtlasLoot_Data["STRATMalekithePallid"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 17, 100003, "", "=q3=Codex: Prayer of Spirit", "=ds=#e2#", "", "10.0%" };
    { 18, 12833, "", "=q3=Plans: Hammer of the Titans", "=ds=#e2#", "", "6.00%" };
    { 19, 13524, "", "=q3=Skull of Burning Shadows", "=ds=#e15#", "", "" };
    { 20, 16691, "", "=q3=Devout Sandals", "=ds=#a1#", "", "" };
    { 21, 18734, "", "=q3=Pale Moon Cloak", "=ds=#a1#", "", "" };
    { 22, 18735, "", "=q3=Maleki's Footwraps", "=ds=#a1#", "", "" };
    { 23, 18737, "", "=q3=Bone Slicing Hatchet", "=ds=#w1#", "", "" };
    { 24, 13509, "", "=q2=Clutch of Foresight", "=ds=#e0#", "", "" };
    { 25, 13525, "", "=q2=Darkbind Fingers", "=ds=#a1#", "", "" };
    { 26, 13526, "", "=q2=Flamescarred Girdle", "=ds=#a2#", "", "" };
    { 27, 13527, "", "=q2=Lavawalker Greaves", "=ds=#a4#", "", "" };
    { 28, 13528, "", "=q2=Twilight Void Bracers", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["STRATMagistrateBarthilas"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12382, "", "=q2=Key to the City", "=ds=#e5#", "", "100%" };
    { 3, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 13174, "", "=q1=Plagued Flesh Sample", "=ds=#m3#", "", "80.0%" };
    { 7, 57483, "", "=q2=Technique: Scroll of Holy Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 8, 13376, "", "=q3=Royal Tribunal Cloak", "=ds=#a1#", "", "" };
    { 9, 18722, "", "=q3=Death Grips", "=ds=#a4#", "", "" };
    { 10, 18725, "", "=q3=Peacemaker", "=ds=#w7#", "", "" };
    { 11, 18726, "", "=q3=Magistrate's Cuffs", "=ds=#a2#", "", "" };
    { 12, 18727, "", "=q3=Crimson Felt Hat", "=ds=#a1#", "", "" };
    { 13, 23198, "", "=q3=Idol of Brutality", "", "", "" };
	};

	AtlasLoot_Data["STRATRamsteintheGorger"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12735, "", "=q2=Frayed Abomination Stitching", "=ds=#m3#", "", "100%" };
    { 3, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 4, 15880, "", "=q1=Head of Ramstein the Gorger", "=ds=#m3#", "", "100%" };
    { 6, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 7, 13174, "", "=q1=Plagued Flesh Sample", "=ds=#m3#", "", "80.0%" };
    { 8, 16737, "", "=q3=Gauntlets of Valor", "=ds=#a4#", "", "12.0%" };
    { 9, 13372, "", "=q3=Slavedriver's Cane", "=ds=#w9#", "", "" };
    { 10, 13373, "", "=q3=Band of Flesh", "=ds=#e15#", "", "" };
    { 11, 13374, "", "=q3=Soulstealer Mantle", "=ds=#a1#", "", "" };
    { 12, 13375, "", "=q3=Crest of Retribution", "=ds=#e16#", "", "" };
    { 13, 13515, "", "=q3=Ramstein's Lightning Bolts", "=ds=#e15#", "", "" };
    { 14, 18723, "", "=q3=Animated Chain Necklace", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["STRATBaronRivendare"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 12843, "", "=q2=Corruptor's Scourgestone", "=ds=#m3#", "", "100%" };
    { 3, 13251, "", "=q1=Head of Baron Rivendare", "=ds=#m3#", "", "100%" };
    { 4, 901724, "", "=q1=Rivendare's Runeblade", "=ds=#m3#", "", "100%" };
    { 5, 59002, "", "=q3=Rivendare's Armor Cache - Legs", "=ds=#e10#", "", "100%" };
    { 7, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 8, 13174, "", "=q1=Plagued Flesh Sample", "=ds=#m3#", "", "80.0%" };
    { 9, 100003, "", "=q3=Codex: Prayer of Spirit", "=ds=#e2#", "", "15.0%" };
    { 10, 13340, "", "=q3=Cape of the Black Baron", "=ds=#a1#", "", "8.70%" };
    { 11, 13335, "", "=q3=Deathcharger's Reins", "=ds=#e10#", "", "1.00%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 13344, "", "=q3=Dracorian Gauntlets", "=ds=#a3#", "", "8.70%" };
    { 18, 13345, "", "=q3=Seal of Rivendare", "=ds=#e15#", "", "8.70%" };
    { 19, 13346, "", "=q3=Robes of the Exalted", "=ds=#a1#", "", "8.70%" };
    { 20, 13349, "", "=q3=Scepter of the Unholy", "=ds=#w6#", "", "8.70%" };
    { 21, 22408, "", "=q3=Ritssyn's Wand of Bad Mojo", "=ds=#w12#", "", "8.70%" };
    { 22, 22409, "", "=q3=Tunic of the Crescent Moon", "=ds=#a2#", "", "8.70%" };
    { 23, 22410, "", "=q3=Gauntlets of Deftness", "=ds=#a3#", "", "8.70%" };
    { 24, 22411, "", "=q3=Helm of the Executioner", "=ds=#a4#", "", "8.70%" };
    { 25, 22412, "", "=q3=Thuzadin Mantle", "=ds=#a1#", "", "8.70%" };
    { 26, 13361, "", "=q3=Skullforge Reaver", "=ds=#w10#", "", "6.00%" };
    { 27, 13368, "", "=q3=Bonescraper", "=ds=#w4#", "", "6.00%" };
    { 28, 13505, "", "=q4=Runeblade of Baron Rivendare", "=ds=#w10#", "", "1.00%" };
	};

	AtlasLoot_Data["STRATTrash"] = {
		{ 1, 18743, "", "=q3=Gracious Cape", "=ds=#s4#", "", "0.01%"};
		{ 2, 17061, "", "=q3=Juno's Shadow", "=ds=#s4#", "", "0.01%"};
		{ 3, 18745, "", "=q3=Sacred Cloth Leggings", "=ds=#s11#, #a1#", "", "0.01%"};
		{ 4, 18744, "", "=q3=Plaguebat Fur Gloves", "=ds=#s9#, #a2#", "", "0.00%"};
		{ 5, 18736, "", "=q3=Plaguehound Leggings", "=ds=#s11#, #a2#", "", "0.00%"};
		{ 6, 18742, "", "=q3=Stratholme Militia Shoulderguard", "=ds=#s3#, #a3#", "", "0.00%"};
		{ 7, 18741, "", "=q3=Morlune's Bracer", "=ds=#s8#, #a4#", "", "0.01%"};
		{ 9, 16249, "", "=q2=Formula: Enchant 2H Weapon - Major Intellect", "=ds=#p4# (300) =q1=#n60#", "", "1.19%"};
		{ 10, 16248, "", "=q2=Formula: Enchant Weapon - Unholy", "=ds=#p4# (295) =q1=#n61#", "", "0.36%"};
		{ 11, 18658, "", "=q2=Schematic: Ultra-Flash Shadow Reflector", "=ds=#p5# (300) =q1=#n62#", "", "1.82%"};
		{ 12, 16052, "", "=q2=Schematic: Voice Amplification Modulator", "=ds=#p5# (290) =q1=#n62#", "", "1.99%"};
		{ 13, 15777, "", "=q2=Pattern: Runic Leather Shoulders", "=ds=#p7# (300) =q1=#n63#", "", "1.00%"};
		{ 14, 15768, "", "=q2=Pattern: Wicked Leather Belt", "=ds=#p7# (300) =q1=#n64#", "", "0.85%"};
		{ 15, 14495, "", "=q2=Pattern: Ghostweave Pants", "=ds=#p8# (290) =q1=#n65#", "", "2.13%"};
		{ 16, 16697, "", "=q3=Devout Bracers", "=ds=#s8#, #a1# (D1)", "", "1.15%"};
		{ 17, 16702, "", "=q3=Dreadmist Belt", "=ds=#s10#, #a1# (D1)", "", "0.90%"};
		{ 18, 16685, "", "=q3=Magister's Belt", "=ds=#s10#, #a1# (D1)", "", "0.80%"};
		{ 19, 16714, "", "=q3=Wildheart Bracers", "=ds=#s8#, #a2# (D1)", "", "1.49%"};
		{ 20, 16681, "", "=q3=Beaststalker's Bindings", "=ds=#s8#, #a3# (D1)", "", "1.64%"};
		{ 21, 16671, "", "=q3=Bindings of Elements", "=ds=#s8#, #a3# (D1)", "", "1.90%"};
		{ 22, 16736, "", "=q3=Belt of Valor", "=ds=#s10#, #a4# (D1)", "", "2.02%"};
		{ 23, 16723, "", "=q3=Lightforge Belt", "=ds=#s10#, #a4# (D1)", "", "1.83%"};
		{ 25, 12811, "", "=q2=Righteous Orb", "=ds=#e8#", "", "5.09%"};
		{ 26, 12735, "", "=q2=Frayed Abomination Stitching", "=ds=#m3#", "", "17.5%"};
	};

		---------------------
		--- The Deadmines ---
		---------------------

	AtlasLoot_Data["VCMarisa"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 4660, "", "=q2=Walking Boots", "=ds=#a1#", "", "75.0%" };
    { 3, 3019, "", "=q2=Noble's Robe", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["VCNoble"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 5967, "", "=q2=Girdle of Nobility", "=ds=#a1#", "", "70.0%" };
    { 3, 3902, "", "=q2=Staff of Nobles", "=ds=#w9#", "", "" };
	};

	AtlasLoot_Data["VCThistlenettle"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 1875, "", "=q1=Thistlenettle's Badge", "=ds=#m3#", "", "100%" };
	};

	AtlasLoot_Data["VCRhahkZor"] = {
		{ 1, 5187, "", "=q1=Rhahk'Zor's Hammer", "=ds=#m3#", "", "95.0%" };
		{ 3, 872, "", "=q2=Rockslicer", "=ds=#w1#", "", "5.0%" };
	};

	AtlasLoot_Data["VCMinerJohnson"] = {
    { 2, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 3, 5444, "", "=q2=Miner's Cape", "=ds=#a1#", "", "65.0%" };
    { 4, 5443, "", "=q3=Gold-plated Buckler", "=ds=#e16#", "", "35.0%" };
	};

	AtlasLoot_Data["VCSneed"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Sneed's Shredder"], "" };
    { 2, 7365, "", "=q1=Gnoam Sprecklesprocket", "=ds=#m3#", "", "100%" };
    { 4, 1937, "", "=q2=Buzz Saw", "=ds=#w10#", "", "10.0%" };
    { 6, 0, "INV_Box_01", "=q6="..BabbleBoss["Sneed"], "" };
    { 7, 5195, "", "=q2=Gold-flecked Gloves", "=ds=#a1#", "", "65.0%" };
    { 8, 5194, "", "=q3=Taskmaster Axe", "=ds=#w1#", "", "35.0%" };
	};

	AtlasLoot_Data["VCGilnid"] = {
    { 2, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 3, 5199, "", "=q2=Smelting Pants", "=ds=#a2#", "", "55.0%" };
    { 4, 1156, "", "=q3=Lavishly Jeweled Ring", "=ds=#e15#", "", "45.0%" };
	};

	AtlasLoot_Data["VCSmite"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 57481, "", "=q2=Technique: Scroll of Holy Resistance II", "=ds=#e2#", "", "15.0%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 5192, "", "=q2=Thief's Blade", "=ds=#w10#", "", "40.0%" };
    { 6, 5196, "", "=q2=Smite's Reaver", "=ds=#w1#", "", "40.0%" };
    { 7, 7230, "", "=q3=Smite's Mighty Hammer", "=ds=#w6#", "", "20.0%" };
	};

	AtlasLoot_Data["VCCookie"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 901727, "", "=q1=Stabby Patty Secret Formula", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 57461, "", "=q2=Technique: Scroll of Frost Resistance II", "=ds=#e2#", "", "15.0%" };
    { 7, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 8, 5197, "", "=q2=Cookie's Tenderizer", "=ds=#w6#", "", "65.0%" };
    { 9, 5198, "", "=q3=Cookie's Stirring Rod", "=ds=#w12#", "", "35.0%" };
	};

	AtlasLoot_Data["VCGreenskin"] = {
    { 2, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 3, 5201, "", "=q3=Emberstone Staff", "=ds=#w9#", "", "40.0%" };
    { 4, 5200, "", "=q2=Impaling Harpoon", "=ds=#w7#", "", "30.0%" };
    { 5, 10403, "", "=q2=Blackened Defias Belt", "=ds=#a2#", "", "30.0%" };
	};

	AtlasLoot_Data["VCVanCleef"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 2874, "", "=q1=An Unsent Letter", "=ds=#m3#", "", "100%" };
    { 3, 3637, "", "=q1=Head of VanCleef", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 57471, "", "=q2=Technique: Scroll of Shadow Resistance II", "=ds=#e2#", "", "15.0%" };
    { 8, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 9, 5193, "", "=q3=Cape of the Brotherhood", "=ds=#a1#", "", "30.0%" };
    { 10, 5202, "", "=q3=Corsair's Overshirt", "=ds=#a1#", "", "30.0%" };
    { 11, 5191, "", "=q3=Cruel Barb", "=ds=#w10#", "", "20.0%" };
    { 12, 10399, "", "=q3=Blackened Defias Armor", "=ds=#a2#", "", "20.0%" };
	};

		--------------------
		--- The Stockade ---
		--------------------

	AtlasLoot_Data["TheStockade"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Targorr the Dread"], "" };
    { 2, 3630, "", "=q1=Head of Targorr", "=ds=#m3#", "", "100%" };
    { 4, 901100, "", "=q3=Dread Sword", "=ds=#w10#", "", "50.0%" };
    { 5, 901101, "", "=q3=Dread Shoulders", "=ds=#a2#", "", "50.0%" };
    { 7, 0, "INV_Box_01", "=q6="..BabbleBoss["Kam Deepfury"], "" };
    { 8, 3640, "", "=q1=Head of Deepfury", "=ds=#m3#", "", "100%" };
    { 10, 2280, "", "=q2=Walking Stick of Kam", "=ds=#w9#", "", "33.3%" };
    { 11, 901102, "", "=q3=Tim Kam Slam", "=ds=#w6#", "", "33.3%" };
    { 12, 901103, "", "=q3=Deepfury Mantle", "=ds=#a3#", "", "33.3%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Bazil Thredd"], "" };
    { 17, 2926, "", "=q1=Head of Bazil Thredd", "=ds=#m3#", "", "100%" };
    { 18, 901702, "", "=q1=Prison Wallet", "=ds=#m3#", "", "100%" };
    { 19, 2909, "", "=q1=Red Wool Bandana", "=ds=#m3#", "", "80.0%" };
    { 21, 901109, "", "=q3=Thredded Belt", "=ds=#a2#", "", "50.0%" };
    { 22, 901110, "", "=q3=Needle Thredder", "=ds=#w3#", "", "50.0%" };
    { 24, 0, "INV_Box_01", "=q6="..BabbleBoss["Dextren Ward"], "" };
    { 25, 3628, "", "=q1=Hand of Dextren Ward", "=ds=#m3#", "", "100%" };
    { 27, 901107, "", "=q3=Grave Digging Shovel", "=ds=#w6#", "", "50.0%" };
    { 28, 901108, "", "=q3=Coffin Splinter", "=ds=#w12#", "", "50.0%" };
    { 30, 0, "INV_Box_01", "=q6="..BabbleBoss["Bruegal Ironknuckle"], "" };
    { 31, 2909, "", "=q1=Red Wool Bandana", "=ds=#m3#", "", "80.0%" };
    { 33, 3228, "", "=q3=Jimmied Handcuffs", "=ds=#a3#", "", "60.0%" };
    { 34, 2941, "", "=q3=Prison Shank", "=ds=#w4#", "", "20.0%" };
    { 35, 2942, "", "=q3=Iron Knuckles", "=ds=#w13#", "", "20.0%" };
	};

		-------------------------
		--- The Sunken Temple ---
		-------------------------

	AtlasLoot_Data["STSpawnOfHakkar"] = {
		{ 1, 10802, "", "=q3=Wingveil Cloak", "=ds=#s4#", "", "25.6%"};
		{ 2, 10801, "", "=q3=Slitherscale Boots", "=ds=#s12#, #a2#", "", "42.33%"};
	};

	AtlasLoot_Data["STTrollMinibosses"] = {
		{ 1, 10787, "", "=q3=Atal'ai Gloves", "=ds=#s9#, #a1# =q2=#m16#", "", "5.25%"};
		{ 2, 10783, "", "=q3=Atal'ai Spaulders", "=ds=#s3#, #a2# =q2=#m16#", "", "3.12%"};
		{ 3, 10785, "", "=q3=Atal'ai Leggings", "=ds=#s11#, #a2# =q2=#m16#", "", "4.42%"};
		{ 4, 10784, "", "=q3=Atal'ai Breastplate", "=ds=#s5#, #a3# =q2=#m16#", "", "2.12%"};
		{ 5, 10786, "", "=q3=Atal'ai Boots", "=ds=#s12#, #a3# =q2=#m16#", "", "6.15%"};
		{ 6, 10788, "", "=q3=Atal'ai Girdle", "=ds=#s10#, #a4# =q2=#m16#", "", "7.17%"};
		{ 8, 20606, "", "=q1=Amber Voodoo Feather", "=ds=#m3# =q2=#st1#, #st6#"};
		{ 9, 20607, "", "=q1=Blue Voodoo Feather", "=ds=#m3# =q2=#st2#, #st4#"};
		{ 10, 20608, "", "=q1=Green Voodoo Feather", "=ds=#m3# =q2=#st3#, #st5#"};
	};

	AtlasLoot_Data["STAtalalarion"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 901729, "", "=q1=Shirvallah's Tear", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 6181, "", "=q1=Fetish of Hakkar", "=ds=#m3#", "", "80.0%" };
    { 6, 10799, "", "=q3=Headspike", "=ds=#w7#", "", "20.0%" };
    { 7, 10798, "", "=q3=Atal'alarion's Tusk Ring", "=ds=#a4#", "", "" };
    { 8, 10800, "", "=q3=Darkwater Bracers", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["STDreamscythe"] = {
		{ 1, 12465, "", "=q3=Nightfall Drape", "=ds=#s4#", "", "4.42%"};
		{ 2, 12466, "", "=q3=Dawnspire Cord", "=ds=#s10#, #a1#", "", "4.16%"};
		{ 3, 12464, "", "=q3=Bloodfire Talons", "=ds=#s9#, #a2#", "", "4.99%"};
		{ 4, 10795, "", "=q3=Drakeclaw Band", "=ds=#s13# =q2=#m16#", "", "3.68%"};
		{ 5, 10796, "", "=q3=Drakestone", "=ds=#s15#", "", "4.26%"};
		{ 6, 10797, "", "=q3=Firebreather", "=ds=#h1#, #w10#", "", "4.57%"};
		{ 7, 12463, "", "=q3=Drakefang Butcher", "=ds=#h2#, #w10#", "", "4.40%"};
		{ 8, 12243, "", "=q3=Smoldering Claw", "=ds=#w7#", "", "4.50%"};
	};

	AtlasLoot_Data["STWeaver"] = {
		{ 1, 12465, "", "=q3=Nightfall Drape", "=ds=#s4#", "", "4.20%"};
		{ 2, 12466, "", "=q3=Dawnspire Cord", "=ds=#s10#, #a1#", "", "3.89%"};
		{ 3, 12464, "", "=q3=Bloodfire Talons", "=ds=#s9#, #a2#", "", "4.10%"};
		{ 4, 10795, "", "=q3=Drakeclaw Band", "=ds=#s13# =q2=#m16#", "", "4.46%"};
		{ 5, 10796, "", "=q3=Drakestone", "=ds=#s15#", "", "4.47%"};
		{ 6, 10797, "", "=q3=Firebreather", "=ds=#h1#, #w10#", "", "4.08%"};
		{ 7, 12463, "", "=q3=Drakefang Butcher", "=ds=#h2#, #w10#", "", "5.00%"};
		{ 8, 12243, "", "=q3=Smoldering Claw", "=ds=#w7#", "", "4.42%"};
	};

	AtlasLoot_Data["STAvatarofHakkar"] = {
    { 2, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 3, 10842, "", "=q3=Windscale Sarong", "=ds=#a2#", "", "17.2%" };
    { 4, 10843, "", "=q3=Featherskin Cape", "=ds=#a1#", "", "17.2%" };
    { 5, 10845, "", "=q3=Warrior's Embrace", "=ds=#a4#", "", "17.2%" };
    { 6, 10846, "", "=q3=Bloodshot Greaves", "=ds=#a3#", "", "17.2%" };
    { 7, 10838, "", "=q3=Might of Hakkar", "=ds=#w6#", "", "15.0%" };
    { 8, 10844, "", "=q3=Spire of Hakkar", "=ds=#w9#", "", "15.0%" };
    { 9, 12462, "", "=q4=Embrace of the Wind Serpent", "=ds=#a1#", "", "1.00%" };
	};

	AtlasLoot_Data["STJammalan"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 6212, "", "=q1=Head of Jammal'an", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 6181, "", "=q1=Fetish of Hakkar", "=ds=#m3#", "", "80.0%" };
    { 6, 57468, "", "=q2=Technique: Scroll of Arcane Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 7, 10806, "", "=q3=Vestments of the Atal'ai Prophet", "=ds=#a1#", "", "" };
    { 8, 10807, "", "=q3=Kilt of the Atal'ai Prophet", "=ds=#a1#", "", "" };
    { 9, 10808, "", "=q3=Gloves of the Atal'ai Prophet", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["STOgom"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 6181, "", "=q1=Fetish of Hakkar", "=ds=#m3#", "", "80.0%" };
    { 3, 10803, "", "=q2=Blade of the Wretched", "=ds=#w10#", "", "" };
    { 4, 10804, "", "=q2=Fist of the Damned", "=ds=#w6#", "", "" };
    { 5, 10805, "", "=q2=Eater of the Dead", "=ds=#w1#", "", "" };
	};

	AtlasLoot_Data["STMorphaz"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 20025, "", "=q1=Blood of Morphaz", "=ds=#m3#", "", "100%" };
	};

	AtlasLoot_Data["STHazzas"] = {
		{ 1, 12465, "", "=q3=Nightfall Drape", "=ds=#s4#", "", "4.48%"};
		{ 2, 12466, "", "=q3=Dawnspire Cord", "=ds=#s10#, #a1#", "", "4.46%"};
		{ 3, 12464, "", "=q3=Bloodfire Talons", "=ds=#s9#, #a2#", "", "5.00%"};
		{ 4, 10795, "", "=q3=Drakeclaw Band", "=ds=#s13# =q2=#m16#", "", "4.18%"};
		{ 5, 10796, "", "=q3=Drakestone", "=ds=#s15#", "", "4.92%"};
		{ 6, 10797, "", "=q3=Firebreather", "=ds=#h1#, #w10#", "", "4.50%"};
		{ 7, 12463, "", "=q3=Drakefang Butcher", "=ds=#h2#, #w10#", "", "4.58%"};
		{ 8, 12243, "", "=q3=Smoldering Claw", "=ds=#w7#", "", "4.56%"};
	};

	AtlasLoot_Data["STEranikus"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 10454, "", "=q2=Essence of Eranikus", "=ds=#m3#", "", "100%" };
    { 3, 901713, "", "=q1=Dream Seed", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 57468, "", "=q2=Technique: Scroll of Arcane Resistance IV", "=ds=#e2#", "", "15.0%" };
    { 8, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 9, 10829, "", "=q3=The Dragon's Eye", "=ds=#e15#", "", "17.2%" };
    { 10, 10833, "", "=q3=Horns of Eranikus", "=ds=#a3#", "", "17.2%" };
    { 11, 10835, "", "=q3=Crest of Supremacy", "=ds=#e16#", "", "17.2%" };
    { 12, 10836, "", "=q3=Rod of Corrosion", "=ds=#w12#", "", "17.2%" };
    { 13, 10828, "", "=q3=Dire Nail", "=ds=#w4#", "", "15.0%" };
    { 14, 10837, "", "=q3=Tooth of Eranikus", "=ds=#w1#", "", "15.0%" };
    { 15, 10847, "", "=q4=Dragon's Call", "=ds=#w10#", "", "1.00%" };
	};

	AtlasLoot_Data["STTrash"] = {
		{ 1, 10630, "", "=q3=Soulcatcher Halo", "=ds=#s1#, #a1#", "", "0.01%"};
		{ 2, 10629, "", "=q3=Mistwalker Boots", "=ds=#s12#, #a1#", "", "0.01%"};
		{ 3, 10632, "", "=q3=Slimescale Bracers", "=ds=#s8#, #a3#", "", "0.01%"};
		{ 4, 10631, "", "=q3=Murkwater Gauntlets", "=ds=#s9#, #a3#", "", "0.01%"};
		{ 5, 10633, "", "=q3=Silvershell Leggings", "=ds=#s11#, #a3#", "", "0.01%"};
		{ 6, 10634, "", "=q3=Mindseye Circle", "=ds=#s13#", "", "0.02%"};
		{ 8, 15733, "", "=q3=Pattern: Green Dragonscale Leggings", "=ds=#p7# (270) =q1=#n80#", "", "1.80%"};
		{ 9, 16216, "", "=q2=Formula: Enchant Cloak - Greater Resistance", "=ds=#p4# (265) =q1=#n81#", "", "0.75%"};
		{ 11, 11318, "", "=q1=Atal'ai Haze", "=ds=#m3#"};
		{ 12, 6181, "", "=q1=Fetish of Hakkar", "=ds=#m3#"};
		{ 16, 10623, "", "=q3=Winter's Bite", "=ds=#h1#, #w1#", "", "0.01%"};
		{ 17, 10625, "", "=q3=Stealthblade", "=ds=#h1#, #w4#", "", "0.01%"};
		{ 18, 10628, "", "=q3=Deathblow", "=ds=#h2#, #w10#", "", "0.01%"};
		{ 19, 10626, "", "=q3=Ragehammer", "=ds=#h2#, #w6#", "", "0.01%"};
		{ 20, 10627, "", "=q3=Bludgeon of the Grinning Dog", "=ds=#w9#", "", "0.02%"};
		{ 21, 10624, "", "=q3=Stinging Bow", "=ds=#w2#", "", "0.02%"};
	};

		---------------
		--- Uldaman ---
		---------------

	AtlasLoot_Data["UldMagreganDeepshadow"] = {
		{ 1, 4635, "", "=q1=Hammertoe's Amulet", "=ds=#m3#", "", "100%"};
	};

	AtlasLoot_Data["UldTabletofRyuneh"] = {
		{ 1, 4631, "", "=q1=Tablet of Ryun'eh", "=ds=#m3#"};
	};

	AtlasLoot_Data["UldKromStoutarmChest"] = {
		{ 1, 8027, "", "=q1=Krom Stoutarm's Treasure", "=ds=#m3#"};
	};

	AtlasLoot_Data["UldGarrettFamilyChest"] = {
		{ 1, 8026, "", "=q1=Garrett Family Treasure", "=ds=#m3#"};
	};

	AtlasLoot_Data["UldShovelphlange"] = {
		{ 1, 9375, "", "=q3=Expert Goldminer's Helmet", "=ds=#s1#, #a2#", "", "9.30%"};
		{ 2, 9378, "", "=q3=Shovelphlange's Mining Axe", "=ds=#h1#, #w1#", "", "13.50%"};
		{ 4, 9382, "", "=q2=Tromping Miner's Boots", "=ds=#s12#, #a2#", "", "70.70%"};
	};

	AtlasLoot_Data["UldBaelog"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 9399, "", "=q2=Precision Arrow", "=ds=#e6#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 9401, "", "=q3=Nordic Longshank", "=ds=#w10#", "", "10.0%" };
	};

	AtlasLoot_Data["UldRevelosh"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 7741, "", "=q1=The Shaft of Tsol", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 9387, "", "=q2=Revelosh's Boots", "=ds=#a4#", "", "23.0%" };
    { 6, 9389, "", "=q2=Revelosh's Spaulders", "=ds=#a2#", "", "23.0%" };
    { 7, 9388, "", "=q2=Revelosh's Armguards", "=ds=#a3#", "", "21.0%" };
    { 8, 9390, "", "=q2=Revelosh's Gloves", "=ds=#a1#", "", "21.0%" };
	};

	AtlasLoot_Data["UldIronaya"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 901728, "", "=q1=Titanforged Beacon", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 9408, "", "=q3=Ironshod Bludgeon", "=ds=#w9#", "", "20.0%" };
    { 6, 9407, "", "=q3=Stoneweaver Leggings", "=ds=#a1#", "", "" };
    { 7, 9409, "", "=q3=Ironaya's Bracers", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["UldObsidianSentinel"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 8053, "", "=q1=Obsidian Power Source", "=ds=#m3#", "", "100%" };
	};

	AtlasLoot_Data["UldAncientStoneKeeper"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 9410, "", "=q3=Cragfists", "=ds=#a4#", "", "" };
    { 3, 9411, "", "=q2=Rockshard Pauldrons", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["UldGalgannFirehammer"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 11311, "", "=q2=Emberscale Cape", "=ds=#a1#", "", "40.0%" };
    { 3, 9412, "", "=q3=Galgann's Fireblaster", "=ds=#w5#", "", "" };
    { 4, 9419, "", "=q2=Galgann's Firehammer", "=ds=#w6#", "", "" };
    { 5, 11310, "", "=q3=Flameseer Mantle", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["UldTabletofWill"] = {
		{ 1, 5824, "", "=q1=Tablet of Will", "=ds=#m3#"};
	};

	AtlasLoot_Data["UldShadowforgeCache"] = {
		{ 1, 7669, "", "=q1=Shattered Necklace Ruby", "=ds=#m3#"};
	};

	AtlasLoot_Data["UldGrimlok"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 7670, "", "=q1=Shattered Necklace Sapphire", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 9416, "", "=q3=Grimlok's Charge", "=ds=#w7#", "", "20.0%" };
    { 6, 9414, "", "=q2=Oilskin Leggings", "=ds=#a2#", "", "" };
    { 7, 9415, "", "=q3=Grimlok's Tribal Vestments", "=ds=#a1#", "", "" };
	};

	AtlasLoot_Data["UldArchaedas"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 7672, "", "=q1=Shattered Necklace Power Source", "=ds=#m3#", "", "100%" };
    { 3, 901711, "", "=q1=Resonating Stone of Unity", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 57467, "", "=q2=Technique: Scroll of Arcane Resistance III", "=ds=#e2#", "", "15.0%" };
    { 7, 11118, "", "=q3=Archaedic Stone", "=ds=#e15#", "", "60.0%" };
    { 8, 9413, "", "=q3=The Rockpounder", "=ds=#w6#", "", "" };
    { 9, 9418, "", "=q3=Stoneslayer", "=ds=#w10#", "", "" };
	};

	AtlasLoot_Data["UldTrash"] = {
		{ 1, 9397, "", "=q3=Energy Cloak", "=ds=#s4#", "", "0.01%"};
		{ 2, 9431, "", "=q3=Papal Fez", "=ds=#s1#, #a1#", "", "0.01%"};
		{ 3, 9429, "", "=q3=Miner's Hat of the Deep", "=ds=#s1#, #a1#", "", "0.01%"};
		{ 4, 9420, "", "=q3=Adventurer's Pith Helmet", "=ds=#s1#, #a2#", "", "0.01%"};
		{ 5, 9406, "", "=q3=Spirewind Fetter", "=ds=#s5#, #a2#", "", "0.01%"};
		{ 6, 9428, "", "=q3=Unearthed Bands", "=ds=#s8#, #a2# =q2=#m16#", "", "0.01%"};
		{ 7, 9430, "", "=q3=Spaulders of a Lost Age", "=ds=#s3#, #a3#", "", "0.00%"};
		{ 8, 9396, "", "=q3=Legguards of the Vault", "=ds=#s11#, #a3#"};
		{ 9, 9432, "", "=q3=Skullplate Bracers", "=ds=#s8#, #a4#", "", "0.01%"};
		{ 10, 9393, "", "=q3=Beacon of Hope", "=ds=#s15#", "", "0.01%"};
		{ 12, 7666, "", "=q2=Shattered Necklace", "=q1=#m2#"};
		{ 13, 7673, "", "=q3=Talvash's Enhancing Necklace", "=q1=#m4#: =ds=#s2#"};
		{ 16, 9384, "", "=q3=Stonevault Shiv", "=ds=#h1#, #w4#", "", "0.01%"};
		{ 17, 9392, "", "=q3=Annealed Blade", "=ds=#h1#, #w10#", "", "0.01%"};
		{ 18, 9424, "", "=q3=Ginn-su Sword", "=ds=#h1#, #w10#", "", "0.01%"};
		{ 19, 9465, "", "=q3=Digmaster 5000", "=ds=#h1#, #w1#", "", "0.01%"};
		{ 20, 9383, "", "=q3=Obsidian Cleaver", "=ds=#h2#, #w1#", "", "0.01%"};
		{ 21, 9425, "", "=q3=Pendulum of Doom", "=ds=#h2#, #w1#", "", "0.01%"};
		{ 22, 9386, "", "=q3=Excavator's Brand", "=ds=#h1#, #w6#", "", "0.01%"};
		{ 23, 9427, "", "=q3=Stonevault Bonebreaker", "=ds=#h1#, #w6#", "", "0.01%"};
		{ 24, 9423, "", "=q3=The Jackhammer", "=ds=#h2#, #w6#", "", "0.01%"};
		{ 25, 9391, "", "=q3=The Shoveler", "=ds=#h2#, #w6#, =q2=#c9#", "", "0.01%"};
		{ 26, 9381, "", "=q3=Earthen Rod", "=ds=#w12#", "", "0.01%"};
		{ 27, 9426, "", "=q3=Monolithic Bow", "=ds=#w2#", "", "0.01%"};
		{ 28, 9422, "", "=q3=Shadowforge Bushmaster", "=ds=#w5#", "", "0.01%"};
	};

		-----------------------
		--- Wailing Caverns ---
		-----------------------
		
	AtlasLoot_Data["WailingCaverns1"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Mad Magglish"], "" };
    { 2, 5334, "", "=q1=99-Year-Old Port", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6="..BabbleBoss["Trigore the Lasher"], "" };
    { 5, 5425, "", "=q2=Runescale Girdle", "=ds=#a3#", "", "60.0%" };
    { 6, 5426, "", "=q3=Serpent's Kiss", "=ds=#w1#", "", "100%" };
    { 8, 0, "INV_Box_01", "=q6="..BabbleBoss["Boahn"], "" };
    { 9, 5422, "", "=q2=Brambleweed Leggings", "=ds=#a2#", "", "60.0%" };
    { 10, 5423, "", "=q3=Boahn's Fang", "=ds=#w1#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Lord Cobrahn"], "" };
    { 17, 9738, "", "=q1=Gem of Cobrahn", "=ds=#m3#", "", "100%" };
    { 18, 57476, "", "=q2=Technique: Scroll of Nature Resistance II", "=ds=#e2#", "", "15.0%" };
    { 20, 6465, "", "=q2=Robe of the Moccasin", "=ds=#a1#", "", "60.0%" };
    { 21, 6460, "", "=q3=Cobrahn's Grasp", "=ds=#a3#", "", "20.0%" };
    { 22, 10410, "", "=q3=Leggings of the Fang", "=ds=#a2#", "", "20.0%" };
    { 24, 0, "INV_Box_01", "=q6="..BabbleBoss["Lady Anacondra"], "" };
    { 25, 9739, "", "=q1=Gem of Anacondra", "=ds=#m3#", "", "100%" };
    { 26, 57466, "", "=q2=Technique: Scroll of Arcane Resistance II", "=ds=#e2#", "", "15.0%" };
    { 28, 5404, "", "=q3=Serpent's Shoulders", "=ds=#a2#", "", "80.0%" };
    { 29, 10412, "", "=q2=Belt of the Fang", "=ds=#a2#", "", "10.0%" };
    { 31, 0, "INV_Box_01", "=q6="..BabbleBoss["Kresh"], "" };
    { 32, 6443, "", "=q1=Deviate Hide", "=ds=#m3#", "", "80.0%" };
    { 34, 6447, "", "=q3=Worn Turtle Shell Shield", "=ds=#e16#", "", "90.0%" };
    { 35, 13245, "", "=q3=Kresh's Back", "=ds=#e16#", "", "10.0%" };
	};

	AtlasLoot_Data["WailingCaverns2"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Lord Pythas"], "" };
    { 2, 9740, "", "=q1=Gem of Pythas", "=ds=#m3#", "", "100%" };
    { 4, 6473, "", "=q2=Armor of the Fang", "=ds=#a2#", "", "60.0%" };
    { 5, 6472, "", "=q3=Stinging Viper", "=ds=#w6#", "", "40.0%" };
    { 7, 0, "INV_Box_01", "=q6="..BabbleBoss["Skum"], "" };
    { 8, 6443, "", "=q1=Deviate Hide", "=ds=#m3#", "", "80.0%" };
    { 10, 6448, "", "=q2=Tail Spike", "=ds=#w4#", "", "50.0%" };
    { 11, 6449, "", "=q3=Glowing Lizardscale Cloak", "=ds=#a1#", "", "50.0%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Lord Serpentis"], "" };
    { 17, 9741, "", "=q1=Gem of Serpentis", "=ds=#m3#", "", "100%" };
    { 19, 5970, "", "=q2=Serpent Gloves", "=ds=#a1#", "", "25.0%" };
    { 20, 6459, "", "=q2=Savage Trodders", "=ds=#a3#", "", "25.0%" };
    { 21, 6469, "", "=q3=Venomstrike", "=ds=#w2#", "", "25.0%" };
    { 22, 10411, "", "=q2=Footpads of the Fang", "=ds=#a2#", "", "25.0%" };
    { 24, 0, "INV_Box_01", "=q6="..BabbleBoss["Verdan the Everliving"], "" };
    { 25, 901706, "", "=q1=Everliving Spore", "=ds=#m3#", "", "100%" };
    { 26, 6443, "", "=q1=Deviate Hide", "=ds=#m3#", "", "80.0%" };
    { 27, 57476, "", "=q2=Technique: Scroll of Nature Resistance II", "=ds=#e2#", "", "15.0%" };
    { 29, 6630, "", "=q3=Seedcloud Buckler", "=ds=#e16#", "", "40.0%" };
    { 30, 6631, "", "=q3=Living Root", "=ds=#w9#", "", "40.0%" };
    { 31, 6629, "", "=q2=Sporid Cape", "=ds=#a1#", "", "20.0%" };
    { 33, 0, "INV_Box_01", "=q6="..BabbleBoss["Mutanus the Devourer"], "" };
    { 34, 10441, "", "=q1=Glowing Shard", "=ds=#m3#", "", "100%" };
    { 35, 6443, "", "=q1=Deviate Hide", "=ds=#m3#", "", "80.0%" };
    { 37, 6461, "", "=q3=Slime-encrusted Pads", "=ds=#a1#", "", "33.3%" };
    { 38, 6463, "", "=q3=Deep Fathom Ring", "=ds=#e15#", "", "33.3%" };
    { 39, 6627, "", "=q3=Mutant Scale Breastplate", "=ds=#a3#", "", "33.3%" };
    { 41, 0, "INV_Box_01", "=q6="..BabbleBoss["Deviate Faerie Dragon"], "" };
    { 42, 6443, "", "=q1=Deviate Hide", "=ds=#m3#", "", "80.0%" };
    { 44, 5243, "", "=q3=Firebelcher", "=ds=#w12#", "", "50.0%" };
    { 45, 6632, "", "=q2=Feyscale Cloak", "=ds=#a1#", "", "50.0%" };
	};

		------------------
		--- Zul'Farrak ---
		------------------

	AtlasLoot_Data["ZFAntusul"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 9523, "", "=q1=Troll Temper", "=ds=#m3#", "", "55.0%" };
    { 3, 9639, "", "=q3=The Hand of Antu'sul", "=ds=#w6#", "", "20.0%" };
    { 4, 9379, "", "=q3=Sang'thraze the Deflector", "=ds=#w10#", "", "10.0%" };
    { 5, 9640, "", "=q3=Vice Grips", "=ds=#a4#", "", "" };
    { 6, 9641, "", "=q3=Lifeblood Amulet", "=ds=#e15#", "", "" };
	};

	AtlasLoot_Data["ZFThekatheMartyr"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 10660, "", "=q1=First Mosh'aru Tablet", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 9523, "", "=q1=Troll Temper", "=ds=#m3#", "", "55.0%" };
    { 6, 57463, "", "=q2=Technique: Scroll of Frost Resistance IV", "=ds=#e2#", "", "15.0%" };
	};

	AtlasLoot_Data["ZFWitchDoctorZumrah"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 18083, "", "=q3=Jumanza Grips", "=ds=#a1#", "", "30.0%" };
    { 3, 18082, "", "=q3=Zum'rah's Vexing Cane", "=ds=#w9#", "", "15.0%" };
	};

	AtlasLoot_Data["ZFNekrumGutchewer"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 9471, "", "=q1=Nekrum's Medallion", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 9523, "", "=q1=Troll Temper", "=ds=#m3#", "", "55.0%" };
	};

	AtlasLoot_Data["ZFSezzziz"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 9470, "", "=q3=Bad Mojo Mask", "=ds=#a1#", "", "" };
    { 3, 9473, "", "=q3=Jinxed Hoodoo Skin", "=ds=#a2#", "", "" };
    { 4, 9474, "", "=q3=Jinxed Hoodoo Kilt", "=ds=#a2#", "", "" };
    { 5, 9475, "", "=q3=Diabolic Skiver", "=ds=#w7#", "", "" };
	};

	AtlasLoot_Data["ZFDustwraith"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 9523, "", "=q1=Troll Temper", "=ds=#m3#", "", "55.0%" };
    { 3, 12471, "", "=q3=Desertwalker Cane", "=ds=#e15#", "", "18.6%" };
	};

	AtlasLoot_Data["ZFSandfury"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 9523, "", "=q1=Troll Temper", "=ds=#m3#", "", "55.0%" };
	};

	AtlasLoot_Data["ZFSergeantBly"] = {
		{ 1, 8548, "", "=q1=Divino-matic Rod", "=ds=#m3#", "", "100%"};
	};

	AtlasLoot_Data["ZFHydromancerVelratha"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 9234, "", "=q1=Tiara of the Deep", "=ds=#m3#", "", "100%" };
    { 3, 10661, "", "=q1=Second Mosh'aru Tablet", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 57463, "", "=q2=Technique: Scroll of Frost Resistance IV", "=ds=#e2#", "", "15.0%" };
	};

	AtlasLoot_Data["ZFGahzrilla"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 8707, "", "=q1=Gahz'rilla's Electrified Scale", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 9467, "", "=q2=Gahz'rilla Fang", "=ds=#w4#", "", "" };
    { 6, 9469, "", "=q3=Gahz'rilla Scale Armor", "=ds=#a3#", "", "" };
	};

	AtlasLoot_Data["ZFChiefUkorzSandscalp"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 901712, "", "=q1=Sandfury War Drum", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 9523, "", "=q1=Troll Temper", "=ds=#m3#", "", "55.0%" };
    { 6, 9476, "", "=q3=Big Bad Pauldrons", "=ds=#a4#", "", "30.0%" };
    { 7, 11086, "", "=q3=Jang'thraze the Protector", "=ds=#w10#", "", "10.0%" };
    { 8, 9477, "", "=q3=The Chief's Enforcer", "=ds=#w9#", "", "" };
    { 9, 9478, "", "=q3=Ripsaw", "=ds=#w1#", "", "" };
    { 10, 9479, "", "=q3=Embrace of the Lycan", "=ds=#a2#", "", "" };
	};

	AtlasLoot_Data["ZFZerillis"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 9523, "", "=q1=Troll Temper", "=ds=#m3#", "", "55.0%" };
    { 3, 12470, "", "=q3=Sandstalker Ankleguards", "=ds=#a2#", "", "18.7%" };
	};

	AtlasLoot_Data["ZFTrash"] = {
		{ 1, 9512, "", "=q3=Blackmetal Cape", "=ds=#s4#", "", "0.02%"};
		{ 2, 9484, "", "=q3=Spellshock Leggings", "=ds=#s11#, #a1#", "", "0.01%"};
		{ 3, 862, "", "=q3=Runed Ring", "=ds=#s13# =q2=#m16#", "", "0.02%"};
		{ 4, 6440, "", "=q3=Brainlash", "=ds=#s13#", "", "0.01%"};
		{ 6, 9243, "", "=q2=Shriveled Heart", "=ds=#s2#"};
		{ 8, 9523, "", "=q1=Troll Temper", "=ds=#m3#"};
		{ 9, 9238, "", "=q1=Uncracked Scarab Shell", "=ds=#m3#"};
		{ 16, 5616, "", "=q3=Gutwrencher", "=ds=#h1#, #w4#", "", "0.01%"};
		{ 17, 9511, "", "=q3=Bloodletter Scalpel", "=ds=#h1#, #w10#", "", "0.01%"};
		{ 18, 9481, "", "=q3=The Minotaur", "=ds=#h2#, #w1#", "", "0.01%"};
		{ 19, 9480, "", "=q3=Eyegouger", "=ds=#w7#", "", "0.01%"};
		{ 20, 9482, "", "=q3=Witch Doctor's Cane", "=ds=#w9#", "", "0.01%"};
		{ 21, 9483, "", "=q3=Flaming Incinerator", "=ds=#w12#", "", "0.01%"};
		{ 22, 2040, "", "=q3=Troll Protector", "=ds=#w8#", "", "0.02%"};
	};

		-----------------
		--- Zul'Gurub ---
		-----------------

	AtlasLoot_Data["ZGJeklik"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19881, "", "=q1=Channeler's Head", "=ds=#m3#", "", "100%" };
    { 3, 57608, "", "=q3=Pattern: Drums of the Wild", "=ds=#e2#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 19915, "", "=q3=Zulian Defender", "=ds=#e16#", "", "" };
    { 7, 19918, "", "=q4=Jeklik's Crusher", "=ds=#w6#", "", "" };
    { 8, 19920, "", "=q3=Primalist's Band", "=ds=#e15#", "", "" };
    { 9, 19923, "", "=q3=Jeklik's Opaline Talisman", "=ds=#e15#", "", "" };
    { 10, 19928, "", "=q3=Animist's Spaulders", "=ds=#a2#", "", "" };
    { 11, 20262, "", "=q3=Seafury Boots", "=ds=#a3#", "", "" };
    { 12, 20265, "", "=q3=Peacekeeper Boots", "=ds=#a4#", "", "" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 22711, "", "=q3=Cloak of the Hakkari Worshippers", "=ds=#a1#", "", "10.0%" };
    { 18, 22712, "", "=q3=Might of the Tribe", "=ds=#a1#", "", "10.0%" };
    { 19, 22713, "", "=q3=Zulian Scepter of Rites", "=ds=#w6#", "", "10.0%" };
    { 20, 22714, "", "=q3=Sacrificial Gauntlets", "=ds=#a4#", "", "10.0%" };
    { 21, 22715, "", "=q3=Gloves of the Tormented", "=ds=#a3#", "", "10.0%" };
    { 22, 22716, "", "=q3=Belt of Untapped Power", "=ds=#a1#", "", "10.0%" };
    { 23, 22718, "", "=q3=Blooddrenched Mask", "=ds=#a2#", "", "10.0%" };
    { 24, 22720, "", "=q3=Zulian Headdress", "=ds=#a1#", "", "10.0%" };
    { 25, 22721, "", "=q4=Band of Servitude", "=ds=#e15#", "", "10.0%" };
    { 26, 22722, "", "=q4=Seal of the Gurubashi Berserker", "=ds=#e15#", "", "10.0%" };
	};

	AtlasLoot_Data["ZGVenoxis"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19881, "", "=q1=Channeler's Head", "=ds=#m3#", "", "100%" };
    { 3, 22216, "", "=q1=Venoxis's Venom Sac", "=ds=#m3#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 19900, "", "=q3=Zulian Stone Axe", "=ds=#w1#", "", "" };
    { 7, 19903, "", "=q4=Fang of Venoxis", "=ds=#w4#", "", "" };
    { 8, 19904, "", "=q4=Runed Bloodstained Hauberk", "=ds=#a3#", "", "" };
    { 9, 19905, "", "=q3=Zanzil's Band", "=ds=#e15#", "", "" };
    { 10, 19906, "", "=q3=Blooddrenched Footpads", "=ds=#a2#", "", "" };
    { 11, 19907, "", "=q3=Zulian Tigerhide Cloak", "=ds=#a1#", "", "" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 22711, "", "=q3=Cloak of the Hakkari Worshippers", "=ds=#a1#", "", "10.0%" };
    { 18, 22712, "", "=q3=Might of the Tribe", "=ds=#a1#", "", "10.0%" };
    { 19, 22713, "", "=q3=Zulian Scepter of Rites", "=ds=#w6#", "", "10.0%" };
    { 20, 22714, "", "=q3=Sacrificial Gauntlets", "=ds=#a4#", "", "10.0%" };
    { 21, 22715, "", "=q3=Gloves of the Tormented", "=ds=#a3#", "", "10.0%" };
    { 22, 22716, "", "=q3=Belt of Untapped Power", "=ds=#a1#", "", "10.0%" };
    { 23, 22718, "", "=q3=Blooddrenched Mask", "=ds=#a2#", "", "10.0%" };
    { 24, 22720, "", "=q3=Zulian Headdress", "=ds=#a1#", "", "10.0%" };
    { 25, 22721, "", "=q4=Band of Servitude", "=ds=#e15#", "", "10.0%" };
    { 26, 22722, "", "=q4=Seal of the Gurubashi Berserker", "=ds=#e15#", "", "10.0%" };
	};

	AtlasLoot_Data["ZGMarli"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19881, "", "=q1=Channeler's Head", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 19871, "", "=q3=Talisman of Protection", "=ds=#e15#", "", "" };
    { 6, 19919, "", "=q3=Bloodstained Greaves", "=ds=#a3#", "", "" };
    { 7, 19925, "", "=q3=Band of Jin", "=ds=#e15#", "", "" };
    { 8, 19927, "", "=q4=Mar'li's Touch", "=ds=#w12#", "", "" };
    { 9, 19930, "", "=q3=Mar'li's Eye", "=ds=#e15#", "", "" };
    { 10, 20032, "", "=q4=Flowing Ritual Robes", "=ds=#a1#", "", "" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 22711, "", "=q3=Cloak of the Hakkari Worshippers", "=ds=#a1#", "", "10.0%" };
    { 18, 22712, "", "=q3=Might of the Tribe", "=ds=#a1#", "", "10.0%" };
    { 19, 22713, "", "=q3=Zulian Scepter of Rites", "=ds=#w6#", "", "10.0%" };
    { 20, 22714, "", "=q3=Sacrificial Gauntlets", "=ds=#a4#", "", "10.0%" };
    { 21, 22715, "", "=q3=Gloves of the Tormented", "=ds=#a3#", "", "10.0%" };
    { 22, 22716, "", "=q3=Belt of Untapped Power", "=ds=#a1#", "", "10.0%" };
    { 23, 22718, "", "=q3=Blooddrenched Mask", "=ds=#a2#", "", "10.0%" };
    { 24, 22720, "", "=q3=Zulian Headdress", "=ds=#a1#", "", "10.0%" };
    { 25, 22721, "", "=q4=Band of Servitude", "=ds=#e15#", "", "10.0%" };
    { 26, 22722, "", "=q4=Seal of the Gurubashi Berserker", "=ds=#e15#", "", "10.0%" };
	};

	AtlasLoot_Data["ZGMandokir"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 22637, "", "=q3=Primal Hakkari Idol", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 19872, "", "=q4=Swift Razzashi Raptor", "=ds=#e10#", "", "2.00%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 19863, "", "=q3=Primalist's Seal", "=ds=#e15#", "", "8.33%" };
    { 18, 19866, "", "=q4=Warblade of the Hakkari", "=ds=#w10#", "", "8.33%" };
    { 19, 19867, "", "=q4=Bloodlord's Defender", "=ds=#w10#", "", "8.33%" };
    { 20, 19869, "", "=q3=Blooddrenched Grips", "=ds=#a2#", "", "8.33%" };
    { 21, 19870, "", "=q3=Hakkari Loa Cloak", "=ds=#a1#", "", "8.33%" };
    { 22, 19873, "", "=q3=Overlord's Crimson Band", "=ds=#e15#", "", "8.33%" };
    { 23, 19874, "", "=q4=Halberd of Smiting", "=ds=#w7#", "", "8.33%" };
    { 24, 19877, "", "=q3=Animist's Leggings", "=ds=#a2#", "", "8.33%" };
    { 25, 19878, "", "=q3=Bloodsoaked Pauldrons", "=ds=#a4#", "", "8.33%" };
    { 26, 19893, "", "=q3=Zanzil's Seal", "=ds=#e15#", "", "8.33%" };
    { 27, 19895, "", "=q3=Bloodtinged Kilt", "=ds=#a1#", "", "8.33%" };
    { 28, 20038, "", "=q4=Mandokir's Sting", "=ds=#w2#", "", "8.33%" };
	};

	AtlasLoot_Data["ZGEdgeofMadness"] = {
    { 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Gri'lek"], "" };
    { 2, 19961, "", "=q3=Gri'lek's Grinder", "=ds=#w6#", "", "50.0%" };
    { 3, 19962, "", "=q3=Gri'lek's Carver", "=ds=#w1#", "", "50.0%" };
    { 5, 19939, "", "=q2=Gri'lek's Blood", "=ds=#m3#", "", "100%" };
    { 7, 0, "INV_Box_01", "=q6="..BabbleBoss["Hazza'rah"], "" };
    { 8, 19967, "", "=q3=Thoughtblighter", "=ds=#w12#", "", "50.0%" };
    { 9, 19968, "", "=q3=Fiery Retributer", "=ds=#w10#", "", "50.0%" };
    { 11, 19942, "", "=q2=Hazza'rah's Dream Thread", "=ds=#m3#", "", "100%" };
    { 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Renataki"], "" };
    { 17, 19963, "", "=q3=Pitchfork of Madness", "=ds=#w7#", "", "50.0%" };
    { 18, 19964, "", "=q3=Renataki's Soul Conduit", "=ds=#w10#", "", "50.0%" };
    { 20, 19940, "", "=q2=Renataki's Tooth", "=ds=#m3#", "", "100%" };
    { 22, 0, "INV_Box_01", "=q6="..BabbleBoss["Wushoolay"], "" };
    { 23, 19965, "", "=q3=Wushoolay's Poker", "=ds=#w4#", "", "50.0%" };
    { 24, 19993, "", "=q3=Hoodoo Hunting Bow", "=ds=#w2#", "", "50.0%" };
    { 26, 19941, "", "=q2=Wushoolay's Mane", "=ds=#m3#", "", "100%" };
	};

	AtlasLoot_Data["ZGGahzranka"] = {
    { 1, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 2, 22739, "", "=q3=Tome of Polymorph: Turtle", "=ds=#e2#", "", "15.0%" };
    { 3, 19944, "", "=q4=Nat Pagle's Fish Terminator", "=ds=#w9#", "", "10.0%" };
    { 4, 19945, "", "=q4=Foror's Eyepatch", "=ds=#a2#", "", "10.0%" };
    { 5, 19946, "", "=q3=Tigule's Harpoon", "=ds=#w7#", "", "" };
    { 6, 19947, "", "=q3=Nat Pagle's Broken Reel", "=ds=#e15#", "", "" };
    { 8, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 9, 17962, "", "=q2=Blue Sack of Gems", "=ds=#e10#", "", "20.0%" };
    { 10, 17963, "", "=q2=Green Sack of Gems", "=ds=#e10#", "", "20.0%" };
    { 11, 17964, "", "=q2=Gray Sack of Gems", "=ds=#e10#", "", "20.0%" };
    { 12, 17965, "", "=q2=Yellow Sack of Gems", "=ds=#e10#", "", "20.0%" };
    { 13, 17969, "", "=q2=Red Sack of Gems", "=ds=#e10#", "", "20.0%" };
	};

	AtlasLoot_Data["ZGThekal"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19881, "", "=q1=Channeler's Head", "=ds=#m3#", "", "100%" };
    { 3, 57602, "", "=q3=Pattern: Drums of Fortitude", "=ds=#e2#", "", "100%" };
    { 5, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 6, 19902, "", "=q4=Swift Zulian Tiger", "=ds=#e10#", "", "2.00%" };
    { 7, 19896, "", "=q4=Thekal's Grasp", "=ds=#w13#", "", "" };
    { 8, 19897, "", "=q4=Betrayer's Boots", "=ds=#a1#", "", "" };
    { 9, 19898, "", "=q3=Seal of Jin", "=ds=#e15#", "", "" };
    { 10, 19899, "", "=q3=Ritualistic Legguards", "=ds=#a1#", "", "" };
    { 11, 19901, "", "=q3=Zulian Slicer", "=ds=#w10#", "", "" };
    { 12, 20260, "", "=q3=Seafury Leggings", "=ds=#a3#", "", "" };
    { 13, 20266, "", "=q3=Peacekeeper Leggings", "=ds=#a4#", "", "" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 22711, "", "=q3=Cloak of the Hakkari Worshippers", "=ds=#a1#", "", "10.0%" };
    { 18, 22712, "", "=q3=Might of the Tribe", "=ds=#a1#", "", "10.0%" };
    { 19, 22713, "", "=q3=Zulian Scepter of Rites", "=ds=#w6#", "", "10.0%" };
    { 20, 22714, "", "=q3=Sacrificial Gauntlets", "=ds=#a4#", "", "10.0%" };
    { 21, 22715, "", "=q3=Gloves of the Tormented", "=ds=#a3#", "", "10.0%" };
    { 22, 22716, "", "=q3=Belt of Untapped Power", "=ds=#a1#", "", "10.0%" };
    { 23, 22718, "", "=q3=Blooddrenched Mask", "=ds=#a2#", "", "10.0%" };
    { 24, 22720, "", "=q3=Zulian Headdress", "=ds=#a1#", "", "10.0%" };
    { 25, 22721, "", "=q4=Band of Servitude", "=ds=#e15#", "", "10.0%" };
    { 26, 22722, "", "=q4=Seal of the Gurubashi Berserker", "=ds=#e15#", "", "10.0%" };
	};

	AtlasLoot_Data["ZGArlokk"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19881, "", "=q1=Channeler's Head", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=Variable", "=q5=Chance on Drop" };
    { 5, 19909, "", "=q4=Will of Arlokk", "=ds=#w9#", "", "" };
    { 6, 19910, "", "=q4=Arlokk's Grasp", "=ds=#w13#", "", "" };
    { 7, 19912, "", "=q3=Overlord's Onyx Band", "=ds=#e15#", "", "" };
    { 8, 19913, "", "=q3=Bloodsoaked Greaves", "=ds=#a4#", "", "" };
    { 9, 19914, "", "=q3=Panther Hide Sack", "=ds=#e1#", "", "" };
    { 10, 19922, "", "=q3=Arlokk's Hoodoo Stick", "=ds=#e15#", "", "" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 22711, "", "=q3=Cloak of the Hakkari Worshippers", "=ds=#a1#", "", "10.0%" };
    { 18, 22712, "", "=q3=Might of the Tribe", "=ds=#a1#", "", "10.0%" };
    { 19, 22713, "", "=q3=Zulian Scepter of Rites", "=ds=#w6#", "", "10.0%" };
    { 20, 22714, "", "=q3=Sacrificial Gauntlets", "=ds=#a4#", "", "10.0%" };
    { 21, 22715, "", "=q3=Gloves of the Tormented", "=ds=#a3#", "", "10.0%" };
    { 22, 22716, "", "=q3=Belt of Untapped Power", "=ds=#a1#", "", "10.0%" };
    { 23, 22718, "", "=q3=Blooddrenched Mask", "=ds=#a2#", "", "10.0%" };
    { 24, 22720, "", "=q3=Zulian Headdress", "=ds=#a1#", "", "10.0%" };
    { 25, 22721, "", "=q4=Band of Servitude", "=ds=#e15#", "", "10.0%" };
    { 26, 22722, "", "=q4=Seal of the Gurubashi Berserker", "=ds=#e15#", "", "10.0%" };
	};

	AtlasLoot_Data["ZGJindo"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 22637, "", "=q3=Primal Hakkari Idol", "=ds=#e10#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 19884, "", "=q4=Jin'do's Judgement", "=ds=#w9#", "", "9.09%" };
    { 6, 19885, "", "=q4=Jin'do's Evil Eye", "=ds=#e15#", "", "9.09%" };
    { 7, 19886, "", "=q3=The Hexxer's Cover", "=ds=#a1#", "", "9.09%" };
    { 8, 19887, "", "=q3=Bloodstained Legplates", "=ds=#a3#", "", "9.09%" };
    { 9, 19888, "", "=q3=Overlord's Embrace", "=ds=#a1#", "", "9.09%" };
    { 10, 19889, "", "=q3=Blooddrenched Leggings", "=ds=#a2#", "", "9.09%" };
    { 11, 19890, "", "=q4=Jin'do's Hexxer", "=ds=#w6#", "", "9.09%" };
    { 12, 19891, "", "=q4=Jin'do's Bag of Whammies", "=ds=#e15#", "", "9.09%" };
    { 13, 19892, "", "=q3=Animist's Boots", "=ds=#a2#", "", "9.09%" };
    { 14, 19894, "", "=q3=Bloodsoaked Gauntlets", "=ds=#a4#", "", "9.09%" };
    { 15, 19929, "", "=q3=Bloodtinged Gloves", "=ds=#a1#", "", "9.09%" };
	};

	AtlasLoot_Data["ZGHakkar"] = {
    { 1, 0, "INV_Box_01", "=q6=Guaranteed", "=q5=Always Drops" };
    { 2, 19802, "", "=q4=Heart of Hakkar", "=ds=#m3#", "", "100%" };
    { 4, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 5, 19852, "", "=q4=Ancient Hakkari Manslayer", "=ds=#w1#", "", "14.3%" };
    { 6, 19853, "", "=q4=Gurubashi Dwarf Destroyer", "=ds=#w5#", "", "14.3%" };
    { 7, 19856, "", "=q4=The Eye of Hakkar", "=ds=#e15#", "", "14.3%" };
    { 8, 19857, "", "=q4=Cloak of Consumption", "=ds=#a1#", "", "14.3%" };
    { 9, 19864, "", "=q4=Bloodcaller", "=ds=#w10#", "", "14.3%" };
    { 10, 20257, "", "=q4=Seafury Gauntlets", "=ds=#a3#", "", "14.3%" };
    { 11, 20264, "", "=q4=Peacekeeper Gauntlets", "=ds=#a4#", "", "14.3%" };
    { 16, 0, "INV_Box_01", "=q6=One of the following:", "" };
    { 17, 19854, "", "=q4=Zin'rokh, Destroyer of Worlds", "=ds=#w10#", "", "14.3%" };
    { 18, 19855, "", "=q4=Bloodsoaked Legplates", "=ds=#a4#", "", "14.3%" };
    { 19, 19859, "", "=q4=Fang of the Faceless", "=ds=#w4#", "", "14.3%" };
    { 20, 19861, "", "=q4=Touch of Chaos", "=ds=#w12#", "", "14.3%" };
    { 21, 19862, "", "=q4=Aegis of the Blood God", "=ds=#e16#", "", "14.3%" };
    { 22, 19865, "", "=q4=Warblade of the Hakkari", "=ds=#w10#", "", "14.3%" };
    { 23, 19876, "", "=q4=Soul Corrupter's Necklace", "=ds=#e15#", "", "14.3%" };
	};

	AtlasLoot_Data["ZGMuddyChurningWaters"] = {
		{ 1, 19975, "", "=q1=Zulian Mudskunk", "=ds=#e21#"};
	};

	AtlasLoot_Data["ZGShared"] = {
		{ 1, 22721, "", "=q4=Band of Servitude", "=ds=#s13#"};
		{ 2, 22722, "", "=q4=Seal of the Gurubashi Berserker", "=ds=#s13#"};
		{ 4, 22711, "", "=q3=Cloak of the Hakkari Worshipers", "=ds=#s4#"};
		{ 5, 22712, "", "=q3=Might of the Tribe", "=ds=#s4#"};
		{ 6, 22720, "", "=q3=Zulian Headdress", "=ds=#s1#, #a1#"};
		{ 7, 22716, "", "=q3=Belt of Untapped Power", "=ds=#s10#, #a1#"};
		{ 8, 22718, "", "=q3=Blooddrenched Mask", "=ds=#s1#, #a2#"};
		{ 9, 22715, "", "=q3=Gloves of the Tormented", "=ds=#s9#, #a3#"};
		{ 10, 22714, "", "=q3=Sacrificial Gauntlets", "=ds=#s9#, #a4#"};
		{ 11, 22713, "", "=q3=Zulian Scepter of Rites", "=ds=#h3#, #w6#"};
	};

	AtlasLoot_Data["ZGTrash1"] = {
		{ 1, 20259, "", "=q3=Shadow Panther Hide Gloves", "=ds=#s9#, #a2#"};
		{ 2, 20261, "", "=q3=Shadow Panther Hide Belt", "=ds=#s10#, #a2#"};
		{ 3, 20263, "", "=q3=Gurubashi Helm", "=ds=#s1#, #a4#"};
		{ 4, 19908, "", "=q3=Sceptre of Smiting", "=ds=#h1#, #w6#"};
		{ 5, 19921, "", "=q3=Zulian Hacker", "=ds=#h1#, #w1#"};
		{ 6, 20258, "", "=q3=Zulian Ceremonial Staff", "=ds=#w9#"};
		{ 7, 19727, "", "=q3=Blood Scythe", "=ds=#e19#", "", "0.02%"};
		{ 8, 48126, "", "=q1=Razzashi Hatchling", "=ds=#e13#"};
		{ 10, 19726, "", "=q2=Bloodvine", "=ds=#e8#", "", ""};
		{ 11, 19774, "", "=q2=Souldarite", "=ds=#e8#", "", ""};
		{ 12, 19767, "", "=q1=Primal Bat Leather", "=ds=#e8#", "", ""};
		{ 13, 19768, "", "=q1=Primal Tiger Leather", "=ds=#e8#", "", ""};
		{ 16, 19821, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c1#", "", "0.01%"};
		{ 17, 19816, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c2#", "", "0.01%"};
		{ 18, 19818, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c3#", "", "0.01%"};
		{ 19, 19815, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c4#", "", "0.01%"};
		{ 20, 19820, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c5#", "", "0.01%"};
		{ 21, 19814, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c6#", "", "0.01%"};
		{ 22, 19817, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c7#", "", "0.01%"};
		{ 23, 19819, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c8#", "", "0.01%"};
		{ 24, 19813, "", "=q2=Punctured Voodoo Doll", "=q1=#m1# =ds=#c9#", "", "0.01%"};
		Next = "ZGTrash2";
	};

	AtlasLoot_Data["ZGTrash2"] = {
		{ 1, 19708, "", "=q3=Blue Hakkari Bijou", "=ds=#e15#", "", "1.48%"};
		{ 2, 19713, "", "=q3=Bronze Hakkari Bijou", "=ds=#e15#", "", "1.57%"};
		{ 3, 19715, "", "=q3=Gold Hakkari Bijou", "=ds=#e15#", "", "1.63%"};
		{ 4, 19711, "", "=q3=Green Hakkari Bijou", "=ds=#e15#", "", "1.67%"};
		{ 5, 19710, "", "=q3=Orange Hakkari Bijou", "=ds=#e15#", "", "1.76%"};
		{ 6, 19712, "", "=q3=Purple Hakkari Bijou", "=ds=#e15#", "", "1.67%"};
		{ 7, 19707, "", "=q3=Red Hakkari Bijou", "=ds=#e15#", "", "1.63%"};
		{ 8, 19714, "", "=q3=Silver Hakkari Bijou", "=ds=#e15#", "", "1.59%"};
		{ 9, 19709, "", "=q3=Yellow Hakkari Bijou", "=ds=#e15#", "", "1.50%"};
		{ 16, 19706, "", "=q2=Bloodscalp Coin", "=ds=#e15#", "", "3.01%"};
		{ 17, 19701, "", "=q2=Gurubashi Coin", "=ds=#e15#", "", "3.12%"};
		{ 18, 19700, "", "=q2=Hakkari Coin", "=ds=#e15#", "", "3.19%"};
		{ 19, 19699, "", "=q2=Razzashi Coin", "=ds=#e15#", "", "3.36%"};
		{ 20, 19704, "", "=q2=Sandfury Coin", "=ds=#e15#", "", "3.47%"};
		{ 21, 19705, "", "=q2=Skullsplitter Coin", "=ds=#e15#", "", "3.32%"};
		{ 22, 19702, "", "=q2=Vilebranch Coin", "=ds=#e15#", "", "3.27%"};
		{ 23, 19703, "", "=q2=Witherbark Coin", "=ds=#e15#", "", "3.27%"};
		{ 24, 19698, "", "=q2=Zulian Coin", "=ds=#e15#", "", "3.01%"};
		Prev = "ZGTrash1";
	};

	AtlasLoot_Data["ZGEnchants"] = {
		{ 1, 19790, "", "=q3=Animist's Caress", "=q1=#m1# =ds=#c1#"};
		{ 2, 19785, "", "=q3=Falcon's Call", "=q1=#m1# =ds=#c2#"};
		{ 3, 19787, "", "=q3=Presence of Sight", "=q1=#m1# =ds=#c3#"};
		{ 4, 19783, "", "=q3=Syncretist's Sigil", "=q1=#m1# =ds=#c4#"};
		{ 5, 19789, "", "=q3=Prophetic Aura", "=q1=#m1# =ds=#c5#"};
		{ 6, 19784, "", "=q3=Death's Embrace", "=q1=#m1# =ds=#c6#"};
		{ 7, 19786, "", "=q3=Vodouisant's Vigilant Embrace", "=q1=#m1# =ds=#c7#"};
		{ 8, 19788, "", "=q3=Hoodoo Hex", "=q1=#m1# =ds=#c8#"};
		{ 9, 19782, "", "=q3=Presence of Might", "=q1=#m1# =ds=#c9#"};
		{ 16, 20077, "", "=q3=Zandalar Signet of Might", "=ds=#s3# #e17#"};
		{ 17, 20076, "", "=q3=Zandalar Signet of Mojo", "=ds=#s3# #e17#"};
		{ 18, 20078, "", "=q3=Zandalar Signet of Serenity", "=ds=#s3# #e17#"};
		{ 20, 22635, "", "=q3=Savage Guard", "=ds=#s1#/#s11# #e17#"};
	};

	--------------------------
	--- Sets & Collections ---
	--------------------------

		------------------------------------
		--- Dungeon 1 and 2 Sets (D1/D2) ---
		------------------------------------

	AtlasLoot_Data["T0Druid"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#t0s1#", "=ec1=#j6#"};
		{ 2, 16720, "", "=q3=Wildheart Cowl", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "7.09%"};
		{ 3, 16718, "", "=q3=Wildheart Spaulders", "=ds="..BabbleBoss["Gizrul the Slavener"].." ("..AL["LBRS"]..")", "", "11.04%"};
		{ 4, 16706, "", "=q3=Wildheart Vest", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "7.36%"};
		{ 5, 16714, "", "=q3=Wildheart Bracers", "=ds="..AL["Trash Mobs"].." ("..AL["Strat"]..")", "", "1.85%"};
		{ 6, 16717, "", "=q3=Wildheart Gloves", "=ds="..BabbleBoss["The Unforgiven"].." ("..AL["Strat"]..")", "", "12.61%"};
		{ 7, 16716, "", "=q3=Wildheart Belt", "=ds="..AL["Trash Mobs"].." ("..AL["Scholo"]..")", "", "2.60%"};
		{ 8, 16719, "", "=q3=Wildheart Kilt", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "6.58%"};
		{ 9, 16715, "", "=q3=Wildheart Boots", "=ds="..BabbleBoss["Mother Smolderweb"].." ("..AL["LBRS"]..")", "", "13.03%"};
		{ 16, 0, "Spell_Nature_Regeneration", "=q6=#t05s1#", "=ec1=#j7#"};
		{ 17, 22109, "", "=q4=Feralheart Cowl", "=ds=#a2#, #s1#"};
		{ 18, 22112, "", "=q3=Feralheart Spaulders", "=ds=#a2#, #s3#"};
		{ 19, 22113, "", "=q4=Feralheart Vest", "=ds=#a2#, #s5#"};
		{ 20, 22108, "", "=q3=Feralheart Bracers", "=ds=#a2#, #s8#"};
		{ 21, 22110, "", "=q4=Feralheart Gloves", "=ds=#a2#, #s9#"};
		{ 22, 22106, "", "=q3=Feralheart Belt", "=ds=#a2#, #s10#"};
		{ 23, 22111, "", "=q3=Feralheart Kilt", "=ds=#a2#, #s11#"};
		{ 24, 22107, "", "=q4=Feralheart Boots", "=ds=#a2#, #s12#"};
		Next = "T1T2Druid";
		Back = "T0SET";
	};

	AtlasLoot_Data["T0Hunter"] = {
		{ 1, 0, "Ability_Hunter_RunningShot", "=q6=#t0s2#", "=ec1=#j6#"};
		{ 2, 16677, "", "=q3=Beaststalker's Cap", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "7.00%"};
		{ 3, 16679, "", "=q3=Beaststalker's Mantle", "=ds="..BabbleBoss["Overlord Wyrmthalak"].." ("..AL["LBRS"]..")", "", "9.89%"};
		{ 4, 16674, "", "=q3=Beaststalker's Tunic", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "6.81%"};
		{ 5, 16681, "", "=q3=Beaststalker's Bindings", "=ds="..AL["Trash Mobs"].." ("..AL["Strat"]..")", "", "1.64%"};
		{ 6, 16676, "", "=q3=Beaststalker's Gloves", "=ds="..BabbleBoss["War Master Voone"].." ("..AL["LBRS"]..")", "", "9.15%"};
		{ 7, 16680, "", "=q3=Beaststalker's Belt", "=ds="..AL["Trash Mobs"].." ("..AL["LBRS"]..")", "", "1.36%"};
		{ 8, 16678, "", "=q3=Beaststalker's Pants", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "6.16%"};
		{ 9, 16675, "", "=q3=Beaststalker's Boots", "=ds="..BabbleBoss["Nerub'enkan"].." ("..AL["Strat"]..")", "", "13.62%"};
		{ 16, 0, "Ability_Hunter_RunningShot", "=q6=#t05s2#", "=ec1=#j7#"};
		{ 17, 22013, "", "=q4=Beastmaster's Cap", "=ds=#a3#, #s1#"};
		{ 18, 22016, "", "=q3=Beastmaster's Mantle", "=ds=#a3#, #s3#"};
		{ 19, 22060, "", "=q4=Beastmaster's Tunic", "=ds=#a3#, #s5#"};
		{ 20, 22011, "", "=q3=Beastmaster's Bindings", "=ds=#a3#, #s8#"};
		{ 21, 22015, "", "=q4=Beastmaster's Gloves", "=ds=#a3#, #s9#"};
		{ 22, 22010, "", "=q3=Beastmaster's Belt", "=ds=#a3#, #s10#"};
		{ 23, 22017, "", "=q3=Beastmaster's Pants", "=ds=#a3#, #s11#"};
		{ 24, 22061, "", "=q4=Beastmaster's Boots", "=ds=#a3#, #s12#"};
		Next = "T1T2Hunter";
		Back = "T0SET";
	};

	AtlasLoot_Data["T0Mage"] = {
		{ 1, 0, "Spell_Frost_IceStorm", "=q6=#t0s3#", "=ec1=#j6#"};
		{ 2, 16686, "", "=q3=Magister's Crown", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "8.60%"};
		{ 3, 16689, "", "=q3=Magister's Mantle", "=ds="..BabbleBoss["Ras Frostwhisper"].." ("..AL["Scholo"]..")", "", "11.93%"};
		{ 4, 16688, "", "=q3=Magister's Robes", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "7.24%"};
		{ 5, 16683, "", "=q3=Magister's Bindings", "=ds="..AL["Trash Mobs"].." ("..AL["LBRS"]..")", "", "1.19%"};
		{ 6, 16684, "", "=q3=Magister's Gloves", "=ds="..BabbleBoss["Doctor Theolen Krastinov"].." ("..AL["Scholo"]..")", "", "9.75%"};
		{ 7, 16685, "", "=q3=Magister's Belt", "=ds="..AL["Trash Mobs"].." ("..AL["Strat"]..")", "", "1.32%"};
		{ 8, 16687, "", "=q3=Magister's Leggings", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "6.79%"};
		{ 9, 16682, "", "=q3=Magister's Boots", "=ds="..BabbleBoss["Hearthsinger Forresten"].." ("..AL["Strat"]..")", "", "10.86%"};
		{ 16, 0, "Spell_Frost_IceStorm", "=q6=#t05s3#", "=ec1=#j7#"};
		{ 17, 22065, "", "=q4=Sorcerer's Crown", "=ds=#a1#, #s1#"};
		{ 18, 22068, "", "=q3=Sorcerer's Mantle", "=ds=#a1#, #s3#"};
		{ 19, 22069, "", "=q4=Sorcerer's Robes", "=ds=#a1#, #s5#"};
		{ 20, 22063, "", "=q3=Sorcerer's Bindings", "=ds=#a1#, #s8#"};
		{ 21, 22066, "", "=q4=Sorcerer's Gloves", "=ds=#a1#, #s9#"};
		{ 22, 22062, "", "=q3=Sorcerer's Belt", "=ds=#a1#, #s10#"};
		{ 23, 22067, "", "=q3=Sorcerer's Leggings", "=ds=#a1#, #s11#"};
		{ 24, 22064, "", "=q4=Sorcerer's Boots", "=ds=#a1#, #s12#"};
		Next = "T1T2Mage";
		Back = "T0SET";
	};

	AtlasLoot_Data["T0Paladin"] = {
		{ 1, 0, "Spell_Holy_SealOfMight", "=q6=#t0s4#", "=ec1=#j6#"};
		{ 2, 16727, "", "=q3=Lightforge Helm", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "5.32%"};
		{ 3, 16729, "", "=q3=Lightforge Spaulders", "=ds="..BabbleBoss["The Beast"].." ("..AL["UBRS"]..")", "", "13.62%"};
		{ 4, 16726, "", "=q3=Lightforge Breastplate", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "3.76%"};
		{ 5, 16722, "", "=q3=Lightforge Bracers", "=ds="..AL["Trash Mobs"].." ("..AL["Scholo"]..")", "", "3.37%"};
		{ 6, 16724, "", "=q3=Lightforge Gauntlets", "=ds="..BabbleBoss["Timmy the Cruel"].." ("..AL["Strat"]..")", "", "10.42%"};
		{ 7, 16723, "", "=q3=Lightforge Belt", "=ds="..AL["Trash Mobs"].." ("..AL["Strat"]..")", "", "1.93%"};
		{ 8, 16728, "", "=q3=Lightforge Legplates", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "4.20%"};
		{ 9, 16725, "", "=q3=Lightforge Boots", "=ds="..BabbleBoss["Balnazzar"].." ("..AL["Strat"]..")", "", "11.11%"};
		{ 16, 0, "Spell_Holy_SealOfMight", "=q6=#t05s4#", "=ec1=#j7#"};
		{ 17, 22091, "", "=q4=Soulforge Helm", "=ds=#a4#, #s1#"};
		{ 18, 22093, "", "=q3=Soulforge Spaulders", "=ds=#a4#, #s3#"};
		{ 19, 22089, "", "=q4=Soulforge Breastplate", "=ds=#a4#, #s5#"};
		{ 20, 22088, "", "=q3=Soulforge Bracers", "=ds=#a4#, #s8#"};
		{ 21, 22090, "", "=q4=Soulforge Gauntlets", "=ds=#a4#, #s9#"};
		{ 22, 22086, "", "=q3=Soulforge Belt", "=ds=#a4#, #s10#"};
		{ 23, 22092, "", "=q3=Soulforge Legplates", "=ds=#a4#, #s11#"};
		{ 24, 22087, "", "=q4=Soulforge Boots", "=ds=#a4#, #s12#"};
		Next = "T1T2Paladin";
		Back = "T0SET";
	};

	AtlasLoot_Data["T0Priest"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#t0s5#", "=ec1=#j6#"};
		{ 2, 16693, "", "=q3=Devout Crown", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "7.89%"};
		{ 3, 16695, "", "=q3=Devout Mantle", "=ds="..BabbleBoss["Solakar Flamewreath"].." ("..AL["UBRS"]..")", "", "12.84%"};
		{ 4, 16690, "", "=q3=Devout Robe", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "6.20%"};
		{ 5, 16697, "", "=q3=Devout Bracers", "=ds="..AL["Trash Mobs"].." ("..AL["Strat"]..")", "", "1.13%"};
		{ 6, 16692, "", "=q3=Devout Gloves", "=ds="..BabbleBoss["Archivist Galford"].." ("..AL["Strat"]..")", "", "12.46%"};
		{ 7, 16696, "", "=q3=Devout Belt", "=ds="..AL["Trash Mobs"].." ("..AL["LBRS"]..")", "", "2.07%"};
		{ 8, 16694, "", "=q3=Devout Skirt", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "7.42%"};
		{ 9, 16691, "", "=q3=Devout Sandals", "=ds="..BabbleBoss["Maleki the Pallid"].." ("..AL["Strat"]..")", "", "13.64%"};
		{ 16, 0, "Spell_Holy_PowerWordShield", "=q6=#t05s5#", "=ec1=#j7#"};
		{ 17, 22080, "", "=q4=Virtuous Crown", "=ds=#a1#, #s1#"};
		{ 18, 22082, "", "=q3=Virtuous Mantle", "=ds=#a1#, #s3#"};
		{ 19, 22083, "", "=q4=Virtuous Robe", "=ds=#a1#, #s5#"};
		{ 20, 22079, "", "=q3=Virtuous Bracers", "=ds=#a1#, #s8#"};
		{ 21, 22081, "", "=q4=Virtuous Gloves", "=ds=#a1#, #s9#"};
		{ 22, 22078, "", "=q3=Virtuous Belt", "=ds=#a1#, #s10#"};
		{ 23, 22085, "", "=q3=Virtuous Skirt", "=ds=#a1#, #s11#"};
		{ 24, 22084, "", "=q4=Virtuous Sandals", "=ds=#a1#, #s12#"};
		Next = "T1T2Priest";
		Back = "T0SET";
	};

	AtlasLoot_Data["T0Rogue"] = {
		{ 1, 0, "Ability_BackStab", "=q6=#t0s6#", "=ec1=#j6#"};
		{ 2, 16707, "", "=q3=Shadowcraft Cap", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "6.65%"};
		{ 3, 16708, "", "=q3=Shadowcraft Spaulders", "=ds="..BabbleBoss["Cannon Master Willey"].." ("..AL["Strat"]..")", "", "10.68%"};
		{ 4, 16721, "", "=q3=Shadowcraft Tunic", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "6.09%"};
		{ 5, 16710, "", "=q3=Shadowcraft Bracers", "=ds="..AL["Trash Mobs"].." ("..AL["Scholo"]..")", "", "3.51%"};
		{ 6, 16712, "", "=q3=Shadowcraft Gloves", "=ds="..BabbleBoss["Shadow Hunter Vosh'gajin"].." ("..AL["LBRS"]..")", "", "11.89%"};
		{ 7, 16713, "", "=q3=Shadowcraft Belt", "=ds="..AL["Trash Mobs"].." ("..AL["LBRS"]..")", "", "1.05%"};
		{ 8, 16709, "", "=q3=Shadowcraft Pants", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "7.76%"};
		{ 9, 16711, "", "=q3=Shadowcraft Boots", "=ds="..BabbleBoss["Rattlegore"].." ("..AL["Scholo"]..")", "", "14.32%"};
		{ 16, 0, "Ability_BackStab", "=q6=#t05s6#", "=ec1=#j7#"};
		{ 17, 22005, "", "=q4=Darkmantle Cap", "=ds=#a2#, #s1#"};
		{ 18, 22008, "", "=q3=Darkmantle Spaulders", "=ds=#a2#, #s3#"};
		{ 19, 22009, "", "=q4=Darkmantle Tunic", "=ds=#a2#, #s5#"};
		{ 20, 22004, "", "=q3=Darkmantle Bracers", "=ds=#a2#, #s8#"};
		{ 21, 22006, "", "=q4=Darkmantle Gloves", "=ds=#a2#, #s9#"};
		{ 22, 22002, "", "=q3=Darkmantle Belt", "=ds=#a2#, #s10#"};
		{ 23, 22007, "", "=q3=Darkmantle Pants", "=ds=#a2#, #s11#"};
		{ 24, 22003, "", "=q4=Darkmantle Boots", "=ds=#a2#, #s12#"};
		Next = "T1T2Rogue";
		Back = "T0SET";
	};

	AtlasLoot_Data["T0Shaman"] = {
		{ 1, 0, "Spell_FireResistanceTotem_01", "=q6=#t0s7#", "=ec1=#j6#"};
		{ 2, 16667, "", "=q3=Coif of Elements", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "2.86%"};
		{ 3, 16669, "", "=q3=Pauldrons of Elements", "=ds="..BabbleBoss["Gyth"].." ("..AL["UBRS"]..")", "", "14.77%"};
		{ 4, 16666, "", "=q3=Vest of Elements", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "3.03%"};
		{ 5, 16671, "", "=q3=Bindings of Elements", "=ds="..AL["Trash Mobs"].." ("..AL["Strat"]..")", "", "1.59%"};
		{ 6, 16672, "", "=q3=Gauntlets of Elements", "=ds="..BabbleBoss["Pyroguard Emberseer"].." ("..AL["UBRS"]..")", "", "14.23%"};
		{ 7, 16673, "", "=q3=Cord of Elements", "=ds="..AL["Trash Mobs"].." ("..AL["LBRS"]..")", "", "1.06%"};
		{ 8, 16668, "", "=q3=Kilt of Elements", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "3.02%"};
		{ 9, 16670, "", "=q3=Boots of Elements", "=ds="..BabbleBoss["Highlord Omokk"].." ("..AL["LBRS"]..")", "", "9.35%"};
		{ 16, 0, "Spell_FireResistanceTotem_01", "=q6=#t05s7#", "=ec1=#j7#"};
		{ 17, 22097, "", "=q4=Coif of The Five Thunders", "=ds=#a3#, #s1#"};
		{ 18, 22101, "", "=q3=Pauldrons of The Five Thunders", "=ds=#a3#, #s3#"};
		{ 19, 22102, "", "=q4=Vest of The Five Thunders", "=ds=#a3#, #s5#"};
		{ 20, 22095, "", "=q3=Bindings of The Five Thunders", "=ds=#a3#, #s8#"};
		{ 21, 22099, "", "=q4=Gauntlets of The Five Thunders", "=ds=#a3#, #s9#"};
		{ 22, 22098, "", "=q3=Cord of The Five Thunders", "=ds=#a3#, #s10#"};
		{ 23, 22100, "", "=q3=Kilt of The Five Thunders", "=ds=#a3#, #s11#"};
		{ 24, 22096, "", "=q4=Boots of The Five Thunders", "=ds=#a3#, #s12#"};
		Next = "T1T2Shaman";
		Back = "T0SET";
	};

	AtlasLoot_Data["T0Warlock"] = {
		{ 1, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t0s8#", "=ec1=#j6#"};
		{ 2, 16698, "", "=q3=Dreadmist Mask", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "8.78%"};
		{ 3, 16701, "", "=q3=Dreadmist Mantle", "=ds="..BabbleBoss["Jandice Barov"].." ("..AL["Scholo"]..")", "", "12.20%"};
		{ 4, 16700, "", "=q3=Dreadmist Robe", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "8.04%"};
		{ 5, 16703, "", "=q3=Dreadmist Bracers", "=ds="..AL["Trash Mobs"].." ("..AL["LBRS"]..")", "", "1.68%"};
		{ 6, 16705, "", "=q3=Dreadmist Wraps", "=ds="..BabbleBoss["Lorekeeper Polkelt"].." ("..AL["Scholo"]..")", "", "14.54%"};
		{ 7, 16702, "", "=q3=Dreadmist Belt", "=ds="..AL["Trash Mobs"].." ("..AL["Strat"]..")", "", "1.03%"};
		{ 8, 16699, "", "=q3=Dreadmist Leggings", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "7.31%"};
		{ 9, 16704, "", "=q3=Dreadmist Sandals", "=ds="..BabbleBoss["Baroness Anastari"].." ("..AL["Strat"]..")", "", "13.16%"};
		{ 16, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t05s8#", "=ec1=#j7#"};
		{ 17, 22074, "", "=q4=Deathmist Mask", "=ds=#a1#, #s1#"};
		{ 18, 22073, "", "=q3=Deathmist Mantle", "=ds=#a1#, #s5#"};
		{ 19, 22075, "", "=q4=Deathmist Robe", "=ds=#a1#, #s3#"};
		{ 20, 22071, "", "=q3=Deathmist Bracers", "=ds=#a1#, #s8#"};
		{ 21, 22077, "", "=q4=Deathmist Wraps", "=ds=#a1#, #s9#"};
		{ 22, 22070, "", "=q3=Deathmist Belt", "=ds=#a1#, #s10#"};
		{ 23, 22072, "", "=q3=Deathmist Leggings", "=ds=#a1#, #s11#"};
		{ 24, 22076, "", "=q4=Deathmist Sandals", "=ds=#a1#, #s12#"};
		Next = "T1T2Warlock";
		Back = "T0SET";
	};

	AtlasLoot_Data["T0Warrior"] = {
		{ 1, 0, "INV_Shield_05", "=q6=#t0s9#", "=ec1=#j6#"};
		{ 2, 16731, "", "=q3=Helm of Valor", "=ds="..BabbleBoss["Darkmaster Gandling"].." ("..AL["Scholo"]..")", "", "6.54%"};
		{ 3, 16733, "", "=q3=Spaulders of Valor", "=ds="..BabbleBoss["Warchief Rend Blackhand"].." ("..AL["UBRS"]..")", "", "13.39%"};
		{ 4, 16730, "", "=q3=Breastplate of Valor", "=ds="..BabbleBoss["General Drakkisath"].." ("..AL["UBRS"]..")", "", "5.83%"};
		{ 5, 16735, "", "=q3=Bracers of Valor", "=ds="..AL["Trash Mobs"].." ("..AL["LBRS"]..")", "", "1.49%"};
		{ 6, 16737, "", "=q3=Gauntlets of Valor", "=ds="..BabbleBoss["Ramstein the Gorger"].." ("..AL["Strat"]..")", "", "9.58%"};
		{ 7, 16736, "", "=q3=Belt of Valor", "=ds="..AL["Trash Mobs"].." ("..AL["LBRS"]..")", "", "1.96%"};
		{ 8, 16732, "", "=q3=Legplates of Valor", "=ds="..BabbleBoss["Baron Rivendare"].." ("..AL["Strat"]..")", "", "5.74%"};
		{ 9, 16734, "", "=q3=Boots of Valor", "=ds="..BabbleBoss["Kirtonos the Herald"].." ("..AL["Scholo"]..")", "", "11.12%"};
		{ 16, 0, "INV_Shield_05", "=q6=#t05s9#", "=ec1=#j7#"};
		{ 17, 21999, "", "=q4=Helm of Heroism", "=ds=#a4#, #s1#"};
		{ 18, 22001, "", "=q3=Spaulders of Heroism", "=ds=#a4#, #s3#"};
		{ 19, 21997, "", "=q4=Breastplate of Heroism", "=ds=#a4#, #s5#"};
		{ 20, 21996, "", "=q3=Bracers of Heroism", "=ds=#a4#, #s8#"};
		{ 21, 21998, "", "=q4=Gauntlets of Heroism", "=ds=#a4#, #s9#"};
		{ 22, 21994, "", "=q3=Belt of Heroism", "=ds=#a4#, #s10#"};
		{ 23, 22000, "", "=q3=Legplates of Heroism", "=ds=#a4#, #s11#"};
		{ 24, 21995, "", "=q4=Boots of Heroism", "=ds=#a4#, #s12#"};
		Next = "T1T2Warrior";
		Back = "T0SET";
	};

		-----------------------------
		--- Tier 1/2 Sets (T1/T2) ---
		-----------------------------

	AtlasLoot_Data["T1T2Druid"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#t1s1#", "=ec1=#m30#"};
		{ 2, 16834, "", "=q4=Cenarion Helm", "=ds="..BabbleBoss["Garr"], "", "11.51%"};
		{ 3, 16836, "", "=q4=Cenarion Spaulders", "=ds="..BabbleBoss["Baron Geddon"], "", "19.52%"};
		{ 4, 16833, "", "=q4=Cenarion Vestments", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "15.21%"};
		{ 5, 16830, "", "=q4=Cenarion Bracers", "=ds="..AL["Trash Mobs"], "", "0.17%"};
		{ 6, 16831, "", "=q4=Cenarion Gloves", "=ds="..BabbleBoss["Shazzrah"], "", "19.53%"};
		{ 7, 16828, "", "=q4=Cenarion Belt", "=ds="..AL["Trash Mobs"], "", "0.16%"};
		{ 8, 16835, "", "=q4=Cenarion Leggings", "=ds="..BabbleBoss["Magmadar"], "", "12.90%"};
		{ 9, 16829, "", "=q4=Cenarion Boots", "=ds="..BabbleBoss["Lucifron"], "", "10.72%"};
		{ 16, 0, "Spell_Nature_Regeneration", "=q6=#t2s1#", "=ec1=#m31#"};
		{ 17, 16900, "", "=q4=Stormrage Cover", "=ds="..BabbleBoss["Nefarian"], "", "13.08%"};
		{ 18, 16902, "", "=q4=Stormrage Pauldrons", "=ds="..BabbleBoss["Chromaggus"], "", "14.63%"};
		{ 19, 16897, "", "=q4=Stormrage Chestguard", "=ds="..BabbleBoss["Nefarian"], "", "11.89%"};
		{ 20, 16904, "", "=q4=Stormrage Bracers", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "17.38%"};
		{ 21, 16899, "", "=q4=Stormrage Handguards", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "5.34%"};
		{ 22, 16903, "", "=q4=Stormrage Belt", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "16.90%"};
		{ 23, 16901, "", "=q4=Stormrage Legguards", "=ds="..BabbleBoss["Ragnaros"], "", "15.49%"};
		{ 24, 16898, "", "=q4=Stormrage Boots", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "13.79%"};
		Prev = "T0Druid";
		Next = "T3Druid";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T1T2Hunter"] = {
		{ 1, 0, "Ability_Hunter_RunningShot", "=q6=#t1s2#", "=ec1=#m30#"};
		{ 2, 16846, "", "=q4=Giantstalker's Helmet", "=ds="..BabbleBoss["Garr"], "", "11.57%"};
		{ 3, 16848, "", "=q4=Giantstalker's Epaulets", "=ds="..BabbleBoss["Sulfuron Harbinger"], "", "19.64%"};
		{ 4, 16845, "", "=q4=Giantstalker's Breastplate", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "15.83%"};
		{ 5, 16850, "", "=q4=Giantstalker's Bracers", "=ds="..AL["Trash Mobs"], "", "0.18%"};
		{ 6, 16852, "", "=q4=Giantstalker's Gloves", "=ds="..BabbleBoss["Shazzrah"], "", "18.58%"};
		{ 7, 16851, "", "=q4=Giantstalker's Belt", "=ds="..AL["Trash Mobs"], "", "0.17%"};
		{ 8, 16847, "", "=q4=Giantstalker's Leggings", "=ds="..BabbleBoss["Magmadar"], "", "13.28%"};
		{ 9, 16849, "", "=q4=Giantstalker's Boots", "=ds="..BabbleBoss["Gehennas"], "", "14.54%"};
		{ 16, 0, "Ability_Hunter_RunningShot", "=q6=#t2s2#", "=ec1=#m31#"};
		{ 17, 16939, "", "=q4=Dragonstalker's Helm", "=ds="..BabbleBoss["Nefarian"], "", "13.91%"};
		{ 18, 16937, "", "=q4=Dragonstalker's Spaulders", "=ds="..BabbleBoss["Chromaggus"], "", "16.20%"};
		{ 19, 16942, "", "=q4=Dragonstalker's Breastplate", "=ds="..BabbleBoss["Nefarian"], "", "13.30%"};
		{ 20, 16935, "", "=q4=Dragonstalker's Bracers", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "19.13%"};
		{ 21, 16940, "", "=q4=Dragonstalker's Gauntlets", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "6.13%"};
		{ 22, 16936, "", "=q4=Dragonstalker's Belt", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "20.17%"};
		{ 23, 16938, "", "=q4=Dragonstalker's Legguards", "=ds="..BabbleBoss["Ragnaros"], "", "16.02%"};
		{ 24, 16941, "", "=q4=Dragonstalker's Greaves", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "17.78%"};
		Prev = "T0Hunter";
		Next = "T3Hunter";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T1T2Mage"] = {
		{ 1, 0, "Spell_Frost_IceStorm", "=q6=#t1s3#", "=ec1=#m30#"};
		{ 2, 16795, "", "=q4=Arcanist Crown", "=ds="..BabbleBoss["Garr"], "", "11.31%"};
		{ 3, 16797, "", "=q4=Arcanist Mantle", "=ds="..BabbleBoss["Baron Geddon"], "", "19.92%"};
		{ 4, 16798, "", "=q4=Arcanist Robes", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "16.51%"};
		{ 5, 16799, "", "=q4=Arcanist Bindings", "=ds="..AL["Trash Mobs"], "", "0.16%"};
		{ 6, 16801, "", "=q4=Arcanist Gloves", "=ds="..BabbleBoss["Shazzrah"], "", "19.59%"};
		{ 7, 16802, "", "=q4=Arcanist Belt", "=ds="..AL["Trash Mobs"], "", "0.16%"};
		{ 8, 16796, "", "=q4=Arcanist Leggings", "=ds="..BabbleBoss["Magmadar"], "", "14.57%"};
		{ 9, 16800, "", "=q4=Arcanist Boots", "=ds="..BabbleBoss["Lucifron"], "", "12.06%"};
		{ 16, 0, "Spell_Frost_IceStorm", "=q6=#t2s3#", "=ec1=#m31#"};
		{ 17, 16914, "", "=q4=Netherwind Crown", "=ds="..BabbleBoss["Nefarian"], "", "14.09%"};
		{ 18, 16917, "", "=q4=Netherwind Mantle", "=ds="..BabbleBoss["Chromaggus"], "", "18.09%"};
		{ 19, 16916, "", "=q4=Netherwind Robes", "=ds="..BabbleBoss["Nefarian"], "", "14.03%"};
		{ 20, 16918, "", "=q4=Netherwind Bindings", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "20.41%"};
		{ 21, 16913, "", "=q4=Netherwind Gloves", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "7.37%"};
		{ 22, 16818, "", "=q4=Netherwind Belt", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "19.94%"};
		{ 23, 16915, "", "=q4=Netherwind Pants", "=ds="..BabbleBoss["Ragnaros"], "", "17.37%"};
		{ 24, 16912, "", "=q4=Netherwind Boots", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "17.17%"};
		Prev = "T0Mage";
		Next = "T3Mage";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T1T2Paladin"] = {
		{ 1, 0, "Spell_Holy_SealOfMight", "=q6=#t1s4#", "=ec1=#m30#"};
		{ 2, 16854, "", "=q4=Lawbringer Helm", "=ds="..BabbleBoss["Garr"], "", "7.23%"};
		{ 3, 16856, "", "=q4=Lawbringer Spaulders", "=ds="..BabbleBoss["Baron Geddon"], "", "12.62%"};
		{ 4, 16853, "", "=q4=Lawbringer Chestguard", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "9.53%"};
		{ 5, 16857, "", "=q4=Lawbringer Bracers", "=ds="..AL["Trash Mobs"], "", "0.11%"};
		{ 6, 16860, "", "=q4=Lawbringer Gauntlets", "=ds="..BabbleBoss["Gehennas"], "", "11.77%"};
		{ 7, 16858, "", "=q4=Lawbringer Belt", "=ds="..AL["Trash Mobs"], "", "0.10%"};
		{ 8, 16855, "", "=q4=Lawbringer Legplates", "=ds="..BabbleBoss["Magmadar"], "", "8.54%"};
		{ 9, 16859, "", "=q4=Lawbringer Boots", "=ds="..BabbleBoss["Lucifron"], "", "7.20%"};
		{ 16, 0, "Spell_Holy_SealOfMight", "=q6=#t2s4#", "=ec1=#m31#"};
		{ 17, 16955, "", "=q4=Judgement Crown", "=ds="..BabbleBoss["Nefarian"], "", "8.64%"};
		{ 18, 16953, "", "=q4=Judgement Spaulders", "=ds="..BabbleBoss["Chromaggus"], "", "10.97%"};
		{ 19, 16958, "", "=q4=Judgement Breastplate", "=ds="..BabbleBoss["Nefarian"], "", "9.24%"};
		{ 20, 16951, "", "=q4=Judgement Bindings", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "13.61%"};
		{ 21, 16956, "", "=q4=Judgement Gauntlets", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "3.58%"};
		{ 22, 16952, "", "=q4=Judgement Belt", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "12.23%"};
		{ 23, 16954, "", "=q4=Judgement Legplates", "=ds="..BabbleBoss["Ragnaros"], "", "10.81%"};
		{ 24, 16957, "", "=q4=Judgement Sabatons", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "11.28%"};
		Prev = "T0Paladin";
		Next = "T3Paladin";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T1T2Priest"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#t1s5#", "=ec1=#m30#"};
		{ 2, 16813, "", "=q4=Circlet of Prophecy", "=ds="..BabbleBoss["Garr"], "", "11.36%"};
		{ 3, 16816, "", "=q4=Mantle of Prophecy", "=ds="..BabbleBoss["Sulfuron Harbinger"], "", "21.06%"};
		{ 4, 16815, "", "=q4=Robes of Prophecy", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "15.65%"};
		{ 5, 16819, "", "=q4=Vambraces of Prophecy", "=ds="..AL["Trash Mobs"], "", "0.16%"};
		{ 6, 16812, "", "=q4=Gloves of Prophecy", "=ds="..BabbleBoss["Gehennas"], "", "18.65%"};
		{ 7, 16817, "", "=q4=Girdle of Prophecy", "=ds="..AL["Trash Mobs"], "", "0.18%"};
		{ 8, 16814, "", "=q4=Pants of Prophecy", "=ds="..BabbleBoss["Magmadar"], "", "14.33%"};
		{ 9, 16811, "", "=q4=Boots of Prophecy", "=ds="..BabbleBoss["Shazzrah"], "", "14.90%"};
		{ 16, 0, "Spell_Holy_PowerWordShield", "=q6=#t2s5#", "=ec1=#m31#"};
		{ 17, 16921, "", "=q4=Halo of Transcendence", "=ds="..BabbleBoss["Nefarian"], "", "13.39%"};
		{ 18, 16924, "", "=q4=Pauldrons of Transcendence", "=ds="..BabbleBoss["Chromaggus"], "", "17.83%"};
		{ 19, 16923, "", "=q4=Robes of Transcendence", "=ds="..BabbleBoss["Nefarian"], "", "14.83%"};
		{ 20, 16926, "", "=q4=Bindings of Transcendence", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "20.37%"};
		{ 21, 16920, "", "=q4=Handguards of Transcendence", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "6.01%"};
		{ 22, 16925, "", "=q4=Belt of Transcendence", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "18.76%"};
		{ 23, 16922, "", "=q4=Leggings of Transcendence", "=ds="..BabbleBoss["Ragnaros"], "", "17.30%"};
		{ 24, 16919, "", "=q4=Boots of Transcendence", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "14.61%"};
		Prev = "T0Priest";
		Next = "T3Priest";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T1T2Rogue"] = {
		{ 1, 0, "Ability_BackStab", "=q6=#t1s6#", "=ec1=#m30#"};
		{ 2, 16821, "", "=q4=Nightslayer Cover", "=ds="..BabbleBoss["Garr"], "", "10.38%"};
		{ 3, 16823, "", "=q4=Nightslayer Shoulder Pads", "=ds="..BabbleBoss["Sulfuron Harbinger"], "", "20.66%"};
		{ 4, 16820, "", "=q4=Nightslayer Chestpiece", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "16.76%"};
		{ 5, 16825, "", "=q4=Nightslayer Bracelets", "=ds="..AL["Trash Mobs"], "", "0.17%"};
		{ 6, 16826, "", "=q4=Nightslayer Gloves", "=ds="..BabbleBoss["Gehennas"], "", "19.47%"};
		{ 7, 16827, "", "=q4=Nightslayer Belt", "=ds="..AL["Trash Mobs"], "", "0.15%"};
		{ 8, 16822, "", "=q4=Nightslayer Pants", "=ds="..BabbleBoss["Magmadar"], "", "13.83%"};
		{ 9, 16824, "", "=q4=Nightslayer Boots", "=ds="..BabbleBoss["Shazzrah"], "", "15.58%"};
		{ 16, 0, "Ability_BackStab", "=q6=#t2s6#", "=ec1=#m31#"};
		{ 17, 16908, "", "=q4=Bloodfang Hood", "=ds="..BabbleBoss["Nefarian"], "", "13.21%"};
		{ 18, 16832, "", "=q4=Bloodfang Spaulders", "=ds="..BabbleBoss["Chromaggus"], "", "17.03%"};
		{ 19, 16905, "", "=q4=Bloodfang Chestpiece", "=ds="..BabbleBoss["Nefarian"], "", "14.21%"};
		{ 20, 16911, "", "=q4=Bloodfang Bracers", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "20.69%"};
		{ 21, 16907, "", "=q4=Bloodfang Gloves", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "6.84%"};
		{ 22, 16910, "", "=q4=Bloodfang Belt", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "19.69%"};
		{ 23, 16909, "", "=q4=Bloodfang Pants", "=ds="..BabbleBoss["Ragnaros"], "", "17.18%"};
		{ 24, 16906, "", "=q4=Bloodfang Boots", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "15.66%"};
		Prev = "T0Rogue";
		Next = "T3Rogue";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T1T2Shaman"] = {
		{ 1, 0, "Spell_FireResistanceTotem_01", "=q6=#t1s7#", "=ec1=#m30#"};
		{ 2, 16842, "", "=q4=Earthfury Helmet", "=ds="..BabbleBoss["Garr"], "", "3.91%"};
		{ 3, 16844, "", "=q4=Earthfury Epaulets", "=ds="..BabbleBoss["Baron Geddon"], "", "7.29%"};
		{ 4, 16841, "", "=q4=Earthfury Vestments", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "6.08%"};
		{ 5, 16840, "", "=q4=Earthfury Bracers", "=ds="..AL["Trash Mobs"], "", "0.06%"};
		{ 6, 16839, "", "=q4=Earthfury Gauntlets", "=ds="..BabbleBoss["Gehennas"], "", "7.38%"};
		{ 7, 16838, "", "=q4=Earthfury Belt", "=ds="..AL["Trash Mobs"], "", "0.07%"};
		{ 8, 16843, "", "=q4=Earthfury Legguards", "=ds="..BabbleBoss["Magmadar"], "", "4.73%"};
		{ 9, 16837, "", "=q4=Earthfury Boots", "=ds="..BabbleBoss["Lucifron"], "", "4.16%"};
		{ 16, 0, "Spell_FireResistanceTotem_01", "=q6=#t2s7#", "=ec1=#m31#"};
		{ 17, 16947, "", "=q4=Helmet of Ten Storms", "=ds="..BabbleBoss["Nefarian"], "", "4.86%"};
		{ 18, 16945, "", "=q4=Epaulets of Ten Storms", "=ds="..BabbleBoss["Chromaggus"], "", "6.73%"};
		{ 19, 16950, "", "=q4=Breastplate of Ten Storms", "=ds="..BabbleBoss["Nefarian"], "", "5.65%"};
		{ 20, 16943, "", "=q4=Bracers of Ten Storms", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "7.54%"};
		{ 21, 16948, "", "=q4=Gauntlets of Ten Storms", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "2.13%"};
		{ 22, 16944, "", "=q4=Belt of Ten Storms", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "6.93%"};
		{ 23, 16946, "", "=q4=Legplates of Ten Storms", "=ds="..BabbleBoss["Ragnaros"], "", "5.97%"};
		{ 24, 16949, "", "=q4=Greaves of Ten Storms", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "5.57%"};
		Prev = "T0Shaman";
		Next = "T3Shaman";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T1T2Warlock"] = {
		{ 1, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t1s8#", "=ec1=#m30#"};
		{ 2, 16808, "", "=q4=Felheart Horns", "=ds="..BabbleBoss["Garr"], "", "10.62%"};
		{ 3, 16807, "", "=q4=Felheart Shoulder Pads", "=ds="..BabbleBoss["Baron Geddon"], "", "19.78%"};
		{ 4, 16809, "", "=q4=Felheart Robes", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "15.66%"};
		{ 5, 16804, "", "=q4=Felheart Bracers", "=ds="..AL["Trash Mobs"], "", "0.16%"};
		{ 6, 16805, "", "=q4=Felheart Gloves", "=ds="..BabbleBoss["Lucifron"], "", "14.89%"};
		{ 7, 16806, "", "=q4=Felheart Belt", "=ds="..AL["Trash Mobs"], "", "0.19%"};
		{ 8, 16810, "", "=q4=Felheart Pants", "=ds="..BabbleBoss["Magmadar"], "", "13.75%"};
		{ 9, 16803, "", "=q4=Felheart Slippers", "=ds="..BabbleBoss["Shazzrah"], "", "15.28%"};
		{ 16, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t2s8#", "=ec1=#m31#"};
		{ 17, 16929, "", "=q4=Nemesis Skullcap", "=ds="..BabbleBoss["Nefarian"], "", "13.54%"};
		{ 18, 16932, "", "=q4=Nemesis Spaulders", "=ds="..BabbleBoss["Chromaggus"], "", "16.26%"};
		{ 19, 16931, "", "=q4=Nemesis Robes", "=ds="..BabbleBoss["Nefarian"], "", "12.46%"};
		{ 20, 16934, "", "=q4=Nemesis Bracers", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "18.11%"};
		{ 21, 16928, "", "=q4=Nemesis Gloves", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "5.28%"};
		{ 22, 16933, "", "=q4=Nemesis Belt", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "18.42%"};
		{ 23, 16930, "", "=q4=Nemesis Leggings", "=ds="..BabbleBoss["Ragnaros"], "", "16.87%"};
		{ 24, 16927, "", "=q4=Nemesis Boots", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "15.32%"};
		Prev = "T0Warlock";
		Next = "T3Warlock";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T1T2Warrior"] = {
		{ 1, 0, "INV_Shield_05", "=q6=#t1s9#", "=ec1=#m30#"};
		{ 2, 16866, "", "=q4=Helm of Might", "=ds="..BabbleBoss["Garr"], "", "11.39%"};
		{ 3, 16868, "", "=q4=Pauldrons of Might", "=ds="..BabbleBoss["Sulfuron Harbinger"], "", "21.14%"};
		{ 4, 16865, "", "=q4=Breastplate of Might", "=ds="..BabbleBoss["Golemagg the Incinerator"], "", "15.28%"};
		{ 5, 16861, "", "=q4=Bracers of Might", "=ds="..AL["Trash Mobs"], "", "0.16%"};
		{ 6, 16863, "", "=q4=Gauntlets of Might", "=ds="..BabbleBoss["Lucifron"], "", "16.40%"};
		{ 7, 16864, "", "=q4=Belt of Might", "=ds="..AL["Trash Mobs"], "", "0.16%"};
		{ 8, 16867, "", "=q4=Legplates of Might", "=ds="..BabbleBoss["Magmadar"], "", "13.97%"};
		{ 9, 16862, "", "=q4=Sabatons of Might", "=ds="..BabbleBoss["Gehennas"], "", "14.48%"};
		{ 16, 0, "INV_Shield_05", "=q6=#t2s9#", "=ec1=#m31#"};
		{ 17, 16963, "", "=q4=Helm of Wrath", "=ds="..BabbleBoss["Nefarian"], "", "13.65%"};
		{ 18, 16961, "", "=q4=Pauldrons of Wrath", "=ds="..BabbleBoss["Chromaggus"], "", "16.83%"};
		{ 19, 16966, "", "=q4=Breastplate of Wrath", "=ds="..BabbleBoss["Nefarian"], "", "15.06%"};
		{ 20, 16959, "", "=q4=Bracelets of Wrath", "=ds="..BabbleBoss["Razorgore the Untamed"], "", "20.29%"};
		{ 21, 16964, "", "=q4=Gauntlets of Wrath", "=ds="..BabbleBoss["Firemaw"]..", "..BabbleBoss["Ebonroc"]..", "..BabbleBoss["Flamegor"], "", "5.93%"};
		{ 22, 16960, "", "=q4=Waistband of Wrath", "=ds="..BabbleBoss["Vaelastrasz the Corrupt"], "", "20.03%"};
		{ 23, 16962, "", "=q4=Legplates of Wrath", "=ds="..BabbleBoss["Ragnaros"], "", "17.23%"};
		{ 24, 16965, "", "=q4=Sabatons of Wrath", "=ds="..BabbleBoss["Broodlord Lashlayer"], "", "16.84%"};
		Prev = "T0Warrior";
		Next = "T3Warrior";
		Back = "T1T2T3SET";
	};

		------------------------
		--- Tier 3 Sets (T3) ---
		------------------------

	AtlasLoot_Data["T3Druid"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#t3s1#", "=ec1=#m35#"};
		{ 2, 22490, "", "=q4=Dreamwalker Headpiece", "=ds="};
		{ 3, 22491, "", "=q4=Dreamwalker Spaulders", "=ds="};
		{ 4, 22488, "", "=q4=Dreamwalker Tunic", "=ds="};
		{ 5, 22495, "", "=q4=Dreamwalker Wristguards", "=ds="};
		{ 6, 22493, "", "=q4=Dreamwalker Handguards", "=ds="};
		{ 7, 22494, "", "=q4=Dreamwalker Girdle", "=ds="};
		{ 8, 22489, "", "=q4=Dreamwalker Legguards", "=ds="};
		{ 9, 22492, "", "=q4=Dreamwalker Boots", "=ds="};
		{ 10, 23064, "", "=q4=Ring of the Dreamwalker", "=ds="};
		Prev = "T1T2Druid";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T3Hunter"] = {
		{ 1, 0, "Ability_Hunter_RunningShot", "=q6=#t3s2#", "=ec1=#m35#"};
		{ 2, 22438, "", "=q4=Cryptstalker Headpiece", "=ds="};
		{ 3, 22439, "", "=q4=Cryptstalker Spaulders", "=ds="};
		{ 4, 22436, "", "=q4=Cryptstalker Tunic", "=ds="};
		{ 5, 22443, "", "=q4=Cryptstalker Wristguards", "=ds="};
		{ 6, 22441, "", "=q4=Cryptstalker Handguards", "=ds="};
		{ 7, 22442, "", "=q4=Cryptstalker Girdle", "=ds="};
		{ 8, 22437, "", "=q4=Cryptstalker Legguards", "=ds="};
		{ 9, 22440, "", "=q4=Cryptstalker Boots", "=ds="};
		{ 10, 23067, "", "=q4=Ring of the Cryptstalker", "=ds="};
		Prev = "T1T2Hunter";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T3Mage"] = {
		{ 1, 0, "Spell_Frost_IceStorm", "=q6=#t3s3#", "=ec1=#m35#"};
		{ 2, 22498, "", "=q4=Frostfire Circlet", "=ds="};
		{ 3, 22499, "", "=q4=Frostfire Shoulderpads", "=ds="};
		{ 4, 22496, "", "=q4=Frostfire Robe", "=ds="};
		{ 5, 22503, "", "=q4=Frostfire Bindings", "=ds="};
		{ 6, 22501, "", "=q4=Frostfire Gloves", "=ds="};
		{ 7, 22502, "", "=q4=Frostfire Belt", "=ds="};
		{ 8, 22497, "", "=q4=Frostfire Leggings", "=ds="};
		{ 9, 22500, "", "=q4=Frostfire Sandals", "=ds="};
		{ 10, 23062, "", "=q4=Frostfire Ring", "=ds="};
		Prev = "T1T2Mage";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T3Paladin"] = {
		{ 1, 0, "Spell_Holy_SealOfMight", "=q6=#t3s4#", "=ec1=#m35#"};
		{ 2, 22428, "", "=q4=Redemption Headpiece", "=ds="};
		{ 3, 22429, "", "=q4=Redemption Spaulders", "=ds="};
		{ 4, 22425, "", "=q4=Redemption Tunic", "=ds="};
		{ 5, 22424, "", "=q4=Redemption Wristguards", "=ds="};
		{ 6, 22426, "", "=q4=Redemption Handguards", "=ds="};
		{ 7, 22431, "", "=q4=Redemption Girdle", "=ds="};
		{ 8, 22427, "", "=q4=Redemption Legguards", "=ds="};
		{ 9, 22430, "", "=q4=Redemption Boots", "=ds="};
		{ 10, 23066, "", "=q4=Ring of Redemption", "=ds="};
		Prev = "T1T2Paladin";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T3Priest"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#t3s5#", "=ec1=#m35#"};
		{ 2, 22514, "", "=q4=Circlet of Faith", "=ds="};
		{ 3, 22515, "", "=q4=Shoulderpads of Faith", "=ds="};
		{ 4, 22512, "", "=q4=Robe of Faith", "=ds="};
		{ 5, 22519, "", "=q4=Bindings of Faith", "=ds="};
		{ 6, 22517, "", "=q4=Gloves of Faith", "=ds="};
		{ 7, 22518, "", "=q4=Belt of Faith", "=ds="};
		{ 8, 22513, "", "=q4=Leggings of Faith", "=ds="};
		{ 9, 22516, "", "=q4=Sandals of Faith", "=ds="};
		{ 10, 23061, "", "=q4=Ring of Faith", "=ds="};
		Prev = "T1T2Priest";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T3Rogue"] = {
		{ 1, 0, "Ability_BackStab", "=q6=#t3s6#", "=ec1=#m35#"};
		{ 2, 22478, "", "=q4=Bonescythe Helmet", "=ds="};
		{ 3, 22479, "", "=q4=Bonescythe Pauldrons", "=ds="};
		{ 4, 22476, "", "=q4=Bonescythe Breastplate", "=ds="};
		{ 5, 22483, "", "=q4=Bonescythe Bracers", "=ds="};
		{ 6, 22481, "", "=q4=Bonescythe Gauntlets", "=ds="};
		{ 7, 22482, "", "=q4=Bonescythe Waistguard", "=ds="};
		{ 8, 22477, "", "=q4=Bonescythe Legplates", "=ds="};
		{ 9, 22480, "", "=q4=Bonescythe Sabatons", "=ds="};
		{ 10, 23060, "", "=q4=Bonescythe Ring", "=ds="};
		Prev = "T1T2Rogue";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T3Shaman"] = {
		{ 1, 0, "Spell_FireResistanceTotem_01", "=q6=#t3s7#", "=ec1=#m35#"};
		{ 2, 22466, "", "=q4=Earthshatter Headpiece", "=ds="};
		{ 3, 22467, "", "=q4=Earthshatter Spaulders", "=ds="};
		{ 4, 22464, "", "=q4=Earthshatter Tunic", "=ds="};
		{ 5, 22471, "", "=q4=Earthshatter Wristguards", "=ds="};
		{ 6, 22469, "", "=q4=Earthshatter Handguards", "=ds="};
		{ 7, 22470, "", "=q4=Earthshatter Girdle", "=ds="};
		{ 8, 22465, "", "=q4=Earthshatter Legguards", "=ds="};
		{ 9, 22468, "", "=q4=Earthshatter Boots", "=ds="};
		{ 10, 23065, "", "=q4=Ring of the Earthshatterer", "=ds="};
		Prev = "T1T2Shaman";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T3Warlock"] = {
		{ 1, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t3s8#", "=ec1=#m35#"};
		{ 2, 22506, "", "=q4=Plagueheart Circlet", "=ds="};
		{ 3, 22507, "", "=q4=Plagueheart Shoulderpads", "=ds="};
		{ 4, 22504, "", "=q4=Plagueheart Robe", "=ds="};
		{ 5, 22511, "", "=q4=Plagueheart Bindings", "=ds="};
		{ 6, 22509, "", "=q4=Plagueheart Gloves", "=ds="};
		{ 7, 22510, "", "=q4=Plagueheart Belt", "=ds="};
		{ 8, 22505, "", "=q4=Plagueheart Leggings", "=ds="};
		{ 9, 22508, "", "=q4=Plagueheart Sandals", "=ds="};
		{ 10, 23063, "", "=q4=Plagueheart Ring", "=ds="};
		Prev = "T1T2Warlock";
		Back = "T1T2T3SET";
	};

	AtlasLoot_Data["T3Warrior"] = {
		{ 1, 0, "INV_Shield_05", "=q6=#t3s9#", "=ec1=#m35#"};
		{ 2, 22418, "", "=q4=Dreadnaught Helmet", "=ds="};
		{ 3, 22419, "", "=q4=Dreadnaught Pauldrons", "=ds="};
		{ 4, 22416, "", "=q4=Dreadnaught Breastplate", "=ds="};
		{ 5, 22423, "", "=q4=Dreadnaught Bracers", "=ds="};
		{ 6, 22421, "", "=q4=Dreadnaught Gauntlets", "=ds="};
		{ 7, 22422, "", "=q4=Dreadnaught Waistguard", "=ds="};
		{ 8, 22417, "", "=q4=Dreadnaught Legplates", "=ds="};
		{ 9, 22420, "", "=q4=Dreadnaught Sabatons", "=ds="};
		{ 10, 23059, "", "=q4=Ring of the Dreadnaught", "=ds="};
		Prev = "T1T2Warrior";
		Back = "T1T2T3SET";
	};

		------------------------
		--- Vanilla WoW Sets ---
		------------------------

	AtlasLoot_Data["VWOWSets1"] = {
		{ 1, 0, "INV_Box_01", "=q6=#pre60s1#", "=ec1=#a2#. =q1=#z1#"};
		{ 2, 10399, "", "=q3=Blackened Defias Armor", "=ds=#s5#, =q2=#n6#", "", "14.77%"};
		{ 3, 10401, "", "=q2=Blackened Defias Gloves", "=ds=#s9#, =q2=#n9#", "", "1.76%"};
		{ 4, 10403, "", "=q3=Blackened Defias Belt", "=ds=#s10#, =q2=#n7#", "", "23.26%"};
		{ 5, 10400, "", "=q2=Blackened Defias Leggings", "=ds=#s11#, =q2=#n9#", "", "1.64%"};
		{ 6, 10402, "", "=q2=Blackened Defias Boots", "=ds=#s12#, =q2=#n8#", "", "1.23%"};
		{ 8, 0, "INV_Box_01", "=q6=#pre60s2#", "=ec1=#a2#. =q1=#z2#"};
		{ 9, 6473, "", "=q3=Armor of the Fang", "=ds=#s5#, =q2=#n5#", "", "52.05%"};
		{ 10, 10413, "", "=q3=Gloves of the Fang", "=ds=#s9#, =q2=#n4#", "", "1.20%"};
		{ 11, 10412, "", "=q3=Belt of the Fang", "=ds=#s10#, =q2=#n2#", "", "8.64%"};
		{ 12, 10410, "", "=q3=Leggings of the Fang", "=ds=#s11#, =q2=#n1#", "", "16.03%"};
		{ 13, 10411, "", "=q3=Footpads of the Fang", "=ds=#s12#, =q2=#n3#", "", "19.08%"};
		{ 16, 0, "INV_Box_01", "=q6=#pre60s3#", "=ec1=#a3#. =q1=#z3#"};
		{ 17, 10328, "", "=q3=Scarlet Chestpiece", "=ds=#s5#, =q2=#n12#", "", "0.3%"};
		{ 18, 10333, "", "=q2=Scarlet Wristguards", "=ds=#s8#, =q2=#n15#", "", "1.6%"};
		{ 19, 10331, "", "=q2=Scarlet Gauntlets", "=ds=#s9#, =q2=#n13#", "", "1.7%"};
		{ 20, 10329, "", "=q2=Scarlet Belt", "=ds=#s10#, =q2=#n10#", "", "1.6%"};
		{ 21, 10330, "", "=q3=Scarlet Leggings", "=ds=#s11#, =q2=#n14#", "", "13.2%"};
		{ 22, 10332, "", "=q3=Scarlet Boots", "=ds=#s12#, =q2=#n11#", "", "0.1%"};
		{ 24, 0, "INV_Box_01", "=q6=#pre60s4#", "=ec1=#a3#. =q1=#z4#"};
		{ 25, 11729, "", "=q3=Savage Gladiator Helm", "=ds=#s1#, =q2=#brd3#, #brd5#", "", "10.08%"};
		{ 26, 11726, "", "=q4=Savage Gladiator Chain", "=ds=#s5#, =q2=#brd3#", "", "14.52%"};
		{ 27, 11730, "", "=q3=Savage Gladiator Grips", "=ds=#s9#, =q2=#brd2#", "", "14.12%"};
		{ 28, 11728, "", "=q3=Savage Gladiator Leggings", "=ds=#s11#, =q2=#brd6#", "", "14.95%"};
		{ 29, 11731, "", "=q3=Savage Gladiator Greaves", "=ds=#s12#, =q2=#brd1#", "", "15.14%"};
		Back = "SETSCLASSIC";
	};

	AtlasLoot_Data["VWOWSets2"] = {
		{ 1, 0, "INV_Box_01", "=q6=#pre60s5#", "=ec1=#a1#, =q1=#m1# #c5#, #c3#, #c8#"};
		{ 2, 22302, "", "=q3=Ironweave Cowl", "=ds=#s1#, =q2=#n16# (#z9#)", "", "27.72%"};
		{ 3, 22305, "", "=q3=Ironweave Mantle", "=ds=#s3#, =q2=#n17# (#z4#)", "", "30.39%"};
		{ 4, 22301, "", "=q3=Ironweave Robe", "=ds=#s5#, =q2=#n18# (#z6#)", "", "19.00%"};
		{ 5, 22313, "", "=q3=Ironweave Bracers", "=ds=#s8#, =q2=#n19# (#z10#)", "", "18.16%"};
		{ 6, 22304, "", "=q3=Ironweave Gloves", "=ds=#s9#, =q2=#n20# (#z13#)", "", "16.24%"};
		{ 7, 22306, "", "=q3=Ironweave Belt", "=ds=#s10#, =q2=#n21# (#z10#)", "", "20.28%"};
		{ 8, 22303, "", "=q3=Ironweave Pants", "=ds=#s11#, =q2=#n22# (#z5#)", "", "23.33%"};
		{ 9, 22311, "", "=q3=Ironweave Boots", "=ds=#s12#, =q2=#n23# (#z9#)", "", "12.31%"};
		{ 16, 0, "INV_Box_01", "=q6=#pre60s10#", "=ec1=#a1#, =q2=#n24#. =q1=#z6#"};
		{ 17, 13390, "", "=q3=The Postmaster's Band", "=ds=#s1#", "", ""};
		{ 18, 13388, "", "=q3=The Postmaster's Tunic", "=ds=#s5#", "", ""};
		{ 19, 13389, "", "=q3=The Postmaster's Trousers", "=ds=#s11#", "", ""};
		{ 20, 13391, "", "=q3=The Postmaster's Treads", "=ds=#s12#", "", ""};
		{ 21, 13392, "", "=q3=The Postmaster's Seal", "=ds=#s13#", "", ""};
		Back = "SETSCLASSIC";
	};

	AtlasLoot_Data["VWOWSets3"] = {
		{ 1, 0, "INV_Box_01", "=q6=#pre60s15#", "=q1=#z7#"};
		{ 2, 17082, "", "=q4=Shard of the Flame", "=ds=#s14#, =q2=#n35# (#z14#)", "", "4.46%"};
		{ 3, 17064, "", "=q4=Shard of the Scale", "=ds=#s14#, =q2=#n36# (#z15#)", "", "3.71%"};
		{ 5, 0, "INV_Box_01", "=q6=#pre60s20#", "=q1=#z7#"};
		{ 6, 18204, "", "=q4=Eskhandar's Pelt", "=ds=#s4#, =q2=#n37#", "", "9.16%"};
		{ 7, 18203, "", "=q4=Eskhandar's Right Claw", "=ds=#h3#, #w13#, =q2=#n38# (#z14#)", "", "16.97%"};
		{ 8, 18202, "", "=q4=Eskhandar's Left Claw", "=ds=#h4#, #w13#, =q2=#n39#", "", "12.36%"};
		{ 16, 0, "INV_Box_01", "=q6=#pre60s24#", "=q1=#z10#"};
		{ 17, 13218, "", "=q3=Fang of the Crystal Spider", "=ds=#h1#, #w4#, =q2=#n41#", "", "15.46%"};
		{ 18, 13183, "", "=q3=Venomspitter", "=ds=#h1#, #w6#, =q2=#n42#", "", "13.07%"};
		{ 20, 0, "INV_Box_01", "=q6=#pre60s23#", "=q1=#z9#"};
		{ 21, 12940, "", "=q3=Dal'Rend's Sacred Charge", "=ds=#h3#, #w10#, =q2=#n40#", "", "6.62%"};
		{ 22, 12939, "", "=q3=Dal'Rend's Tribal Guardian", "=ds=#h4#, #w10#, =q2=#n40#", "", "7.44%"};
		Back = "SETSCLASSIC";
	};
	AtlasLoot_Data["VWOWScholo"] = {
		{ 1, 0, "INV_Box_01", "=q6=#pre60s6#", "=ec1=#a1#. =q1=#z5#"};
		{ 2, 14633, "", "=q3=Necropile Mantle", "=ds=#s3#", "", "1.12%"};
		{ 3, 14626, "", "=q3=Necropile Robe", "=ds=#s5#", "", "1.27%"};
		{ 4, 14629, "", "=q3=Necropile Cuffs", "=ds=#s8#", "", "1.03%"};
		{ 5, 14632, "", "=q3=Necropile Leggings", "=ds=#s11#", "", "0.85%"};
		{ 6, 14631, "", "=q3=Necropile Boots", "=ds=#s12#", "", "0.88%"};
		{ 8, 0, "INV_Box_01", "=q6=#pre60s7#", "=ec1=#a2#. =q1=#z5#"};
		{ 9, 14637, "", "=q3=Cadaverous Armor", "=ds=#s5#", "", "1.51%"};
		{ 10, 14640, "", "=q3=Cadaverous Gloves", "=ds=#s9#", "", "0.82%"};
		{ 11, 14636, "", "=q3=Cadaverous Belt", "=ds=#s10#", "", "0.60%"};
		{ 12, 14638, "", "=q3=Cadaverous Leggings", "=ds=#s11#", "", "1.09%"};
		{ 13, 14641, "", "=q3=Cadaverous Walkers", "=ds=#s12#", "", "0.67%"};
		{ 16, 0, "INV_Box_01", "=q6=#pre60s8#", "=ec1=#a3#. =q1=#z5#"};
		{ 17, 14611, "", "=q3=Bloodmail Hauberk", "=ds=#s5#", "", "0.54%"};
		{ 18, 14615, "", "=q3=Bloodmail Gauntlets", "=ds=#s9#", "", "0.09%"};
		{ 19, 14614, "", "=q3=Bloodmail Belt", "=ds=#s10#", "", "0.60%"};
		{ 20, 14612, "", "=q3=Bloodmail Legguards", "=ds=#s11#", "", "0.42%"};
		{ 21, 14616, "", "=q3=Bloodmail Boots", "=ds=#s12#", "", "0.36%"};
		{ 23, 0, "INV_Box_01", "=q6=#pre60s9#", "=ec1=#a4#. =q1=#z5#"};
		{ 24, 14624, "", "=q3=Deathbone Chestplate", "=ds=#s5#", "", "0.45%"};
		{ 25, 14622, "", "=q3=Deathbone Gauntlets", "=ds=#s9#", "", "0.45%"};
		{ 26, 14620, "", "=q3=Deathbone Girdle", "=ds=#s10#", "", "0.67%"};
		{ 27, 14623, "", "=q3=Deathbone Legguards", "=ds=#s11#", "", "1.12%"};
		{ 28, 14621, "", "=q3=Deathbone Sabatons", "=ds=#s12#", "", "0.57%"};
		Back = "SETSCLASSIC";
	};

	AtlasLoot_Data["VWOWZulGurub"] = {
		{ 1, 0, "INV_Box_01", "=q6=#pre60s16#", "=q1=#z8#"};
		{ 2, 19898, "", "=q3=Seal of Jin", "=ds=#s13#, =q2=#n28#", "", "8.81%"};
		{ 3, 19925, "", "=q3=Band of Jin", "=ds=#s13#, =q2=#n29#", "", "10.36%"};
		{ 5, 0, "INV_Box_01", "=q6=#pre60s17#", "=q1=#z8#"};
		{ 6, 19873, "", "=q3=Overlord's Crimson Band", "=ds=#s13#, =q2=#n33#", "", "10.12%"};
		{ 7, 19912, "", "=q3=Overlord's Onyx Band", "=ds=#s13#, =q2=#n30#", "", "14.51%"};
		{ 9, 0, "INV_Box_01", "=q6=#pre60s22#", "=q1=#z8#"};
		{ 10, 19896, "", "=q4=Thekal's Grasp", "=ds=#h3#, #w13#, =q2=#n28#", "", "5.20%"};
		{ 11, 19910, "", "=q4=Arlokk's Grasp", "=ds=#h4#, #w13#, =q2=#n30#", "", "4.54%"};
		{ 16, 0, "INV_Box_01", "=q6=#pre60s18#", "=q1=#z8#"};
		{ 17, 19863, "", "=q3=Primalist's Seal", "=ds=#s13#, =q2=#n33#", "", "9.72%"};
		{ 18, 19920, "", "=q3=Primalist's Band", "=ds=#s13#, =q2=#n31#", "", "8.95%"};
		{ 20, 0, "INV_Box_01", "=q6=#pre60s19#", "=q1=#z8#"};
		{ 21, 19905, "", "=q3=Zanzil's Band", "=ds=#s13#, =q2=#n32#", "", "9.24%"};
		{ 22, 19893, "", "=q3=Zanzil's Seal", "=ds=#s13#, =q2=#n33#", "", "10.12%"};
		{ 24, 0, "INV_Box_01", "=q6=#pre60s21#", "=q1=#z8#"};
		{ 25, 19865, "", "=q4=Warblade of the Hakkari", "=ds=#h3#, #w10#, =q2=#n34#", "", "5.18%"};
		{ 26, 19866, "", "=q4=Warblade of the Hakkari", "=ds=#h4#, #w10#, =q2=#n33#", "", "4.55%"};
		Back = "SETSCLASSIC";
	};

		---------------
		--- ZG Sets ---
		---------------

	AtlasLoot_Data["ZGSets1"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#zgs1#", "=ec1=#c1#"};
		{ 2, 19955, "", "=q4=Wushoolay's Charm of Nature", ""};
		{ 3, 19613, "", "=q4=Pristine Enchanted South Seas Kelp", "=ds=#r5#"};
		{ 4, 19838, "", "=q4=Zandalar Haruspex's Tunic", "=q4=#zgt9#, =ds=#r4#"};
		{ 5, 19839, "", "=q4=Zandalar Haruspex's Belt", "=q4=#zgt4#, =ds=#r3#"};
		{ 6, 19840, "", "=q4=Zandalar Haruspex's Bracers", "=q4=#zgt5#, =ds=#r2#"};
		{ 8, 0, "Ability_Hunter_RunningShot", "=q6=#zgs2#", "=ec1=#c2#"};
		{ 9, 19953, "", "=q4=Renataki's Charm of Beasts", ""};
		{ 10, 19621, "", "=q4=Maelstrom's Wrath", "=ds=#r5#"};
		{ 11, 19831, "", "=q4=Zandalar Predator's Mantle", "=q4=#zgt6#, =ds=#r4#"};
		{ 12, 19832, "", "=q4=Zandalar Predator's Belt", "=q4=#zgt2#, =ds=#r3#"};
		{ 13, 19833, "", "=q4=Zandalar Predator's Bracers", "=q4=#zgt3#, =ds=#r2#"};
		{ 16, 0, "Spell_Frost_IceStorm", "=q6=#zgs3#", "=ec1=#c3#"};
		{ 17, 19959, "", "=q4=Hazza'rah's Charm of Magic", ""};
		{ 18, 19601, "", "=q4=Jewel of Kajaro", "=ds=#r5#"};
		{ 19, 20034, "", "=q4=Zandalar Illusionist's Robe", "=q4=#zgt1#, =ds=#r4#"};
		{ 20, 19845, "", "=q4=Zandalar Illusionist's Mantle", "=q4=#zgt2#, =ds=#r3#"};
		{ 21, 19846, "", "=q4=Zandalar Illusionist's Wraps", "=q4=#zgt3#, =ds=#r2#"};
		{ 23, 0, "Spell_Holy_SealOfMight", "=q6=#zgs4#", "=ec1=#c4#"};
		{ 24, 19952, "", "=q4=Gri'lek's Charm of Valor", ""};
		{ 25, 19588, "", "=q4=Hero's Brand", "=ds=#r5#"};
		{ 26, 19825, "", "=q4=Zandalar Freethinker's Breastplate", "=q4=#zgt9#, =ds=#r4#"};
		{ 27, 19826, "", "=q4=Zandalar Freethinker's Belt", "=q4=#zgt2#, =ds=#r3#"};
		{ 28, 19827, "", "=q4=Zandalar Freethinker's Armguards", "=q4=#zgt3#, =ds=#r2#"};
		Next = "ZGSets2";
		Back = "SETMENU";
	};

	AtlasLoot_Data["ZGSets2"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#zgs5#", "=ec1=#c5#"};
		{ 2, 19958, "", "=q4=Hazza'rah's Charm of Healing", ""};
		{ 3, 19594, "", "=q4=The All-Seeing Eye of Zuldazar", "=ds=#r5#"};
		{ 4, 19841, "", "=q4=Zandalar Confessor's Mantle", "=q4=#zgt6#, =ds=#r4#"};
		{ 5, 19842, "", "=q4=Zandalar Confessor's Bindings", "=q4=#zgt4#, =ds=#r3#"};
		{ 6, 19843, "", "=q4=Zandalar Confessor's Wraps", "=q4=#zgt5#, =ds=#r2#"};
		{ 8, 0, "Ability_BackStab", "=q6=#zgs6#", "=ec1=#c6#"};
		{ 9, 19954, "", "=q4=Renataki's Charm of Trickery", ""};
		{ 10, 19617, "", "=q4=Zandalarian Shadow Mastery Talisman", "=ds=#r5#"};
		{ 11, 19834, "", "=q4=Zandalar Madcap's Tunic", "=q4=#zgt6#, =ds=#r4#"};
		{ 12, 19835, "", "=q4=Zandalar Madcap's Mantle", "=q4=#zgt7#, =ds=#r3#"};
		{ 13, 19836, "", "=q4=Zandalar Madcap's Bracers", "=q4=#zgt8#, =ds=#r2#"};
		{ 16, 0, "Spell_FireResistanceTotem_01", "=q6=#zgs7#", "=ec1=#c7#"};
		{ 17, 19956, "", "=q4=Wushoolay's Charm of Spirits", ""};
		{ 18, 19609, "", "=q4=Unmarred Vision of Voodress", "=ds=#r5#"};
		{ 19, 19828, "", "=q4=Zandalar Augur's Hauberk", "=q4=#zgt9#, =ds=#r4#"};
		{ 20, 19829, "", "=q4=Zandalar Augur's Belt", "=q4=#zgt7#, =ds=#r3#"};
		{ 21, 19830, "", "=q4=Zandalar Augur's Bracers", "=q4=#zgt8#, =ds=#r2#"};
		{ 23, 0, "Spell_Shadow_CurseOfTounges", "=q6=#zgs8#", "=ec1=#c8#"};
		{ 24, 19957, "", "=q4=Hazza'rah's Charm of Destruction", ""};
		{ 25, 19605, "", "=q4=Kezan's Unstoppable Taint", "=ds=#r5#"};
		{ 26, 20033, "", "=q4=Zandalar Demoniac's Robe", "=q4=#zgt1#, =ds=#r4#"};
		{ 27, 19849, "", "=q4=Zandalar Demoniac's Mantle", "=q4=#zgt4#, =ds=#r3#"};
		{ 28, 19848, "", "=q4=Zandalar Demoniac's Wraps", "=q4=#zgt5#, =ds=#r2#"};
		Next = "ZGSets3";
		Prev = "ZGSets1";
		Back = "SETMENU";
	};

	AtlasLoot_Data["ZGSets3"] = {
		{ 1, 0, "INV_Shield_05", "=q6=#zgs9#", "=ec1=#c9#"};
		{ 2, 19951, "", "=q4=Gri'lek's Charm of Might", ""};
		{ 3, 19577, "", "=q4=Rage of Mugamba", "=ds=#r5#"};
		{ 4, 19822, "", "=q4=Zandalar Vindicator's Breastplate", "=q4=#zgt1#, =ds=#r4#"};
		{ 5, 19823, "", "=q4=Zandalar Vindicator's Belt", "=q4=#zgt7#, =ds=#r3#"};
		{ 6, 19824, "", "=q4=Zandalar Vindicator's Armguards", "=q4=#zgt8#, =ds=#r2#"};
		Prev = "ZGSets2";
		Back = "SETMENU";
	};

		-----------------
		--- AQ20 Sets ---
		-----------------

	AtlasLoot_Data["AQ20Sets1"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#aq20s1#", "=ec1=#c1#"};
		{ 2, 21407, "", "=q4=Mace of Unending Life", "=q4=#aq20t1#, =ds=#r5#"};
		{ 3, 21409, "", "=q4=Cloak of Unending Life", "=q3=#aq20t5#, =ds=#r4#"};
		{ 4, 21408, "", "=q4=Band of Unending Life", "=q3=#aq20t3#, =ds=#r3#"};
		{ 6, 0, "Ability_Hunter_RunningShot", "=q6=#aq20s2#", "=ec1=#c2#"};
		{ 7, 21401, "", "=q4=Scythe of the Unseen Path", "=q4=#aq20t6#, =ds=#r5#"};
		{ 8, 21403, "", "=q4=Cloak of the Unseen Path", "=q3=#aq20t5#, =ds=#r4#"};
		{ 9, 21402, "", "=q4=Signet of the Unseen Path", "=q3=#aq20t4#, =ds=#r3#"};
		{ 11, 0, "Spell_Frost_IceStorm", "=q6=#aq20s3#", "=ec1=#c3#"};
		{ 12, 21413, "", "=q4=Blade of Vaulted Secrets", "=q4=#aq20t1#, =ds=#r5#"};
		{ 13, 21415, "", "=q4=Drape of Vaulted Secrets", "=q3=#aq20t2#, =ds=#r4#"};
		{ 14, 21414, "", "=q4=Band of Vaulted Secrets", "=q3=#aq20t3#, =ds=#r3#"};
		{ 16, 0, "Spell_Holy_SealOfMight", "=q6=#aq20s4#", "=ec1=#c4#"};
		{ 17, 21395, "", "=q4=Blade of Eternal Justice", "=q4=#aq20t6#, =ds=#r5#"};
		{ 18, 21397, "", "=q4=Cape of Eternal Justice", "=q3=#aq20t5#, =ds=#r4#"};
		{ 19, 21396, "", "=q4=Ring of Eternal Justice", "=q3=#aq20t3#, =ds=#r3#"};
		{ 21, 0, "Spell_Holy_PowerWordShield", "=q6=#aq20s5#", "=ec1=#c5#"};
		{ 22, 21410, "", "=q4=Gavel of Infinite Wisdom", "=q4=#aq20t1#, =ds=#r5#"};
		{ 23, 21412, "", "=q4=Shroud of Infinite Wisdom", "=q3=#aq20t2#, =ds=#r4#"};
		{ 24, 21411, "", "=q4=Ring of Infinite Wisdom", "=q3=#aq20t4#, =ds=#r3#"};
		{ 26, 0, "Ability_BackStab", "=q6=#aq20s6#", "=ec1=#c6#"};
		{ 27, 21404, "", "=q4=Dagger of Veiled Shadows", "=q4=#aq20t6#, =ds=#r5#"};
		{ 28, 21406, "", "=q4=Cloak of Veiled Shadows", "=q3=#aq20t2#, =ds=#r4#"};
		{ 29, 21405, "", "=q4=Band of Veiled Shadows", "=q3=#aq20t4#, =ds=#r3#"};
		Next = "AQ20Sets2";
		Back = "SETMENU";
	};

	AtlasLoot_Data["AQ20Sets2"] = {
		{ 1, 0, "Spell_FireResistanceTotem_01", "=q6=#aq20s7#", "=ec1=#c7#"};
		{ 2, 21398, "", "=q4=Hammer of the Gathering Storm", "=q4=#aq20t6#, =ds=#r5#"};
		{ 3, 21400, "", "=q4=Cloak of the Gathering Storm", "=q3=#aq20t5#, =ds=#r4#"};
		{ 4, 21399, "", "=q4=Ring of the Gathering Storm", "=q3=#aq20t3#, =ds=#r3#"};
		{ 6, 0, "Spell_Shadow_CurseOfTounges", "=q6=#aq20s8#", "=ec1=#c8#"};
		{ 7, 21416, "", "=q4=Kris of Unspoken Names", "=q4=#aq20t1#, =ds=#r5#"};
		{ 8, 21418, "", "=q4=Shroud of Unspoken Names", "=q3=#aq20t5#, =ds=#r4#"};
		{ 9, 21417, "", "=q4=Ring of Unspoken Names", "=q3=#aq20t4#, =ds=#r3#"};
		{ 11, 0, "INV_Shield_05", "=q6=#aq20s9#", "=ec1=#c9#"};
		{ 12, 21392, "", "=q4=Sickle of Unyielding Strength", "=q4=#aq20t6#, =ds=#r5#"};
		{ 13, 21394, "", "=q4=Drape of Unyielding Strength", "=q3=#aq20t2#, =ds=#r4#"};
		{ 14, 21393, "", "=q4=Signet of Unyielding Strength", "=q3=#aq20t3#=ds=, #r3#"};
		Prev = "AQ20Sets1";
		Back = "SETMENU";
	};

		-----------------
		--- AQ40 Sets ---
		-----------------

	AtlasLoot_Data["AQ40Sets1"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#aq40s1#", "=ec1=#c1#"};
		{ 2, 21357, "", "=q4=Genesis Vest", "=q4=#aq40t4#, =ds=#r3#"};
		{ 3, 21353, "", "=q4=Genesis Helm", "=q4=#aq40t6#, =ds=#r2#"};
		{ 4, 21356, "", "=q4=Genesis Trousers", "=q4=#aq40t7#, =ds=#r2#"};
		{ 5, 21354, "", "=q4=Genesis Shoulderpads", "=q4=#aq40t1#, =ds=#r1#"};
		{ 6, 21355, "", "=q4=Genesis Boots", "=q4=#aq40t1#, =ds=#r1#"};
		{ 8, 0, "Ability_Hunter_RunningShot", "=q6=#aq40s2#", "=ec1=#c2#"};
		{ 9, 21370, "", "=q4=Striker's Hauberk", "=q4=#aq40t8#, =ds=#r3#"};
		{ 10, 21366, "", "=q4=Striker's Diadem", "=q4=#aq40t6#, =ds=#r2#"};
		{ 11, 21368, "", "=q4=Striker's Leggings", "=q4=#aq40t7#, =ds=#r2#"};
		{ 12, 21367, "", "=q4=Striker's Pauldrons", "=q4=#aq40t5#, =ds=#r1#"};
		{ 13, 21365, "", "=q4=Striker's Footguards", "=q4=#aq40t5#, =ds=#r1#"};
		{ 16, 0, "Spell_Frost_IceStorm", "=q6=#aq40s3#", "=ec1=#c3#"};
		{ 17, 21343, "", "=q4=Enigma Robes", "=q4=#aq40t4#, =ds=#r3#"};
		{ 18, 21347, "", "=q4=Enigma Circlet", "=q4=#aq40t2#, =ds=#r2#"};
		{ 19, 21346, "", "=q4=Enigma Leggings", "=q4=#aq40t3#, =ds=#r2#"};
		{ 20, 21345, "", "=q4=Enigma Shoulderpads", "=q4=#aq40t1#, =ds=#r1#"};
		{ 21, 21344, "", "=q4=Enigma Boots", "=q4=#aq40t1#, =ds=#r1#"};
		{ 23, 0, "Spell_Holy_SealOfMight", "=q6=#aq40s4#", "=ec1=#c4#"};
		{ 24, 21389, "", "=q4=Avenger's Breastplate", "=q4=#aq40t8#, =ds=#r3#"};
		{ 25, 21387, "", "=q4=Avenger's Crown", "=q4=#aq40t6#, =ds=#r2#"};
		{ 26, 21390, "", "=q4=Avenger's Legguards", "=q4=#aq40t7#, =ds=#r2#"};
		{ 27, 21391, "", "=q4=Avenger's Pauldrons", "=q4=#aq40t1#, =ds=#r1#"};
		{ 28, 21388, "", "=q4=Avenger's Greaves", "=q4=#aq40t1#, =ds=#r1#"};
		Next = "AQ40Sets2";
		Back = "SETMENU";
	};

	AtlasLoot_Data["AQ40Sets2"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#aq40s5#", "=ec1=#c5#"};
		{ 2, 21351, "", "=q4=Vestments of the Oracle", "=q4=#aq40t4#, =ds=#r3#"};
		{ 3, 21348, "", "=q4=Tiara of the Oracle", "=q4=#aq40t2#, =ds=#r2#"};
		{ 4, 21352, "", "=q4=Trousers of the Oracle", "=q4=#aq40t3#, =ds=#r2#"};
		{ 5, 21350, "", "=q4=Mantle of the Oracle", "=q4=#aq40t5#, =ds=#r1#"};
		{ 6, 21349, "", "=q4=Footwraps of the Oracle", "=q4=#aq40t5#, =ds=#r1#"};
		{ 8, 0, "Ability_BackStab", "=q6=#aq40s6#", "=ec1=#c6#"};
		{ 9, 21364, "", "=q4=Deathdealer's Vest", "=q4=#aq40t8#, =ds=#r3#"};
		{ 10, 21360, "", "=q4=Deathdealer's Helm", "=q4=#aq40t6#, =ds=#r2#"};
		{ 11, 21362, "", "=q4=Deathdealer's Leggings", "=q4=#aq40t3#, =ds=#r2#"};
		{ 12, 21361, "", "=q4=Deathdealer's Spaulders", "=q4=#aq40t5#, =ds=#r1#"};
		{ 13, 21359, "", "=q4=Deathdealer's Boots", "=q4=#aq40t5#, =ds=#r1#"};
		{ 16, 0, "Spell_FireResistanceTotem_01", "=q6=#aq40s7#", "=ec1=#c7#"};
		{ 17, 21374, "", "=q4=Stormcaller's Hauberk", "=q4=#aq40t8#, =ds=#r3#"};
		{ 18, 21372, "", "=q4=Stormcaller's Diadem", "=q4=#aq40t6#, =ds=#r2#"};
		{ 19, 21375, "", "=q4=Stormcaller's Leggings", "=q4=#aq40t7#, =ds=#r2#"};
		{ 20, 21376, "", "=q4=Stormcaller's Pauldrons", "=q4=#aq40t1#, =ds=#r1#"};
		{ 21, 21373, "", "=q4=Stormcaller's Footguards", "=q4=#aq40t1#, =ds=#r1#"};
		{ 23, 0, "Spell_Shadow_CurseOfTounges", "=q6=#aq40s8#", "=ec1=#c8#"};
		{ 24, 21334, "", "=q4=Doomcaller's Robes", "=q4=#aq40t4#, =ds=#r3#"};
		{ 25, 21337, "", "=q4=Doomcaller's Circlet", "=q4=#aq40t2#, =ds=#r2#"};
		{ 26, 21336, "", "=q4=Doomcaller's Trousers", "=q4=#aq40t7#, =ds=#r2#"};
		{ 27, 21335, "", "=q4=Doomcaller's Mantle", "=q4=#aq40t1#, =ds=#r1#"};
		{ 28, 21338, "", "=q4=Doomcaller's Footwraps", "=q4=#aq40t1#, =ds=#r1#"};
		Next = "AQ40Sets3";
		Prev = "AQ40Sets1";
		Back = "SETMENU";
	};

	AtlasLoot_Data["AQ40Sets3"] = {
		{ 1, 0, "INV_Shield_05", "=q6=#aq40s9#", "=ec1=#c9#"};
		{ 2, 21331, "", "=q4=Conqueror's Breastplate", "=q4=#aq40t8#, =ds=#r3#"};
		{ 3, 21329, "", "=q4=Conqueror's Crown", "=q4=#aq40t2#, =ds=#r2#"};
		{ 4, 21332, "", "=q4=Conqueror's Legguards", "=q4=#aq40t3#, =ds=#r2#"};
		{ 5, 21330, "", "=q4=Conqueror's Spaulders", "=q4=#aq40t5#, =ds=#r1#"};
		{ 6, 21333, "", "=q4=Conqueror's Greaves", "=q4=#aq40t5#, =ds=#r1#"};
		Prev = "AQ40Sets2";
		Back = "SETMENU";
	};

		-----------------------
		--- BoE World Epics ---
		-----------------------

	AtlasLoot_Data["WorldEpics1"] = {
		{ 1, 867, "", "=q4=Gloves of Holy Might", "=ds=#s9#, #a2#", "", ""};
		{ 2, 1981, "", "=q4=Icemail Jerkin", "=ds=#s5#, #a3#", "", ""};
		{ 3, 1980, "", "=q4=Underworld Band", "=ds=#s13#", "", ""};
		{ 16, 869, "", "=q4=Dazzling Longsword", "=ds=#h1#, #w10#", "", ""};
		{ 17, 1982, "", "=q4=Nightblade", "=ds=#h2#, #w10#", "", ""};
		{ 18, 870, "", "=q4=Fiery War Axe", "=ds=#h2#, #w1#", "", ""};
		{ 19, 868, "", "=q4=Ardent Custodian", "=ds=#h1#, #w6#", "", ""};
		{ 20, 873, "", "=q4=Staff of Jordan", "=ds=#w9#", "", ""};
		{ 21, 1204, "", "=q4=The Green Tower", "=ds=#w8#", "", ""};
		{ 22, 2825, "", "=q4=Bow of Searing Arrows", "=ds=#w2#", "", ""};
		Next = "WorldEpics2";
		Back = "WORLDEPICS";
	};

	AtlasLoot_Data["WorldEpics2"] = {
		{ 1, 3075, "", "=q4=Eye of Flame", "=ds=#s1#, #a1#", "", ""};
		{ 2, 940, "", "=q4=Robes of Insight", "=ds=#s5#, #a1#", "", ""};
		{ 3, 14551, "", "=q4=Edgemaster's Handguards", "=ds=#s9#, #a3#", "", ""};
		{ 4, 17007, "", "=q4=Stonerender Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 5, 14549, "", "=q4=Boots of Avoidance", "=ds=#s12#, #a4#", "", ""};
		{ 6, 1315, "", "=q4=Lei of Lilies", "=ds=#s2#", "", ""};
		{ 7, 942, "", "=q4=Freezing Band", "=ds=#s13#", "", ""};
		{ 8, 1447, "", "=q4=Ring of Saviors", "=ds=#s13#", "", ""};
		{ 16, 2164, "", "=q4=Gut Ripper", "=ds=#h1#, #w4#", "", ""};
		{ 17, 2163, "", "=q4=Shadowblade", "=ds=#h1#, #w4#", "", ""};
		{ 18, 809, "", "=q4=Bloodrazor", "=ds=#h1#, #w10#", "", ""};
		{ 19, 871, "", "=q4=Flurry Axe", "=ds=#h1#, #w1#", "", ""};
		{ 20, 2291, "", "=q4=Kang the Decapitator", "=ds=#h2#, #w1#", "", ""};
		{ 21, 810, "", "=q4=Hammer of the Northern Wind", "=ds=#h1#, #w6#", "", ""};
		{ 22, 2915, "", "=q4=Taran Icebreaker", "=ds=#h2#, #w6#", "", ""};
		{ 23, 812, "", "=q4=Glowing Brightwood Staff", "=ds=#w9#", "", ""};
		{ 24, 943, "", "=q4=Warden Staff", "=ds=#w9#", "", ""};
		{ 25, 1169, "", "=q4=Blackskull Shield", "=ds=#w8#", "", ""};
		{ 26, 1979, "", "=q4=Wall of the Dead", "=ds=#w8#", "", ""};
		{ 27, 2824, "", "=q4=Hurricane", "=ds=#w2#", "", ""};
		{ 28, 2100, "", "=q4=Precisely Calibrated Boomstick", "=ds=#w5#", "", ""};
		Next = "WorldEpics3";
		Prev = "WorldEpics1";
		Back = "WORLDEPICS";
	};

	AtlasLoot_Data["WorldEpics3"] = {
		{ 1, 3475, "", "=q4=Cloak of Flames", "=ds=#s4#", "", ""};
		{ 2, 14553, "", "=q4=Sash of Mercy", "=ds=#s10#, #a2#", "", ""};
		{ 3, 2245, "", "=q4=Helm of Narv", "=ds=#s1#, #a3#", "", ""};
		{ 4, 14552, "", "=q4=Stockade Pauldrons", "=ds=#s3#, #a4#", "", ""};
		{ 5, 14554, "", "=q4=Cloudkeeper Legplates", "=ds=#s11#, #a4#", "", ""};
		{ 6, 1443, "", "=q4=Jeweled Amulet of Cainwyn", "=ds=#s2#", "", ""};
		{ 7, 14558, "", "=q4=Lady Maye's Pendant", "=ds=#s2#", "", ""};
		{ 8, 2246, "", "=q4=Myrmidon's Signet", "=ds=#s13#", "", ""};
		{ 9, 833, "", "=q4=Lifestone", "=ds=#s14#", "", ""};
		{ 10, 14557, "", "=q4=The Lion Horn of Stormwind", "=ds=#s14#", "", ""};
		{ 16, 14555, "", "=q4=Alcor's Sunrazor", "=ds=#h1#, #w4#", "", ""};
		{ 17, 2244, "", "=q4=Krol Blade", "=ds=#h1#, #w10#", "", ""};
		{ 18, 1728, "", "=q4=Teebu's Blazing Longsword", "=ds=#h1#, #w10#", "", ""};
		{ 19, 2801, "", "=q4=Blade of Hanna", "=ds=#h2#, #w10#", "", ""};
		{ 20, 647, "", "=q4=Destiny", "=ds=#h2#, #w10#", "", ""};
		{ 21, 811, "", "=q4=Axe of the Deep Woods", "=ds=#h1#, #w1#", "", ""};
		{ 22, 1263, "", "=q4=Brain Hacker", "=ds=#h2#, #w1#", "", ""};
		{ 23, 2243, "", "=q4=Hand of Edward the Odd", "=ds=#h1#, #w6#", "", ""};
		{ 24, 944, "", "=q4=Elemental Mage Staff", "=ds=#w9#", "", ""};
		{ 25, 1168, "", "=q4=Skullflame Shield", "=ds=#w8#", "", ""};
		{ 26, 2099, "", "=q4=Dwarven Hand Cannon", "=ds=#w5#", "", ""};
		Next = "WorldEpics4";
		Prev = "WorldEpics2";
		Back = "WORLDEPICS";
	};

	-----------
	--- PvP ---
	-----------

		----------------------
		--- Alterac Valley ---
		----------------------

	AtlasLoot_Data["AVMisc"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#m7#", "=q5=#b1#"};
		{ 2, 19030, "", "=q4=Stormpike Battle Charger", "=ds=#e12#", "50000 #alliance#"};
		{ 3, 19045, "", "=q3=Stormpike Battle Standard", "=ds=#e14#", "15000 #alliance#"};
		{ 4, 19032, "", "=q1=Stormpike Battle Tabard", "=ds=#s7#", "15000 #alliance#"};
		{ 6, 19316, "", "=q2=Ice Threaded Arrow", "=ds=#w17#", "60 #silver# 1 #faction#"};
		{ 7, 17348, "", "=q1=Major Healing Draught", "=ds=#e2#", "10 #silver# 8 #faction#"};
		{ 8, 17349, "", "=q1=Superior Healing Draught", "=ds=#e2#", "5 #silver# 1 #faction#"};
		{ 9, 19301, "", "=q1=Alterac Manna Biscuit", "=ds=#e3#", "70 #silver#"};
		{ 10, 19307, "", "=q1=Alterac Heavy Runecloth Bandage", "=ds=#e5#", "80 #silver#"};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#m6#", "=q5=#b2#"};
		{ 17, 19029, "", "=q4=Horn of the Frostwolf Howler", "=ds=#e12#", "50000 #horde#"};
		{ 18, 19046, "", "=q3=Frostwolf Battle Standard", "=ds=#e14#", "15000 #horde#"};
		{ 19, 19031, "", "=q1=Frostwolf Battle Tabard", "=ds=#s7#", "15000 #horde#"};
		{ 21, 19317, "", "=q2=Ice Threaded Bullet", "=ds=#w18#", "60 #silver# 1 #faction#"};
		{ 22, 17351, "", "=q1=Major Mana Draught", "=ds=#e2#", "10 #silver# 8 #faction#"};
		{ 23, 17352, "", "=q1=Superior Mana Draught", "=ds=#e2#", "5 #silver# 1 #faction#"};
		{ 24, 19318, "", "=q1=Bottled Alterac Spring Water", "=ds=#e4#", "50 #silver#"};
		Next = "AVBlue_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["AVBlue_A"] = {
		{ 2, 19086, "", "=q3=Stormpike Sage's Cloak", "=ds=#s4#", "1600 #alliance#"};
		{ 3, 19084, "", "=q3=Stormpike Soldier's Cloak", "=ds=#s4#", "1600 #alliance#"};
		{ 4, 19094, "", "=q3=Stormpike Cloth Girdle", "=ds=#s10#, #a1#", "3000 #alliance#"};
		{ 5, 19093, "", "=q3=Stormpike Leather Girdle", "=ds=#s10#, #a2#", "3000 #alliance#"};
		{ 6, 19092, "", "=q3=Stormpike Mail Girdle", "=ds=#s10#, #a3#", "3000 #alliance#"};
		{ 7, 19091, "", "=q3=Stormpike Plate Girdle", "=ds=#s10#, #a4#", "3000 #alliance#"};
		{ 8, 19098, "", "=q3=Stormpike Sage's Pendant", "=ds=#s2#", "1600 #alliance#"};
		{ 9, 19097, "", "=q3=Stormpike Soldier's Pendant", "=ds=#s2#", "1600 #alliance#"};
		{ 10, 19100, "", "=q3=Electrified Dagger", "=ds=#h1#, #w4#", "2400 #alliance#"};
		{ 11, 19104, "", "=q3=Stormstrike Hammer", "=ds=#h1#, #w6#", "2400 #alliance#"};
		{ 12, 19102, "", "=q3=Crackling Staff", "=ds=#w9#", "3000 #alliance#"};
		{ 13, 19320, "", "=q3=Gnoll Skin Bandolier", "=ds=#w20#", "1600 #alliance#"};
		{ 14, 19319, "", "=q3=Harpy Hide Quiver", "=ds=#w19#", "1600 #alliance#"};
		{ 17, 19325, "", "=q4=Don Julio's Band", "=ds=#s13#", "5000 #faction#"};
		{ 18, 21563, "", "=q4=Don Rodrigo's Band", "=ds=#s13#", "5000 #faction#"};
		{ 19, 19312, "", "=q4=Lei of the Lifegiver", "=ds=#s15#", "5000 #faction#"};
		{ 20, 19315, "", "=q4=Therazane's Touch", "=ds=#s15#", "5000 #faction#"};
		{ 21, 19308, "", "=q4=Tome of Arcane Domination", "=ds=#s15#", "5000 #faction#"};
		{ 22, 19309, "", "=q4=Tome of Shadow Force", "=ds=#s15#", "5000 #faction#"};
		{ 23, 19311, "", "=q4=Tome of Fiery Arcana", "=ds=#s15#", "5000 #faction#"};
		{ 24, 19310, "", "=q4=Tome of the Ice Lord", "=ds=#s15#", "5000 #faction#"};
		{ 25, 19324, "", "=q4=The Lobotomizer", "=ds=#h1#, #w4#", "5000 #faction#"};
		{ 26, 19321, "", "=q4=The Immovable Object", "=ds=#w8#", "5000 #faction#"};
		{ 27, 19323, "", "=q4=The Unstoppable Force", "=ds=#h2#, #w6#", "5000 #faction#"};
		Prev = "AVMisc";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["AVBlue_H"] = {
		{ 2, 19085, "", "=q3=Frostwolf Advisor's Cloak", "=ds=#s4#", "1600 #horde#"};
		{ 3, 19083, "", "=q3=Frostwolf Legionnaire's Cloak", "=ds=#s4#", "1600 #horde#"};
		{ 4, 19090, "", "=q3=Frostwolf Cloth Belt", "=ds=#s10#, #a1#", "3000 #horde#"};
		{ 5, 19089, "", "=q3=Frostwolf Leather Belt", "=ds=#s10#, #a2#", "3000 #horde#"};
		{ 6, 19088, "", "=q3=Frostwolf Mail Belt", "=ds=#s10#, #a3#", "3000 #horde#"};
		{ 7, 19087, "", "=q3=Frostwolf Plate Belt", "=ds=#s10#, #a4#", "3000 #horde#"};
		{ 8, 19096, "", "=q3=Frostwolf Advisor's Pendant", "=ds=#s2#", "1600 #horde#"};
		{ 9, 19095, "", "=q3=Frostwolf Legionnaire's Pendant", "=ds=#s2#", "1600 #horde#"};
		{ 10, 19099, "", "=q3=Glacial Blade", "=ds=#h1#, #w4#", "2400 #horde#"};
		{ 11, 19103, "", "=q3=Frostbite", "=ds=#h1#, #w6#", "2400 #horde#"};
		{ 12, 19101, "", "=q3=Whiteout Staff", "=ds=#w9#", "3000 #horde#"};
		{ 13, 19320, "", "=q3=Gnoll Skin Bandolier", "=ds=#w20#", "1600 #horde#"};
		{ 14, 19319, "", "=q3=Harpy Hide Quiver", "=ds=#w19#", "1600 #horde#"};
		{ 17, 19325, "", "=q4=Don Julio's Band", "=ds=#s13#", "5000 #faction#"};
		{ 18, 21563, "", "=q4=Don Rodrigo's Band", "=ds=#s13#", "5000 #faction#"};
		{ 19, 19312, "", "=q4=Lei of the Lifegiver", "=ds=#s15#", "5000 #faction#"};
		{ 20, 19315, "", "=q4=Therazane's Touch", "=ds=#s15#", "5000 #faction#"};
		{ 21, 19308, "", "=q4=Tome of Arcane Domination", "=ds=#s15#", "5000 #faction#"};
		{ 22, 19309, "", "=q4=Tome of Shadow Force", "=ds=#s15#", "5000 #faction#"};
		{ 23, 19311, "", "=q4=Tome of Fiery Arcana", "=ds=#s15#", "5000 #faction#"};
		{ 24, 19310, "", "=q4=Tome of the Ice Lord", "=ds=#s15#", "5000 #faction#"};
		{ 25, 19324, "", "=q4=The Lobotomizer", "=ds=#h1#, #w4#", "5000 #faction#"};
		{ 26, 19321, "", "=q4=The Immovable Object", "=ds=#w8#", "5000 #faction#"};
		{ 27, 19323, "", "=q4=The Unstoppable Force", "=ds=#h2#, #w6#", "5000 #faction#"};
		Prev = "AVMisc";
		Back = "PVPMENU2";
	};

		--------------------
		--- Arathi Basin ---
		--------------------

	AtlasLoot_Data["ABMisc_A"] = {
		{ 2, 17349, "", "=q1=Superior Healing Draught", "=ds=", "5 #silver# 1 #alliance#", ""};
		{ 3, 17352, "", "=q1=Superior Mana Draught", "=ds=", "5 #silver# 1 #alliance#", ""};
		{ 4, 20225, "", "=q1=Highlander's Enriched Ration", "=ds=", "18 #silver#", ""};
		{ 5, 20227, "", "=q1=Highlander's Iron Ration", "=ds=", "13,5 #silver#", ""};
		{ 6, 20226, "", "=q1=Highlander's Field Ration", "=ds=", "9 #silver#", ""};
		{ 7, 20243, "", "=q1=Highlander's Runecloth Bandage", "=ds=", "18 #silver#", ""};
		{ 8, 20237, "", "=q1=Highlander's Mageweave Bandage", "=ds=", "13,5 #silver#", ""};
		{ 9, 20244, "", "=q1=Highlander's Silk Bandage", "=ds=", "9 #silver#", ""};
		{ 11, 21119, "", "=q3=Talisman of Arathor", "=ds=", "300 #alliance#", ""};
		{ 12, 21118, "", "=q3=Talisman of Arathor", "=ds=", "300 #alliance#", ""};
		{ 13, 21117, "", "=q3=Talisman of Arathor", "=ds=", "400 #alliance#", ""};
		{ 14, 20071, "", "=q3=Talisman of Arathor", "=ds=", "3000 #alliance#", ""};
		{ 17, 0, "INV_BannerPVP_02", "=q6="..AL["Level 60 Rewards"], "=q5=#b5#" };
		{ 18, 20073, "", "=q4=Cloak of the Honor Guard", "=ds=", "5000 #alliance#", ""};
		{ 19, 20070, "", "=q4=Sageclaw", "=ds=", "9000 #alliance#", ""};
		{ 20, 20069, "", "=q4=Ironbark Staff", "=ds=", "16000 #alliance#", ""};
		Next = "AB4049_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["AB4049_A"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6="..AL["Level 40-49 Rewards"], "=q5=#b5#"};
		{ 2, 20097, "", "=q3=Highlander's Cloth Girdle", "=ds=", "400 #alliance#", ""};
		{ 3, 20094, "", "=q3=Highlander's Cloth Boots", "=ds=", "400 #alliance#", ""};
		{ 4, 20115, "", "=q3=Highlander's Leather Girdle", "=ds=", "400 #alliance#", ""};
		{ 5, 20103, "", "=q3=Highlander's Lizardhide Girdle", "=ds=", "400 #alliance#", ""};
		{ 6, 20112, "", "=q3=Highlander's Leather Boots", "=ds=", "400 #alliance#", ""};
		{ 7, 20100, "", "=q3=Highlander's Lizardhide Boots", "=ds=", "400 #alliance#", ""};
		{ 8, 20089, "", "=q3=Highlander's Chain Girdle", "=ds=", "300 #alliance#", ""};
		{ 9, 20088, "", "=q3=Highlander's Chain Girdle", "=ds=", "400 #alliance#", ""};
		{ 10, 20119, "", "=q3=Highlander's Mail Girdle", "=ds=", "300 #alliance#", ""};
		{ 11, 20118, "", "=q3=Highlander's Mail Girdle", "=ds=", "400 #alliance#", ""};
		{ 12, 20092, "", "=q3=Highlander's Chain Greaves", "=ds=", "300 #alliance#", ""};
		{ 13, 20091, "", "=q3=Highlander's Chain Greaves", "=ds=", "400 #alliance#", ""};
		{ 14, 20122, "", "=q3=Highlander's Mail Greaves", "=ds=", "300 #alliance#", ""};
		{ 15, 20121, "", "=q3=Highlander's Mail Greaves", "=ds=", "400 #alliance#", ""};
		{ 17, 20107, "", "=q3=Highlander's Lamellar Girdle", "=ds=", "300 #alliance#", ""};
		{ 18, 20106, "", "=q3=Highlander's Lamellar Girdle", "=ds=", "400 #alliance#", ""};
		{ 19, 20125, "", "=q3=Highlander's Plate Girdle", "=ds=", "300 #alliance#", ""};
		{ 20, 20124, "", "=q3=Highlander's Plate Girdle", "=ds=", "400 #alliance#", ""};
		{ 21, 20110, "", "=q3=Highlander's Lamellar Greaves", "=ds=", "300 #alliance#", ""};
		{ 22, 20109, "", "=q3=Highlander's Lamellar Greaves", "=ds=", "400 #alliance#", ""};
		{ 23, 20128, "", "=q3=Highlander's Plate Greaves", "=ds=", "300 #alliance#", ""};
		{ 24, 20127, "", "=q3=Highlander's Plate Greaves", "=ds=", "400 #alliance#", ""};
		Prev = "ABMisc_A";
		Next = "AB2039_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["AB2039_A"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6="..AL["Level 30-39 Rewards"], "=q5=#b5#"};
		{ 2, 20098, "", "=q3=Highlander's Cloth Girdle", "=ds=", "300 #alliance#", ""};
		{ 3, 20095, "", "=q3=Highlander's Cloth Boots", "=ds=", "300 #alliance#", ""};
		{ 4, 20116, "", "=q3=Highlander's Leather Girdle", "=ds=", "300 #alliance#", ""};
		{ 5, 20104, "", "=q3=Highlander's Lizardhide Girdle", "=ds=", "300 #alliance#", ""};
		{ 6, 20113, "", "=q3=Highlander's Leather Boots", "=ds=", "300 #alliance#", ""};
		{ 7, 20101, "", "=q3=Highlander's Lizardhide Boots", "=ds=", "300 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_02", "=q6="..AL["Level 20-29 Rewards"], "=q5=#b5#" };
		{ 17, 20099, "", "=q3=Highlander's Cloth Girdle", "=ds=", "300 #alliance#", ""};
		{ 18, 20096, "", "=q3=Highlander's Cloth Boots", "=ds=", "300 #alliance#", ""};
		{ 19, 20117, "", "=q3=Highlander's Leather Girdle", "=ds=", "300 #alliance#", ""};
		{ 20, 20105, "", "=q3=Highlander's Lizardhide Girdle", "=ds=", "300 #alliance#", ""};
		{ 21, 20120, "", "=q3=Highlander's Mail Girdle", "=ds=", "300 #alliance#", ""};
		{ 22, 20090, "", "=q3=Highlander's Padded Girdle", "=ds=", "300 #alliance#", ""};
		{ 23, 20114, "", "=q3=Highlander's Leather Boots", "=ds=", "300 #alliance#", ""};
		{ 24, 20102, "", "=q3=Highlander's Lizardhide Boots", "=ds=", "300 #alliance#", ""};
		{ 25, 20123, "", "=q3=Highlander's Mail Greaves", "=ds=", "300 #alliance#", ""};
		{ 26, 20093, "", "=q3=Highlander's Padded Greaves", "=ds=", "300 #alliance#", ""};
		{ 27, 20108, "", "=q3=Highlander's Lamellar Girdle", "=ds=", "300 #alliance#", ""};
		{ 28, 20126, "", "=q3=Highlander's Mail Girdle", "=ds=", "300 #alliance#", ""};
		{ 29, 20111, "", "=q3=Highlander's Lamellar Greaves", "=ds=", "300 #alliance#", ""};
		{ 30, 20129, "", "=q3=Highlander's Mail Greaves", "=ds=", "300 #alliance#", ""};
		Prev = "AB4049_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["ABMisc_H"] = {
		{ 2, 17349, "", "=q1=Superior Healing Draught", "=ds=", "5 #silver# 5 #horde#", ""};
		{ 3, 17352, "", "=q1=Superior Mana Draught", "=ds=", "5 #silver# 5 #horde#", ""};
		{ 4, 20222, "", "=q1=Defiler's Enriched Ration", "=ds=", "18 #silver#", ""};
		{ 5, 20224, "", "=q1=Defiler's Iron Ration", "=ds=", "15 #silver#", ""};
		{ 6, 20223, "", "=q1=Defiler's Field Ration", "=ds=", "9 #silver#", ""};
		{ 7, 20234, "", "=q1=Defiler's Runecloth Bandage", "=ds=", "18 #silver#", ""};
		{ 8, 20232, "", "=q1=Defiler's Mageweave Bandage", "=ds=", "15 #silver#", ""};
		{ 9, 20235, "", "=q1=Defiler's Silk Bandage", "=ds=", "9 #silver#", ""};
		{ 11, 21116, "", "=q3=Defiler's Talisman", "=ds=", "300 #horde#", ""};
		{ 12, 21120, "", "=q3=Defiler's Talisman", "=ds=", "300 #horde#", ""};
		{ 13, 21115, "", "=q3=Defiler's Talisman", "=ds=", "400 #horde#", ""};
		{ 14, 20072, "", "=q3=Defiler's Talisman", "=ds=", "3000 #horde#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6="..AL["Level 60 Rewards"], "=q5=#b6#"};
		{ 17, 20068, "", "=q4=Deathguard's Cloak", "=ds=", "5000 #horde#", ""};
		{ 25, 20214, "", "=q4=Mindfang", "=ds=", "9000 #horde#", ""};
		{ 26, 20220, "", "=q4=Ironbark Staff", "=ds=", "16000 #horde#", ""};
		Next = "AB4049_H";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["AB4049_H"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6="..AL["Level 40-49 Rewards"], "=q5=#b6#"};
		{ 2, 20165, "", "=q3=Defiler's Cloth Girdle", "=ds=", "400 #horde#", ""};
		{ 3, 20160, "", "=q3=Defiler's Cloth Boots", "=ds=", "400 #horde#", ""};
		{ 4, 20193, "", "=q3=Defiler's Leather Girdle", "=ds=", "400 #horde#", ""};
		{ 5, 20174, "", "=q3=Defiler's Lizardhide Girdle", "=ds=", "400 #horde#", ""};
		{ 6, 20189, "", "=q3=Defiler's Leather Boots", "=ds=", "400 #horde#", ""};
		{ 7, 20170, "", "=q3=Defiler's Lizardhide Boots", "=ds=", "400 #horde#", ""};
		{ 8, 20153, "", "=q3=Defiler's Chain Girdle", "=ds=", "300 #horde#", ""};
		{ 9, 20151, "", "=q3=Defiler's Chain Girdle", "=ds=", "400 #horde#", ""};
		{ 10, 20198, "", "=q3=Defiler's Mail Girdle", "=ds=", "300 #horde#", ""};
		{ 11, 20196, "", "=q3=Defiler's Mail Girdle", "=ds=", "400 #horde#", ""};
		{ 12, 20156, "", "=q3=Defiler's Chain Greaves", "=ds=", "300 #horde#", ""};
		{ 13, 20155, "", "=q3=Defiler's Chain Greaves", "=ds=", "400 #horde#", ""};
		{ 14, 20200, "", "=q3=Defiler's Mail Greaves", "=ds=", "300 #horde#", ""};
		{ 15, 20202, "", "=q3=Defiler's Mail Greaves", "=ds=", "400 #horde#", ""};
		{ 16, 20180, "", "=q3=Defiler's Lamellar Girdle", "=ds=", "300 #horde#", ""};
		{ 17, 20179, "", "=q3=Defiler's Lamellar Girdle", "=ds=", "400 #horde#", ""};
		{ 18, 20206, "", "=q3=Defiler's Plate Girdle", "=ds=", "300 #horde#", ""};
		{ 19, 20205, "", "=q3=Defiler's Plate Girdle", "=ds=", "400 #horde#", ""};
		{ 20, 20183, "", "=q3=Defiler's Lamellar Greaves", "=ds=", "300 #horde#", ""};
		{ 21, 20185, "", "=q3=Defiler's Lamellar Greaves", "=ds=", "400 #horde#", ""};
		{ 22, 20209, "", "=q3=Defiler's Plate Greaves", "=ds=", "300 #horde#", ""};
		{ 23, 20211, "", "=q3=Defiler's Plate Greaves", "=ds=", "400 #horde#", ""};
		Prev = "ABMisc_H";
		Next = "AB2039_H";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["AB2039_H"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6="..AL["Level 30-39 Rewards"], "=q5=#b6#"};
		{ 2, 20166, "", "=q3=Defiler's Cloth Girdle", "=ds=", "300 #horde#", ""};
		{ 3, 20161, "", "=q3=Defiler's Cloth Boots", "=ds=", "300 #horde#", ""};
		{ 4, 20192, "", "=q3=Defiler's Leather Girdle", "=ds=", "300 #horde#", ""};
		{ 5, 20173, "", "=q3=Defiler's Lizardhide Girdle", "=ds=", "300 #horde#", ""};
		{ 6, 20187, "", "=q3=Defiler's Leather Boots", "=ds=", "300 #horde#", ""};
		{ 7, 20168, "", "=q3=Defiler's Lizardhide Boots", "=ds=", "300 #horde#", ""};
		{ 16, 0, "INV_BannerPVP_02", "=q6="..AL["Level 20-29 Rewards"], "=q5=#b6#" };
		{ 17, 20164, "", "=q3=Defiler's Cloth Girdle", "=ds=", "300 #horde#", ""};
		{ 18, 20162, "", "=q3=Defiler's Cloth Boots", "=ds=", "300 #horde#", ""};
		{ 19, 20191, "", "=q3=Defiler's Leather Girdle", "=ds=", "300 #horde#", ""};
		{ 20, 20172, "", "=q3=Defiler's Lizardhide Girdle", "=ds=", "300 #horde#", ""};
		{ 21, 20152, "", "=q3=Defiler's Chain Girdle", "=ds=", "300 #horde#", ""};
		{ 22, 20197, "", "=q3=Defiler's Padded Girdle", "=ds=", "300 #horde#", ""};
		{ 23, 20188, "", "=q3=Defiler's Leather Boots", "=ds=", "300 #horde#", ""};
		{ 24, 20169, "", "=q3=Defiler's Lizardhide Boots", "=ds=", "300 #horde#", ""};
		{ 25, 20201, "", "=q3=Defiler's Mail Greaves", "=ds=", "300 #horde#", ""};
		{ 26, 20157, "", "=q3=Defiler's Chain Greaves", "=ds=", "300 #horde#", ""};
		{ 27, 20178, "", "=q3=Defiler's Lamellar Girdle", "=ds=", "300 #horde#", ""};
		{ 28, 20207, "", "=q3=Defiler's Mail Girdle", "=ds=", "300 #horde#", ""};
		{ 29, 20182, "", "=q3=Defiler's Lamellar Greaves", "=ds=", "300 #horde#", ""};
		{ 30, 20210, "", "=q3=Defiler's Mail Greaves", "=ds=", "300 #horde#", ""};
		Prev = "AB4049_H";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["ABSets1_A"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#absa1#", "=ec1=#c5#, #c3#, #c8#"};
		{ 2, 20061, "", "=q4=Highlander's Epaulets", "=ds=", "9000 #alliance#", ""};
		{ 3, 20047, "", "=q3=Highlander's Cloth Girdle", "=ds=", "3000 #alliance#", ""};
		{ 4, 20054, "", "=q3=Highlander's Cloth Boots", "=ds=", "3000 #alliance#", ""};
		{ 6, 0, "INV_BannerPVP_02", "=q6=#absa2#", "=ec1=#c6#, #c1#"};
		{ 7, 20059, "", "=q4=Highlander's Leather Shoulders", "=ds=", "9000 #alliance#", ""};
		{ 8, 20045, "", "=q3=Highlander's Leather Girdle", "=ds=", "3000 #alliance#", ""};
		{ 9, 20052, "", "=q3=Highlander's Leather Boots", "=ds=", "3000 #alliance#", ""};
		{ 11, 0, "INV_BannerPVP_02", "=q6=#absa3#", "=ec1=#c6#, #c1#"};
		{ 12, 20060, "", "=q4=Highlander's Lizardhide Shoulders", "=ds=", "9000 #alliance#", ""};
		{ 13, 20046, "", "=q3=Highlander's Lizardhide Girdle", "=ds=", "3000 #alliance#", ""};
		{ 14, 20053, "", "=q3=Highlander's Lizardhide Boots", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_02", "=q6=#absa4#", "=ec1=#c2#, #c7#"};
		{ 17, 20055, "", "=q4=Highlander's Chain Pauldrons", "=ds=", "9000 #alliance#", ""};
		{ 18, 20043, "", "=q3=Highlander's Chain Girdle", "=ds=", "3000 #alliance#", ""};
		{ 19, 20050, "", "=q3=Highlander's Chain Greaves", "=ds=", "3000 #alliance#", ""};
		{ 21, 0, "INV_BannerPVP_02", "=q6=#absa5#", "=ec1=#c2#, #c7#"};
		{ 22, 20056, "", "=q4=Highlander's Mail Pauldrons", "=ds=", "9000 #alliance#", ""};
		{ 23, 20044, "", "=q3=Highlander's Mail Girdle", "=ds=", "3000 #alliance#", ""};
		{ 24, 20051, "", "=q3=Highlander's Mail Greaves", "=ds=", "3000 #alliance#", ""};
		{ 26, 0, "INV_BannerPVP_02", "=q6=#absa6#", "=ec1=#c9#, #c4#"};
		{ 27, 20057, "", "=q4=Highlander's Plate Spaulders", "=ds=", "9000 #alliance#", ""};
		{ 28, 20041, "", "=q3=Highlander's Plate Girdle", "=ds=", "3000 #alliance#", ""};
		{ 29, 20048, "", "=q3=Highlander's Plate Greaves", "=ds=", "3000 #alliance#", ""};
		Next = "ABSets2_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["ABSets1_H"] = {
		{ 1, 0, "INV_BannerPVP_01", "=q6=#absh1#", "=ec1=#c5#, #c3#, #c8#"};
		{ 2, 20176, "", "=q4=Defiler's Epaulets", "=ds=", "9000 #horde#", ""};
		{ 3, 20163, "", "=q3=Defiler's Cloth Girdle", "=ds=", "3000 #horde#", ""};
		{ 4, 20159, "", "=q3=Defiler's Cloth Boots", "=ds=", "3000 #horde#", ""};
		{ 6, 0, "INV_BannerPVP_01", "=q6=#absh2#", "=ec1=#c6#, #c1#"};
		{ 7, 20194, "", "=q4=Defiler's Leather Shoulders", "=ds=", "9000 #horde#", ""};
		{ 8, 20190, "", "=q3=Defiler's Leather Girdle", "=ds=", "3000 #horde#", ""};
		{ 9, 20186, "", "=q3=Defiler's Leather Boots", "=ds=", "3000 #horde#", ""};
		{ 11, 0, "INV_BannerPVP_01", "=q6=#absh3#", "=ec1=#c6#, #c1#"};
		{ 12, 20175, "", "=q4=Defiler's Lizardhide Shoulders", "=ds=", "9000 #horde#", ""};
		{ 13, 20171, "", "=q3=Defiler's Lizardhide Girdle", "=ds=", "3000 #horde#", ""};
		{ 14, 20167, "", "=q3=Defiler's Lizardhide Boots", "=ds=", "3000 #horde#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#absh4#", "=ec1=#c2#, #c7#"};
		{ 17, 20158, "", "=q3=Defiler's Chain Pauldrons", "=ds=", "9000 #horde#", ""};
		{ 18, 20150, "", "=q3=Defiler's Chain Girdle", "=ds=", "3000 #horde#", ""};
		{ 19, 20154, "", "=q3=Defiler's Chain Greaves", "=ds=", "3000 #horde#", ""};
		{ 21, 0, "INV_BannerPVP_01", "=q6=#absh5#", "=ec1=#c2#, #c7#"};
		{ 22, 20203, "", "=q4=Defiler's Mail Pauldrons", "=ds=", "9000 #horde#", ""};
		{ 23, 20195, "", "=q3=Defiler's Mail Girdle", "=ds=", "3000 #horde#", ""};
		{ 24, 20199, "", "=q3=Defiler's Mail Greaves", "=ds=", "3000 #horde#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#absh6#", "=ec1=#c9#, #c4#"};
		{ 17, 20212, "", "=q4=Defiler's Plate Spaulders", "=ds=", "9000 #horde#", ""};
		{ 18, 20204, "", "=q3=Defiler's Plate Girdle", "=ds=", "3000 #horde#", ""};
		{ 19, 20208, "", "=q3=Defiler's Plate Greaves", "=ds=", "3000 #horde#", ""};
		Next = "ABSets2_H";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["ABSets2_A"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#absa7#", "=ec1=#c4#"};
		{ 2, 20058, "", "=q4=Highlander's Lamellar Spaulders", "=ds=", "9000 #alliance#", ""};
		{ 3, 20042, "", "=q3=Highlander's Lamellar Girdle", "=ds=", "3000 #alliance#", ""};
		{ 4, 20049, "", "=q3=Highlander's Lamellar Greaves", "=ds=", "3000 #alliance#", ""};
		Prev = "ABSets1_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["ABSets2_H"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#absa7#", "=ec1=#c4#"};
		{ 2, 20184, "", "=q4=Defiler's Lamellar Spaulders", "=ds=", "9000 #horde#", ""};
		{ 3, 20177, "", "=q3=Defiler's Lamellar Girdle", "=ds=", "3000 #horde#", ""};
		{ 4, 20181, "", "=q3=Defiler's Lamellar Greaves", "=ds=", "3000 #horde#", ""};
		Prev = "ABSets1_H";
		Back = "PVPMENU2";
	};

		---------------------
		--- Warsong Gulch ---
		---------------------

	AtlasLoot_Data["WSGMisc"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#m7#", "=q5=#b3#"};
		{ 2, 19506, "", "=q1=Silverwing Battle Tabard", "=ds=", "12000 #faction#", ""};
		{ 5, 17348, "", "=q1=Major Healing Draught", "=ds=", "10 #silver# 2 #faction#", ""};
		{ 6, 17349, "", "=q1=Superior Healing Draught", "=ds=", "5 #silver# 5 #faction#", ""};
		{ 7, 19060, "", "=q1=Warsong Gulch Enriched Ration", "=ds=", "20 #silver#", ""};
		{ 8, 19062, "", "=q1=Warsong Gulch Field Ration", "=ds=", "10 #silver#", ""};
		{ 9, 19067, "", "=q1=Warsong Gulch Mageweave Bandage", "=ds=", "15 #silver#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#m6#", "=q5=#b4#"};
		{ 17, 19505, "", "=q1=Warsong Battle Tabard", "=ds=", "12000 #faction#", ""};
		{ 20, 17351, "", "=q1=Major Mana Draught", "=ds=", "10 #silver# 2 #faction#", ""};
		{ 21, 17352, "", "=q1=Superior Mana Draught", "=ds=", "5 #silver# 5 #faction#", ""};
		{ 22, 19061, "", "=q1=Warsong Gulch Iron Ration", "=ds=", "15 #silver#", ""};
		{ 23, 19066, "", "=q1=Warsong Gulch Runecloth Bandage", "=ds=", "20 #silver#", ""};
		{ 24, 19068, "", "=q1=Warsong Gulch Silk Bandage", "=ds=", "10 #silver#", ""};
		Next = "WSGAccessories_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["WSGAccessories_A"] = {
		{ 1, 20428, "", "=q3=Caretaker's Cape", "=ds=", "100 #alliance#", ""};
		{ 2, 19533, "", "=q3=Caretaker's Cape", "=ds=", "100 #alliance#", ""};
		{ 3, 19532, "", "=q3=Caretaker's Cape", "=ds=", "300 #alliance#", ""};
		{ 4, 19531, "", "=q3=Caretaker's Cape", "=ds=", "300 #alliance#", ""};
		{ 5, 19530, "", "=q3=Caretaker's Cape", "=ds=", "1600 #alliance#", ""};
		{ 7, 20444, "", "=q3=Sentinel's Medallion", "=ds=", "100 #alliance#", ""};
		{ 8, 19541, "", "=q3=Sentinel's Medallion", "=ds=", "100 #alliance#", ""};
		{ 9, 19540, "", "=q3=Sentinel's Medallion", "=ds=", "300 #alliance#", ""};
		{ 10, 19539, "", "=q3=Sentinel's Medallion", "=ds=", "300 #alliance#", ""};
		{ 11, 19538, "", "=q3=Sentinel's Medallion", "=ds=", "1600 #alliance#", ""};
		{ 13, 21568, "", "=q3=Rune of Duty", "=ds=", "300 #alliance#", ""};
		{ 14, 21567, "", "=q3=Rune of Duty", "=ds=", "300 #alliance#", ""};
		{ 16, 20431, "", "=q3=Lorekeeper's Ring", "=ds=", "100 #alliance#", ""};
		{ 17, 19525, "", "=q3=Lorekeeper's Ring", "=ds=", "100 #alliance#", ""};
		{ 18, 19524, "", "=q3=Lorekeeper's Ring", "=ds=", "300 #alliance#", ""};
		{ 19, 19523, "", "=q3=Lorekeeper's Ring", "=ds=", "300 #alliance#", ""};
		{ 20, 19522, "", "=q3=Lorekeeper's Ring", "=ds=", "1600 #alliance#", ""};
		{ 22, 20439, "", "=q3=Protector's Band", "=ds=", "100 #alliance#", ""};
		{ 23, 19517, "", "=q3=Protector's Band", "=ds=", "100 #alliance#", ""};
		{ 24, 19515, "", "=q3=Protector's Band", "=ds=", "300 #alliance#", ""};
		{ 25, 19516, "", "=q3=Protector's Band", "=ds=", "300 #alliance#", ""};
		{ 26, 19514, "", "=q3=Protector's Band", "=ds=", "1600 #alliance#", ""};
		{ 28, 21566, "", "=q3=Rune of Perfection", "=ds=", "300 #alliance#", ""};
		{ 29, 21565, "", "=q3=Rune of Perfection", "=ds=", "300 #alliance#", ""};
		Next = "WSGWeapons_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["WSGAccessories_H"] = {
		{ 1, 20427, "", "=q3=Battle Healer's Cloak", "=ds=", "100 #horde#", ""};
		{ 2, 19529, "", "=q3=Battle Healer's Cloak", "=ds=", "100 #horde#", ""};
		{ 3, 19528, "", "=q3=Battle Healer's Cloak", "=ds=", "300 #horde#", ""};
		{ 4, 19527, "", "=q3=Battle Healer's Cloak", "=ds=", "300 #horde#", ""};
		{ 5, 19526, "", "=q3=Battle Healer's Cloak", "=ds=", "1600 #horde#", ""};
		{ 7, 20442, "", "=q3=Scout's Medallion", "=ds=", "100 #horde#", ""};
		{ 8, 19537, "", "=q3=Scout's Medallion", "=ds=", "100 #horde#", ""};
		{ 9, 19536, "", "=q3=Scout's Medallion", "=ds=", "300 #horde#", ""};
		{ 10, 19535, "", "=q3=Scout's Medallion", "=ds=", "300 #horde#", ""};
		{ 11, 19534, "", "=q3=Scout's Medallion", "=ds=", "1600 #horde#", ""};
		{ 13, 21568, "", "=q3=Rune of Duty", "=ds=", "300 #horde#", ""};
		{ 14, 21567, "", "=q3=Rune of Duty", "=ds=", "300 #horde#", ""};
		{ 16, 20426, "", "=q3=Advisor's Ring", "=ds=", "100 #horde#", ""};
		{ 17, 19521, "", "=q3=Advisor's Ring", "=ds=", "100 #horde#", ""};
		{ 18, 19520, "", "=q3=Advisor's Ring", "=ds=", "300 #horde#", ""};
		{ 19, 19519, "", "=q3=Advisor's Ring", "=ds=", "300 #horde#", ""};
		{ 20, 19518, "", "=q3=Advisor's Ring", "=ds=", "1600 #horde#", ""};
		{ 22, 20429, "", "=q3=Legionnaire's Band", "=ds=", "100 #horde#", ""};
		{ 23, 19513, "", "=q3=Legionnaire's Band", "=ds=", "100 #horde#", ""};
		{ 24, 19512, "", "=q3=Legionnaire's Band", "=ds=", "300 #horde#", ""};		
		{ 25, 19511, "", "=q3=Legionnaire's Band", "=ds=", "300 #horde#", ""};
		{ 26, 19510, "", "=q3=Legionnaire's Band", "=ds=", "1600 #horde#", ""};
		{ 28, 21566, "", "=q3=Rune of Perfection", "=ds=", "300 #horde#", ""};
		{ 29, 21565, "", "=q3=Rune of Perfection", "=ds=", "300 #horde#", ""};
		Next = "WSGWeapons_H";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["WSGWeapons_A"] = {
		{ 1, 20443, "", "=q3=Sentinel's Blade", "=ds=", "300 #alliance#", ""};
		{ 2, 19549, "", "=q3=Sentinel's Blade", "=ds=", "400 #alliance#", ""};
		{ 3, 19548, "", "=q3=Sentinel's Blade", "=ds=", "500 #alliance#", ""};
		{ 4, 19547, "", "=q3=Sentinel's Blade", "=ds=", "700 #alliance#", ""};
		{ 5, 19546, "", "=q3=Sentinel's Blade", "=ds=", "6000 #alliance#", ""};
		{ 7, 20440, "", "=q3=Protector's Sword", "=ds=", "300 #alliance#", ""};
		{ 8, 19557, "", "=q3=Protector's Sword", "=ds=", "400 #alliance#", ""};
		{ 9, 19556, "", "=q3=Protector's Sword", "=ds=", "500 #alliance#", ""};
		{ 10, 19555, "", "=q3=Protector's Sword", "=ds=", "700 #alliance#", ""};
		{ 11, 19554, "", "=q3=Protector's Sword", "=ds=", "6000 #alliance#", ""};
		{ 16, 20434, "", "=q3=Lorekeeper's Staff", "=ds=", "500 #alliance#", ""};
		{ 17, 19573, "", "=q3=Lorekeeper's Staff", "=ds=", "700 #alliance#", ""};
		{ 18, 19572, "", "=q3=Lorekeeper's Staff", "=ds=", "1000 #alliance#", ""};
		{ 19, 19571, "", "=q3=Lorekeeper's Staff", "=ds=", "5000 #alliance#", ""};
		{ 20, 19570, "", "=q3=Lorekeeper's Staff", "=ds=", "15000 #alliance#", ""};
		{ 22, 20438, "", "=q3=Outrunner's Bow", "=ds=", "300 #alliance#", ""};
		{ 23, 19565, "", "=q3=Outrunner's Bow", "=ds=", "400 #alliance#", ""};
		{ 24, 19564, "", "=q3=Outrunner's Bow", "=ds=", "500 #alliance#", ""};
		{ 25, 19563, "", "=q3=Outrunner's Bow", "=ds=", "700 #alliance#", ""};
		{ 26, 19562, "", "=q3=Outrunner's Bow", "=ds=", "6000 #alliance#", ""};
		Prev = "WSGAccessories_A";
		Next = "WSGArmor_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["WSGWeapons_H"] = {
		{ 1, 20441, "", "=q3=Scout's Blade", "=ds=", "300 #horde#", ""};
		{ 2, 19545, "", "=q3=Scout's Blade", "=ds=", "400 #horde#", ""};
		{ 3, 19544, "", "=q3=Scout's Blade", "=ds=", "500 #horde#", ""};
		{ 4, 19543, "", "=q3=Scout's Blade", "=ds=", "700 #horde#", ""};
		{ 5, 19542, "", "=q3=Scout's Blade", "=ds=", "6000 #horde#", ""};
		{ 7, 20430, "", "=q3=Legionnaire's Sword", "=ds=", "300 #horde#", ""};
		{ 8, 19553, "", "=q3=Legionnaire's Sword", "=ds=", "400 #horde#", ""};
		{ 9, 19552, "", "=q3=Legionnaire's Sword", "=ds=", "500 #horde#", ""};
		{ 10, 19551, "", "=q3=Legionnaire's Sword", "=ds=", "700 #horde#", ""};
		{ 11, 19550, "", "=q3=Legionnaire's Sword", "=ds=", "6000 #horde#", ""};
		{ 16, 20425, "", "=q3=Advisor's Gnarled Staff", "=ds=", "500 #horde#", ""};
		{ 17, 19569, "", "=q3=Advisor's Gnarled Staff", "=ds=", "700 #horde#", ""};
		{ 18, 19568, "", "=q3=Advisor's Gnarled Staff", "=ds=", "1000 #horde#", ""};
		{ 19, 19567, "", "=q3=Advisor's Gnarled Staff", "=ds=", "5000 #horde#", ""};
		{ 20, 19566, "", "=q3=Advisor's Gnarled Staff", "=ds=", "15000 #horde#", ""};
		{ 22, 20437, "", "=q3=Outrider's Bow", "=ds=", "300 #horde#", ""};
		{ 23, 19561, "", "=q3=Outrider's Bow", "=ds=", "400 #horde#", ""};
		{ 24, 19560, "", "=q3=Outrider's Bow", "=ds=", "500 #horde#", ""};
		{ 25, 19559, "", "=q3=Outrider's Bow", "=ds=", "700 #horde#", ""};
		{ 26, 19558, "", "=q3=Outrider's Bow", "=ds=", "6000 #horde#", ""};
		Prev = "WSGAccessories_H";
		Next = "WSGArmor_H";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["WSGArmor_A"] = {
		{ 1, 19597, "", "=q4=Dryad's Wrist Bindings", "=ds=", "500 #alliance#", ""};
		{ 2, 19596, "", "=q4=Dryad's Wrist Bindings", "=ds=", "700 #alliance#", ""};
		{ 3, 19595, "", "=q4=Dryad's Wrist Bindings", "=ds=", "5000 #alliance#", ""};	
		{ 5, 19590, "", "=q4=Forest Stalker's Bracers", "=ds=", "500 #alliance#", ""};
		{ 6, 19589, "", "=q4=Forest Stalker's Bracers", "=ds=", "700 #alliance#", ""};
		{ 7, 19587, "", "=q4=Forest Stalker's Bracers", "=ds=", "5000 #alliance#", ""};
		{ 9, 19584, "", "=q4=Windtalker's Wristguards", "=ds=", "500 #alliance#", ""};
		{ 10, 19583, "", "=q4=Windtalker's Wristguards", "=ds=", "700 #alliance#", ""};
		{ 11, 19582, "", "=q4=Windtalker's Wristguards", "=ds=", "5000 #alliance#", ""};
		{ 13, 19581, "", "=q4=Berserker Bracers", "=ds=", "500 #alliance#", ""};
		{ 14, 19580, "", "=q4=Berserker Bracers", "=ds=", "700 #alliance#", ""};
		{ 15, 19578, "", "=q4=Berserker Bracers", "=ds=", "5000 #alliance#", ""};
		{ 16, 22752, "", "=q4=Sentinel's Silk Leggings", "=ds=", "9000 #alliance#", ""};	
		{ 18, 22749, "", "=q4=Sentinel's Leather Pants", "=ds=", "9000 #alliance#", ""};
		{ 19, 22750, "", "=q4=Sentinel's Lizardhide Pants", "=ds=", "9000 #alliance#", ""};
		{ 21, 22748, "", "=q4=Sentinel's Chain Leggings", "=ds=", "9000 #alliance#", ""};
		{ 22, 30497, "", "=q4=Sentinel's Mail Leggings", "=ds=", "9000 #alliance#", ""};
		{ 24, 22753, "", "=q4=Sentinel's Lamellar Legguards", "=ds=", "9000 #alliance#", ""};
		{ 25, 22672, "", "=q4=Sentinel's Plate Legguards", "=ds=", "9000 #alliance#", ""};	
		Prev = "WSGWeapons_A";
		Back = "PVPMENU2";
	};

	AtlasLoot_Data["WSGArmor_H"] = {
		{ 1, 19597, "", "=q4=Dryad's Wrist Bindings", "=ds=", "500 #horde#", ""};
		{ 2, 19596, "", "=q4=Dryad's Wrist Bindings", "=ds=", "700 #horde#", ""};
		{ 3, 19595, "", "=q4=Dryad's Wrist Bindings", "=ds=", "5000 #horde#", ""};
		{ 5, 19590, "", "=q4=Forest Stalker's Bracers", "=ds=", "500 #horde#", ""};
		{ 6, 19589, "", "=q4=Forest Stalker's Bracers", "=ds=", "700 #horde#", ""};
		{ 7, 19587, "", "=q4=Forest Stalker's Bracers", "=ds=", "5000 #horde#", ""};
		{ 9, 19584, "", "=q4=Windtalker's Wristguards", "=ds=", "500 #horde#", ""};
		{ 10, 19583, "", "=q4=Windtalker's Wristguards", "=ds=", "700 #horde#", ""};
		{ 11, 19582, "", "=q4=Windtalker's Wristguards", "=ds=", "5000 #horde#", ""};
		{ 13, 19581, "", "=q4=Berserker Bracers", "=ds=", "500 #horde#", ""};
		{ 14, 19580, "", "=q4=Berserker Bracers", "=ds=", "700 #horde#", ""};
		{ 15, 19578, "", "=q4=Berserker Bracers", "=ds=", "5000 #horde#", ""};
		{ 16, 22747, "", "=q4=Outrider's Silk Leggings", "=ds=", "9000 #horde#", ""};
		{ 18, 22740, "", "=q4=Outrider's Leather Pants", "=ds=", "9000 #horde#", ""};
		{ 19, 22741, "", "=q4=Outrider's Lizardhide Pants", "=ds=", "9000 #horde#", ""};
		{ 21, 22673, "", "=q4=Outrider's Chain Leggings", "=ds=", "9000 #horde#", ""};
		{ 22, 22676, "", "=q4=Outrider's Mail Leggings", "=ds=", "9000 #horde#", ""};
		{ 24, 30498, "", "=q4=Outrider's Lamellar Legguards", "=ds=", "9000 #horde#", ""};
		{ 25, 22651, "", "=q4=Outrider's Plate Legguards", "=ds=", "9000 #horde#", ""};
		Prev = "WSGWeapons_H";
		Back = "PVPMENU2";
	};

		---------------------------------------
		--- PvP Level 60 Rare and Epic Sets ---
		---------------------------------------

	AtlasLoot_Data["PVPDruid"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea1#", "=q5=#pvps1#"};
		{ 2, 16451, "", "=q4=Field Marshal's Dragonhide Helmet", "=ds=", "15000 #alliance#", ""};
		{ 3, 16449, "", "=q4=Field Marshal's Dragonhide Spaulders", "=ds=", "9000 #alliance#", ""};
		{ 4, 16452, "", "=q4=Field Marshal's Dragonhide Breastplate", "=ds=", "15000 #alliance#", ""};
		{ 5, 16448, "", "=q4=Marshal's Dragonhide Gauntlets", "=ds=", "9000 #alliance#", ""};
		{ 6, 16450, "", "=q4=Marshal's Dragonhide Legguards", "=ds=", "15000 #alliance#", ""};
		{ 7, 16459, "", "=q4=Marshal's Dragonhide Boots", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra1#", "=q5=#pvps2#"};
		{ 10, 23308, "", "=q3=Lieutenant Commander's Dragonhide Headguard", "=ds=", "5000 #alliance#", ""};
		{ 11, 23309, "", "=q3=Lieutenant Commander's Dragonhide Shoulders", "=ds=", "3000 #alliance#", ""};
		{ 12, 23294, "", "=q3=Knight-Captain's Dragonhide Chestpiece", "=ds=", "5000 #alliance#", ""};
		{ 13, 23280, "", "=q3=Knight-Lieutenant's Dragonhide Grips", "=ds=", "3000 #alliance#", ""};
		{ 14, 23295, "", "=q3=Knight-Captain's Dragonhide Leggings", "=ds=", "5000 #alliance#", ""};
		{ 15, 23281, "", "=q3=Knight-Lieutenant's Dragonhide Treads", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh1#", "=q5=#pvps1#"};
		{ 17, 16550, "", "=q4=Warlord's Dragonhide Helmet", "=ds=", "15000 #horde#", ""};
		{ 18, 16551, "", "=q4=Warlord's Dragonhide Epaulets", "=ds=", "9000 #horde#", ""};
		{ 19, 16549, "", "=q4=Warlord's Dragonhide Hauberk", "=ds=", "15000 #horde#", ""};
		{ 20, 16555, "", "=q4=General's Dragonhide Gloves", "=ds=", "9000 #horde#", ""};
		{ 21, 16552, "", "=q4=General's Dragonhide Leggings", "=ds=", "15000 #horde#", ""};
		{ 22, 16554, "", "=q4=General's Dragonhide Boots", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh1#", "=q5=#pvps2#"};
		{ 25, 23253, "", "=q3=Champion's Dragonhide Headguard", "=ds=", "5000 #horde#", ""};
		{ 26, 23254, "", "=q3=Champion's Dragonhide Shoulders", "=ds=", "3000 #horde#", ""};
		{ 27, 22877, "", "=q3=Legionnaire's Dragonhide Chestpiece", "=ds=", "5000 #horde#", ""};
		{ 28, 22863, "", "=q3=Blood Guard's Dragonhide Grips", "=ds=", "3000 #horde#", ""};
		{ 29, 22878, "", "=q3=Legionnaire's Dragonhide Leggings", "=ds=", "5000 #horde#", ""};
		{ 30, 22852, "", "=q3=Blood Guard's Dragonhide Treads", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

	AtlasLoot_Data["PVPHunter"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea2#", "=q5=#pvps1#"};
		{ 2, 16465, "", "=q4=Field Marshal's Chain Helm", "=ds=", "15000 #alliance#", ""};
		{ 3, 16468, "", "=q4=Field Marshal's Chain Spaulders", "=ds=", "9000 #alliance#", ""};
		{ 4, 16466, "", "=q4=Field Marshal's Chain Breastplate", "=ds=", "15000 #alliance#", ""};
		{ 5, 16463, "", "=q4=Marshal's Chain Grips", "=ds=", "9000 #alliance#", ""};
		{ 6, 16467, "", "=q4=Marshal's Chain Legguards", "=ds=", "15000 #alliance#", ""};
		{ 7, 16462, "", "=q4=Marshal's Chain Boots", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra2#", "=q5=#pvps2#"};
		{ 10, 23306, "", "=q3=Lieutenant Commander's Chain Helm", "=ds=", "5000 #alliance#", ""};
		{ 11, 23307, "", "=q3=Lieutenant Commander's Chain Shoulders", "=ds=", "3000 #alliance#", ""};
		{ 12, 23292, "", "=q3=Knight-Captain's Chain Hauberk", "=ds=", "5000 #alliance#", ""};
		{ 13, 23279, "", "=q3=Knight-Lieutenant's Chain Vices", "=ds=", "3000 #alliance#", ""};
		{ 14, 23293, "", "=q3=Knight-Captain's Chain Legguards", "=ds=", "5000 #alliance#", ""};
		{ 15, 23278, "", "=q3=Knight-Lieutenant's Chain Greaves", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh2#", "=q5=#pvps1#"};
		{ 17, 16566, "", "=q4=Warlord's Chain Helmet", "=ds=", "15000 #horde#", ""};
		{ 18, 16568, "", "=q4=Warlord's Chain Shoulders", "=ds=", "9000 #horde#", ""};
		{ 19, 16565, "", "=q4=Warlord's Chain Chestpiece", "=ds=", "15000 #horde#", ""};
		{ 20, 16571, "", "=q4=General's Chain Gloves", "=ds=", "9000 #horde#", ""};
		{ 21, 16567, "", "=q4=General's Chain Legguards", "=ds=", "15000 #horde#", ""};
		{ 22, 16569, "", "=q4=General's Chain Boots", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh2#", "=q5=#pvps2#"};
		{ 25, 23251, "", "=q3=Champion's Chain Helm", "=ds=", "5000 #horde#", ""};
		{ 26, 23252, "", "=q3=Champion's Chain Shoulders", "=ds=", "3000 #horde#", ""};
		{ 27, 22874, "", "=q3=Legionnaire's Chain Hauberk", "=ds=", "5000 #horde#", ""};
		{ 28, 22862, "", "=q3=Blood Guard's Chain Vices", "=ds=", "3000 #horde#", ""};
		{ 29, 22875, "", "=q3=Legionnaire's Chain Legguards", "=ds=", "5000 #horde#", ""};
		{ 30, 22843, "", "=q3=Blood Guard's Chain Greaves", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

	AtlasLoot_Data["PVPMage"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea3#", "=q5=#pvps1#"};
		{ 2, 16441, "", "=q4=Field Marshal's Coronet", "=ds=", "15000 #alliance#", ""};
		{ 3, 16444, "", "=q4=Field Marshal's Silk Spaulders", "=ds=", "9000 #alliance#", ""};
		{ 4, 16443, "", "=q4=Field Marshal's Silk Vestments", "=ds=", "15000 #alliance#", ""};
		{ 5, 16440, "", "=q4=Marshal's Silk Gloves", "=ds=", "9000 #alliance#", ""};
		{ 6, 16442, "", "=q4=Marshal's Silk Leggings", "=ds=", "15000 #alliance#", ""};
		{ 7, 16437, "", "=q4=Marshal's Silk Footwraps", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra3#", "=q5=#pvps2#"};
		{ 10, 23318, "", "=q3=Lieutenant Commander's Silk Cowl", "=ds=", "5000 #alliance#", ""};
		{ 11, 23319, "", "=q3=Lieutenant Commander's Silk Mantle", "=ds=", "3000 #alliance#", ""};
		{ 12, 23305, "", "=q3=Knight-Captain's Silk Tunic", "=ds=", "5000 #alliance#", ""};
		{ 13, 23290, "", "=q3=Knight-Lieutenant's Silk Handwraps", "=ds=", "3000 #alliance#", ""};
		{ 14, 23304, "", "=q3=Knight-Captain's Silk Legguards", "=ds=", "5000 #alliance#", ""};
		{ 15, 23291, "", "=q3=Knight-Lieutenant's Silk Walkers", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh3#", "=q5=#pvps1#"};
		{ 17, 16533, "", "=q4=Warlord's Silk Cowl", "=ds=", "15000 #horde#", ""};
		{ 18, 16536, "", "=q4=Warlord's Silk Amice", "=ds=", "9000 #horde#", ""};
		{ 19, 16535, "", "=q4=Warlord's Silk Raiment", "=ds=", "15000 #horde#", ""};
		{ 20, 16540, "", "=q4=General's Silk Handguards", "=ds=", "9000 #horde#", ""};
		{ 21, 16534, "", "=q4=General's Silk Trousers", "=ds=", "15000 #horde#", ""};
		{ 22, 16539, "", "=q4=General's Silk Boots", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh3#", "=q5=#pvps2#"};
		{ 25, 23263, "", "=q3=Champion's Silk Cowl", "=ds=", "5000 #horde#", ""};
		{ 26, 23264, "", "=q3=Champion's Silk Mantle", "=ds=", "3000 #horde#", ""};
		{ 27, 22886, "", "=q3=Legionnaire's Silk Tunic", "=ds=", "5000 #horde#", ""};
		{ 28, 22870, "", "=q3=Blood Guard's Silk Handwraps", "=ds=", "3000 #horde#", ""};
		{ 29, 22883, "", "=q3=Legionnaire's Silk Legguards", "=ds=", "5000 #horde#", ""};
		{ 30, 22860, "", "=q3=Blood Guard's Silk Walkers", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

	AtlasLoot_Data["PVPPaladin"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea4#", "=q5=#pvps1#"};
		{ 2, 16474, "", "=q4=Field Marshal's Lamellar Faceguard", "=ds=", "15000 #alliance#", ""};
		{ 3, 16476, "", "=q4=Field Marshal's Lamellar Pauldrons", "=ds=", "9000 #alliance#", ""};
		{ 4, 16473, "", "=q4=Field Marshal's Lamellar Chestplate", "=ds=", "15000 #alliance#", ""};
		{ 5, 16471, "", "=q4=Marshal's Lamellar Gloves", "=ds=", "9000 #alliance#", ""};
		{ 6, 16475, "", "=q4=Marshal's Lamellar Legplates", "=ds=", "15000 #alliance#", ""};
		{ 7, 16472, "", "=q4=Marshal's Lamellar Boots", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra4#", "=q5=#pvps2#"};
		{ 10, 23276, "", "=q3=Lieutenant Commander's Lamellar Headguard", "=ds=", "5000 #alliance#", ""};
		{ 11, 23277, "", "=q3=Lieutenant Commander's Lamellar Shoulders", "=ds=", "3000 #alliance#", ""};
		{ 12, 23272, "", "=q3=Knight-Captain's Lamellar Breastplate", "=ds=", "5000 #alliance#", ""};
		{ 13, 23274, "", "=q3=Knight-Lieutenant's Lamellar Gauntlets", "=ds=", "3000 #alliance#", ""};
		{ 14, 23273, "", "=q3=Knight-Captain's Lamellar Leggings", "=ds=", "5000 #alliance#", ""};
		{ 15, 23275, "", "=q3=Knight-Lieutenant's Lamellar Sabatons", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh9#", "=q5=#pvps1#"};
		{ 17, 29616, "", "=q4=Warlord's Lamellar Faceguard", "=ds=", "15000 #horde#", ""};
		{ 18, 29617, "", "=q4=Warlord's Lamellar Pauldrons", "=ds=", "9000 #horde#", ""};
		{ 19, 29615, "", "=q4=Warlord's Lamellar Chestplate", "=ds=", "15000 #horde#", ""};
		{ 20, 29613, "", "=q4=General's Lamellar Gloves", "=ds=", "9000 #horde#", ""};
		{ 21, 29614, "", "=q4=General's Lamellar Legplates", "=ds=", "15000 #horde#", ""};
		{ 22, 29612, "", "=q4=General's Lamellar Boots", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh9#", "=q5=#pvps2#"};
		{ 25, 29604, "", "=q3=Champion's Lamellar Headguard", "=ds=", "5000 #horde#", ""};
		{ 26, 29605, "", "=q3=Champion's Lamellar Shoulders", "=ds=", "3000 #horde#", ""};
		{ 27, 29602, "", "=q3=Legionnaire's Lamellar Breastplate", "=ds=", "5000 #horde#", ""};
		{ 28, 29600, "", "=q3=Blood Guard's Lamellar Gauntlets", "=ds=", "3000 #horde#", ""};
		{ 29, 29603, "", "=q3=Legionnaire's Lamellar Leggings", "=ds=", "5000 #horde#", ""};
		{ 30, 29601, "", "=q3=Blood Guard's Lamellar Sabatons", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

	AtlasLoot_Data["PVPPriest"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea5#", "=q5=#pvps1#"};
		{ 2, 17602, "", "=q4=Field Marshal's Headdress", "=ds=", "15000 #alliance#", ""};
		{ 3, 17604, "", "=q4=Field Marshal's Satin Mantle", "=ds=", "9000 #alliance#", ""};
		{ 4, 17605, "", "=q4=Field Marshal's Satin Vestments", "=ds=", "15000 #alliance#", ""};
		{ 5, 17608, "", "=q4=Marshal's Satin Gloves", "=ds=", "9000 #alliance#", ""};
		{ 6, 17603, "", "=q4=Marshal's Satin Pants", "=ds=", "15000 #alliance#", ""};
		{ 7, 17607, "", "=q4=Marshal's Satin Sandals", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra5#", "=q5=#pvps2#"};
		{ 10, 23316, "", "=q3=Lieutenant Commander's Satin Hood", "=ds=", "5000 #alliance#", ""};
		{ 11, 23317, "", "=q3=Lieutenant Commander's Satin Mantle", "=ds=", "3000 #alliance#", ""};
		{ 12, 23303, "", "=q3=Knight-Captain's Satin Tunic", "=ds=", "5000 #alliance#", ""};
		{ 13, 23288, "", "=q3=Knight-Lieutenant's Satin Handwraps", "=ds=", "3000 #alliance#", ""};
		{ 14, 23302, "", "=q3=Knight-Captain's Satin Legguards", "=ds=", "5000 #alliance#", ""};
		{ 15, 23289, "", "=q3=Knight-Lieutenant's Satin Walkers", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh4#", "=q5=#pvps1#"};
		{ 17, 17623, "", "=q4=Warlord's Satin Cowl", "=ds=", "15000 #horde#", ""};
		{ 18, 17622, "", "=q4=Warlord's Satin Mantle", "=ds=", "9000 #horde#", ""};
		{ 19, 17624, "", "=q4=Warlord's Satin Robes", "=ds=", "15000 #horde#", ""};
		{ 20, 17620, "", "=q4=General's Satin Gloves", "=ds=", "9000 #horde#", ""};
		{ 21, 17625, "", "=q4=General's Satin Leggings", "=ds=", "15000 #horde#", ""};
		{ 22, 17618, "", "=q4=General's Satin Boots", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh4#", "=q5=#pvps2#"};
		{ 25, 23261, "", "=q3=Champion's Satin Hood", "=ds=", "5000 #horde#", ""};
		{ 26, 23262, "", "=q3=Champion's Satin Mantle", "=ds=", "3000 #horde#", ""};
		{ 27, 22885, "", "=q3=Legionnaire's Satin Tunic", "=ds=", "5000 #horde#", ""};
		{ 28, 22869, "", "=q3=Blood Guard's Satin Handwraps", "=ds=", "3000 #horde#", ""};
		{ 29, 22882, "", "=q3=Legionnaire's Satin Legguards", "=ds=", "5000 #horde#", ""};
		{ 30, 22859, "", "=q3=Blood Guard's Satin Walkers", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

	AtlasLoot_Data["PVPRogue"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea6#", "=q5=#pvps1#"};
		{ 2, 16455, "", "=q4=Field Marshal's Leather Mask", "=ds=", "15000 #alliance#", ""};
		{ 3, 16457, "", "=q4=Field Marshal's Leather Epaulets", "=ds=", "9000 #alliance#", ""};
		{ 4, 16453, "", "=q4=Field Marshal's Leather Chestpiece", "=ds=", "15000 #alliance#", ""};
		{ 5, 16454, "", "=q4=Marshal's Leather Handgrips", "=ds=", "9000 #alliance#", ""};
		{ 6, 16456, "", "=q4=Marshal's Leather Leggings", "=ds=", "15000 #alliance#", ""};
		{ 7, 16446, "", "=q4=Marshal's Leather Footguards", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra6#", "=q5=#pvps2#"};
		{ 10, 23312, "", "=q3=Lieutenant Commander's Leather Helm", "=ds=", "5000 #alliance#", ""};
		{ 11, 23313, "", "=q3=Lieutenant Commander's Leather Shoulders", "=ds=", "3000 #alliance#", ""};
		{ 12, 23298, "", "=q3=Knight-Captain's Leather Chestpiece", "=ds=", "5000 #alliance#", ""};
		{ 13, 23284, "", "=q3=Knight-Lieutenant's Leather Grips", "=ds=", "3000 #alliance#", ""};
		{ 14, 23299, "", "=q3=Knight-Captain's Leather Legguards", "=ds=", "5000 #alliance#", ""};
		{ 15, 23285, "", "=q3=Knight-Lieutenant's Leather Walkers", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh5#", "=q5=#pvps1#"};
		{ 17, 16561, "", "=q4=Warlord's Leather Helm", "=ds=", "15000 #horde#", ""};
		{ 18, 16562, "", "=q4=Warlord's Leather Spaulders", "=ds=", "9000 #horde#", ""};
		{ 19, 16563, "", "=q4=Warlord's Leather Breastplate", "=ds=", "15000 #horde#", ""};
		{ 20, 16560, "", "=q4=General's Leather Mitts", "=ds=", "9000 #horde#", ""};
		{ 21, 16564, "", "=q4=General's Leather Legguards", "=ds=", "15000 #horde#", ""};
		{ 22, 16558, "", "=q4=General's Leather Treads", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh5#", "=q5=#pvps2#"};
		{ 25, 23257, "", "=q3=Champion's Leather Helm", "=ds=", "5000 #horde#", ""};
		{ 26, 23258, "", "=q3=Champion's Leather Shoulders", "=ds=", "3000 #horde#", ""};
		{ 27, 22879, "", "=q3=Legionnaire's Leather Chestpiece", "=ds=", "5000 #horde#", ""};
		{ 28, 22864, "", "=q3=Blood Guard's Leather Grips", "=ds=", "3000 #horde#", ""};
		{ 29, 22880, "", "=q3=Legionnaire's Leather Legguards", "=ds=", "5000 #horde#", ""};
		{ 30, 22856, "", "=q3=Blood Guard's Leather Walkers", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

	AtlasLoot_Data["PVPShaman"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea9#", "=q5=#pvps1#"};
		{ 2, 29610, "", "=q4=Field Marshal's Mail Helm", "=ds=", "15000 #alliance#", ""};
		{ 3, 29611, "", "=q4=Field Marshal's Mail Spaulders", "=ds=", "9000 #alliance#", ""};
		{ 4, 29609, "", "=q4=Field Marshal's Mail Armor", "=ds=", "15000 #alliance#", ""};
		{ 5, 29607, "", "=q4=Marshal's Mail Gauntlets", "=ds=", "9000 #alliance#", ""};
		{ 6, 29608, "", "=q4=Marshal's Mail Leggings", "=ds=", "15000 #alliance#", ""};
		{ 7, 29606, "", "=q4=Marshal's Mail Boots", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra9#", "=q5=#pvps2#"};
		{ 10, 29598, "", "=q3=Lieutenant Commander's Mail Headguard", "=ds=", "5000 #alliance#", ""};
		{ 11, 29599, "", "=q3=Lieutenant Commander's Mail Pauldrons", "=ds=", "3000 #alliance#", ""};
		{ 12, 29596, "", "=q3=Knight-Captain's Mail Hauberk", "=ds=", "5000 #alliance#", ""};
		{ 13, 29595, "", "=q3=Knight-Lieutenant's Mail Vices", "=ds=", "3000 #alliance#", ""};
		{ 14, 29597, "", "=q3=Knight-Captain's Mail Legguards", "=ds=", "5000 #alliance#", ""};
		{ 15, 29594, "", "=q3=Knight-Lieutenant's Mail Greaves", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh6#", "=q5=#pvps1#"};
		{ 17, 16578, "", "=q4=Warlord's Mail Helm", "=ds=", "15000 #horde#", ""};
		{ 18, 16580, "", "=q4=Warlord's Mail Spaulders", "=ds=", "9000 #horde#", ""};
		{ 19, 16577, "", "=q4=Warlord's Mail Armor", "=ds=", "15000 #horde#", ""};
		{ 20, 16574, "", "=q4=General's Mail Gauntlets", "=ds=", "9000 #horde#", ""};
		{ 21, 16579, "", "=q4=General's Mail Leggings", "=ds=", "15000 #horde#", ""};
		{ 22, 16573, "", "=q4=General's Mail Boots", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh6#", "=q5=#pvps2#"};
		{ 25, 23259, "", "=q3=Champion's Mail Headguard", "=ds=", "5000 #horde#", ""};
		{ 26, 23260, "", "=q3=Champion's Mail Pauldrons", "=ds=", "3000 #horde#", ""};
		{ 27, 22876, "", "=q3=Legionnaire's Mail Hauberk", "=ds=", "5000 #horde#", ""};
		{ 28, 22867, "", "=q3=Blood Guard's Mail Vices", "=ds=", "3000 #horde#", ""};
		{ 29, 22887, "", "=q3=Legionnaire's Mail Legguards", "=ds=", "5000 #horde#", ""};
		{ 30, 22857, "", "=q3=Blood Guard's Mail Greaves", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

	AtlasLoot_Data["PVPWarlock"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea7#", "=q5=#pvps1#"};
		{ 2, 17578, "", "=q4=Field Marshal's Coronal", "=ds=", "15000 #alliance#", ""};
		{ 3, 17580, "", "=q4=Field Marshal's Dreadweave Shoulders", "=ds=", "9000 #alliance#", ""};
		{ 4, 17581, "", "=q4=Field Marshal's Dreadweave Robe", "=ds=", "15000 #alliance#", ""};
		{ 5, 17584, "", "=q4=Marshal's Dreadweave Gloves", "=ds=", "9000 #alliance#", ""};
		{ 6, 17579, "", "=q4=Marshal's Dreadweave Leggings", "=ds=", "15000 #alliance#", ""};
		{ 7, 17583, "", "=q4=Marshal's Dreadweave Boots", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra7#", "=q5=#pvps2#"};
		{ 10, 23310, "", "=q3=Lieutenant Commander's Dreadweave Cowl", "=ds=", "5000 #alliance#", ""};
		{ 11, 23311, "", "=q3=Lieutenant Commander's Dreadweave Spaulders", "=ds=", "3000 #alliance#", ""};
		{ 12, 23297, "", "=q3=Knight-Captain's Dreadweave Tunic", "=ds=", "5000 #alliance#", ""};
		{ 13, 23282, "", "=q3=Knight-Lieutenant's Dreadweave Handwraps", "=ds=", "3000 #alliance#", ""};
		{ 14, 23296, "", "=q3=Knight-Captain's Dreadweave Legguards", "=ds=", "5000 #alliance#", ""};
		{ 15, 23283, "", "=q3=Knight-Lieutenant's Dreadweave Walkers", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh7#", "=q5=#pvps1#"};
		{ 17, 17591, "", "=q4=Warlord's Dreadweave Hood", "=ds=", "15000 #horde#", ""};
		{ 18, 17590, "", "=q4=Warlord's Dreadweave Mantle", "=ds=", "9000 #horde#", ""};
		{ 19, 17592, "", "=q4=Warlord's Dreadweave Robe", "=ds=", "15000 #horde#", ""};
		{ 20, 17588, "", "=q4=General's Dreadweave Gloves", "=ds=", "9000 #horde#", ""};
		{ 21, 17593, "", "=q4=General's Dreadweave Pants", "=ds=", "15000 #horde#", ""};
		{ 22, 17586, "", "=q4=General's Dreadweave Boots", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh7#", "=q5=#pvps2#"};
		{ 25, 23255, "", "=q3=Champion's Dreadweave Cowl", "=ds=", "5000 #horde#", ""};
		{ 26, 23256, "", "=q3=Champion's Dreadweave Spaulders", "=ds=", "3000 #horde#", ""};
		{ 27, 22884, "", "=q3=Legionnaire's Dreadweave Tunic", "=ds=", "5000 #horde#", ""};
		{ 28, 22865, "", "=q3=Blood Guard's Dreadweave Handwraps", "=ds=", "3000 #horde#", ""};
		{ 29, 22881, "", "=q3=Legionnaire's Dreadweave Legguards", "=ds=", "5000 #horde#", ""};
		{ 30, 22855, "", "=q3=Blood Guard's Dreadweave Walkers", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

	AtlasLoot_Data["PVPWarrior"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvpea8#", "=q5=#pvps1#"};
		{ 2, 16478, "", "=q4=Field Marshal's Plate Helm", "=ds=", "15000 #alliance#", ""};
		{ 3, 16480, "", "=q4=Field Marshal's Plate Shoulderguards", "=ds=", "9000 #alliance#", ""};
		{ 4, 16477, "", "=q4=Field Marshal's Plate Armor", "=ds=", "15000 #alliance#", ""};
		{ 5, 16484, "", "=q4=Marshal's Plate Gauntlets", "=ds=", "9000 #alliance#", ""};
		{ 6, 16479, "", "=q4=Marshal's Plate Legguards", "=ds=", "15000 #alliance#", ""};
		{ 7, 16483, "", "=q4=Marshal's Plate Boots", "=ds=", "9000 #alliance#", ""};
		{ 9, 0, "INV_BannerPVP_02", "=q6=#pvpra8#", "=q5=#pvps2#"};
		{ 10, 23314, "", "=q3=Lieutenant Commander's Plate Helm", "=ds=", "5000 #alliance#", ""};
		{ 11, 23315, "", "=q3=Lieutenant Commander's Plate Shoulders", "=ds=", "3000 #alliance#", ""};
		{ 12, 23300, "", "=q3=Knight-Captain's Plate Hauberk", "=ds=", "5000 #alliance#", ""};
		{ 13, 23286, "", "=q3=Knight-Lieutenant's Plate Gauntlets", "=ds=", "3000 #alliance#", ""};
		{ 14, 23301, "", "=q3=Knight-Captain's Plate Leggings", "=ds=", "5000 #alliance#", ""};
		{ 15, 23287, "", "=q3=Knight-Lieutenant's Plate Greaves", "=ds=", "3000 #alliance#", ""};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#pvpeh8#", "=q5=#pvps1#"};
		{ 17, 16542, "", "=q4=Warlord's Plate Headpiece", "=ds=", "15000 #horde#", ""};
		{ 18, 16544, "", "=q4=Warlord's Plate Shoulders", "=ds=", "9000 #horde#", ""};
		{ 19, 16541, "", "=q4=Warlord's Plate Armor", "=ds=", "15000 #horde#", ""};
		{ 20, 16548, "", "=q4=General's Plate Gauntlets", "=ds=", "9000 #horde#", ""};
		{ 21, 16543, "", "=q4=General's Plate Leggings", "=ds=", "15000 #horde#", ""};
		{ 22, 16545, "", "=q4=General's Plate Boots", "=ds=", "9000 #horde#", ""};
		{ 24, 0, "INV_BannerPVP_01", "=q6=#pvprh8#", "=q5=#pvps2#"};
		{ 25, 23244, "", "=q3=Champion's Plate Helm", "=ds=", "5000 #horde#", ""};
		{ 26, 23243, "", "=q3=Champion's Plate Shoulders", "=ds=", "3000 #horde#", ""};
		{ 27, 22872, "", "=q3=Legionnaire's Plate Hauberk", "=ds=", "5000 #horde#", ""};
		{ 28, 22868, "", "=q3=Blood Guard's Plate Gauntlets", "=ds=", "3000 #horde#", ""};
		{ 29, 22873, "", "=q3=Legionnaire's Plate Leggings", "=ds=", "5000 #horde#", ""};
		{ 30, 22858, "", "=q3=Blood Guard's Plate Greaves", "=ds=", "3000 #horde#", ""};
		Back = "PVPSET";
	};

		----------------------------
		--- PvP Level 60 Weapons ---
		----------------------------

	AtlasLoot_Data["PVPWeapons_A"] = {
		{ 1, 18843, "", "=q4=Grand Marshal's Right Hand Blade", "=ds=#h3#, #w13#", "13000 #alliance#", ""};
		{ 2, 18847, "", "=q4=Grand Marshal's Left Hand Blade", "=ds=#h4#, #w13#", "13000 #alliance#", ""};
		{ 3, 23451, "", "=q4=Grand Marshal's Mageblade", "=ds=#h4#, #w4#", "13000 #alliance#", ""};
		{ 4, 18838, "", "=q4=Grand Marshal's Dirk", "=ds=#h1#, #w4#", "13000 #alliance#", ""};
		{ 5, 12584, "", "=q4=Grand Marshal's Longsword", "=ds=#h1#, #w10#", "13000 #alliance#", ""};
		{ 6, 23456, "", "=q4=Grand Marshal's Swiftblade", "=ds=#h1#, #w10#", "13000 #alliance#", ""};
		{ 7, 18876, "", "=q4=Grand Marshal's Claymore", "=ds=#h2#, #w10#", "25000 #alliance#", ""};
		{ 8, 18827, "", "=q4=Grand Marshal's Handaxe", "=ds=#h1#, #w1#", "13000 #alliance#", ""};
		{ 9, 18830, "", "=q4=Grand Marshal's Sunderer", "=ds=#h2#, #w1#", "25000 #alliance#", ""};
		{ 10, 23454, "", "=q4=Grand Marshal's Warhammer", "=ds=#h3#, #w6#", "13000 #alliance#", ""};
		{ 11, 18865, "", "=q4=Grand Marshal's Punisher", "=ds=#h1#, #w6#", "13000 #alliance#", ""};
		{ 12, 18867, "", "=q4=Grand Marshal's Battle Hammer", "=ds=#h2#, #w6#", "25000 #alliance#", ""};
		{ 13, 23455, "", "=q4=Grand Marshal's Demolisher", "=ds=#h2#, #w6#", "25000 #alliance#", ""};
		{ 14, 18869, "", "=q4=Grand Marshal's Glaive", "=ds=#w7#", "25000 #alliance#", ""};
		{ 15, 18873, "", "=q4=Grand Marshal's Stave", "=ds=#w9#", "25000 #alliance#", ""};
		{ 16, 18825, "", "=q4=Grand Marshal's Aegis", "=ds=#w8#", "13000 #alliance#", ""};
		{ 17, 18833, "", "=q4=Grand Marshal's Bullseye", "=ds=#w2#", "13000 #alliance#", ""};
		{ 18, 18836, "", "=q4=Grand Marshal's Repeater", "=ds=#w3#", "13000 #alliance#", ""};
		{ 19, 18855, "", "=q4=Grand Marshal's Hand Cannon", "=ds=#w5#", "13000 #alliance#", ""};
		{ 20, 23452, "", "=q4=Grand Marshal's Tome of Power", "=ds=#s15#", "13000 #alliance#", ""};
		{ 21, 23453, "", "=q4=Grand Marshal's Tome of Restoration", "=ds=#s15#", "13000 #alliance#", ""};
		Back = "PVPMENU";
	};

	AtlasLoot_Data["PVPWeapons_H"] = {
		{ 1, 18844, "", "=q4=High Warlord's Right Claw", "=ds=#h3#, #w13#", "13000 #horde#", ""};
		{ 2, 18848, "", "=q4=High Warlord's Left Claw", "=ds=#h4#, #w13#", "13000 #horde#", ""};
		{ 3, 23466, "", "=q4=High Warlord's Spellblade", "=ds=#h4#, #w4#", "13000 #horde#", ""};
		{ 4, 18840, "", "=q4=High Warlord's Razor", "=ds=#h1#, #w4#", "13000 #horde#", ""};
		{ 5, 16345, "", "=q4=High Warlord's Blade", "=ds=#h1#, #w10#", "13000 #horde#", ""};
		{ 6, 23467, "", "=q4=High Warlord's Quickblade", "=ds=#h1#, #w10#", "13000 #horde#", ""};
		{ 7, 18877, "", "=q4=High Warlord's Greatsword", "=ds=#h2#, #w10#", "25000 #horde#", ""};
		{ 8, 18828, "", "=q4=High Warlord's Cleaver", "=ds=#h1#, #w1#", "13000 #horde#", ""};
		{ 9, 18831, "", "=q4=High Warlord's Battle Axe", "=ds=#h2#, #w1#", "25000 #horde#", ""};
		{ 10, 23464, "", "=q4=High Warlord's Battle Mace", "=ds=#h3#, #w6#", "13000 #horde#", ""};
		{ 11, 18866, "", "=q4=High Warlord's Bludgeon", "=ds=#h1#, #w6#", "13000 #horde#", ""};
		{ 12, 18868, "", "=q4=High Warlord's Pulverizer", "=ds=#h2#, #w6#", "25000 #horde#", ""};
		{ 13, 23465, "", "=q4=High Warlord's Destroyer", "=ds=#h2#, #w6#", "25000 #horde#", ""};
		{ 14, 18871, "", "=q4=High Warlord's Pig Sticker", "=ds=#w7#", "25000 #horde#", ""};
		{ 15, 18874, "", "=q4=High Warlord's War Staff", "=ds=#w9#", "25000 #horde#", ""};
		{ 16, 18826, "", "=q4=High Warlord's Shield Wall", "=ds=#w8#", "13000 #horde#", ""};
		{ 17, 18835, "", "=q4=High Warlord's Recurve", "=ds=#w2#", "13000 #horde#", ""};
		{ 18, 18837, "", "=q4=High Warlord's Crossbow", "=ds=#w3#", "13000 #horde#", ""};
		{ 19, 18860, "", "=q4=High Warlord's Street Sweeper", "=ds=#w5#", "13000 #horde#", ""};
		{ 20, 23468, "", "=q4=High Warlord's Tome of Destruction", "=ds=#s15#", "13000 #horde#", ""};
		{ 21, 23469, "", "=q4=High Warlord's Tome of Mending", "=ds=#s15#", "13000 #horde#", ""};
		Back = "PVPMENU";
	};

		--------------------------------
		--- PvP Level 60 Accessories ---
		--------------------------------

	AtlasLoot_Data["PvP60Accessories1_A"] = {
		{ 1, 29465, "", "=q4=Black Battlestrider", "=ds=#e12#", "50000 #alliance#", ""};
		{ 2, 29467, "", "=q4=Black War Ram", "=ds=#e12#", "50000 #alliance#", ""};
		{ 3, 29468, "", "=q4=Black War Steed Bridle", "=ds=#e12#", "50000 #alliance#", ""};
		{ 4, 29471, "", "=q4=Reins of the Black War Tiger", "=ds=#e12#", "50000 #alliance#", ""};
		{ 5, 35906, "", "=q4=Reins of the Black War Elekk", "=ds#e12#=", "50000 #alliance#", ""};
		{ 7, 18863, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 8, 18856, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 9, 18859, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 10, 18864, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 11, 18862, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 12, 18857, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 13, 29593, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 14, 18858, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 15, 18854, "", "=q3=Insignia of the Alliance", "=ds=#s14#", "2805 #alliance#", ""};
		{ 16, 15196, "", "=q1=Private's Tabard", "=ds=#s7#", "15000 #alliance#", ""};
		{ 17, 15198, "", "=q1=Knight's Colors", "=ds=#s7#", "20000 #alliance#", ""};
		{ 18, 18606, "", "=q1=Alliance Battle Standard", "=ds=", "15300 #alliance#", ""};
		{ 20, 18839, "", "=q1=Combat Healing Potion", "=ds=#e2#", "10 #silver# 1 #alliance#", ""};
		{ 21, 18841, "", "=q1=Combat Mana Potion", "=ds=#e2#", "10 #silver# 1 #alliance#", ""};
		{ 22, 32455, "", "=q1=Star's Lament", "=ds=#e4#", "12 #silver# 1 #alliance#", ""};
		Next = "PvP60Accessories2_A";
		Back = "PVPMENU";
	};

	AtlasLoot_Data["PvP60Accessories1_H"] = {
		{ 1, 29466, "", "=q4=Black War Kodo", "=ds=#e12#", "50000 #horde#", ""};
		{ 2, 29469, "", "=q4=Horn of the Black War Wolf", "=ds=#e12#", "50000 #horde#", ""};
		{ 3, 29470, "", "=q4=Red Skeletal Warhorse", "=ds=#e12#", "50000 #horde#", ""};
		{ 4, 29472, "", "=q4=Whistle of the Black War Raptor", "=ds=#e12#", "50000 #horde#", ""};
		{ 5, 34129, "", "=q4=Swift Warstrider", "=ds=#e12#", "50000 #horde#", ""};
		{ 7, 18853, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 8, 18846, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 9, 18850, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 10, 29592, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 11, 18851, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 12, 18849, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 13, 18845, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 14, 18852, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 15, 18834, "", "=q3=Insignia of the Horde", "=ds=#s14#", "2805 #horde#", ""};
		{ 16, 15197, "", "=q1=Scout's Tabard", "=ds=#s7#", "15000 #horde#", ""};
		{ 17, 15199, "", "=q1=Stone Guard's Herald", "=ds=#s7#", "20000 #horde#", ""};
		{ 18, 18607, "", "=q1=Horde Battle Standard", "=ds=", "15300 #horde#", ""};
		{ 20, 18839, "", "=q1=Combat Healing Potion", "=ds=#e2#", "10 #silver# 1 #horde#", ""};
		{ 21, 18841, "", "=q1=Combat Mana Potion", "=ds=#e2#", "10 #silver# 1 #horde#", ""};
		{ 22, 32455, "", "=q1=Star's Lament", "=ds=#e4#", "12 #silver# 1 #horde#", ""};
		Next = "PvP60Accessories2_H";
		Back = "PVPMENU";
	};

	AtlasLoot_Data["PvP60Accessories2_A"] = {
		{ 1, 18457, "", "=q3=Sergeant Major's Silk Cuffs", "=ds=#s8#, #a1#", "300 #alliance#", ""};
		{ 2, 18456, "", "=q3=Sergeant Major's Silk Cuffs", "=ds=#s8#, #a1#", "1600 #alliance#", ""};
		{ 4, 18455, "", "=q3=Sergeant Major's Dragonhide Armsplints", "=ds=#s8#, #a2#", "300 #alliance#", ""};
		{ 5, 18454, "", "=q3=Sergeant Major's Dragonhide Armsplints", "=ds=#s8#, #a2#", "1600 #alliance#", ""};
		{ 7, 18453, "", "=q3=Sergeant Major's Leather Armsplints", "=ds=#s8#, #a3#", "300 #alliance#", ""};
		{ 8, 18452, "", "=q3=Sergeant Major's Leather Armsplints", "=ds=#s8#, #a3#", "1600 #alliance#", ""};
		{ 10, 18449, "", "=q3=Sergeant Major's Chain Armguards", "=ds=#s8#, #a3#", "300 #alliance#", ""};
		{ 11, 18448, "", "=q3=Sergeant Major's Chain Armguards", "=ds=#s8#, #a3#", "1600 #alliance#", ""};
		{ 13, 18447, "", "=q3=Sergeant Major's Plate Wristguards", "=ds=#s8#, #a4#", "300 #alliance#", ""};
		{ 14, 18445, "", "=q3=Sergeant Major's Plate Wristguards", "=ds=#s8#, #a4#", "1600 #alliance#", ""};
		{ 16, 18440, "", "=q3=Sergeant's Cape", "=ds=#s4#", "100 #alliance#", ""};
		{ 17, 18441, "", "=q3=Sergeant's Cape", "=ds=#s4#", "300 #alliance#", ""};
		{ 18, 16342, "", "=q3=Sergeant's Cape", "=ds=#s4#", "1600 #alliance#", ""};
		{ 20, 18442, "", "=q3=Master Sergeant's Insignia", "=ds=#s2#", "100 #alliance#", ""};
		{ 21, 18444, "", "=q3=Master Sergeant's Insignia", "=ds=#s2#", "300 #alliance#", ""};
		{ 22, 18443, "", "=q3=Master Sergeant's Insignia", "=ds=#s2#", "1600 #alliance#", ""};
		Prev = "PvP60Accessories1_A";
		Back = "PVPMENU";
	};

	AtlasLoot_Data["PvP60Accessories2_H"] = {
		{ 1, 18437, "", "=q3=First Sergeant's Silk Cuffs", "=ds=#s8#, #a1#", "300 #horde#", ""};
		{ 2, 16486, "", "=q3=First Sergeant's Silk Cuffs", "=ds=#s8#, #a1#", "1600 #horde#", ""};
		{ 4, 18436, "", "=q3=First Sergeant's Dragonhide Armguards", "=ds=#s8#, #a1#", "300 #horde#", ""};
		{ 5, 18434, "", "=q3=First Sergeant's Dragonhide Armguards", "=ds=#s8#, #a1#", "1600 #horde#", ""};
		{ 7, 18435, "", "=q3=First Sergeant's Leather Armguards", "=ds=#s8#, #a2#", "300 #horde#", ""};
		{ 8, 16497, "", "=q3=First Sergeant's Leather Armguards", "=ds=#s8#, #a2#", "1600 #horde#", ""};
		{ 10, 18432, "", "=q3=First Sergeant's Mail Wristguards", "=ds=#s8#, #a3#", "300 #horde#", ""};
		{ 11, 16532, "", "=q3=First Sergeant's Mail Wristguards", "=ds=#s8#, #a3#", "1600 #horde#", ""};
		{ 13, 18430, "", "=q3=First Sergeant's Plate Bracers", "=ds=#s8#, #a4#", "300 #horde#", ""};
		{ 14, 18429, "", "=q3=First Sergeant's Plate Bracers", "=ds=#s8#, #a4#", "1600 #horde#", ""};
		{ 16, 18427, "", "=q3=Sergeant's Cloak", "=ds=#s4#", "100 #horde#", ""};
		{ 17, 16341, "", "=q3=Sergeant's Cloak", "=ds=#s4#", "300 #horde#", ""};
		{ 18, 18461, "", "=q3=Sergeant's Cloak", "=ds=#s4#", "1600 #horde#", ""};
		{ 20, 15200, "", "=q3=Senior Sergeant's Insignia", "=ds=#s2#", "100 #horde#", ""};
		{ 21, 18428, "", "=q3=Senior Sergeant's Insignia", "=ds=#s2#", "300 #horde#", ""};
		{ 22, 16335, "", "=q3=Senior Sergeant's Insignia", "=ds=#s2#", "1600 #horde#", ""};
		Prev = "PvP60Accessories2";
		Back = "PVPMENU";
	};

	----------------
	--- Factions ---
	----------------

		------------
		--- Misc ---
		------------

	AtlasLoot_Data["MiscFactions"] = {
		{ 1, 0, "INV_Misc_Head_Centaur_01", "=q6="..BabbleFaction["Magram Clan Centaur"], "=q5=#r2#"};
		{ 2, 6789, "", "=q2=Ceremonial Centaur Blanket", "=q1=#m4#: =ds=#s4#"};
		{ 3, 6788, "", "=q2=Magram Hunter's Belt", "=q1=#m4#: =ds=#s10#, #a2#"};
		{ 5, 0, "INV_Jewelry_Amulet_07", "=q6=#b5#", "=q5=#r5#, =q1="..BabbleFaction["Alliance"]};
		{ 6, 20132, "", "=q1=Arathor Battle Tabard", "=q1=#m4#: =ds=#s7#"};
		{ 8, 0, "Ability_Mount_PinkTiger", "=q6="..BabbleFaction["Wintersaber Trainers"], "=q5=#r5#"};
		{ 9, 13086, "", "=q4=Reins of the Winterspring Frostsaber", "=ds=#e12#"};
		{ 16, 0, "INV_Misc_Head_Centaur_01", "=q6="..BabbleFaction["Gelkis Clan Centaur"], "=q5=#r2#"};
		{ 17, 6773, "", "=q2=Gelkis Marauder Chain", "=q1=#m4#: =ds=#s5#, #a3#"};
		{ 18, 6774, "", "=q2=Uthek's Finger", "=q1=#m4#: =ds=#s15#"};
		{ 20, 0, "INV_Jewelry_Amulet_07", "=q6=#b6#", "=q5=#r5#, =q1="..BabbleFaction["Horde"]};
		{ 21, 20131, "", "=q1=Battle Tabard of the Defilers", "=q1=#m4#: =ds=#s7#"};
		Back = "REPMENU_ORIGINALWOW";
	};

		-------------------
		--- Argent Dawn ---
		-------------------

	AtlasLoot_Data["Argent1"] = {
		{ 1, 22689, "", "=q3=Sanctified Leather Helm", "=ds=#s1#, #a2#"};
		{ 2, 22690, "", "=q3=Leggings of the Plague Hunter", "=ds=#s11#, #a3#"};
		{ 3, 22681, "", "=q3=Band of Piety", "=ds=#s13#"};
		{ 4, 22680, "", "=q3=Band of Resolution", "=ds=#s13#"};
		{ 5, 22688, "", "=q3=Verimonde's Last Resort", "=ds=#h3#, #w4#"};
		{ 6, 22679, "", "=q3=Supply Bag", "=ds=#m14# #e1#"};
		{ 8, 22638, "", "=q3=Shadow Guard", "=ds=#s1# #e17#"};
		{ 10, 22523, "", "=q2=Insignia of the Dawn", "=ds=#m17#"};
		{ 16, 22667, "", "=q4=Bracers of Hope", "=ds=#s8#, #a1#"};
		{ 17, 22668, "", "=q4=Bracers of Subterfuge", "=ds=#s8#, #a2#"};
		{ 18, 22657, "", "=q4=Amulet of the Dawn", "=ds=#s2#"};
		{ 19, 22659, "", "=q4=Medallion of the Dawn", "=ds=#s2#"};
		{ 20, 22678, "", "=q4=Talisman of Ascendance", "=ds=#s14#"};
		{ 21, 22656, "", "=q4=The Purifier", "=ds=#w5#"};
		{ 23, 22636, "", "=q3=Ice Guard", "=ds=#s1# #e17#"};
		{ 25, 22524, "", "=q2=Insignia of the Crusade", "=ds=#m17#"};
		Next = "Argent2";
		Back = "REPMENU_ORIGINALWOW";
	};

	AtlasLoot_Data["Argent2"] = {
		{ 1, 12844, "", "=q2=Argent Dawn Valor Token", "=ds=#m17#"};
		{ 3, 0, "INV_Jewelry_Talisman_08", "=q6=#r2#", ""};
		{ 4, 13724, "", "=q1=Enriched Manna Biscuit", "=ds=#e3#"};
		{ 6, 0, "INV_Jewelry_Talisman_08", "=q6=#r3#", ""};
		{ 7, 13482, "", "=q2=Recipe: Transmute Air to Fire", "=ds=#p1# (275)"};
		{ 8, 19203, "", "=q1=Plans: Girdle of the Dawn", "=ds=#p2# (290)"};
		{ 9, 19446, "", "=q1=Formula: Enchant Bracer - Mana Regeneration", "=ds=#p4# (290)"};
		{ 10, 19442, "", "=q1=Formula: Powerful Anti-Venom", "=ds=#p6# (300)"};
		{ 11, 19328, "", "=q1=Pattern: Dawn Treaders", "=ds=#p7# (290)"};
		{ 12, 19216, "", "=q1=Pattern: Argent Boots", "=ds=#p8# (290)"};
		{ 16, 0, "INV_Jewelry_Talisman_08", "=q6=#r4#", ""};
		{ 17, 18171, "", "=q2=Arcane Mantle of the Dawn", "=ds=#s3# #e17#"};
		{ 18, 18169, "", "=q2=Flame Mantle of the Dawn", "=ds=#s3# #e17#"};
		{ 19, 18170, "", "=q2=Frost Mantle of the Dawn", "=ds=#s3# #e17#"};
		{ 20, 18172, "", "=q2=Nature Mantle of the Dawn", "=ds=#s3# #e17#"};
		{ 21, 18173, "", "=q2=Shadow Mantle of the Dawn", "=ds=#s3# #e17#"};
		{ 22, 19205, "", "=q1=Plans: Gloves of the Dawn", "=ds=#p2# (300)"};
		{ 23, 19447, "", "=q1=Formula: Enchant Bracer - Healing", "=ds=#p4# (300)"};
		{ 24, 19329, "", "=q1=Pattern: Golden Mantle of the Dawn", "=ds=#p7# (300)"};
		{ 25, 19217, "", "=q1=Pattern: Argent Shoulders", "=ds=#p8# (300)"};
		{ 26, 13810, "", "=q1=Blessed Sunfruit", "=ds=#e3#"};
		{ 27, 13813, "", "=q1=Blessed Sunfruit Juice", "=ds=#e4#"};
		{ 29, 0, "INV_Jewelry_Talisman_08", "=q6=#r5#", ""};
		{ 30, 18182, "", "=q2=Chromatic Mantle of the Dawn", "=ds=#s3# #e17#"};
		Prev = "Argent1";
		Back = "REPMENU_ORIGINALWOW";
	};

		---------------------------------------------------
		--- Bloodsail Buccaneers & Hydraxian Waterlords ---
		---------------------------------------------------

	AtlasLoot_Data["BloodsailHydraxian"] = {
		{ 1, 0, "INV_Helmet_66", "=q6="..BabbleFaction["Bloodsail Buccaneers"], "=q5=#r1#"};
		{ 2, 22742, "", "=q1=Bloodsail Shirt", "=ds=#s5#"};
		{ 3, 22743, "", "=q1=Bloodsail Sash", "=ds=#s10#"};
		{ 4, 22745, "", "=q1=Bloodsail Pants", "=ds=#s11#"};
		{ 5, 22744, "", "=q1=Bloodsail Boots", "=ds=#s12#"};
		{ 7, 0, "INV_Helmet_66", "=q6="..BabbleFaction["Bloodsail Buccaneers"], "=q5=#r2#"};
		{ 8, 12185, "", "=q2=Bloodsail Admiral's Hat", "=ds=#s1#, #a1#"};
		{ 16, 0, "Spell_Frost_SummonWaterElemental_2", "=q6="..BabbleFaction["Hydraxian Waterlords"], "=q5=#r3#"};
		{ 17, 18399, "", "=q3=Ocean's Breeze", "=q1=#m4#: =ds=#s13#"};
		{ 18, 18398, "", "=q3=Tidal Loop", "=q1=#m4#: =ds=#s13#"};
		{ 19, 17333, "", "=q1=Aqual Quintessence", "=ds=#m3#"};
		{ 21, 0, "Spell_Frost_SummonWaterElemental_2", "=q6="..BabbleFaction["Hydraxian Waterlords"], "=q5=#r4#"};
		{ 22, 22754, "", "=q1=Eternal Quintessence", "=ds=#m3#"};
		Back = "REPMENU_ORIGINALWOW";
	};
		-------------------------
		--- Brood of Nozdormu ---
		-------------------------

	AtlasLoot_Data["AQBroodRings"] = {
		{ 1, 0, "INV_Jewelry_Ring_40", "=q6="..AL["Path of the Conqueror"], ""};
		{ 2, 21201, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r1#"};
		{ 3, 21202, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r2#"};
		{ 4, 21203, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r3#"};
		{ 5, 21204, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r4#"};
		{ 6, 21205, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r5#"};
		{ 8, 0, "INV_Jewelry_Ring_40", "=q6="..AL["Path of the Invoker"], ""};
		{ 9, 21206, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r1#"};
		{ 10, 21207, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r2#"};
		{ 11, 21208, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r3#"};
		{ 12, 21209, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r4#"};
		{ 13, 21210, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r5#"};
		{ 16, 0, "INV_Jewelry_Ring_40", "=q6="..AL["Path of the Protector"], ""};
		{ 17, 21196, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r1#"};
		{ 18, 21197, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r2#"};
		{ 19, 21198, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r3#"};
		{ 20, 21199, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r4#"};
		{ 21, 21200, "", "=q4=Signet Ring of the Bronze Dragonflight", "=ds=#s13#, =q1=#r5#"};
		Back = "REPMENU_ORIGINALWOW";
	};

		-----------------------
		--- Cenarion Circle ---
		-----------------------

	AtlasLoot_Data["Cenarion1"] = {
		{ 1, 22209, "", "=q1=Plans: Heavy Obsidian Belt", "=ds=#p2# (300)"};
		{ 2, 22768, "", "=q1=Plans: Ironvine Belt", "=ds=#p2# (300)"};
		{ 3, 20732, "", "=q1=Formula: Enchant Cloak - Greater Fire Resistance", "=ds=#p4# (300)"};
		{ 4, 22769, "", "=q1=Pattern: Bramblewood Belt", "=ds=#p7# (300)"};
		{ 5, 20509, "", "=q1=Pattern: Sandstalker Bracers", "=ds=#p7# (300)"};
		{ 6, 20506, "", "=q1=Pattern: Spitfire Bracers", "=ds=#p7# (300)"};
		{ 7, 22772, "", "=q1=Pattern: Sylvan Shoulders", "=ds=#p8# (300)"};
		{ 8, 22310, "", "=q1=Pattern: Cenarion Herb Bag", "=ds=#p8# (275)"};
		{ 10, 20802, "", "=q2=Cenarion Combat Badge", "=ds=#m17#"};
		{ 11, 20800, "", "=q2=Cenarion Logistics Badge", "=ds=#m17#"};
		{ 12, 21515, "", "=q2=Mark of Remulos", "=ds=#m17#"};
		{ 16, 0, "INV_QirajIdol_Amber", "=q6=#j8#", ""};
		{ 17, 21187, "", "=q3=Earthweave Cloak", "=ds=#s4#", "5 #ccombat# 3 #clogistics# 7 #ctactical#"};
		{ 18, 21178, "", "=q3=Gloves of Earthen Power", "=ds=#s9#, #a2#", "5 #ccombat# 3 #clogistics# 7 #ctactical#"};
		{ 19, 21179, "", "=q3=Band of Earthen Wrath", "=ds=#s13#", "5 #ccombat# 3 #clogistics# 7 #ctactical#"};
		{ 25, 20801, "", "=q2=Cenarion Tactical Badge", "=ds=#m17#"};
		{ 26, 21508, "", "=q2=Mark of Cenarius", "=ds=#m17#"};
		Next = "Cenarion2";
		Back = "REPMENU_ORIGINALWOW";
	};

	AtlasLoot_Data["Cenarion2"] = {
		{ 1, 22767, "", "=q1=Plans: Ironvine Gloves", "=ds=#p2# (300)"};
		{ 2, 22214, "", "=q1=Plans: Light Obsidian Belt", "=ds=#p2# (300)"};
		{ 3, 20733, "", "=q1=Formula: Enchant Cloak - Greater Nature Resistance", "=ds=#p4# (300)"};
		{ 4, 22770, "", "=q1=Pattern: Bramblewood Boots", "=ds=#p7# (300)"};
		{ 5, 20510, "", "=q1=Pattern: Sandstalker Gauntlets", "=ds=#p7# (300)"};
		{ 6, 20507, "", "=q1=Pattern: Spitfire Gauntlets", "=ds=#p7# (300)"};
		{ 7, 22773, "", "=q1=Pattern: Sylvan Crown", "=ds=#p8# (300)"};
		{ 16, 0, "INV_QirajIdol_Amber", "=q6=#j8#", ""};
		{ 17, 21183, "", "=q3=Earthpower Vest", "=ds=#s5#, #a1#", "7 #ccombat# 4 #clogistics# 4 #ctactical#"};
		{ 18, 21182, "", "=q3=Band of Earthen Might", "=ds=#s13#", "7 #ccombat# 4 #clogistics# 4 #ctactical#"};
		{ 19, 21181, "", "=q3=Grace of Earth", "=ds=#s14#", "7 #ccombat# 4 #clogistics# 4 #ctactical#"};
		Next = "Cenarion3";
		Prev = "Cenarion1";
		Back = "REPMENU_ORIGINALWOW";
	};

	AtlasLoot_Data["Cenarion3"] = {
		{ 1, 22766, "", "=q1=Plans: Ironvine Breastplate", "=ds=#p2# (300)"};
		{ 2, 22219, "", "=q1=Plans: Jagged Obsidian Shield", "=ds=#p2# (300)"};
		{ 3, 22771, "", "=q1=Pattern: Bramblewood Helm", "=ds=#p7# (300)"};
		{ 4, 20511, "", "=q1=Pattern: Sandstalker Breastplate", "=ds=#p7# (300)"};
		{ 5, 20508, "", "=q1=Pattern: Spitfire Breastplate", "=ds=#p7# (300)"};
		{ 6, 22683, "", "=q1=Pattern: Gaea's Embrace", "=ds=#p8# (300)"};
		{ 7, 22312, "", "=q1=Pattern: Satchel of Cenarius", "=ds=#p8# (300)"};
		{ 8, 22774, "", "=q1=Pattern: Sylvan Vest", "=ds=#p8# (300)"};
		{ 16, 0, "INV_QirajIdol_Amber", "=q6=#j8#", ""};
		{ 17, 21186, "", "=q4=Rockfury Bracers", "=ds=#s8#, #a1#", "15 #ccombat# 20 #clogistics# 17 #ctactical# 1 #cremulos#"};
		{ 18, 21184, "", "=q4=Deeprock Bracers", "=ds=#s8#, #a4#", "15 #ccombat# 20 #clogistics# 17 #ctactical# 1 #cremulos#"};
		{ 19, 21189, "", "=q4=Might of Cenarius", "=ds=#s13#", "15 #ccombat# 20 #clogistics# 17 #ctactical# 1 #cremulos#"};
		{ 20, 21185, "", "=q4=Earthcalm Orb", "=ds=#s15#", "15 #ccombat# 20 #clogistics# 17 #ctactical# 1 #cremulos#"};
		Next = "Cenarion4";
		Prev = "Cenarion2";
		Back = "REPMENU_ORIGINALWOW";
	};

	AtlasLoot_Data["Cenarion4"] = {
		{ 1, 22221, "", "=q1=Plans: Obsidian Mail Tunic", "=ds=#p2# (300)"};
		{ 2, 20382, "", "=q1=Pattern: Dreamscale Breastplate", "=ds=#p7# (300)"};
		{ 16, 0, "INV_QirajIdol_Amber", "=q6=#j8#", ""};
		{ 17, 21190, "", "=q4=Wrath of Cenarius", "=ds=#s13#", "15 #ccombat# 20 #clogistics# 20 #ctactical# 1 #ccenarius#"};
		{ 18, 21180, "", "=q4=Earthstrike", "=ds=#s14#", "15 #ccombat# 20 #clogistics# 20 #ctactical# 1 #ccenarius#"};
		{ 19, 21188, "", "=q4=Fist of Cenarius", "=ds=#h2#, #w6#", "15 #ccombat# 20 #clogistics# 20 #ctactical# 1 #ccenarius#", "", ""};
		Prev = "Cenarion3";
		Back = "REPMENU_ORIGINALWOW";
	};

		----------------------------------------
		--- Stormpike Guard & Frostwolf Clan ---
		----------------------------------------

	AtlasLoot_Data["AlteracFactions"] = {
		{ 1, 0, "INV_Jewelry_StormPikeTrinket_01", "=q6="..BabbleFaction["Stormpike Guard"], "=q5="..BabbleFaction["Alliance"]};
		{ 2, 17904, "", "=q4=Stormpike Insignia Rank 6", "=ds=#s14#, =q1=#r5#"};
		{ 3, 17903, "", "=q3=Stormpike Insignia Rank 5", "=ds=#s14#, =q1=#r5#"};
		{ 4, 17902, "", "=q3=Stormpike Insignia Rank 4", "=ds=#s14#, =q1=#r4#"};
		{ 5, 17901, "", "=q2=Stormpike Insignia Rank 3", "=ds=#s14#, =q1=#r3#"};
		{ 6, 17900, "", "=q2=Stormpike Insignia Rank 2", "=ds=#s14#, =q1=#r2#"};
		{ 7, 17691, "", "=q2=Stormpike Insignia Rank 1", "=ds=#s14#, =q1=#r1#"};
		{ 12, 20648, "", "=q3=Cold Forged Hammer", "=q1=#m4#: =ds=#h3#, #w6#"};
		{ 13, 19106, "", "=q3=Ice Barbed Spear", "=q1=#m4#: =ds=#w7#"};
		{ 14, 19108, "", "=q3=Wand of Biting Cold", "=q1=#m4#: =ds=#w12#"};
		{ 15, 19107, "", "=q3=Bloodseeker", "=q1=#m4#: =ds=#w3#"};
		{ 16, 0, "INV_Jewelry_FrostwolfTrinket_01", "=q6="..BabbleFaction["Frostwolf Clan"], "=q5="..BabbleFaction["Horde"]};
		{ 17, 17909, "", "=q4=Frostwolf Insignia Rank 6", "=ds=#s14#, =q1=#r5#"};
		{ 18, 17908, "", "=q3=Frostwolf Insignia Rank 5", "=ds=#s14#, =q1=#r5#"};
		{ 19, 17907, "", "=q3=Frostwolf Insignia Rank 4", "=ds=#s14#, =q1=#r4#"};
		{ 20, 17906, "", "=q2=Frostwolf Insignia Rank 3", "=ds=#s14#, =q1=#r3#"};
		{ 21, 17905, "", "=q2=Frostwolf Insignia Rank 2", "=ds=#s14#, =q1=#r2#"};
		{ 22, 17690, "", "=q2=Frostwolf Insignia Rank 1", "=ds=#s14#, =q1=#r1#"};
		Back = "REPMENU_ORIGINALWOW";
	};

		---------------------------
		--- Thorium Brotherhood ---
		---------------------------

	AtlasLoot_Data["Thorium1"] = {
		{ 1, 0, "INV_Ingot_Mithril", "=q6=#r2#", ""};
		{ 2, 17051, "", "=q3=Plans: Dark Iron Bracers", "=ds=#p2# (295)"};
		{ 3, 20761, "", "=q1=Recipe: Transmute Elemental Fire", "=ds=#p1# (300)"};
		{ 4, 19444, "", "=q1=Formula: Enchant Weapon - Strength", "=ds=#p4# (290)"};
		{ 5, 17023, "", "=q1=Pattern: Molten Helm", "=ds=#p7# (300)"};
		{ 6, 17022, "", "=q1=Pattern: Corehound Boots", "=ds=#p7# (295)"};
		{ 7, 17018, "", "=q1=Pattern: Flarecore Gloves", "=ds=#p8# (300)"};
		{ 16, 0, "INV_Ingot_Mithril", "=q6=#r3#", ""};
		{ 17, 17060, "", "=q3=Plans: Dark Iron Destroyer", "=ds=#p2# (300)"};
		{ 18, 17059, "", "=q3=Plans: Dark Iron Reaver", "=ds=#p2# (300)"};
		{ 19, 17049, "", "=q3=Plans: Fiery Chain Girdle", "=ds=#p2# (295)"};
		{ 20, 19206, "", "=q1=Plans: Dark Iron Helm", "=ds=#p2# (300)"};
		{ 21, 19448, "", "=q1=Formula: Enchant Weapon - Mighty Spirit", "=ds=#p4# (300)"};
		{ 22, 17025, "", "=q1=Pattern: Black Dragonscale Boots", "=ds=#p7# (300)"};
		{ 23, 19330, "", "=q1=Pattern: Lava Belt", "=ds=#p7# (300)"};
		{ 24, 17017, "", "=q1=Pattern: Flarecore Mantle", "=ds=#p8# (300)"};
		{ 25, 19219, "", "=q1=Pattern: Flarecore Robe", "=ds=#p8# (300)"};
		Next = "Thorium2";
		Back = "REPMENU_ORIGINALWOW";
	};

	AtlasLoot_Data["Thorium2"] = {
		{ 1, 0, "INV_Ingot_Mithril", "=q6=#r4#", ""};
		{ 2, 18592, "", "=q4=Plans: Sulfuron Hammer", "=ds=#p2# (300), #m4#"};
		{ 3, 17052, "", "=q3=Plans: Dark Iron Leggings", "=ds=#p2# (300)"};
		{ 4, 17053, "", "=q3=Plans: Fiery Chain Shoulders", "=ds=#p2# (300)"};
		{ 5, 19209, "", "=q1=Plans: Blackfury", "=ds=#p2# (300)"};
		{ 6, 19208, "", "=q1=Plans: Black Amnesty", "=ds=#p2# (300)"};
		{ 7, 19207, "", "=q1=Plans: Dark Iron Gauntlets", "=ds=#p2# (300)"};
		{ 8, 19449, "", "=q1=Formula: Enchant Weapon - Mighty Intellect", "=ds=#p4# (300)"};
		{ 9, 19331, "", "=q1=Pattern: Chromatic Gauntlets", "=ds=#p7# (300)"};
		{ 10, 19332, "", "=q1=Pattern: Corehound Belt", "=ds=#p7# (300)"};
		{ 11, 19333, "", "=q1=Pattern: Molten Belt", "=ds=#p7# (300)"};
		{ 12, 19220, "", "=q1=Pattern: Flarecore Leggings", "=ds=#p8# (300)"};
		{ 16, 0, "INV_Ingot_Mithril", "=q6=#r5#", ""};
		{ 17, 19211, "", "=q1=Plans: Blackguard", "=ds=#p2# (300)"};
		{ 18, 20040, "", "=q1=Plans: Dark Iron Boots", "=ds=#p2# (300)"};
		{ 19, 19210, "", "=q1=Plans: Ebon Hand", "=ds=#p2# (300)"};
		{ 20, 19212, "", "=q1=Plans: Nightfall", "=ds=#p2# (300)"};
		Prev = "Thorium1";
		Back = "REPMENU_ORIGINALWOW";
	};

		----------------------
		--- Timbermaw Hold ---
		----------------------

	AtlasLoot_Data["Timbermaw"] = {
		{ 1, 0, "INV_Misc_Horn_01", "=q6=#r2#", ""};
		{ 2, 13484, "", "=q2=Recipe: Transmute Earth to Water", "=ds=#p1# (275)"};
		{ 3, 22392, "", "=q1=Formula: Enchant 2H Weapon - Agility", "=ds=#p4# (290)"};
		{ 4, 20254, "", "=q1=Pattern: Warbear Woolies", "=ds=#p7# (285)"};
		{ 5, 20253, "", "=q1=Pattern: Warbear Harness", "=ds=#p7# (275)"};
		{ 7, 0, "INV_Misc_Horn_01", "=q6=#r3#", ""};
		{ 8, 16768, "", "=q2=Furbolg Medicine Pouch", "=ds=#s15#"};
		{ 9, 16769, "", "=q2=Furbolg Medicine Totem", "=ds=#h3#, #w6#"};
		{ 10, 19202, "", "=q1=Plans: Heavy Timbermaw Belt", "=ds=#p2# (290)"};
		{ 11, 19445, "", "=q1=Formula: Enchant Weapon - Agility", "=ds=#p4# (290)"};
		{ 12, 19326, "", "=q1=Pattern: Might of the Timbermaw", "=ds=#p7# (290)"};
		{ 13, 19215, "", "=q1=Pattern: Wisdom of the Timbermaw", "=ds=#p8# (290)"};
		{ 16, 0, "INV_Misc_Horn_01", "=q6=#r4#", ""};
		{ 17, 19204, "", "=q1=Plans: Heavy Timbermaw Boots", "=ds=#p2# (300)"};
		{ 18, 19327, "", "=q1=Pattern: Timbermaw Brawlers", "=ds=#p7# (300)"};
		{ 19, 19218, "", "=q1=Pattern: Mantle of the Timbermaw", "=ds=#p8# (300)"};
		{ 22, 0, "INV_Misc_Horn_01", "=q6=#r5#", ""};
		{ 23, 21326, "", "=q4=Defender of the Timbermaw", "=q1=#m4#: =ds=#s14#"};
		Back = "REPMENU_ORIGINALWOW";
	};

		----------------------
		--- Zandalar Tribe ---
		----------------------

	AtlasLoot_Data["Zandalar1"] = {
		{ 1, 19858, "", "=q2=Zandalar Honor Token", "=ds=#m17#"};
		{ 3, 0, "INV_Misc_Coin_08", "=q6=#r2#", ""};
		{ 4, 20012, "", "=q1=Recipe: Greater Dreamless Sleep", "=ds=#p1# (275)"};
		{ 5, 19778, "", "=q1=Plans: Bloodsoul Gauntlets", "=ds=#p2# (300)"};
		{ 6, 19781, "", "=q1=Plans: Darksoul Shoulders", "=ds=#p2# (300)"};
		{ 7, 20757, "", "=q1=Formula: Brilliant Mana Oil", "=ds=#p4# (300)"};
		{ 8, 20001, "", "=q1=Schematic: Bloodvine Lens", "=ds=#p5# (300)"};
		{ 9, 19771, "", "=q1=Pattern: Primal Batskin Bracers", "=ds=#p7# (300)"};
		{ 10, 19766, "", "=q1=Pattern: Bloodvine Boots", "=ds=#p8# (300)"};
		{ 16, 0, "INV_Misc_Coin_08", "=q6=#r3#", ""};
		{ 17, 20014, "", "=q1=Recipe: Major Troll's Blood Potion", "=ds=#p1# (290)"};
		{ 18, 19777, "", "=q1=Plans: Bloodsoul Shoulders", "=ds=#p2# (300)"};
		{ 19, 19780, "", "=q1=Plans: Darksoul Leggings", "=ds=#p2# (300)"};
		{ 20, 20756, "", "=q1=Formula: Brilliant Wizard Oil", "=ds=#p4# (300)"};
		{ 21, 20000, "", "=q1=Schematic: Bloodvine Goggles", "=ds=#p5# (300)"};
		{ 22, 19773, "", "=q1=Pattern: Blood Tiger Shoulders", "=ds=#p7# (300)"};
		{ 23, 19770, "", "=q1=Pattern: Primal Batskin Gloves", "=ds=#p7# (300)"};
		{ 24, 19765, "", "=q1=Pattern: Bloodvine Leggings", "=ds=#p8# (300)"};
		{ 25, 20031, "", "=q1=Essence Mango", "=ds=#e3#", "1 #zandalar#", ""};
		Next = "Zandalar2";
		Back = "REPMENU_ORIGINALWOW";
	};

	AtlasLoot_Data["Zandalar2"] = {
		{ 1, 0, "INV_Misc_Coin_08", "=q6=#r4#", ""};
		{ 2, 20080, "", "=q2=Sheen of Zanza", "=ds=#e2#", "3 #zandalar#", ""};
		{ 3, 20079, "", "=q2=Spirit of Zanza", "=ds=#e2#", "3 #zandalar#", ""};
		{ 4, 20081, "", "=q2=Swiftness of Zanza", "=ds=#e2#", "3 #zandalar#", ""};
		{ 5, 20011, "", "=q1=Recipe: Mageblood Potion", "=ds=#p1# (275)"};
		{ 6, 19776, "", "=q1=Plans: Bloodsoul Breastplate", "=ds=#p2# (300)"};
		{ 7, 19779, "", "=q1=Plans: Darksoul Breastplate", "=ds=#p2# (300)"};
		{ 8, 19772, "", "=q1=Pattern: Blood Tiger Breastplate", "=ds=#p7# (300)"};
		{ 9, 19769, "", "=q1=Pattern: Primal Batskin Jerkin", "=ds=#p7# (300)"};
		{ 10, 19764, "", "=q1=Pattern: Bloodvine Vest", "=ds=#p8# (300)"};
		{ 16, 0, "INV_Misc_Coin_08", "=q6=#r5#", ""};
		{ 17, 20077, "", "=q3=Zandalar Signet of Might", "=ds=#s3# #e17#", "15 #zandalar#", ""};
		{ 18, 20076, "", "=q3=Zandalar Signet of Mojo", "=ds=#s3# #e17#", "15 #zandalar#", ""};
		{ 19, 20078, "", "=q3=Zandalar Signet of Serenity", "=ds=#s3# #e17#", "15 #zandalar#", ""};
		{ 20, 20013, "", "=q1=Recipe: Living Action Potion", "=ds=#p1# (285)"};
		Prev = "Zandalar1";
		Back = "REPMENU_ORIGINALWOW";
	};

	--------------------
	--- World Bosses ---
	--------------------

		----------------------------
		--- Dragons of Nightmare ---
		----------------------------

	AtlasLoot_Data["DEmeriss"] = {
		{ 1, 20579, "", "=q4=Green Dragonskin Cloak", "=ds=#s4# =q1=#m5#", "", "9.14%"};
		{ 2, 20618, "", "=q4=Gloves of Delusional Power", "=ds=#s9#, #a1# =q1=#m5#", "", "9.71%"};
		{ 3, 20615, "", "=q4=Dragonspur Wraps", "=ds=#s8#, #a2# =q1=#m5#", "", "8.83%"};
		{ 4, 20617, "", "=q4=Ancient Corroded Leggings", "=ds=#s11#, #a3# =q1=#m5#", "", "9.80%"};
		{ 5, 20616, "", "=q4=Dragonbone Wristguards", "=ds=#s8#, #a4# =q1=#m5#", "", "10.20%"};
		{ 6, 20619, "", "=q4=Acid Inscribed Greaves", "=ds=#s12#, #a4# =q1=#m5#", "", "8.85%"};
		{ 7, 20582, "", "=q4=Trance Stone", "=ds=#s15# =q1=#m5#", "", "9.57%"};
		{ 8, 20580, "", "=q4=Hammer of Bestial Fury", "=ds=#h3#, #w6# =q1=#m5#", "", "8.93%"};
		{ 9, 20581, "", "=q4=Staff of Rampant Growth", "=ds=#w9# =q1=#m5#", "", "9.70%"};
		{ 11, 20644, "", "=q4=Nightmare Engulfed Object", "=ds=#m3# =q1=#m5#", "", "80.05%"};
		{ 12, 20600, "", "=q4=Malfurion's Signet Ring", "=q1=#m4#: =ds=#s13#"};
		{ 16, 20623, "", "=q4=Circlet of Restless Dreams", "=ds=#s1#, #a2#", "", "10.51%"};
		{ 17, 20621, "", "=q4=Boots of the Endless Moor", "=ds=#s12#, #a3#", "", "10.24%"};
		{ 18, 20622, "", "=q4=Dragonheart Necklace", "=ds=#s2#", "", "12.35%"};
		{ 19, 20624, "", "=q4=Ring of the Unliving", "=ds=#s13#", "", "13.23%"};
		{ 20, 20599, "", "=q4=Polished Ironwood Crossbow", "=ds=#w3#", "", "12.63%"};
	};

	AtlasLoot_Data["DLethon"] = {
		{ 1, 20579, "", "=q4=Green Dragonskin Cloak", "=ds=#s4# =q1=#m5#", "", "9.14%"};
		{ 2, 20618, "", "=q4=Gloves of Delusional Power", "=ds=#s9#, #a1# =q1=#m5#", "", "9.71%"};
		{ 3, 20615, "", "=q4=Dragonspur Wraps", "=ds=#s8#, #a2# =q1=#m5#", "", "8.83%"};
		{ 4, 20617, "", "=q4=Ancient Corroded Leggings", "=ds=#s11#, #a3# =q1=#m5#", "", "9.80%"};
		{ 5, 20616, "", "=q4=Dragonbone Wristguards", "=ds=#s8#, #a4# =q1=#m5#", "", "10.20%"};
		{ 6, 20619, "", "=q4=Acid Inscribed Greaves", "=ds=#s12#, #a4# =q1=#m5#", "", "8.85%"};
		{ 7, 20582, "", "=q4=Trance Stone", "=ds=#s15# =q1=#m5#", "", "9.57%"};
		{ 8, 20580, "", "=q4=Hammer of Bestial Fury", "=ds=#h3#, #w6# =q1=#m5#", "", "8.93%"};
		{ 9, 20581, "", "=q4=Staff of Rampant Growth", "=ds=#w9# =q1=#m5#", "", "9.70%"};
		{ 11, 20644, "", "=q4=Nightmare Engulfed Object", "=ds=#m3# =q1=#m5#", "", "80.05%"};
		{ 12, 20600, "", "=q4=Malfurion's Signet Ring", "=q1=#m4#: =ds=#s13#"};
		{ 16, 20626, "", "=q4=Black Bark Wristbands", "=ds=#s8#, #a1#", "", "9.44%"};
		{ 17, 20625, "", "=q4=Belt of the Dark Bog", "=ds=#s10#, #a1#", "", "10.99%"};
		{ 18, 20628, "", "=q4=Deviate Growth Cap", "=ds=#s1#, #a2#", "", "15.80%"};
		{ 19, 20627, "", "=q4=Dark Heart Pants", "=ds=#s11#, #a2#", "", "11.68%"};
		{ 20, 20629, "", "=q4=Malignant Footguards", "=ds=#s12#, #a3#", "", "4.46%"};
		{ 21, 20630, "", "=q4=Gauntlets of the Shining Light", "=ds=#s9#, #a4#", "", "8.19%"};
	};

	AtlasLoot_Data["DTaerar"] = {
		{ 1, 20579, "", "=q4=Green Dragonskin Cloak", "=ds=#s4# =q1=#m5#", "", "9.14%"};
		{ 2, 20618, "", "=q4=Gloves of Delusional Power", "=ds=#s9#, #a1# =q1=#m5#", "", "9.71%"};
		{ 3, 20615, "", "=q4=Dragonspur Wraps", "=ds=#s8#, #a2# =q1=#m5#", "", "8.83%"};
		{ 4, 20617, "", "=q4=Ancient Corroded Leggings", "=ds=#s11#, #a3# =q1=#m5#", "", "9.80%"};
		{ 5, 20616, "", "=q4=Dragonbone Wristguards", "=ds=#s8#, #a4# =q1=#m5#", "", "10.20%"};
		{ 6, 20619, "", "=q4=Acid Inscribed Greaves", "=ds=#s12#, #a4# =q1=#m5#", "", "8.85%"};
		{ 7, 20582, "", "=q4=Trance Stone", "=ds=#s15# =q1=#m5#", "", "9.57%"};
		{ 8, 20580, "", "=q4=Hammer of Bestial Fury", "=ds=#h3#, #w6# =q1=#m5#", "", "8.93%"};
		{ 9, 20581, "", "=q4=Staff of Rampant Growth", "=ds=#w9# =q1=#m5#", "", "9.70%"};
		{ 11, 20644, "", "=q4=Nightmare Engulfed Object", "=ds=#m3# =q1=#m5#", "", "80.05%"};
		{ 12, 20600, "", "=q4=Malfurion's Signet Ring", "=q1=#m4#: =ds=#s13#"};
		{ 16, 20631, "", "=q4=Mendicant's Slippers", "=ds=#s12#, #a1#", "", "13.14%"};
		{ 17, 20633, "", "=q4=Unnatural Leather Spaulders", "=ds=#s3#, #a2#", "", "11.30%"};
		{ 18, 20634, "", "=q4=Boots of Fright", "=ds=#s12#, #a2#", "", "10.15%"};
		{ 19, 20632, "", "=q4=Mindtear Band", "=ds=#s13#", "", "13.69%"};
		{ 20, 20577, "", "=q4=Nightmare Blade", "=ds=#h1#, #w10#", "", "12.07%"};
	};

	AtlasLoot_Data["DYsondre"] = {
		{ 1, 20579, "", "=q4=Green Dragonskin Cloak", "=ds=#s4# =q1=#m5#", "", "9.14%"};
		{ 2, 20618, "", "=q4=Gloves of Delusional Power", "=ds=#s9#, #a1# =q1=#m5#", "", "9.71%"};
		{ 3, 20615, "", "=q4=Dragonspur Wraps", "=ds=#s8#, #a2# =q1=#m5#", "", "8.83%"};
		{ 4, 20617, "", "=q4=Ancient Corroded Leggings", "=ds=#s11#, #a3# =q1=#m5#", "", "9.80%"};
		{ 5, 20616, "", "=q4=Dragonbone Wristguards", "=ds=#s8#, #a4# =q1=#m5#", "", "10.20%"};
		{ 6, 20619, "", "=q4=Acid Inscribed Greaves", "=ds=#s12#, #a4# =q1=#m5#", "", "8.85%"};
		{ 7, 20582, "", "=q4=Trance Stone", "=ds=#s15# =q1=#m5#", "", "9.57%"};
		{ 8, 20580, "", "=q4=Hammer of Bestial Fury", "=ds=#h3#, #w6# =q1=#m5#", "", "8.93%"};
		{ 9, 20581, "", "=q4=Staff of Rampant Growth", "=ds=#w9# =q1=#m5#", "", "9.70%"};
		{ 11, 20644, "", "=q4=Nightmare Engulfed Object", "=ds=#m3# =q1=#m5#", "", "80.05%"};
		{ 12, 20600, "", "=q4=Malfurion's Signet Ring", "=q1=#m4#: =ds=#s13#"};
		{ 16, 20635, "", "=q4=Jade Inlaid Vestments", "=ds=#s5#, #a1#", "", "14.19%"};
		{ 17, 20638, "", "=q4=Leggings of the Demented Mind", "=ds=#s11#, #a3#", "", "3.66%"};
		{ 18, 20637, "", "=q4=Acid Inscribed Pauldrons", "=ds=#s3#, #a4#", "", "10.13%"};
		{ 19, 20639, "", "=q4=Strangely Glyphed Legplates", "=ds=#s11#, #a4#", "", "8.87%"};
		{ 20, 20636, "", "=q4=Hibernation Crystal", "=ds=#s14#", "", "12.75%"};
		{ 21, 20578, "", "=q4=Emerald Dragonfang", "=ds=#h1#, #w4#", "", "9.95%"};
	};

		----------------
		--- Azuregos ---
		----------------

	AtlasLoot_Data["WorldBossesClassic"] = {
		{ 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Azuregos"], ""};
		{ 2, 18541, "", "=q4=Puissant Cape", "=ds=#s4#", "", "11.71%"};
		{ 3, 18208, "", "=q4=Drape of Benediction", "=ds=#s4#", "", "11.22%"};
		{ 4, 19132, "", "=q4=Crystal Adorned Crown", "=ds=#s1#, #a1#", "", "13.54%"};
		{ 5, 18545, "", "=q4=Leggings of Arcane Supremacy", "=ds=#s11#, #a1#", "", "16.39% "};
		{ 6, 19131, "", "=q4=Snowblind Shoes", "=ds=#s12#, #a1#", "", "12.23%"};
		{ 7, 18547, "", "=q4=Unmelting Ice Girdle", "=ds=#s10#, #a4#", "", "12.93%"};
		{ 8, 17070, "", "=q4=Fang of the Mystics", "=ds=#h3#, #w4#", "", "13.64%"};
		{ 9, 18202, "", "=q4=Eskhandar's Left Claw", "=ds=#h4#, #w13#", "", "11.76%"};
		{ 10, 18542, "", "=q4=Typhoon", "=ds=#h2#, #w10#", "", "16.89%"};
		{ 11, 19130, "", "=q4=Cold Snap", "=ds=#w12#", "", "11.89%"};
		{ 16, 18704, "", "=q4=Mature Blue Dragon Sinew", "=ds=#m3# =q1=(#c2#)", "", "51.56%"};
		{ 17, 18714, "", "=q4=Ancient Sinew Wrapped Lamina", "=q1=#m4#: =ds=#m14# #w19#"};
	};