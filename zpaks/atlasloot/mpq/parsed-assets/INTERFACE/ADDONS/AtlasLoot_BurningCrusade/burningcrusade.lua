local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")

-- Index
--- Dungeons & Raids
---- Keys
---- Auchindoun: Auchenai Crypts
---- Auchindoun: Mana-Tombs
---- Auchindoun: Sethekk Halls
---- Auchindoun: Shadow Labyrinth
---- Black Temple
---- Caverns of Time: Old Hillsbrad Foothills
---- Caverns of Time: The Black Morass
---- Caverns of Time: Hyjal Summit
---- Coilfang Reservoir: The Slave Pens
---- Coilfang Reservoir: The Steamvault
---- Coilfang Reservoir: The Underbog
---- Coilfang Reservoir: Serpentshrine Cavern
---- Gruul's Lair
---- Hellfire Citadel: Hellfire Ramparts
---- Hellfire Citadel: The Blood Furnace
---- Hellfire Citadel: The Shattered Halls
---- Hellfire Citadel: Magtheridon's Lair
---- Karazhan
---- Sunwell Isle: Magister's Terrace
---- Sunwell Isle: Sunwell Plateau
---- Tempest Keep: The Arcatraz
---- Tempest Keep: The Botanica
---- Tempest Keep: The Mechanar
---- Tempest Keep: The Eye
---- Zul'Aman
--- Factions
---- Ashtongue Deathsworn
---- Cenarion Expedition
---- Honor Hold
---- Keepers of Time
---- Kurenai
---- Lower City
---- Netherwing
---- Ogri'la
---- Sha'tari Skyguard
---- Shattered Sun Offensive
---- Sporeggar
---- The Aldor
---- The Consortium
---- The Mag'har
---- The Scale of the Sands
---- The Scryers
---- The Sha'tar
---- The Violet Eye
---- Thrallmar
---- Tranquillien
---- Misc
--- PvP
---- World PvP - Hellfire Peninsula: Hellfire Fortifications
---- World PvP - Nagrand: Halaa
---- World PvP - Terokkar Forest: Bone Wastes
---- World PvP - Zangarmarsh: Twin Spire Ruins
---- Rep-PvP Level 70 - Armor Sets
---- PvP Level 70 - Accessories
---- PvP Level 70 - Non Set Epics
---- Arena - Armor Sets
---- Arena Season 2 - Weapons
---- Arena Season 3 - Weapons
---- Arena Season 4 - Weapons
--- Sets & Collections
---- Dungeon 3 Sets (D3)
---- Tier 4/Tier 5/Tier 6
---- The Burning Crusade Sets
---- Badge of Justice Rewards
---- BoE World Epics
--- World Bosses

	------------------------
	--- Dungeons & Raids ---
	------------------------

		------------
		--- Keys ---
		------------

	AtlasLoot_Data["BCKeys"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 27991, "", "=q1=Shadow Labyrinth Key", "=ds=#e9#"};
		{ 3, 28395, "", "=q1=Shattered Halls Key", "=ds=#e9#"};
		{ 4, 31084, "", "=q1=Key to the Arcatraz", "=ds=#e9#"};
		{ 6, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 7, 30622, "", "=q1=Flamewrought Key", "=ds=#e9# =ec1=#m7#"};
		{ 8, 30637, "", "=q1=Flamewrought Key", "=ds=#e9# =ec1=#m6#"};
		{ 9, 30623, "", "=q1=Reservoir Key", "=ds=#e9#"};
		{ 10, 30633, "", "=q1=Auchenai Key", "=ds=#e9#"};
		{ 11, 30635, "", "=q1=Key of Time", "=ds=#e9#"};
		{ 12, 30634, "", "=q1=Warpforged Key", "=ds=#e9#"};
		{ 16, 0, "INV_Box_01", "=q6=#j2#", ""};
		{ 17, 24490, "", "=q1=The Master's Key", "=ds=#e9#"};
		{ 19, 0, "INV_Box_01", "=q6=#m20#", ""};
		{ 20, 32092, "", "=q3=The Eye of Haramad", "=ds=#m27#"};
		{ 21, 32449, "", "=q1=Essence-Infused Moonstone", "=ds=#m27#"};
	};

		-----------------------------------
		--- Auchindoun: Auchenai Crypts ---
		-----------------------------------

	AtlasLoot_Data["AuchCryptsShirrak"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Shirrak the Dead Watcher", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Shirrak the Dead Watcher", "=q5=ONE WILL DROP"};
    { 5, 25964, "", "=q3=Shaarde the Lesser", "=ds=#w10#", "", "20.0%" };
    { 6, 26055, "", "=q3=Oculus of the Hidden Eye", "=ds=#s14#", "", "20.0%" };
    { 7, 27408, "", "=q3=Hope Bearer Helm", "=ds=#a4#", "", "20.0%" };
    { 8, 27409, "", "=q3=Raven-Heart Headdress", "=ds=#a2#", "", "20.0%" };
    { 9, 27410, "", "=q3=Collar of Command", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["AuchCryptsShirrakHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Shirrak the Dead Watcher (1)", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Shirrak the Dead Watcher (1)", "=q5=ONE WILL DROP"};
    { 6, 27493, "", "=q3=Gloves of the Deadwatcher", "=ds=#a1#", "", "16.7%" };
    { 7, 27845, "", "=q3=Magma Plume Boots", "=ds=#a3#", "", "16.7%" };
    { 8, 27846, "", "=q3=Claw of the Watcher", "=ds=#w13#", "", "16.7%" };
    { 9, 27847, "", "=q3=Fanblade Pauldrons", "=ds=#a4#", "", "16.7%" };
    { 10, 27865, "", "=q3=Bracers of Shirrak", "=ds=#a3#", "", "16.7%" };
    { 11, 27866, "", "=q3=Scintillating Headdress of Second Sight", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchCryptsAvatar"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Avatar of the Martyred", "=q5=CHANCE TO DROP"};
    { 2, 57484, "", "=q3=Technique: Scroll of Holy Resistance VI", "=ds=#e2#", "", "15.0%" };
	};

	AtlasLoot_Data["AuchCryptsExarch"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Exarch Maladaar", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 901735, "", "=q1=Mark of the Fallen Exarch", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Exarch Maladaar", "=q5=CHANCE TO DROP"};
    { 6, 57484, "", "=q3=Technique: Scroll of Holy Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 7, 100004, "", "=q3=Codex: Prayer of Spirit II", "=ds=#e2#", "", "15.0%" };
    { 9, 0, "AO_Unknown", "=q6=Exarch Maladaar", "=q5=ONE WILL DROP"};
    { 10, 27411, "", "=q3=Slippers of Serenity", "=ds=#a1#", "", "16.7%" };
    { 11, 27412, "", "=q3=Ironstaff of Regeneration", "=ds=#w9#", "", "16.7%" };
    { 12, 27413, "", "=q3=Ring of the Exarchs", "=ds=#s13#", "", "16.7%" };
    { 13, 27414, "", "=q3=Mok'Nathal Beast-Mask", "=ds=#a3#", "", "16.7%" };
    { 14, 27415, "", "=q3=Darkguard Face Mask", "=ds=#a2#", "", "16.7%" };
    { 15, 27416, "", "=q3=Fetish of the Fallen", "=ds=#s14#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchCryptsExarchHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Exarch Maladaar (1)", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 33836, "", "=q1=The Exarch's Soul Gem", "=ds=#m3#", "", "100%" };
    { 5, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Exarch Maladaar (1)", "=q5=CHANCE TO DROP"};
    { 8, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 9, 57484, "", "=q3=Technique: Scroll of Holy Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 10, 100004, "", "=q3=Codex: Prayer of Spirit II", "=ds=#e2#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Exarch Maladaar (1)", "=q5=ONE WILL DROP"};
    { 17, 27523, "", "=q3=Exarch's Diamond Band", "=ds=#s13#", "", "16.7%" };
    { 18, 27867, "", "=q3=Boots of the Unjust", "=ds=#a2#", "", "16.7%" };
    { 19, 27869, "", "=q3=Soulpriest's Ring of Resolve", "=ds=#s13#", "", "16.7%" };
    { 20, 27870, "", "=q3=Doomplate Legguards", "=ds=#a4#", "", "16.7%" };
    { 21, 27871, "", "=q3=Maladaar's Blessed Chaplet", "=ds=#s2#", "", "16.7%" };
    { 22, 27872, "", "=q3=The Harvester of Souls", "=ds=#w1#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Exarch Maladaar (1)", "=q5=ONE WILL DROP"};
    { 25, 29244, "", "=q4=Wave-Song Girdle", "=ds=#a3#", "", "33.3%" };
    { 26, 29257, "", "=q4=Sash of Arcane Visions", "=ds=#a1#", "", "33.3%" };
    { 27, 29354, "", "=q4=Light-Touched Stole of Altruism", "=ds=#a1#", "", "33.3%" };
	};

	AtlasLoot_Data["AuchManaNexusPrince"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Nexus-Prince Shaffar", "=q5=ALL WILL DROP"};
    { 2, 28490, "", "=q1=Shaffar's Wrappings", "=ds=#m3#", "", "100%" };
    { 3, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 4, 901733, "", "=q1=Ring of Shaffar", "=ds=#m3#", "", "100%" };
    { 6, 0, "RoM_stellar_dice", "=q6=Nexus-Prince Shaffar", "=q5=CHANCE TO DROP"};
    { 7, 22921, "", "=q2=Recipe: Major Frost Protection Potion", "=ds=#e2#", "", "10.0%" };
    { 9, 0, "AO_Unknown", "=q6=Nexus-Prince Shaffar", "=q5=ONE WILL DROP"};
    { 10, 25953, "", "=q3=Ethereal Warp-Bow", "=ds=#w2#", "", "16.7%" };
    { 11, 25954, "", "=q3=Sigil of Shaffar", "=ds=#s2#", "", "16.7%" };
    { 12, 25955, "", "=q3=Mask of the Howling Storm", "=ds=#a3#", "", "16.7%" };
    { 13, 25956, "", "=q3=Nexus-Bracers of Vigor", "=ds=#a4#", "", "16.7%" };
    { 14, 25957, "", "=q3=Ethereal Boots of the Skystrider", "=ds=#a1#", "", "16.7%" };
    { 15, 25962, "", "=q3=Longstrider's Loop", "=ds=#s13#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchManaNexusPrinceHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Nexus-Prince Shaffar (1)", "=q5=ALL WILL DROP"};
    { 2, 28490, "", "=q1=Shaffar's Wrappings", "=ds=#m3#", "", "100%" };
    { 3, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 4, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 33835, "", "=q1=Shaffar's Wondrous Amulet", "=ds=#m3#", "", "100%" };
    { 6, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 8, 0, "RoM_stellar_dice", "=q6=Nexus-Prince Shaffar (1)", "=q5=CHANCE TO DROP"};
    { 9, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 10, 22921, "", "=q2=Recipe: Major Frost Protection Potion", "=ds=#e2#", "", "10.0%" };
    { 12, 0, "AO_Unknown", "=q6=Nexus-Prince Shaffar (1)", "=q5=ONE WILL DROP"};
    { 13, 27827, "", "=q3=Lucid Dream Bracers", "=ds=#a2#", "", "16.7%" };
    { 14, 27828, "", "=q3=Warp-Scarab Brooch", "=ds=#s14#", "", "16.7%" };
    { 15, 27829, "", "=q3=Axe of the Nexus-Kings", "=ds=#w1#", "", "16.7%" };
    { 16, 27831, "", "=q3=Mantle of the Unforgiven", "=ds=#a2#", "", "16.7%" };
    { 17, 27835, "", "=q3=Stillwater Girdle", "=ds=#a3#", "", "16.7%" };
    { 18, 27837, "", "=q3=Wastewalker Leggings", "=ds=#a2#", "", "16.7%" };
    { 20, 0, "AO_Unknown", "=q6=Nexus-Prince Shaffar (1)", "=q5=ONE WILL DROP"};
    { 21, 29240, "", "=q4=Bands of Negation", "=ds=#a1#", "", "25.0%" };
    { 22, 29352, "", "=q4=Cobalt Band of Tyrigosa", "=ds=#s13#", "", "25.0%" };
    { 23, 30535, "", "=q4=Forestwalker Kilt", "=ds=#a2#", "", "25.0%" };
    { 24, 32082, "", "=q4=The Fel Barrier", "=ds=#w8#", "", "25.0%" };
	};

	AtlasLoot_Data["AuchManaYor"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Yor", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Yor", "=q5=ONE WILL DROP"};
    { 6, 31554, "", "=q3=Windchanneller's Tunic", "=ds=#a1#", "", "25.0%" };
    { 7, 31562, "", "=q3=Skystalker's Tunic", "=ds=#a2#", "", "25.0%" };
    { 8, 31570, "", "=q3=Mistshroud Tunic", "=ds=#a3#", "", "25.0%" };
    { 9, 31578, "", "=q3=Slatesteel Breastplate", "=ds=#a4#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Yor", "=q5=ONE WILL DROP"};
    { 17, 31919, "", "=q4=Nexus-Prince's Ring of Balance", "=ds=#s13#", "", "16.7%" };
    { 18, 31920, "", "=q4=Shaffar's Band of Brutality", "=ds=#s13#", "", "16.7%" };
    { 19, 31921, "", "=q4=Yor's Collapsing Band", "=ds=#s13#", "", "16.7%" };
    { 20, 31922, "", "=q4=Ring of Conflict Survival", "=ds=#s13#", "", "16.7%" };
    { 21, 31923, "", "=q4=Band of the Crystalline Void", "=ds=#s13#", "", "16.7%" };
    { 22, 31924, "", "=q4=Yor's Revenge", "=ds=#s13#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchManaTavarok"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Tavarok", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Tavarok", "=q5=ONE WILL DROP"};
    { 5, 25944, "", "=q3=Shaarde the Greater", "=ds=#w10#", "", "16.7%" };
    { 6, 25945, "", "=q3=Cloak of Revival", "=ds=#a1#", "", "16.7%" };
    { 7, 25946, "", "=q3=Nethershade Boots", "=ds=#a2#", "", "16.7%" };
    { 8, 25947, "", "=q3=Lightning-Rod Pauldrons", "=ds=#a3#", "", "16.7%" };
    { 9, 25950, "", "=q3=Staff of Polarities", "=ds=#w9#", "", "16.7%" };
    { 10, 25952, "", "=q3=Scimitar of the Nexus-Stalkers", "=ds=#w10#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchManaTavarokHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Tavarok (1)", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Tavarok (1)", "=q5=ONE WILL DROP"};
    { 6, 27821, "", "=q3=Extravagant Boots of Malice", "=ds=#a1#", "", "16.7%" };
    { 7, 27822, "", "=q3=Crystal Band of Valor", "=ds=#s13#", "", "16.7%" };
    { 8, 27823, "", "=q3=Shard Encrusted Breastplate", "=ds=#a3#", "", "16.7%" };
    { 9, 27824, "", "=q3=Robe of the Great Dark Beyond", "=ds=#a1#", "", "16.7%" };
    { 10, 27825, "", "=q3=Predatory Gloves", "=ds=#a2#", "", "16.7%" };
    { 11, 27826, "", "=q3=Mantle of the Sea Wolf", "=ds=#a3#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchManaPandemonius"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Pandemonius", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Pandemonius", "=q5=ONE WILL DROP"};
    { 5, 25939, "", "=q3=Voidfire Wand", "=ds=#w12#", "", "16.7%" };
    { 6, 25940, "", "=q3=Idol of the Claw", "", "", "16.7%" };
    { 7, 25941, "", "=q3=Boots of the Outlander", "=ds=#a3#", "", "16.7%" };
    { 8, 25942, "", "=q3=Faith Bearer's Gauntlets", "=ds=#a4#", "", "16.7%" };
    { 9, 25943, "", "=q3=Creepjacker", "=ds=#w13#", "", "16.7%" };
    { 10, 28166, "", "=q3=Shield of the Void", "=ds=#w8#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchManaPandemoniusHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Pandemonius (1)", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Pandemonius (1)", "=q5=ONE WILL DROP"};
    { 6, 27813, "", "=q3=Boots of the Colossus", "=ds=#a4#", "", "16.7%" };
    { 7, 27814, "", "=q3=Twinblade of Mastery", "=ds=#w4#", "", "16.7%" };
    { 8, 27815, "", "=q3=Totem of the Astral Winds", "", "", "16.7%" };
    { 9, 27816, "", "=q3=Mindrage Pauldrons", "=ds=#a1#", "", "16.7%" };
    { 10, 27817, "", "=q3=Starbolt Longbow", "=ds=#w2#", "", "16.7%" };
    { 11, 27818, "", "=q3=Starry Robes of the Crescent", "=ds=#a2#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchManaPaxivi"] = {
    { 1, 0, "INV_Box_01", "=q6=No loot configured", "=ds=#m20#", "", "" };
	};

	AtlasLoot_Data["AuchSethekkTalonKingCoffer"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=The Talon King's Coffer", "=q5=ALL WILL DROP"};
    { 2, 27991, "", "=q1=Shadow Labyrinth Key", "=ds=#e5#", "", "100%" };
	};

	AtlasLoot_Data["AuchSethekkDarkweaver"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Darkweaver Syth", "=q5=ALL WILL DROP"};
    { 2, 27633, "", "=q1=Terokk's Mask", "=ds=#m3#", "", "100%" };
    { 3, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Darkweaver Syth", "=q5=CHANCE TO DROP"};
    { 6, 24160, "", "=q3=Design: Khorium Inferno Band", "=ds=#e2#", "", "10.0%" };
    { 8, 0, "AO_Unknown", "=q6=Darkweaver Syth", "=q5=ONE WILL DROP"};
    { 9, 27914, "", "=q3=Moonstrider Boots", "=ds=#a2#", "", "16.7%" };
    { 10, 27915, "", "=q3=Sky-Hunter Swift Boots", "=ds=#a3#", "", "16.7%" };
    { 11, 27916, "", "=q3=Sethekk Feather-Darts", "=ds=#w11#", "", "16.7%" };
    { 12, 27917, "", "=q3=Libram of the Eternal Rest", "", "", "16.7%" };
    { 13, 27918, "", "=q3=Bands of Syth", "=ds=#a4#", "", "16.7%" };
    { 14, 27919, "", "=q3=Light-Woven Slippers", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchSethekkDarkweaverHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Darkweaver Syth (1)", "=q5=ALL WILL DROP"};
    { 2, 25461, "", "=q1=Book of Forgotten Names", "=ds=#m3#", "", "100%" };
    { 3, 27633, "", "=q1=Terokk's Mask", "=ds=#m3#", "", "100%" };
    { 4, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 5, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Darkweaver Syth (1)", "=q5=CHANCE TO DROP"};
    { 8, 24160, "", "=q3=Design: Khorium Inferno Band", "=ds=#e2#", "", "10.0%" };
    { 10, 0, "AO_Unknown", "=q6=Darkweaver Syth (1)", "=q5=ONE WILL DROP"};
    { 11, 27914, "", "=q3=Moonstrider Boots", "=ds=#a2#", "", "16.7%" };
    { 12, 27915, "", "=q3=Sky-Hunter Swift Boots", "=ds=#a3#", "", "16.7%" };
    { 13, 27916, "", "=q3=Sethekk Feather-Darts", "=ds=#w11#", "", "16.7%" };
    { 14, 27917, "", "=q3=Libram of the Eternal Rest", "", "", "16.7%" };
    { 15, 27918, "", "=q3=Bands of Syth", "=ds=#a4#", "", "16.7%" };
    { 16, 27919, "", "=q3=Light-Woven Slippers", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchSethekkRavenGod"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Anzu", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Anzu", "=q5=CHANCE TO DROP"};
    { 6, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 7, 32768, "", "=q4=Reins of the Raven Lord", "=ds=#e10#", "", "0.93%" };
    { 9, 0, "AO_Unknown", "=q6=Anzu", "=q5=ONE WILL DROP"};
    { 10, 32769, "", "=q3=Belt of the Raven Lord", "=ds=#a2#", "", "20.0%" };
    { 11, 32778, "", "=q3=Boots of Righteous Fortitude", "=ds=#a4#", "", "20.0%" };
    { 12, 32779, "", "=q3=Band of Frigid Elements", "=ds=#s13#", "", "20.0%" };
    { 13, 32780, "", "=q3=The Boomstick", "=ds=#w5#", "", "20.0%" };
    { 14, 32781, "", "=q3=Talon of Anzu", "=ds=#w4#", "", "20.0%" };
	};

	AtlasLoot_Data["AuchSethekkTalonKing"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Talon King Ikiss", "=q5=ALL WILL DROP"};
    { 2, 27632, "", "=q1=Terokk's Quill", "=ds=#m3#", "", "100%" };
    { 3, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 4, 901737, "", "=q1=Arakkoa Crown", "=ds=#m3#", "", "100%" };
    { 6, 0, "AO_Unknown", "=q6=Talon King Ikiss", "=q5=ONE WILL DROP"};
    { 7, 27925, "", "=q3=Ravenclaw Band", "=ds=#s13#", "", "16.7%" };
    { 8, 27946, "", "=q3=Avian Cloak of Feathers", "=ds=#a1#", "", "16.7%" };
    { 9, 27980, "", "=q3=Terokk's Nightmace", "=ds=#w6#", "", "16.7%" };
    { 10, 27981, "", "=q3=Sethekk Oracle Cloak", "=ds=#a1#", "", "16.7%" };
    { 11, 27985, "", "=q3=Deathforge Girdle", "=ds=#a4#", "", "16.7%" };
    { 12, 27986, "", "=q3=Crow Wing Reaper", "=ds=#w1#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Talon King Ikiss", "=q5=ONE WILL DROP"};
    { 17, 27776, "", "=q3=Shoulderpads of Assassination", "=ds=#a2#", "", "20.0%" };
    { 18, 27838, "", "=q3=Incanter's Trousers", "=ds=#a1#", "", "20.0%" };
    { 19, 27875, "", "=q3=Hallowed Trousers", "=ds=#a1#", "", "20.0%" };
    { 20, 27936, "", "=q3=Greaves of Desolation", "=ds=#a3#", "", "20.0%" };
    { 21, 27948, "", "=q3=Trousers of Oblivion", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["AuchSethekkTalonKingHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Talon King Ikiss (1)", "=q5=ALL WILL DROP"};
    { 2, 27632, "", "=q1=Terokk's Quill", "=ds=#m3#", "", "100%" };
    { 3, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 4, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 33834, "", "=q1=The Headfeathers of Ikiss", "=ds=#m3#", "", "100%" };
    { 6, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 8, 0, "RoM_stellar_dice", "=q6=Talon King Ikiss (1)", "=q5=CHANCE TO DROP"};
    { 9, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 11, 0, "AO_Unknown", "=q6=Talon King Ikiss (1)", "=q5=ONE WILL DROP"};
    { 12, 29249, "", "=q4=Bands of the Benevolent", "=ds=#a1#", "", "25.0%" };
    { 13, 29259, "", "=q4=Bracers of the Hunt", "=ds=#a3#", "", "25.0%" };
    { 14, 29355, "", "=q4=Terokk's Shadowstaff", "=ds=#w9#", "", "25.0%" };
    { 15, 32073, "", "=q4=Spaulders of Dementia", "=ds=#a4#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Talon King Ikiss (1)", "=q5=ONE WILL DROP"};
    { 17, 27776, "", "=q3=Shoulderpads of Assassination", "=ds=#a2#", "", "9.09%" };
    { 18, 27838, "", "=q3=Incanter's Trousers", "=ds=#a1#", "", "9.09%" };
    { 19, 27875, "", "=q3=Hallowed Trousers", "=ds=#a1#", "", "9.09%" };
    { 20, 27925, "", "=q3=Ravenclaw Band", "=ds=#s13#", "", "9.09%" };
    { 21, 27936, "", "=q3=Greaves of Desolation", "=ds=#a3#", "", "9.09%" };
    { 22, 27946, "", "=q3=Avian Cloak of Feathers", "=ds=#a1#", "", "9.09%" };
    { 23, 27948, "", "=q3=Trousers of Oblivion", "=ds=#a1#", "", "9.09%" };
    { 24, 27980, "", "=q3=Terokk's Nightmace", "=ds=#w6#", "", "9.09%" };
    { 25, 27981, "", "=q3=Sethekk Oracle Cloak", "=ds=#a1#", "", "9.09%" };
    { 26, 27985, "", "=q3=Deathforge Girdle", "=ds=#a4#", "", "9.09%" };
    { 27, 27986, "", "=q3=Crow Wing Reaper", "=ds=#w1#", "", "9.09%" };
	};

	AtlasLoot_Data["BTAkama"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Shade of Akama", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Shade of Akama", "=q5=ONE WILL DROP"};
    { 5, 32263, "", "=q4=Praetorian's Legguards", "=ds=#a4#", "", "14.3%" };
    { 6, 32264, "", "=q4=Shoulders of the Hidden Predator", "=ds=#a3#", "", "14.3%" };
    { 7, 32265, "", "=q4=Shadow-walker's Cord", "=ds=#a2#", "", "14.3%" };
    { 8, 32266, "", "=q4=Ring of Deceitful Intent", "=ds=#s13#", "", "14.3%" };
    { 9, 32268, "", "=q4=Myrmidon's Treads", "=ds=#a4#", "", "14.3%" };
    { 10, 32276, "", "=q4=Flashfire Girdle", "=ds=#a3#", "", "14.3%" };
    { 11, 32513, "", "=q4=Wristbands of Divine Influence", "=ds=#a1#", "", "14.3%" };
    { 16, 0, "AO_Unknown", "=q6=Shade of Akama", "=q5=ONE WILL DROP"};
    { 17, 32270, "", "=q4=Focused Mana Bindings", "=ds=#a1#", "", "14.3%" };
    { 18, 32271, "", "=q4=Kilt of Immortal Nature", "=ds=#a2#", "", "14.3%" };
    { 19, 32273, "", "=q4=Amice of Brilliant Light", "=ds=#a1#", "", "14.3%" };
    { 20, 32275, "", "=q4=Spiritwalker Gauntlets", "=ds=#a3#", "", "14.3%" };
    { 21, 32278, "", "=q4=Grips of Silent Justice", "=ds=#a4#", "", "14.3%" };
    { 22, 32279, "", "=q4=The Seeker's Wristguards", "=ds=#a4#", "", "14.3%" };
    { 23, 32361, "", "=q4=Blind-Seers Icon", "=ds=#s15#", "", "14.3%" };
	};

	AtlasLoot_Data["BTGorefiend"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Teron Gorefiend", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Teron Gorefiend", "=q5=ONE WILL DROP"};
    { 5, 32326, "", "=q4=Twisted Blades of Zarak", "=ds=#w11#", "", "16.7%" };
    { 6, 32328, "", "=q4=Botanist's Gloves of Growth", "=ds=#a2#", "", "16.7%" };
    { 7, 32329, "", "=q4=Cowl of Benevolence", "=ds=#a1#", "", "16.7%" };
    { 8, 32330, "", "=q4=Totem of Ancestral Guidance", "", "", "16.7%" };
    { 9, 32348, "", "=q4=Soul Cleaver", "=ds=#w1#", "", "16.7%" };
    { 10, 32512, "", "=q4=Girdle of Lordaeron's Fallen", "=ds=#a4#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Teron Gorefiend", "=q5=ONE WILL DROP"};
    { 17, 32280, "", "=q4=Gauntlets of Enforcement", "=ds=#a4#", "", "16.7%" };
    { 18, 32323, "", "=q4=Shadowmoon Destroyer's Drape", "=ds=#a1#", "", "16.7%" };
    { 19, 32324, "", "=q4=Insidious Bands", "=ds=#a2#", "", "16.7%" };
    { 20, 32325, "", "=q4=Rifle of the Stoic Guardian", "=ds=#w5#", "", "16.7%" };
    { 21, 32327, "", "=q4=Robe of the Shadow Council", "=ds=#a1#", "", "16.7%" };
    { 22, 32510, "", "=q4=Softstep Boots of Tracking", "=ds=#a3#", "", "16.7%" };
	};

	AtlasLoot_Data["BTBloodboil"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Gurtogg Bloodboil", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Gurtogg Bloodboil", "=q5=ONE WILL DROP"};
    { 5, 32338, "", "=q4=Blood-cursed Shoulderpads", "=ds=#a1#", "", "14.3%" };
    { 6, 32339, "", "=q4=Belt of Primal Majesty", "=ds=#a2#", "", "14.3%" };
    { 7, 32340, "", "=q4=Garments of Temperance", "=ds=#a1#", "", "14.3%" };
    { 8, 32341, "", "=q4=Leggings of Divine Retribution", "=ds=#a4#", "", "14.3%" };
    { 9, 32342, "", "=q4=Girdle of Mighty Resolve", "=ds=#a4#", "", "14.3%" };
    { 10, 32343, "", "=q4=Wand of Prismatic Focus", "=ds=#w12#", "", "14.3%" };
    { 11, 32344, "", "=q4=Staff of Immaculate Recovery", "=ds=#w9#", "", "14.3%" };
    { 16, 0, "AO_Unknown", "=q6=Gurtogg Bloodboil", "=q5=ONE WILL DROP"};
    { 17, 32269, "", "=q4=Messenger of Fate", "=ds=#w4#", "", "16.7%" };
    { 18, 32333, "", "=q4=Girdle of Stability", "=ds=#a4#", "", "16.7%" };
    { 19, 32334, "", "=q4=Vest of Mounting Assault", "=ds=#a3#", "", "16.7%" };
    { 20, 32335, "", "=q4=Unstoppable Aggressor's Ring", "=ds=#s13#", "", "16.7%" };
    { 21, 32337, "", "=q4=Shroud of Forgiveness", "=ds=#a1#", "", "16.7%" };
    { 22, 32501, "", "=q4=Shadowmoon Insignia", "=ds=#s14#", "", "16.7%" };
	};

	AtlasLoot_Data["BTEssencofSouls"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Essence of Anger", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 16, 0, "AO_Unknown", "=q6=Essence of Anger", "=q5=ONE WILL DROP"};
    { 17, 32332, "", "=q4=Torch of the Damned", "=ds=#w6#", "", "7.69%" };
    { 18, 32345, "", "=q4=Dreadboots of the Legion", "=ds=#a4#", "", "7.69%" };
    { 19, 32346, "", "=q4=Boneweave Girdle", "=ds=#a3#", "", "7.69%" };
    { 20, 32347, "", "=q4=Grips of Damnation", "=ds=#a2#", "", "7.69%" };
    { 21, 32349, "", "=q4=Translucent Spellthread Necklace", "=ds=#s2#", "", "7.69%" };
    { 22, 32350, "", "=q4=Touch of Inspiration", "=ds=#s15#", "", "7.69%" };
    { 23, 32351, "", "=q4=Elunite Empowered Bracers", "=ds=#a2#", "", "7.69%" };
    { 24, 32352, "", "=q4=Naturewarden's Treads", "=ds=#a2#", "", "7.69%" };
    { 25, 32353, "", "=q4=Gloves of Unfailing Faith", "=ds=#a1#", "", "7.69%" };
    { 26, 32354, "", "=q4=Crown of Empowered Fate", "=ds=#a4#", "", "7.69%" };
    { 27, 32362, "", "=q4=Pendant of Titans", "=ds=#s2#", "", "7.69%" };
    { 28, 32363, "", "=q4=Naaru-Blessed Life Rod", "=ds=#w12#", "", "7.69%" };
    { 29, 32517, "", "=q4=The Wavemender's Mantle", "=ds=#a3#", "", "7.69%" };
	};

	AtlasLoot_Data["BTShahraz"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Mother Shahraz", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Mother Shahraz", "=q5=ONE WILL DROP"};
    { 5, 32365, "", "=q4=Heartshatter Breastplate", "=ds=#a4#", "", "16.7%" };
    { 6, 32366, "", "=q4=Shadowmaster's Boots", "=ds=#a2#", "", "16.7%" };
    { 7, 32367, "", "=q4=Leggings of Devastation", "=ds=#a1#", "", "16.7%" };
    { 8, 32368, "", "=q4=Tome of the Lightbringer", "", "", "16.7%" };
    { 9, 32369, "", "=q4=Blade of Savagery", "=ds=#w10#", "", "16.7%" };
    { 10, 32370, "", "=q4=Nadina's Pendant of Purity", "=ds=#s2#", "", "16.7%" };
    { 12, 0, "AO_Unknown", "=q6=Mother Shahraz", "=q5=ONE WILL DROP"};
    { 13, 31101, "", "=q4=Pauldrons of the Forgotten Conqueror", "=ds=#e10#", "", "33.3%" };
    { 14, 31102, "", "=q4=Pauldrons of the Forgotten Vanquisher", "=ds=#e10#", "", "33.3%" };
    { 15, 31103, "", "=q4=Pauldrons of the Forgotten Protector", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["BTCouncil"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=High Nethermancer Zerevor", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=High Nethermancer Zerevor", "=q5=ONE WILL DROP"};
    { 5, 32331, "", "=q4=Cloak of the Illidari Council", "=ds=#a1#", "", "16.7%" };
    { 6, 32373, "", "=q4=Helm of the Illidari Shatterer", "=ds=#a4#", "", "16.7%" };
    { 7, 32376, "", "=q4=Forest Prowler's Helm", "=ds=#a3#", "", "16.7%" };
    { 8, 32505, "", "=q4=Madness of the Betrayer", "=ds=#s14#", "", "16.7%" };
    { 9, 32518, "", "=q4=Veil of Turning Leaves", "=ds=#a2#", "", "16.7%" };
    { 10, 32519, "", "=q4=Belt of Divine Guidance", "=ds=#a1#", "", "16.7%" };
    { 12, 0, "AO_Unknown", "=q6=High Nethermancer Zerevor", "=q5=ONE WILL DROP"};
    { 13, 31098, "", "=q4=Leggings of the Forgotten Conqueror", "=ds=#e10#", "", "33.3%" };
    { 14, 31099, "", "=q4=Leggings of the Forgotten Vanquisher", "=ds=#e10#", "", "33.3%" };
    { 15, 31100, "", "=q4=Leggings of the Forgotten Protector", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["BTIllidanStormrage"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Illidan Stormrage", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Illidan Stormrage", "=q5=CHANCE TO DROP"};
    { 5, 32837, "", "=q5=Warglaive of Azzinoth", "=ds=#w10#", "", "4.00%" };
    { 6, 32838, "", "=q5=Warglaive of Azzinoth", "=ds=#w10#", "", "4.00%" };
    { 8, 0, "AO_Unknown", "=q6=Illidan Stormrage", "=q5=ONE WILL DROP"};
    { 9, 32235, "", "=q4=Cursed Vision of Sargeras", "=ds=#a2#", "", "16.7%" };
    { 10, 32336, "", "=q4=Black Bow of the Betrayer", "=ds=#w2#", "", "16.7%" };
    { 11, 32375, "", "=q4=Bulwark of Azzinoth", "=ds=#w8#", "", "16.7%" };
    { 12, 32471, "", "=q4=Shard of Azzinoth", "=ds=#w4#", "", "16.7%" };
    { 13, 32497, "", "=q4=Stormrage Signet Ring", "=ds=#s13#", "", "16.7%" };
    { 14, 32521, "", "=q4=Faceplate of the Impenetrable", "=ds=#a4#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Illidan Stormrage", "=q5=ONE WILL DROP"};
    { 17, 32374, "", "=q4=Zhar'doom, Greatstaff of the Devourer", "=ds=#w9#", "", "16.7%" };
    { 18, 32483, "", "=q4=The Skull of Gul'dan", "=ds=#s14#", "", "16.7%" };
    { 19, 32496, "", "=q4=Memento of Tyrande", "=ds=#s14#", "", "16.7%" };
    { 20, 32500, "", "=q4=Crystal Spire of Karabor", "=ds=#w6#", "", "16.7%" };
    { 21, 32524, "", "=q4=Shroud of the Highborne", "=ds=#a1#", "", "16.7%" };
    { 22, 32525, "", "=q4=Cowl of the Illidari High Lord", "=ds=#a1#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Illidan Stormrage", "=q5=ONE WILL DROP"};
    { 25, 31089, "", "=q4=Chestguard of the Forgotten Conqueror", "=ds=#e10#", "", "33.3%" };
    { 26, 31090, "", "=q4=Chestguard of the Forgotten Vanquisher", "=ds=#e10#", "", "33.3%" };
    { 27, 31091, "", "=q4=Chestguard of the Forgotten Protector", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["BTTrash"] = {
		{ 1, 32590, "", "=q4=Nethervoid Cloak", "=ds=#s4#", "", "1%"};
		{ 2, 34012, "", "=q4=Shroud of the Final Stand", "=ds=#s4#", "", "1%"};
		{ 3, 32609, "", "=q4=Boots of the Divine Light", "=ds=#s12#, #a1#", "", "1%"};
		{ 4, 32593, "", "=q4=Treads of the Den Mother", "=ds=#s12#, #a2#", "", "1%"};
		{ 5, 32592, "", "=q4=Chestguard of Relentless Storms", "=ds=#s5#, #a3#", "", "1%"};
		{ 6, 32608, "", "=q4=Pillager's Gauntlets", "=ds=#s9#, #a4#", "", "1%"};
		{ 7, 32606, "", "=q4=Girdle of the Lightbearer", "=ds=#s10#, #a4#", "", "1%"};
		{ 8, 32591, "", "=q4=Choker of Serrated Blades", "=ds=#s2#", "", "1%"};
		{ 9, 32589, "", "=q4=Hellfire-Encased Pendant", "=ds=#s2#", "", "1%"};
		{ 10, 32526, "", "=q4=Band of Devastation", "=ds=#s13#", "", "1%"};
		{ 11, 32528, "", "=q4=Blessed Band of Karabor", "=ds=#s13#", "", "1%"};
		{ 12, 32527, "", "=q4=Ring of Ancient Knowledge", "=ds=#s13#", "", "2%"};
		{ 16, 34009, "", "=q4=Hammer of Judgement", "=ds=#h3#, #w6#", "", "1%"};
		{ 17, 32943, "", "=q4=Swiftsteel Bludgeon", "=ds=#h1#, #w6#", "", "2%"};
		{ 18, 34011, "", "=q4=Illidari Runeshield", "=ds=#w8#", "", "1%"};
		{ 20, 32228, "", "=q4=Empyrean Sapphire", "=ds=#e7#", "", "12%"};
		{ 21, 32231, "", "=q4=Pyrestone", "=ds=#e7#", "", "8%"};
		{ 22, 32229, "", "=q4=Lionseye", "=ds=#e7#", "", "6%"};
		{ 23, 32249, "", "=q4=Seaspray Emerald", "=ds=#e7#", "", "9%"};
		{ 24, 32230, "", "=q4=Shadowsong Amethyst", "=ds=#e7#", "", "6%"};
		{ 25, 32227, "", "=q4=Crimson Spinel", "=ds=#e7#", "", "8%"};
		{ 27, 32428, "", "=q3=Heart of Darkness", "=ds=#e8#", "", "16%"};
		{ 28, 32897, "", "=q2=Mark of the Illidari", "=ds=#m20#", "", "27%"};
	};

	AtlasLoot_Data["BTPatterns"] = {
		{ 1, 32738, "", "=q4=Plans: Dawnsteel Bracers", "=ds=#p2# (375)"};
		{ 2, 32739, "", "=q4=Plans: Dawnsteel Shoulders", "=ds=#p2# (375)"};
		{ 3, 32736, "", "=q4=Plans: Swiftsteel Bracers", "=ds=#p2# (375)"};
		{ 4, 32737, "", "=q4=Plans: Swiftsteel Shoulders", "=ds=#p2# (375)"};
		{ 5, 32748, "", "=q4=Pattern: Bindings of Lightning Reflexes", "=ds=#p7# (375)"};
		{ 6, 32744, "", "=q4=Pattern: Bracers of Renewed Life", "=ds=#p7# (375)"};
		{ 7, 32750, "", "=q4=Pattern: Living Earth Bindings", "=ds=#p7# (375)"};
		{ 8, 32751, "", "=q4=Pattern: Living Earth Shoulders", "=ds=#p7# (375)"};
		{ 9, 32749, "", "=q4=Pattern: Shoulders of Lightning Reflexes", "=ds=#p7# (375)"};
		{ 10, 32745, "", "=q4=Pattern: Shoulderpads of Renewed Life", "=ds=#p7# (375)"};
		{ 11, 32746, "", "=q4=Pattern: Swiftstrike Bracers", "=ds=#p7# (375)"};
		{ 12, 32747, "", "=q4=Pattern: Swiftstrike Shoulders", "=ds=#p7# (375)"};
		{ 16, 32754, "", "=q4=Pattern: Bracers of Nimble Thought", "=ds=#p8# (375)"};
		{ 17, 32755, "", "=q4=Pattern: Mantle of Nimble Thought", "=ds=#p8# (375)"};
		{ 18, 32753, "", "=q4=Pattern: Swiftheal Mantle", "=ds=#p8# (375)"};
		{ 19, 32752, "", "=q4=Pattern: Swiftheal Wraps", "=ds=#p8# (375)"};
	};

		------------------------------------------------
		--- Caverns of Time: Old Hillsbrad Foothills ---
		------------------------------------------------

	AtlasLoot_Data["CoTHillsbradDrake"] = {
    { 1, 0, "AO_Unknown", "=q6=Lieutenant Drake", "=q5=ONE WILL DROP"};
    { 2, 27417, "", "=q3=Ravenwing Pauldrons", "=ds=#a2#", "", "20.0%" };
    { 3, 27418, "", "=q3=Stormreaver Shadow-Kilt", "=ds=#a1#", "", "20.0%" };
    { 4, 27420, "", "=q3=Uther's Ceremonial Warboots", "=ds=#a4#", "", "20.0%" };
    { 5, 27423, "", "=q3=Cloak of Impulsiveness", "=ds=#a1#", "", "20.0%" };
    { 6, 27436, "", "=q3=Iron Band of the Unbreakable", "=ds=#s13#", "", "20.0%" };
	};

	AtlasLoot_Data["CoTHillsbradDrakeHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Lieutenant Drake (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Lieutenant Drake (1)", "=q5=ONE WILL DROP"};
    { 5, 28210, "", "=q3=Bloodskull Destroyer", "=ds=#w6#", "", "16.7%" };
    { 6, 28211, "", "=q3=Lieutenant's Signet of Lordaeron", "=ds=#s13#", "", "16.7%" };
    { 7, 28212, "", "=q3=Aran's Sorcerous Slacks", "=ds=#a1#", "", "16.7%" };
    { 8, 28213, "", "=q3=Lordaeron Medical Guide", "=ds=#s15#", "", "16.7%" };
    { 9, 28214, "", "=q3=Grips of the Lunar Eclipse", "=ds=#a2#", "", "16.7%" };
    { 10, 28215, "", "=q3=Mok'Nathal Mask of Battle", "=ds=#a3#", "", "16.7%" };
	};

	AtlasLoot_Data["CoTHillsbradHunter"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Epoch Hunter", "=q5=ALL WILL DROP"};
    { 2, 901736, "", "=q1=Infinite Drake Head", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Epoch Hunter", "=q5=ONE WILL DROP"};
    { 5, 27431, "", "=q3=Time-Shifted Dagger", "=ds=#w4#", "", "20.0%" };
    { 6, 27432, "", "=q3=Broxigar's Ring of Valor", "=ds=#s13#", "", "20.0%" };
    { 7, 27433, "", "=q3=Pauldrons of Sufferance", "=ds=#a1#", "", "20.0%" };
    { 8, 27434, "", "=q3=Mantle of Perenolde", "=ds=#a2#", "", "20.0%" };
    { 9, 27440, "", "=q3=Diamond Prism of Recurrence", "=ds=#s2#", "", "20.0%" };
	};

	AtlasLoot_Data["CoTHillsbradHunterHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Epoch Hunter (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 33847, "", "=q1=Epoch Hunter's Head", "=ds=#m3#", "", "100%" };
    { 4, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 6, 0, "RoM_stellar_dice", "=q6=Epoch Hunter (1)", "=q5=CHANCE TO DROP"};
    { 7, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 8, 24173, "", "=q4=Design: Circlet of Arcane Might", "=ds=#e2#", "", "10.0%" };
    { 10, 0, "AO_Unknown", "=q6=Epoch Hunter (1)", "=q5=ONE WILL DROP"};
    { 11, 28222, "", "=q3=Reaver of the Infinites", "=ds=#w1#", "", "16.7%" };
    { 12, 28223, "", "=q3=Arcanist's Stone", "=ds=#s14#", "", "16.7%" };
    { 13, 28225, "", "=q3=Doomplate Warhelm", "=ds=#a4#", "", "16.7%" };
    { 14, 28226, "", "=q3=Timeslicer", "=ds=#w4#", "", "16.7%" };
    { 15, 28227, "", "=q3=Sparking Arcanite Ring", "=ds=#s13#", "", "16.7%" };
    { 16, 28233, "", "=q3=Necklace of Resplendent Hope", "=ds=#s2#", "", "16.7%" };
    { 18, 0, "AO_Unknown", "=q6=Epoch Hunter (1)", "=q5=ONE WILL DROP"};
    { 19, 29246, "", "=q4=Nightfall Wristguards", "=ds=#a2#", "", "25.0%" };
    { 20, 29250, "", "=q4=Cord of Sanctification", "=ds=#a1#", "", "25.0%" };
    { 21, 30534, "", "=q4=Wyrmscale Greaves", "=ds=#a3#", "", "25.0%" };
    { 22, 30536, "", "=q4=Greaves of the Martyr", "=ds=#a4#", "", "25.0%" };
    { 24, 0, "AO_Unknown", "=q6=Epoch Hunter (1)", "=q5=ONE WILL DROP"};
    { 25, 27904, "", "=q3=Resounding Ring of Glory", "=ds=#s13#", "", "16.7%" };
    { 26, 27911, "", "=q3=Epoch's Whispering Cinch", "=ds=#a2#", "", "16.7%" };
    { 27, 28191, "", "=q3=Mana-Etched Vestments", "=ds=#a1#", "", "16.7%" };
    { 28, 28224, "", "=q3=Wastewalker Helm", "=ds=#a2#", "", "16.7%" };
    { 29, 28344, "", "=q3=Wyrmfury Pauldrons", "=ds=#a3#", "", "16.7%" };
    { 30, 28401, "", "=q3=Hauberk of Desolation", "=ds=#a3#", "", "16.7%" };
	};

	AtlasLoot_Data["CoTHillsbradSkarloc"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Captain Skarloc", "=q5=CHANCE TO DROP"};
    { 2, 22927, "", "=q2=Recipe: Ironshield Potion", "=ds=#e2#", "", "10.0%" };
    { 4, 0, "AO_Unknown", "=q6=Captain Skarloc", "=q5=ONE WILL DROP"};
    { 5, 27424, "", "=q3=Amani Venom-Axe", "=ds=#w1#", "", "20.0%" };
    { 6, 27426, "", "=q3=Northshire Battlemace", "=ds=#w6#", "", "20.0%" };
    { 7, 27427, "", "=q3=Durotan's Battle Harness", "=ds=#a4#", "", "20.0%" };
    { 8, 27428, "", "=q3=Stormfront Gauntlets", "=ds=#a3#", "", "20.0%" };
    { 9, 27430, "", "=q3=Scaled Greaves of Patience", "=ds=#a3#", "", "20.0%" };
	};

	AtlasLoot_Data["CoTHillsbradSkarlocHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Captain Skarloc (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Captain Skarloc (1)", "=q5=CHANCE TO DROP"};
    { 5, 22927, "", "=q2=Recipe: Ironshield Potion", "=ds=#e2#", "", "10.0%" };
    { 7, 0, "AO_Unknown", "=q6=Captain Skarloc (1)", "=q5=ONE WILL DROP"};
    { 8, 28216, "", "=q3=Dathrohan's Ceremonial Hammer", "=ds=#w6#", "", "16.7%" };
    { 9, 28217, "", "=q3=Tarren Mill Vitality Locket", "=ds=#s2#", "", "16.7%" };
    { 10, 28218, "", "=q3=Pontiff's Pantaloons of Prophecy", "=ds=#a1#", "", "16.7%" };
    { 11, 28219, "", "=q3=Emerald-Scale Greaves", "=ds=#a3#", "", "16.7%" };
    { 12, 28220, "", "=q3=Moon-Crown Antlers", "=ds=#a2#", "", "16.7%" };
    { 13, 28221, "", "=q3=Boots of the Watchful Heart", "=ds=#a4#", "", "16.7%" };
	};

	AtlasLoot_Data["CoTMorassDejaHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Chrono Lord Deja (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Chrono Lord Deja (1)", "=q5=CHANCE TO DROP"};
    { 5, 29675, "", "=q2=Pattern: Arcane Armor Kit", "=ds=#e2#", "", "10.0%" };
    { 7, 0, "AO_Unknown", "=q6=Chrono Lord Deja (1)", "=q5=ONE WILL DROP"};
    { 8, 27987, "", "=q3=Melmorta's Twilight Longbow", "=ds=#w2#", "", "16.7%" };
    { 9, 27988, "", "=q3=Burnoose of Shifting Ages", "=ds=#a1#", "", "16.7%" };
    { 10, 27993, "", "=q3=Mask of Inner Fire", "=ds=#a3#", "", "16.7%" };
    { 11, 27994, "", "=q3=Mantle of Three Terrors", "=ds=#a1#", "", "16.7%" };
    { 12, 27995, "", "=q3=Sun-Gilded Shouldercaps", "=ds=#a2#", "", "16.7%" };
    { 13, 27996, "", "=q3=Ring of Spiritual Precision", "=ds=#s13#", "", "16.7%" };
	};

	AtlasLoot_Data["CoTMorassAeonus"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Aeonus", "=q5=ALL WILL DROP"};
    { 2, 901741, "", "=q1=Infinite Membrane", "=ds=#m3#", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Aeonus", "=q5=CHANCE TO DROP"};
    { 5, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "5.00%" };
    { 7, 0, "AO_Unknown", "=q6=Aeonus", "=q5=ONE WILL DROP"};
    { 8, 27509, "", "=q3=Handgrips of Assassination", "=ds=#a2#", "", "16.7%" };
    { 9, 27839, "", "=q3=Legplates of the Righteous", "=ds=#a4#", "", "16.7%" };
    { 10, 27873, "", "=q3=Moonglade Pants", "=ds=#a2#", "", "16.7%" };
    { 11, 27977, "", "=q3=Legplates of the Bold", "=ds=#a4#", "", "16.7%" };
    { 12, 28194, "", "=q3=Primal Surge Bracers", "=ds=#a3#", "", "16.7%" };
    { 13, 28207, "", "=q3=Pauldrons of the Crimson Flight", "=ds=#a4#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Aeonus", "=q5=ONE WILL DROP"};
    { 17, 28188, "", "=q3=Bloodfire Greatstaff", "=ds=#w9#", "", "16.7%" };
    { 18, 28189, "", "=q3=Latro's Shifting Sword", "=ds=#w10#", "", "16.7%" };
    { 19, 28190, "", "=q3=Scarab of the Infinite Cycle", "=ds=#s14#", "", "16.7%" };
    { 20, 28192, "", "=q3=Helm of Desolation", "=ds=#a3#", "", "16.7%" };
    { 21, 28193, "", "=q3=Mana-Etched Crown", "=ds=#a1#", "", "16.7%" };
    { 22, 28206, "", "=q3=Cowl of the Guiltless", "=ds=#a2#", "", "16.7%" };
	};

	AtlasLoot_Data["CoTMorassAeonusHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Aeonus (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 33858, "", "=q1=Aeonus's Hourglass", "=ds=#m3#", "", "100%" };
    { 4, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 6, 0, "RoM_stellar_dice", "=q6=Aeonus (1)", "=q5=CHANCE TO DROP"};
    { 7, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "40.0%" };
    { 9, 0, "AO_Unknown", "=q6=Aeonus (1)", "=q5=ONE WILL DROP"};
    { 10, 29247, "", "=q4=Girdle of the Deathdealer", "=ds=#a2#", "", "25.0%" };
    { 11, 29253, "", "=q4=Girdle of Valorous Deeds", "=ds=#a4#", "", "25.0%" };
    { 12, 29356, "", "=q4=Quantum Blade", "=ds=#w10#", "", "25.0%" };
    { 13, 30531, "", "=q4=Breeches of the Occultist", "=ds=#a1#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Aeonus (1)", "=q5=ONE WILL DROP"};
    { 17, 27509, "", "=q3=Handgrips of Assassination", "=ds=#a2#", "", "16.7%" };
    { 18, 27839, "", "=q3=Legplates of the Righteous", "=ds=#a4#", "", "16.7%" };
    { 19, 27873, "", "=q3=Moonglade Pants", "=ds=#a2#", "", "16.7%" };
    { 20, 27977, "", "=q3=Legplates of the Bold", "=ds=#a4#", "", "16.7%" };
    { 21, 28194, "", "=q3=Primal Surge Bracers", "=ds=#a3#", "", "16.7%" };
    { 22, 28207, "", "=q3=Pauldrons of the Crimson Flight", "=ds=#a4#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Aeonus (1)", "=q5=ONE WILL DROP"};
    { 25, 28188, "", "=q3=Bloodfire Greatstaff", "=ds=#w9#", "", "16.7%" };
    { 26, 28189, "", "=q3=Latro's Shifting Sword", "=ds=#w10#", "", "16.7%" };
    { 27, 28190, "", "=q3=Scarab of the Infinite Cycle", "=ds=#s14#", "", "16.7%" };
    { 28, 28192, "", "=q3=Helm of Desolation", "=ds=#a3#", "", "16.7%" };
    { 29, 28193, "", "=q3=Mana-Etched Crown", "=ds=#a1#", "", "16.7%" };
    { 30, 28206, "", "=q3=Cowl of the Guiltless", "=ds=#a2#", "", "16.7%" };
	};

	AtlasLoot_Data["CoTMorassDeja"] = {
    { 1, 0, "AO_Unknown", "=q6=Chrono Lord Deja", "=q5=ONE WILL DROP"};
    { 2, 27987, "", "=q3=Melmorta's Twilight Longbow", "=ds=#w2#", "", "16.7%" };
    { 3, 27988, "", "=q3=Burnoose of Shifting Ages", "=ds=#a1#", "", "16.7%" };
    { 4, 27993, "", "=q3=Mask of Inner Fire", "=ds=#a3#", "", "16.7%" };
    { 5, 27994, "", "=q3=Mantle of Three Terrors", "=ds=#a1#", "", "16.7%" };
    { 6, 27995, "", "=q3=Sun-Gilded Shouldercaps", "=ds=#a2#", "", "16.7%" };
    { 7, 27996, "", "=q3=Ring of Spiritual Precision", "=ds=#s13#", "", "16.7%" };
	};

	AtlasLoot_Data["CoTMorassTemporus"] = {
    { 1, 0, "AO_Unknown", "=q6=Temporus", "=q5=ONE WILL DROP"};
    { 2, 28033, "", "=q3=Epoch-Mender", "=ds=#w9#", "", "16.7%" };
    { 3, 28034, "", "=q3=Hourglass of the Unraveller", "=ds=#s14#", "", "16.7%" };
    { 4, 28184, "", "=q3=Millennium Blade", "=ds=#w10#", "", "16.7%" };
    { 5, 28185, "", "=q3=Khadgar's Kilt of Abjuration", "=ds=#a1#", "", "16.7%" };
    { 6, 28186, "", "=q3=Laughing Skull Battle-Harness", "=ds=#a3#", "", "16.7%" };
    { 7, 28187, "", "=q3=Star-Heart Lamp", "=ds=#s15#", "", "16.7%" };
	};

	AtlasLoot_Data["CoTMorassTemporusHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Temporus (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Temporus (1)", "=q5=ONE WILL DROP"};
    { 5, 28033, "", "=q3=Epoch-Mender", "=ds=#w9#", "", "16.7%" };
    { 6, 28034, "", "=q3=Hourglass of the Unraveller", "=ds=#s14#", "", "16.7%" };
    { 7, 28184, "", "=q3=Millennium Blade", "=ds=#w10#", "", "16.7%" };
    { 8, 28185, "", "=q3=Khadgar's Kilt of Abjuration", "=ds=#a1#", "", "16.7%" };
    { 9, 28186, "", "=q3=Laughing Skull Battle-Harness", "=ds=#a3#", "", "16.7%" };
    { 10, 28187, "", "=q3=Star-Heart Lamp", "=ds=#s15#", "", "16.7%" };
	};

	AtlasLoot_Data["MountHyjalArchimonde"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Archimonde", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Archimonde", "=q5=ONE WILL DROP"};
    { 5, 30902, "", "=q4=Cataclysm's Edge", "=ds=#w10#", "", "16.7%" };
    { 6, 30903, "", "=q4=Legguards of Endless Rage", "=ds=#a4#", "", "16.7%" };
    { 7, 30904, "", "=q4=Savior's Grasp", "=ds=#a4#", "", "16.7%" };
    { 8, 30905, "", "=q4=Midnight Chestguard", "=ds=#a2#", "", "16.7%" };
    { 9, 30906, "", "=q4=Bristleblitz Striker", "=ds=#w2#", "", "16.7%" };
    { 10, 30907, "", "=q4=Mail of Fevered Pursuit", "=ds=#a3#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Archimonde", "=q5=ONE WILL DROP"};
    { 17, 30908, "", "=q4=Apostle of Argus", "=ds=#w9#", "", "16.7%" };
    { 18, 30909, "", "=q4=Antonidas's Aegis of Rapt Concentration", "=ds=#w8#", "", "16.7%" };
    { 19, 30910, "", "=q4=Tempest of Chaos", "=ds=#w10#", "", "16.7%" };
    { 20, 30911, "", "=q4=Scepter of Purification", "=ds=#s15#", "", "16.7%" };
    { 21, 30912, "", "=q4=Leggings of Eternity", "=ds=#a1#", "", "16.7%" };
    { 22, 30913, "", "=q4=Robes of Rhonin", "=ds=#a1#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Archimonde", "=q5=ONE WILL DROP"};
    { 25, 31095, "", "=q4=Helm of the Forgotten Protector", "=ds=#e10#", "", "33.3%" };
    { 26, 31096, "", "=q4=Helm of the Forgotten Vanquisher", "=ds=#e10#", "", "33.3%" };
    { 27, 31097, "", "=q4=Helm of the Forgotten Conqueror", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["MountHyjalTrash"] = {
		{ 1, 32590, "", "=q4=Nethervoid Cloak", "=ds=#s4#", "", "1%"};
		{ 2, 34010, "", "=q4=Pepe's Shroud of Pacification", "=ds=#s4#", "", "1%"};
		{ 3, 32609, "", "=q4=Boots of the Divine Light", "=ds=#s12#, #a1#", "", "1%"};
		{ 4, 32592, "", "=q4=Chestguard of Relentless Storms", "=ds=#s5#, #a3#", "", "1%"};
		{ 5, 32591, "", "=q4=Choker of Serrated Blades", "=ds=#s2#", "", "1%"};
		{ 6, 32589, "", "=q4=Hellfire-Encased Pendant", "=ds=#s2#", "", "1%"};
		{ 7, 34009, "", "=q4=Hammer of Judgement", "=ds=#h3#, #w6#", "", "1%"};
		{ 8, 32946, "", "=q4=Claw of Molten Fury", "=ds=#h3#, #w13#", "", "0.46%"};
		{ 9, 32945, "", "=q4=Fist of Molten Fury", "=ds=#h4#, #w13#", "", "0.42%"};
		{ 11, 32428, "", "=q3=Heart of Darkness", "=ds=#e8#", "", "16%"};
		{ 12, 32897, "", "=q2=Mark of the Illidari", "=ds=#m20#", "", "27%"};
		{ 16, 32285, "", "=q4=Design: Flashing Crimson Spinel", "=ds=#p12# (375)", "", "4%"};
		{ 17, 32296, "", "=q4=Design: Great Lionseye", "=ds=#p12# (375)", "", "3%"};
		{ 18, 32303, "", "=q4=Design: Inscribed Pyrestone", "=ds=#p12# (375)", "", "3%"};
		{ 19, 32295, "", "=q4=Design: Mystic Lionseye", "=ds=#p12# (375)", "", "4%"};
		{ 20, 32298, "", "=q4=Design: Shifting Shadowsong Amethyst", "=ds=#p12# (375)", "", "4%"};
		{ 21, 32297, "", "=q4=Design: Sovereign Shadowsong Amethyst", "=ds=#p12# (375)", "", "4%"};
		{ 22, 32289, "", "=q4=Design: Stormy Empyrean Sapphire", "=ds=#p12# (375)", "", "4%"};
		{ 23, 32307, "", "=q4=Design: Veiled Pyrestone", "=ds=#p12# (375)", "", "3%"};
	};

	AtlasLoot_Data["MountHyjalWinterchill"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Rage Winterchill", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 32459, "", "=q1=Time-Phased Phylactery", "=ds=#m3#", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Rage Winterchill", "=q5=ONE WILL DROP"};
    { 6, 30868, "", "=q4=Rejuvenating Bracers", "=ds=#a2#", "", "16.7%" };
    { 7, 30869, "", "=q4=Howling Wind Bracers", "=ds=#a3#", "", "16.7%" };
    { 8, 30870, "", "=q4=Cuffs of Devastation", "=ds=#a1#", "", "16.7%" };
    { 9, 30871, "", "=q4=Bracers of Martyrdom", "=ds=#a1#", "", "16.7%" };
    { 10, 30872, "", "=q4=Chronicle of Dark Secrets", "=ds=#s15#", "", "16.7%" };
    { 11, 30873, "", "=q4=Stillwater Boots", "=ds=#a3#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Rage Winterchill", "=q5=ONE WILL DROP"};
    { 17, 30861, "", "=q4=Furious Shackles", "=ds=#a4#", "", "16.7%" };
    { 18, 30862, "", "=q4=Blessed Adamantite Bracers", "=ds=#a4#", "", "16.7%" };
    { 19, 30863, "", "=q4=Deadly Cuffs", "=ds=#a2#", "", "16.7%" };
    { 20, 30864, "", "=q4=Bracers of the Pathfinder", "=ds=#a3#", "", "16.7%" };
    { 21, 30865, "", "=q4=Tracker's Blade", "=ds=#w4#", "", "16.7%" };
    { 22, 30866, "", "=q4=Blood-stained Pauldrons", "=ds=#a4#", "", "16.7%" };
	};

	AtlasLoot_Data["MountHyjalAnetheron"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Anetheron", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Anetheron", "=q5=ONE WILL DROP"};
    { 5, 30874, "", "=q4=The Unbreakable Will", "=ds=#w10#", "", "16.7%" };
    { 6, 30883, "", "=q4=Pillar of Ferocity", "=ds=#w9#", "", "16.7%" };
    { 7, 30884, "", "=q4=Hatefury Mantle", "=ds=#a1#", "", "16.7%" };
    { 8, 30885, "", "=q4=Archbishop's Slippers", "=ds=#a1#", "", "16.7%" };
    { 9, 30887, "", "=q4=Golden Links of Restoration", "=ds=#a3#", "", "16.7%" };
    { 10, 30888, "", "=q4=Anetheron's Noose", "=ds=#a1#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Anetheron", "=q5=ONE WILL DROP"};
    { 17, 30878, "", "=q4=Glimmering Steel Mantle", "=ds=#a4#", "", "16.7%" };
    { 18, 30879, "", "=q4=Don Alejandro's Money Belt", "=ds=#a2#", "", "16.7%" };
    { 19, 30880, "", "=q4=Quickstrider Moccasins", "=ds=#a3#", "", "16.7%" };
    { 20, 30881, "", "=q4=Blade of Infamy", "=ds=#w10#", "", "16.7%" };
    { 21, 30882, "", "=q4=Bastion of Light", "=ds=#w8#", "", "16.7%" };
    { 22, 30886, "", "=q4=Enchanted Leather Sandals", "=ds=#a2#", "", "16.7%" };
	};

	AtlasLoot_Data["MountHyjalKazrogal"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Kaz'rogal", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Kaz'rogal", "=q5=ONE WILL DROP"};
    { 5, 30893, "", "=q4=Sun-touched Chain Leggings", "=ds=#a3#", "", "16.7%" };
    { 6, 30894, "", "=q4=Blue Suede Shoes", "=ds=#a1#", "", "16.7%" };
    { 7, 30914, "", "=q4=Belt of the Crescent Moon", "=ds=#a2#", "", "16.7%" };
    { 8, 30916, "", "=q4=Leggings of Channeled Elements", "=ds=#a1#", "", "16.7%" };
    { 9, 30917, "", "=q4=Razorfury Mantle", "=ds=#a2#", "", "16.7%" };
    { 10, 30918, "", "=q4=Hammer of Atonement", "=ds=#w6#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Kaz'rogal", "=q5=ONE WILL DROP"};
    { 17, 30889, "", "=q4=Kaz'rogal's Hardened Heart", "=ds=#w8#", "", "16.7%" };
    { 18, 30891, "", "=q4=Black Featherlight Boots", "=ds=#a2#", "", "16.7%" };
    { 19, 30892, "", "=q4=Beast-tamer's Shoulders", "=ds=#a3#", "", "16.7%" };
    { 20, 30895, "", "=q4=Angelista's Sash", "=ds=#a1#", "", "16.7%" };
    { 21, 30915, "", "=q4=Belt of Seething Fury", "=ds=#a4#", "", "16.7%" };
    { 22, 30919, "", "=q4=Valestalker Girdle", "=ds=#a3#", "", "16.7%" };
	};

	AtlasLoot_Data["MountHyjalAzgalor"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Azgalor", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Azgalor", "=q5=ONE WILL DROP"};
    { 5, 30896, "", "=q4=Glory of the Defender", "=ds=#a4#", "", "16.7%" };
    { 6, 30897, "", "=q4=Girdle of Hope", "=ds=#a4#", "", "16.7%" };
    { 7, 30898, "", "=q4=Shady Dealer's Pantaloons", "=ds=#a2#", "", "16.7%" };
    { 8, 30899, "", "=q4=Don Rodrigo's Poncho", "=ds=#a2#", "", "16.7%" };
    { 9, 30900, "", "=q4=Bow-stitched Leggings", "=ds=#a3#", "", "16.7%" };
    { 10, 30901, "", "=q4=Boundless Agony", "=ds=#w4#", "", "16.7%" };
    { 12, 0, "AO_Unknown", "=q6=Azgalor", "=q5=ONE WILL DROP"};
    { 13, 31092, "", "=q4=Gloves of the Forgotten Conqueror", "=ds=#e10#", "", "33.3%" };
    { 14, 31093, "", "=q4=Gloves of the Forgotten Vanquisher", "=ds=#e10#", "", "33.3%" };
    { 15, 31094, "", "=q4=Gloves of the Forgotten Protector", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["CFRSlaveRokmar"] = {
    { 1, 0, "AO_Unknown", "=q6=Rokmar the Crackler", "=q5=ONE WILL DROP"};
    { 2, 24376, "", "=q3=Runed Fungalcap", "=ds=#s14#", "", "20.0%" };
    { 3, 24378, "", "=q3=Coilfang Hammer of Renewal", "=ds=#w6#", "", "20.0%" };
    { 4, 24379, "", "=q3=Bogstrok Scale Cloak", "=ds=#a1#", "", "20.0%" };
    { 5, 24380, "", "=q3=Calming Spore Reed", "=ds=#w12#", "", "20.0%" };
    { 6, 24381, "", "=q3=Coilfang Needler", "=ds=#w3#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRSlaveRokmarHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Rokmar the Crackler (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Rokmar the Crackler (1)", "=q5=ONE WILL DROP"};
    { 5, 27547, "", "=q3=Coldwhisper Cord", "=ds=#a1#", "", "16.7%" };
    { 6, 27548, "", "=q3=Girdle of Many Blessings", "=ds=#a4#", "", "16.7%" };
    { 7, 27549, "", "=q3=Wavefury Boots", "=ds=#a3#", "", "16.7%" };
    { 8, 27550, "", "=q3=Ironscale War Cloak", "=ds=#a1#", "", "16.7%" };
    { 9, 27551, "", "=q3=Skeletal Necklace of Battlerage", "=ds=#s2#", "", "16.7%" };
    { 10, 28124, "", "=q3=Liar's Cord", "=ds=#a2#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRSlaveMennu"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Mennu the Betrayer", "=q5=CHANCE TO DROP"};
    { 2, 29674, "", "=q2=Pattern: Nature Armor Kit", "=ds=#e2#", "", "10.0%" };
    { 4, 0, "AO_Unknown", "=q6=Mennu the Betrayer", "=q5=ONE WILL DROP"};
    { 5, 24356, "", "=q3=Wastewalker Shiv", "=ds=#w4#", "", "20.0%" };
    { 6, 24357, "", "=q3=Vest of Living Lightning", "=ds=#a3#", "", "20.0%" };
    { 7, 24359, "", "=q3=Princely Reign Leggings", "=ds=#a1#", "", "20.0%" };
    { 8, 24360, "", "=q3=Tracker's Belt", "=ds=#a3#", "", "20.0%" };
    { 9, 24361, "", "=q3=Spellfire Longsword", "=ds=#w10#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRSlaveMennuHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Mennu the Betrayer (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Mennu the Betrayer (1)", "=q5=CHANCE TO DROP"};
    { 5, 29674, "", "=q2=Pattern: Nature Armor Kit", "=ds=#e2#", "", "10.0%" };
    { 7, 0, "AO_Unknown", "=q6=Mennu the Betrayer (1)", "=q5=ONE WILL DROP"};
    { 8, 27541, "", "=q3=Archery Belt of the Broken", "=ds=#a3#", "", "16.7%" };
    { 9, 27542, "", "=q3=Cord of Belief", "=ds=#a1#", "", "16.7%" };
    { 10, 27543, "", "=q3=Starlight Dagger", "=ds=#w4#", "", "16.7%" };
    { 11, 27544, "", "=q3=Totem of Spontaneous Regrowth", "", "", "16.7%" };
    { 12, 27545, "", "=q3=Mennu's Scaled Leggings", "=ds=#a2#", "", "16.7%" };
    { 13, 27546, "", "=q3=Traitor's Noose", "=ds=#s2#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRSlaveQuagmirran"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Quagmirran", "=q5=ALL WILL DROP"};
    { 2, 901732, "", "=q1=Ancient Fungus", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Quagmirran", "=q5=ONE WILL DROP"};
    { 5, 24362, "", "=q3=Spore-Soaked Vaneer", "=ds=#a1#", "", "20.0%" };
    { 6, 24363, "", "=q3=Unscarred Breastplate", "=ds=#a4#", "", "20.0%" };
    { 7, 24364, "", "=q3=Azureplate Greaves", "=ds=#a4#", "", "20.0%" };
    { 8, 24365, "", "=q3=Deft Handguards", "=ds=#a2#", "", "20.0%" };
    { 9, 24366, "", "=q3=Scorpid-Sting Mantle", "=ds=#a3#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRSlaveQuagmirranHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Quagmirran (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 33821, "", "=q1=The Heart of Quagmirran", "=ds=#m3#", "", "100%" };
    { 4, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 6, 0, "RoM_stellar_dice", "=q6=Quagmirran (1)", "=q5=CHANCE TO DROP"};
    { 7, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "40.0%" };
    { 9, 0, "AO_Unknown", "=q6=Quagmirran (1)", "=q5=ONE WILL DROP"};
    { 10, 29242, "", "=q4=Boots of Blasphemy", "=ds=#a1#", "", "25.0%" };
    { 11, 29349, "", "=q4=Adamantine Chain of the Unbroken", "=ds=#s2#", "", "25.0%" };
    { 12, 30538, "", "=q4=Midnight Legguards", "=ds=#a2#", "", "25.0%" };
    { 13, 32078, "", "=q4=Pauldrons of Wild Magic", "=ds=#a3#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Quagmirran (1)", "=q5=ONE WILL DROP"};
    { 17, 27672, "", "=q3=Girdle of the Immovable", "=ds=#a4#", "", "16.7%" };
    { 18, 27673, "", "=q3=Phosphorescent Blade", "=ds=#w10#", "", "16.7%" };
    { 19, 27683, "", "=q3=Quagmirran's Eye", "=ds=#s14#", "", "16.7%" };
    { 20, 27712, "", "=q3=Shackles of Quagmirran", "=ds=#a2#", "", "16.7%" };
    { 21, 27713, "", "=q3=Pauldrons of Desolation", "=ds=#a3#", "", "16.7%" };
    { 22, 27714, "", "=q3=Swamplight Lantern", "=ds=#s15#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Quagmirran (1)", "=q5=ONE WILL DROP"};
    { 25, 27740, "", "=q3=Band of Ursol", "=ds=#s13#", "", "16.7%" };
    { 26, 27741, "", "=q3=Bleeding Hollow Warhammer", "=ds=#w6#", "", "16.7%" };
    { 27, 27742, "", "=q3=Mage-Fury Girdle", "=ds=#a1#", "", "16.7%" };
    { 28, 27796, "", "=q3=Mana-Etched Spaulders", "=ds=#a1#", "", "16.7%" };
    { 29, 27800, "", "=q3=Earthsoul Britches", "=ds=#a2#", "", "16.7%" };
    { 30, 28337, "", "=q3=Breastplate of Righteous Fury", "=ds=#a4#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRSteamSteamriggerHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Mekgineer Steamrigger (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Mekgineer Steamrigger (1)", "=q5=CHANCE TO DROP"};
    { 5, 23887, "", "=q3=Schematic: Rocket Boots Xtreme", "=ds=#e2#", "", "38.0%" };
    { 7, 0, "AO_Unknown", "=q6=Mekgineer Steamrigger (1)", "=q5=ONE WILL DROP"};
    { 8, 27790, "", "=q3=Mask of Penance", "=ds=#a4#", "", "20.0%" };
    { 9, 27791, "", "=q3=Serpentcrest Life-Staff", "=ds=#w9#", "", "20.0%" };
    { 10, 27792, "", "=q3=Steam-Hinge Chain of Valor", "=ds=#s2#", "", "20.0%" };
    { 11, 27793, "", "=q3=Earth Mantle Handwraps", "=ds=#a3#", "", "20.0%" };
    { 12, 27794, "", "=q3=Recoilless Rocket Ripper X-54", "=ds=#w5#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRSteamWarlord"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Warlord Kalithresh", "=q5=ALL WILL DROP"};
    { 2, 901738, "", "=q1=Opressor Trident", "=ds=#m3#", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Warlord Kalithresh", "=q5=CHANCE TO DROP"};
    { 5, 24313, "", "=q4=Pattern: Battlecast Hood", "=ds=#e2#", "", "10.0%" };
    { 6, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "5.00%" };
    { 8, 0, "AO_Unknown", "=q6=Warlord Kalithresh", "=q5=ONE WILL DROP"};
    { 9, 27737, "", "=q3=Moonglade Shoulders", "=ds=#a2#", "", "16.7%" };
    { 10, 27738, "", "=q3=Incanter's Pauldrons", "=ds=#a1#", "", "16.7%" };
    { 11, 27795, "", "=q3=Sash of Serpentra", "=ds=#a1#", "", "16.7%" };
    { 12, 27799, "", "=q3=Vermillion Robes of the Dominant", "=ds=#a1#", "", "16.7%" };
    { 13, 27801, "", "=q3=Beast Lord Mantle", "=ds=#a3#", "", "16.7%" };
    { 14, 28203, "", "=q3=Breastplate of the Righteous", "=ds=#a4#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Warlord Kalithresh", "=q5=ONE WILL DROP"};
    { 17, 27475, "", "=q3=Gauntlets of the Bold", "=ds=#a4#", "", "16.7%" };
    { 18, 27510, "", "=q3=Tidefury Gauntlets", "=ds=#a3#", "", "16.7%" };
    { 19, 27804, "", "=q3=Devilshark Cape", "=ds=#a1#", "", "16.7%" };
    { 20, 27805, "", "=q3=Ring of the Silver Hand", "=ds=#s13#", "", "16.7%" };
    { 21, 27806, "", "=q3=Fathomheart Gauntlets", "=ds=#a3#", "", "16.7%" };
    { 22, 27874, "", "=q3=Beast Lord Leggings", "=ds=#a3#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRSteamWarlordHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Warlord Kalithresh (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 31721, "", "=q1=Kalithresh's Trident", "=ds=#m3#", "", "100%" };
    { 4, 33827, "", "=q1=The Warlord's Treatise", "=ds=#m3#", "", "100%" };
    { 5, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Warlord Kalithresh (1)", "=q5=CHANCE TO DROP"};
    { 8, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 9, 24313, "", "=q4=Pattern: Battlecast Hood", "=ds=#e2#", "", "10.0%" };
    { 11, 0, "AO_Unknown", "=q6=Warlord Kalithresh (1)", "=q5=ONE WILL DROP"};
    { 12, 29243, "", "=q4=Wave-Fury Vambraces", "=ds=#a3#", "", "25.0%" };
    { 13, 29351, "", "=q4=Wrathtide Longbow", "=ds=#w2#", "", "25.0%" };
    { 14, 29463, "", "=q4=Amber Bands of the Aggressor", "=ds=#a4#", "", "25.0%" };
    { 15, 30543, "", "=q4=Pontifex Kilt", "=ds=#a1#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Warlord Kalithresh (1)", "=q5=ONE WILL DROP"};
    { 17, 27737, "", "=q3=Moonglade Shoulders", "=ds=#a2#", "", "16.7%" };
    { 18, 27738, "", "=q3=Incanter's Pauldrons", "=ds=#a1#", "", "16.7%" };
    { 19, 27795, "", "=q3=Sash of Serpentra", "=ds=#a1#", "", "16.7%" };
    { 20, 27799, "", "=q3=Vermillion Robes of the Dominant", "=ds=#a1#", "", "16.7%" };
    { 21, 27801, "", "=q3=Beast Lord Mantle", "=ds=#a3#", "", "16.7%" };
    { 22, 28203, "", "=q3=Breastplate of the Righteous", "=ds=#a4#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Warlord Kalithresh (1)", "=q5=ONE WILL DROP"};
    { 25, 27475, "", "=q3=Gauntlets of the Bold", "=ds=#a4#", "", "16.7%" };
    { 26, 27510, "", "=q3=Tidefury Gauntlets", "=ds=#a3#", "", "16.7%" };
    { 27, 27804, "", "=q3=Devilshark Cape", "=ds=#a1#", "", "16.7%" };
    { 28, 27805, "", "=q3=Ring of the Silver Hand", "=ds=#s13#", "", "16.7%" };
    { 29, 27806, "", "=q3=Fathomheart Gauntlets", "=ds=#a3#", "", "16.7%" };
    { 30, 27874, "", "=q3=Beast Lord Leggings", "=ds=#a3#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRSteamThespia"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Hydromancer Thespia", "=q5=ALL WILL DROP"};
    { 2, 30828, "", "=q1=Vial of Underworld Loam", "=ds=#m3#", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Hydromancer Thespia", "=q5=CHANCE TO DROP"};
    { 5, 29673, "", "=q2=Pattern: Frost Armor Kit", "=ds=#e2#", "", "10.0%" };
    { 7, 0, "AO_Unknown", "=q6=Hydromancer Thespia", "=q5=ONE WILL DROP"};
    { 8, 27508, "", "=q3=Incanter's Gloves", "=ds=#a1#", "", "20.0%" };
    { 9, 27783, "", "=q3=Moonrage Girdle", "=ds=#a2#", "", "20.0%" };
    { 10, 27784, "", "=q3=Scintillating Coral Band", "=ds=#s13#", "", "20.0%" };
    { 11, 27787, "", "=q3=Chestguard of No Remorse", "=ds=#a2#", "", "20.0%" };
    { 12, 27789, "", "=q3=Cloak of Whispering Shells", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRSteamThespiaHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Hydromancer Thespia (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 30828, "", "=q1=Vial of Underworld Loam", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Hydromancer Thespia (1)", "=q5=CHANCE TO DROP"};
    { 6, 29673, "", "=q2=Pattern: Frost Armor Kit", "=ds=#e2#", "", "13.0%" };
    { 8, 0, "AO_Unknown", "=q6=Hydromancer Thespia (1)", "=q5=ONE WILL DROP"};
    { 9, 27508, "", "=q3=Incanter's Gloves", "=ds=#a1#", "", "20.0%" };
    { 10, 27783, "", "=q3=Moonrage Girdle", "=ds=#a2#", "", "20.0%" };
    { 11, 27784, "", "=q3=Scintillating Coral Band", "=ds=#s13#", "", "20.0%" };
    { 12, 27787, "", "=q3=Chestguard of No Remorse", "=ds=#a2#", "", "20.0%" };
    { 13, 27789, "", "=q3=Cloak of Whispering Shells", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRSteamSteamrigger"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Mekgineer Steamrigger", "=q5=CHANCE TO DROP"};
    { 2, 23887, "", "=q3=Schematic: Rocket Boots Xtreme", "=ds=#e2#", "", "8.00%" };
    { 4, 0, "AO_Unknown", "=q6=Mekgineer Steamrigger", "=q5=ONE WILL DROP"};
    { 5, 27790, "", "=q3=Mask of Penance", "=ds=#a4#", "", "20.0%" };
    { 6, 27791, "", "=q3=Serpentcrest Life-Staff", "=ds=#w9#", "", "20.0%" };
    { 7, 27792, "", "=q3=Steam-Hinge Chain of Valor", "=ds=#s2#", "", "20.0%" };
    { 8, 27793, "", "=q3=Earth Mantle Handwraps", "=ds=#a3#", "", "20.0%" };
    { 9, 27794, "", "=q3=Recoilless Rocket Ripper X-54", "=ds=#w5#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRUnderHungarfenHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Hungarfen (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Hungarfen (1)", "=q5=CHANCE TO DROP"};
    { 5, 57479, "", "=q3=Technique: Scroll of Nature Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 7, 0, "AO_Unknown", "=q6=Hungarfen (1)", "=q5=ONE WILL DROP"};
    { 8, 27743, "", "=q3=Girdle of Living Flame", "=ds=#a3#", "", "16.7%" };
    { 9, 27744, "", "=q3=Idol of Ursoc", "", "", "16.7%" };
    { 10, 27745, "", "=q3=Hungarhide Gauntlets", "=ds=#a3#", "", "16.7%" };
    { 11, 27746, "", "=q3=Arcanium Signet Bands", "=ds=#a1#", "", "16.7%" };
    { 12, 27747, "", "=q3=Boggspine Knuckles", "=ds=#w13#", "", "16.7%" };
    { 13, 27748, "", "=q3=Cassock of the Loyal", "=ds=#a4#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRUnderGhazan"] = {
    { 1, 0, "AO_Unknown", "=q6=Ghaz'an", "=q5=ONE WILL DROP"};
    { 2, 24458, "", "=q3=Studded Girdle of Virtue", "=ds=#a4#", "", "20.0%" };
    { 3, 24459, "", "=q3=Cloak of Healing Rays", "=ds=#a1#", "", "20.0%" };
    { 4, 24460, "", "=q3=Talisman of Tenacity", "=ds=#s2#", "", "20.0%" };
    { 5, 24461, "", "=q3=Hatebringer", "=ds=#w6#", "", "20.0%" };
    { 6, 24462, "", "=q3=Luminous Pearls of Insight", "=ds=#s2#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRUnderGhazanHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Ghaz'an (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Ghaz'an (1)", "=q5=ONE WILL DROP"};
    { 5, 27755, "", "=q3=Girdle of Gallantry", "=ds=#a4#", "", "16.7%" };
    { 6, 27757, "", "=q3=Greatstaff of the Leviathan", "=ds=#w9#", "", "16.7%" };
    { 7, 27758, "", "=q3=Hydra-fang Necklace", "=ds=#s2#", "", "16.7%" };
    { 8, 27759, "", "=q3=Headdress of the Tides", "=ds=#a3#", "", "16.7%" };
    { 9, 27760, "", "=q3=Dunewind Sash", "=ds=#a2#", "", "16.7%" };
    { 10, 27761, "", "=q3=Ring of the Shadow Deeps", "=ds=#s13#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRUnderSwamplordHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Swamplord Musel'ek (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Swamplord Musel'ek (1)", "=q5=CHANCE TO DROP"};
    { 5, 57479, "", "=q3=Technique: Scroll of Nature Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 7, 0, "AO_Unknown", "=q6=Swamplord Musel'ek (1)", "=q5=ONE WILL DROP"};
    { 8, 27762, "", "=q3=Weathered Band of the Swamplord", "=ds=#s13#", "", "16.7%" };
    { 9, 27763, "", "=q3=Crown of the Forest Lord", "=ds=#a2#", "", "16.7%" };
    { 10, 27764, "", "=q3=Hands of the Sun", "=ds=#a1#", "", "16.7%" };
    { 11, 27765, "", "=q3=Armwraps of Disdain", "=ds=#a2#", "", "16.7%" };
    { 12, 27766, "", "=q3=Swampstone Necklace", "=ds=#s2#", "", "16.7%" };
    { 13, 27767, "", "=q3=Bogreaver", "=ds=#w1#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRUnderHungarfen"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Hungarfen", "=q5=CHANCE TO DROP"};
    { 2, 57479, "", "=q3=Technique: Scroll of Nature Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 4, 0, "AO_Unknown", "=q6=Hungarfen", "=q5=ONE WILL DROP"};
    { 5, 24413, "", "=q3=Totem of the Thunderhead", "", "", "20.0%" };
    { 6, 24450, "", "=q3=Manaspark Gloves", "=ds=#a1#", "", "20.0%" };
    { 7, 24451, "", "=q3=Lykul Bloodbands", "=ds=#a3#", "", "20.0%" };
    { 8, 24452, "", "=q3=Starlight Gauntlets", "=ds=#a2#", "", "20.0%" };
    { 9, 27631, "", "=q3=Needle Shrike", "=ds=#w11#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRUnderSwamplord"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Swamplord Musel'ek", "=q5=CHANCE TO DROP"};
    { 2, 57479, "", "=q3=Technique: Scroll of Nature Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 4, 0, "AO_Unknown", "=q6=Swamplord Musel'ek", "=q5=ONE WILL DROP"};
    { 5, 24453, "", "=q3=Zangartooth Shortblade", "=ds=#w4#", "", "20.0%" };
    { 6, 24454, "", "=q3=Cloak of Enduring Swiftness", "=ds=#a1#", "", "20.0%" };
    { 7, 24455, "", "=q3=Tunic of the Nightwatcher", "=ds=#a2#", "", "20.0%" };
    { 8, 24456, "", "=q3=Greaves of the Iron Guardian", "=ds=#a4#", "", "20.0%" };
    { 9, 24457, "", "=q3=Truth Bearer Shoulderguards", "=ds=#a4#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRUnderStalker"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=The Black Stalker", "=q5=ALL WILL DROP"};
    { 2, 24248, "", "=q1=Brain of the Black Stalker", "=ds=#m3#", "", "100%" };
    { 3, 901734, "", "=q1=Stalker Tendril", "=ds=#m3#", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=The Black Stalker", "=q5=ONE WILL DROP"};
    { 6, 24463, "", "=q3=Pauldrons of Brute Force", "=ds=#a4#", "", "20.0%" };
    { 7, 24464, "", "=q3=The Stalker's Fangs", "=ds=#w4#", "", "20.0%" };
    { 8, 24465, "", "=q3=Shamblehide Chestguard", "=ds=#a3#", "", "20.0%" };
    { 9, 24466, "", "=q3=Skulldugger's Leggings", "=ds=#a2#", "", "20.0%" };
    { 10, 24481, "", "=q3=Robes of the Augurer", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRUnderStalkerHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=The Black Stalker (1)", "=q5=ALL WILL DROP"};
    { 2, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 3, 24248, "", "=q1=Brain of the Black Stalker", "=ds=#m3#", "", "100%" };
    { 4, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 33826, "", "=q1=Black Stalker Egg", "=ds=#m3#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=The Black Stalker (1)", "=q5=CHANCE TO DROP"};
    { 8, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "40.0%" };
    { 10, 0, "AO_Unknown", "=q6=The Black Stalker (1)", "=q5=ONE WILL DROP"};
    { 11, 27779, "", "=q3=Bone Chain Necklace", "=ds=#s2#", "", "16.7%" };
    { 12, 27780, "", "=q3=Ring of Fabled Hope", "=ds=#s13#", "", "16.7%" };
    { 13, 27781, "", "=q3=Demonfang Ritual Helm", "=ds=#a1#", "", "16.7%" };
    { 14, 27896, "", "=q3=Alembic of Infernal Power", "=ds=#s14#", "", "16.7%" };
    { 15, 27907, "", "=q3=Mana-Etched Pantaloons", "=ds=#a1#", "", "16.7%" };
    { 16, 27938, "", "=q3=Savage Mask of the Lynx Lord", "=ds=#a2#", "", "16.7%" };
    { 18, 0, "AO_Unknown", "=q6=The Black Stalker (1)", "=q5=ONE WILL DROP"};
    { 19, 29265, "", "=q4=Barkchip Boots", "=ds=#a2#", "", "25.0%" };
    { 20, 29350, "", "=q4=The Black Stalk", "=ds=#w12#", "", "25.0%" };
    { 21, 30541, "", "=q4=Stormsong Kilt", "=ds=#a3#", "", "25.0%" };
    { 22, 32081, "", "=q4=Eye of the Stalker", "=ds=#s13#", "", "25.0%" };
    { 24, 0, "AO_Unknown", "=q6=The Black Stalker (1)", "=q5=ONE WILL DROP"};
    { 25, 27768, "", "=q3=Oracle Belt of Timeless Mystery", "=ds=#a1#", "", "16.7%" };
    { 26, 27769, "", "=q3=Endbringer", "=ds=#w10#", "", "16.7%" };
    { 27, 27770, "", "=q3=Argussian Compass", "=ds=#s14#", "", "16.7%" };
    { 28, 27771, "", "=q3=Doomplate Shoulderguards", "=ds=#a4#", "", "16.7%" };
    { 29, 27772, "", "=q3=Stormshield of Renewal", "=ds=#w8#", "", "16.7%" };
    { 30, 27773, "", "=q3=Barbaric Legstraps", "=ds=#a3#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRSerpentMorogrim"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Morogrim Tidewalker", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Morogrim Tidewalker", "=q5=ONE WILL DROP"};
    { 5, 30082, "", "=q4=Talon of Azshara", "=ds=#w10#", "", "25.0%" };
    { 6, 30083, "", "=q4=Ring of Sundered Souls", "=ds=#s13#", "", "25.0%" };
    { 7, 30720, "", "=q4=Serpent-Coil Braid", "=ds=#s14#", "", "25.0%" };
    { 8, 33058, "", "=q4=Band of the Vigilant", "=ds=#s13#", "", "25.0%" };
    { 10, 0, "AO_Unknown", "=q6=Morogrim Tidewalker", "=q5=ONE WILL DROP"};
    { 11, 30081, "", "=q4=Warboots of Obliteration", "=ds=#a4#", "", "25.0%" };
    { 12, 30084, "", "=q4=Pauldrons of the Argent Sentinel", "=ds=#a4#", "", "25.0%" };
    { 13, 30085, "", "=q4=Mantle of the Tireless Tracker", "=ds=#a3#", "", "25.0%" };
    { 14, 30098, "", "=q4=Razor-Scale Battlecloak", "=ds=#a1#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Morogrim Tidewalker", "=q5=ONE WILL DROP"};
    { 17, 30008, "", "=q4=Pendant of the Lost Ages", "=ds=#s2#", "", "20.0%" };
    { 18, 30068, "", "=q4=Girdle of the Tidal Call", "=ds=#a3#", "", "20.0%" };
    { 19, 30075, "", "=q4=Gnarled Chestpiece of the Ancients", "=ds=#a2#", "", "20.0%" };
    { 20, 30079, "", "=q4=Illidari Shoulderpads", "=ds=#a1#", "", "20.0%" };
    { 21, 30080, "", "=q4=Luminescent Rod of the Naaru", "=ds=#w12#", "", "20.0%" };
	};

	AtlasLoot_Data["CFRSerpentVashj"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Lady Vashj", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 30183, "", "=q4=Nether Vortex", "=ds=#e7#", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Lady Vashj", "=q5=ONE WILL DROP"};
    { 6, 30102, "", "=q4=Krakken-Heart Breastplate", "=ds=#a4#", "", "16.7%" };
    { 7, 30103, "", "=q4=Fang of Vashj", "=ds=#w4#", "", "16.7%" };
    { 8, 30104, "", "=q4=Cobra-Lash Boots", "=ds=#a3#", "", "16.7%" };
    { 9, 30105, "", "=q4=Serpent Spine Longbow", "=ds=#w2#", "", "16.7%" };
    { 10, 30106, "", "=q4=Belt of One-Hundred Deaths", "=ds=#a2#", "", "16.7%" };
    { 11, 30621, "", "=q4=Prism of Inner Calm", "=ds=#s14#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Lady Vashj", "=q5=ONE WILL DROP"};
    { 17, 30107, "", "=q4=Vestments of the Sea-Witch", "=ds=#a1#", "", "16.7%" };
    { 18, 30108, "", "=q4=Lightfathom Scepter", "=ds=#w6#", "", "16.7%" };
    { 19, 30109, "", "=q4=Ring of Endless Coils", "=ds=#s13#", "", "16.7%" };
    { 20, 30110, "", "=q4=Coral Band of the Revived", "=ds=#s13#", "", "16.7%" };
    { 21, 30111, "", "=q4=Runetotem's Mantle", "=ds=#a2#", "", "16.7%" };
    { 22, 30112, "", "=q4=Glorious Gauntlets of Crestfall", "=ds=#a4#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Lady Vashj", "=q5=ONE WILL DROP"};
    { 25, 30242, "", "=q4=Helm of the Vanquished Champion", "=ds=#e10#", "", "33.3%" };
    { 26, 30243, "", "=q4=Helm of the Vanquished Defender", "=ds=#e10#", "", "33.3%" };
    { 27, 30244, "", "=q4=Helm of the Vanquished Hero", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["CFRSerpentHydross"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Hydross the Unstable", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Hydross the Unstable", "=q5=ONE WILL DROP"};
    { 5, 30047, "", "=q4=Blackfathom Warbands", "=ds=#a3#", "", "25.0%" };
    { 6, 30048, "", "=q4=Brighthelm of Justice", "=ds=#a4#", "", "25.0%" };
    { 7, 30052, "", "=q4=Ring of Lethality", "=ds=#s13#", "", "25.0%" };
    { 8, 30629, "", "=q4=Scarab of Displacement", "=ds=#s14#", "", "25.0%" };
    { 10, 0, "AO_Unknown", "=q6=Hydross the Unstable", "=q5=ONE WILL DROP"};
    { 11, 30054, "", "=q4=Ranger-General's Chestguard", "=ds=#a3#", "", "25.0%" };
    { 12, 30055, "", "=q4=Shoulderpads of the Stranger", "=ds=#a2#", "", "25.0%" };
    { 13, 30056, "", "=q4=Robe of Hateful Echoes", "=ds=#a1#", "", "25.0%" };
    { 14, 33055, "", "=q4=Band of Vile Aggression", "=ds=#s13#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Hydross the Unstable", "=q5=ONE WILL DROP"};
    { 17, 30049, "", "=q4=Fathomstone", "=ds=#s15#", "", "16.7%" };
    { 18, 30050, "", "=q4=Boots of the Shifting Nightmare", "=ds=#a1#", "", "16.7%" };
    { 19, 30051, "", "=q4=Idol of the Crescent Goddess", "", "", "16.7%" };
    { 20, 30053, "", "=q4=Pauldrons of the Wardancer", "=ds=#a4#", "", "16.7%" };
    { 21, 30664, "", "=q4=Living Root of the Wildheart", "=ds=#s14#", "", "16.7%" };
    { 22, 32516, "", "=q4=Wraps of Purification", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["CFRSerpentLurker"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=The Lurker Below", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=The Lurker Below", "=q5=ONE WILL DROP"};
    { 5, 30057, "", "=q4=Bracers of Eradication", "=ds=#a4#", "", "25.0%" };
    { 6, 30060, "", "=q4=Boots of Effortless Striking", "=ds=#a2#", "", "25.0%" };
    { 7, 30061, "", "=q4=Ancestral Ring of Conquest", "=ds=#s13#", "", "25.0%" };
    { 8, 30062, "", "=q4=Grove-Bands of Remulos", "=ds=#a2#", "", "25.0%" };
    { 10, 0, "AO_Unknown", "=q6=The Lurker Below", "=q5=ONE WILL DROP"};
    { 11, 30063, "", "=q4=Libram of Absolute Truth", "", "", "20.0%" };
    { 12, 30064, "", "=q4=Cord of Screaming Terrors", "=ds=#a1#", "", "20.0%" };
    { 13, 30067, "", "=q4=Velvet Boots of the Guardian", "=ds=#a1#", "", "20.0%" };
    { 14, 30665, "", "=q4=Earring of Soulful Meditation", "=ds=#s14#", "", "20.0%" };
    { 15, 33054, "", "=q4=The Seal of Danzalar", "=ds=#s13#", "", "20.0%" };
    { 16, 0, "AO_Unknown", "=q6=The Lurker Below", "=q5=ONE WILL DROP"};
    { 17, 30058, "", "=q4=Mallet of the Tides", "=ds=#w6#", "", "25.0%" };
    { 18, 30059, "", "=q4=Choker of Animalistic Fury", "=ds=#s2#", "", "25.0%" };
    { 19, 30065, "", "=q4=Glowing Breastplate of Truth", "=ds=#a4#", "", "25.0%" };
    { 20, 30066, "", "=q4=Tempest-Strider Boots", "=ds=#a3#", "", "25.0%" };
	};

	AtlasLoot_Data["CFRSerpentLeotheras"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Leotheras the Blind", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Leotheras the Blind", "=q5=ONE WILL DROP"};
    { 5, 30091, "", "=q4=True-Aim Stalker Bands", "=ds=#a3#", "", "16.7%" };
    { 6, 30092, "", "=q4=Orca-Hide Boots", "=ds=#a2#", "", "16.7%" };
    { 7, 30095, "", "=q4=Fang of the Leviathan", "=ds=#w10#", "", "16.7%" };
    { 8, 30096, "", "=q4=Girdle of the Invulnerable", "=ds=#a4#", "", "16.7%" };
    { 9, 30097, "", "=q4=Coral-Barbed Shoulderpads", "=ds=#a3#", "", "16.7%" };
    { 10, 30627, "", "=q4=Tsunami Talisman", "=ds=#s14#", "", "16.7%" };
    { 12, 0, "AO_Unknown", "=q6=Leotheras the Blind", "=q5=ONE WILL DROP"};
    { 13, 30239, "", "=q4=Gloves of the Vanquished Champion", "=ds=#e10#", "", "33.3%" };
    { 14, 30240, "", "=q4=Gloves of the Vanquished Defender", "=ds=#e10#", "", "33.3%" };
    { 15, 30241, "", "=q4=Gloves of the Vanquished Hero", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["CFRSerpentKarathress"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Fathom-Lord Karathress", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Fathom-Lord Karathress", "=q5=ONE WILL DROP"};
    { 5, 30090, "", "=q4=World Breaker", "=ds=#w6#", "", "16.7%" };
    { 6, 30099, "", "=q4=Frayed Tether of the Drowned", "=ds=#s2#", "", "16.7%" };
    { 7, 30100, "", "=q4=Soul-Strider Boots", "=ds=#a1#", "", "16.7%" };
    { 8, 30101, "", "=q4=Bloodsea Brigand's Vest", "=ds=#a2#", "", "16.7%" };
    { 9, 30626, "", "=q4=Sextant of Unstable Currents", "=ds=#s14#", "", "16.7%" };
    { 10, 30663, "", "=q4=Fathom-Brooch of the Tidewalker", "=ds=#s14#", "", "16.7%" };
    { 12, 0, "AO_Unknown", "=q6=Fathom-Lord Karathress", "=q5=ONE WILL DROP"};
    { 13, 30245, "", "=q4=Leggings of the Vanquished Champion", "=ds=#e10#", "", "33.3%" };
    { 14, 30246, "", "=q4=Leggings of the Vanquished Defender", "=ds=#e10#", "", "33.3%" };
    { 15, 30247, "", "=q4=Leggings of the Vanquished Hero", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["HCFurnaceMakerHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=The Maker (1)", "=q5=ALL WILL DROP"};
    { 2, 23894, "", "=q1=Fel Orc Blood Vial", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 21877, "", "=q1=Netherweave Cloth", "=ds=#e7#", "", "100%" };
    { 6, 0, "AO_Unknown", "=q6=The Maker (1)", "=q5=ONE WILL DROP"};
    { 7, 27483, "", "=q3=Moon-Touched Bands", "=ds=#a2#", "", "20.0%" };
    { 8, 27484, "", "=q3=Libram of Avengement", "", "", "20.0%" };
    { 9, 27485, "", "=q3=Embroidered Cape of Mysteries", "=ds=#a1#", "", "20.0%" };
    { 10, 27487, "", "=q3=Bloodlord Legplates", "=ds=#a4#", "", "20.0%" };
    { 11, 27488, "", "=q3=Mage-Collar of the Firestorm", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["HCFurnaceBroggok"] = {
    { 1, 0, "AO_Unknown", "=q6=Broggok", "=q5=ONE WILL DROP"};
    { 2, 24389, "", "=q3=Legion Blunderbuss", "=ds=#w5#", "", "20.0%" };
    { 3, 24390, "", "=q3=Auslese's Light Channeler", "=ds=#s14#", "", "20.0%" };
    { 4, 24391, "", "=q3=Kilt of the Night Strider", "=ds=#a2#", "", "20.0%" };
    { 5, 24392, "", "=q3=Arcing Bracers", "=ds=#a1#", "", "20.0%" };
    { 6, 24393, "", "=q3=Bloody Surgeon's Mitts", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["HCFurnaceBroggokHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Broggok (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 21877, "", "=q1=Netherweave Cloth", "=ds=#e7#", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Broggok (1)", "=q5=ONE WILL DROP"};
    { 6, 27489, "", "=q3=Virtue Bearer's Vambraces", "=ds=#a4#", "", "20.0%" };
    { 7, 27490, "", "=q3=Firebrand Battleaxe", "=ds=#w1#", "", "20.0%" };
    { 8, 27491, "", "=q3=Signet of Repose", "=ds=#s13#", "", "20.0%" };
    { 9, 27492, "", "=q3=Moonchild Leggings", "=ds=#a2#", "", "20.0%" };
    { 10, 27848, "", "=q3=Embroidered Spellpyre Boots", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["HCFurnaceMaker"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=The Maker", "=q5=ALL WILL DROP"};
    { 2, 23894, "", "=q1=Fel Orc Blood Vial", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=The Maker", "=q5=ONE WILL DROP"};
    { 5, 24384, "", "=q3=Diamond-Core Sledgemace", "=ds=#w6#", "", "20.0%" };
    { 6, 24385, "", "=q3=Pendant of Battle-Lust", "=ds=#s2#", "", "20.0%" };
    { 7, 24386, "", "=q3=Libram of Saints Departed", "", "", "20.0%" };
    { 8, 24387, "", "=q3=Ironblade Gauntlets", "=ds=#a4#", "", "20.0%" };
    { 9, 24388, "", "=q3=Girdle of the Gale Storm", "=ds=#a3#", "", "20.0%" };
	};

	AtlasLoot_Data["HCFurnaceBreaker"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Keli'dan the Breaker", "=q5=ALL WILL DROP"};
    { 2, 23894, "", "=q1=Fel Orc Blood Vial", "=ds=#m3#", "", "100%" };
    { 3, 901731, "", "=q1=Blood Crucible", "=ds=#m3#", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Keli'dan the Breaker", "=q5=ONE WILL DROP"};
    { 6, 24394, "", "=q3=Warsong Howling Axe", "=ds=#w1#", "", "20.0%" };
    { 7, 24395, "", "=q3=Mindfire Waistband", "=ds=#a1#", "", "20.0%" };
    { 8, 24396, "", "=q3=Vest of Vengeance", "=ds=#a2#", "", "20.0%" };
    { 9, 24397, "", "=q3=Raiments of Divine Authority", "=ds=#a1#", "", "20.0%" };
    { 10, 24398, "", "=q3=Mantle of the Dusk-Dweller", "=ds=#a2#", "", "20.0%" };
	};

	AtlasLoot_Data["HCFurnaceBreakerHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Keli'dan the Breaker (1)", "=q5=ALL WILL DROP"};
    { 2, 23894, "", "=q1=Fel Orc Blood Vial", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 33814, "", "=q1=Keli'dan's Feathered Stave", "=ds=#m3#", "", "100%" };
    { 5, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Keli'dan the Breaker (1)", "=q5=CHANCE TO DROP"};
    { 8, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "40.0%" };
    { 10, 0, "AO_Unknown", "=q6=Keli'dan the Breaker (1)", "=q5=ONE WILL DROP"};
    { 11, 27512, "", "=q3=The Willbreaker", "=ds=#w10#", "", "16.7%" };
    { 12, 27514, "", "=q3=Leggings of the Unrepentant", "=ds=#a2#", "", "16.7%" };
    { 13, 27522, "", "=q3=World's End Bracers", "=ds=#a3#", "", "16.7%" };
    { 14, 27788, "", "=q3=Bloodsworn Warboots", "=ds=#a4#", "", "16.7%" };
    { 15, 28121, "", "=q3=Icon of Unyielding Courage", "=ds=#s14#", "", "16.7%" };
    { 16, 28264, "", "=q3=Wastewalker Tunic", "=ds=#a2#", "", "16.7%" };
    { 18, 0, "AO_Unknown", "=q6=Keli'dan the Breaker (1)", "=q5=ONE WILL DROP"};
    { 19, 29239, "", "=q4=Eaglecrest Warboots", "=ds=#a4#", "", "25.0%" };
    { 20, 29245, "", "=q4=Wave-Crest Striders", "=ds=#a3#", "", "25.0%" };
    { 21, 29347, "", "=q4=Talisman of the Breaker", "=ds=#s2#", "", "25.0%" };
    { 22, 32080, "", "=q4=Mantle of Shadowy Embrace", "=ds=#a2#", "", "25.0%" };
    { 24, 0, "AO_Unknown", "=q6=Keli'dan the Breaker (1)", "=q5=ONE WILL DROP"};
    { 25, 27494, "", "=q3=Emerald Eye Bracer", "=ds=#a3#", "", "16.7%" };
    { 26, 27495, "", "=q3=Soldier's Dog Tags", "=ds=#s2#", "", "16.7%" };
    { 27, 27497, "", "=q3=Doomplate Gauntlets", "=ds=#a4#", "", "16.7%" };
    { 28, 27505, "", "=q3=Ruby Helm of the Just", "=ds=#a4#", "", "16.7%" };
    { 29, 27506, "", "=q3=Robe of Effervescent Light", "=ds=#a1#", "", "16.7%" };
    { 30, 27507, "", "=q3=Adamantine Repeater", "=ds=#w3#", "", "16.7%" };
	};

	AtlasLoot_Data["KaraAttumen"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Attumen the Huntsman", "=q5=CHANCE TO DROP"};
    { 2, 23809, "", "=q3=Schematic: Stabilized Eternium Scope", "=ds=#e2#", "", "8.00%" };
    { 3, 30480, "", "=q4=Fiery Warhorse's Reins", "=ds=#e10#", "", "1.00%" };
    { 16, 0, "AO_Unknown", "=q6=Attumen the Huntsman", "=q5=ONE WILL DROP"};
    { 17, 28453, "", "=q4=Bracers of the White Stag", "=ds=#a2#", "", "8.33%" };
    { 18, 28454, "", "=q4=Stalker's War Bands", "=ds=#a3#", "", "8.33%" };
    { 19, 28477, "", "=q4=Harbinger Bands", "=ds=#a1#", "", "8.33%" };
    { 20, 28502, "", "=q4=Vambraces of Courage", "=ds=#a4#", "", "8.33%" };
    { 21, 28503, "", "=q4=Whirlwind Bracers", "=ds=#a3#", "", "8.33%" };
    { 22, 28504, "", "=q4=Steelhawk Crossbow", "=ds=#w3#", "", "8.33%" };
    { 23, 28505, "", "=q4=Gauntlets of Renewed Hope", "=ds=#a4#", "", "8.33%" };
    { 24, 28506, "", "=q4=Gloves of Dexterous Manipulation", "=ds=#a2#", "", "8.33%" };
    { 25, 28507, "", "=q4=Handwraps of Flowing Thought", "=ds=#a1#", "", "8.33%" };
    { 26, 28508, "", "=q4=Gloves of Saintly Blessings", "=ds=#a1#", "", "8.33%" };
    { 27, 28509, "", "=q4=Worgen Claw Necklace", "=ds=#s2#", "", "8.33%" };
    { 28, 28510, "", "=q4=Spectral Band of Innervation", "=ds=#s13#", "", "8.33%" };
	};

	AtlasLoot_Data["KaraMoroes"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Moroes", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Moroes", "=q5=CHANCE TO DROP"};
    { 5, 22559, "", "=q3=Formula: Enchant Weapon - Mongoose", "=ds=#e2#", "", "5.00%" };
    { 16, 0, "AO_Unknown", "=q6=Moroes", "=q5=ONE WILL DROP"};
    { 17, 28524, "", "=q4=Emerald Ripper", "=ds=#w4#", "", "8.33%" };
    { 18, 28525, "", "=q4=Signet of Unshakable Faith", "=ds=#s15#", "", "8.33%" };
    { 19, 28528, "", "=q4=Moroes' Lucky Pocket Watch", "=ds=#s14#", "", "8.33%" };
    { 20, 28529, "", "=q4=Royal Cloak of Arathi Kings", "=ds=#a1#", "", "8.33%" };
    { 21, 28530, "", "=q4=Brooch of Unquenchable Fury", "=ds=#s2#", "", "8.33%" };
    { 22, 28545, "", "=q4=Edgewalker Longboots", "=ds=#a2#", "", "8.33%" };
    { 23, 28565, "", "=q4=Nethershard Girdle", "=ds=#a1#", "", "8.33%" };
    { 24, 28566, "", "=q4=Crimson Girdle of the Indomitable", "=ds=#a4#", "", "8.33%" };
    { 25, 28567, "", "=q4=Belt of Gale Force", "=ds=#a3#", "", "8.33%" };
    { 26, 28568, "", "=q4=Idol of the Avian Heart", "", "", "8.33%" };
    { 27, 28569, "", "=q4=Boots of Valiance", "=ds=#a4#", "", "8.33%" };
    { 28, 28570, "", "=q4=Shadow-Cloak of Dalaran", "=ds=#a1#", "", "8.33%" };
	};

	AtlasLoot_Data["KaraKeannaLog"] = {
		{ 1, 24492, "", "=q1=Keanna's Log", "=ds=#m3#"};
	};

	AtlasLoot_Data["KaraMaiden"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Maiden of Virtue", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Maiden of Virtue", "=q5=ONE WILL DROP"};
    { 5, 28511, "", "=q4=Bands of Indwelling", "=ds=#a1#", "", "8.33%" };
    { 6, 28512, "", "=q4=Bracers of Justice", "=ds=#a4#", "", "8.33%" };
    { 7, 28514, "", "=q4=Bracers of Maliciousness", "=ds=#a2#", "", "8.33%" };
    { 8, 28515, "", "=q4=Bands of Nefarious Deeds", "=ds=#a1#", "", "8.33%" };
    { 9, 28516, "", "=q4=Barbed Choker of Discipline", "=ds=#s2#", "", "8.33%" };
    { 10, 28517, "", "=q4=Boots of Foretelling", "=ds=#a1#", "", "8.33%" };
    { 11, 28518, "", "=q4=Iron Gauntlets of the Maiden", "=ds=#a4#", "", "8.33%" };
    { 12, 28519, "", "=q4=Gloves of Quickening", "=ds=#a3#", "", "8.33%" };
    { 13, 28520, "", "=q4=Gloves of Centering", "=ds=#a3#", "", "8.33%" };
    { 14, 28521, "", "=q4=Mitts of the Treemender", "=ds=#a2#", "", "8.33%" };
    { 15, 28522, "", "=q4=Shard of the Virtuous", "=ds=#w6#", "", "8.33%" };
    { 16, 28523, "", "=q4=Totem of Healing Rains", "", "", "8.33%" };
	};

	AtlasLoot_Data["KaraOperaEvent"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Shared Drops"], ""};
		{ 2, 29434, "", "=q4=Badge of Justice", "=ds=#e15#", "", "100%"};
		{ 3, 28594, "", "=q4=Trial-FireTrousers", "=ds=#s11#, #a1#", "", "15.96%"};
		{ 4, 28591, "", "=q4=Earthsoul Leggings", "=ds=#s11#, #a2#", "", "12.45%"};
		{ 5, 28589, "", "=q4=Beastmaw Pauldrons", "=ds=#s3#, #a3#", "", "12.54%"};
		{ 6, 28593, "", "=q4=Eternium Greathelm", "=ds=#s1#, #a4#", "", "11.53%"};
		{ 7, 28590, "", "=q4=Ribbon of Sacrifice", "=ds=#s14#", "", "18.41%"};
		{ 8, 28592, "", "=q4=Libram of Souls Redeemed", "=ds=#s16#, #w16#", "", "8.38%"};
		{ 10, 0, "INV_Box_01", "=q6="..BabbleBoss["The Crone"], "=q5="..AL["Wizard of Oz"]};
		{ 11, 28586, "", "=q4=Wicked Witch's Hat", "=ds=#s1#, #a1#", "", "20.12%"};
		{ 12, 28585, "", "=q4=Ruby Slippers", "=ds=#s12#, #a1#", "", "25.39%"};
		{ 13, 28587, "", "=q4=Legacy", "=ds=#h2#, #w1#", "", "20.43%"};
		{ 14, 28588, "", "=q4=Blue Diamond Witchwand", "=ds=#w12#", "", "17.96%"};
		{ 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Romulo & Julianne"], "=q5="..AL["Romulo & Julianne"]};
		{ 17, 28578, "", "=q4=Masquerade Gown", "=ds=#s5#, #a1#", "", "22.73%"};
		{ 18, 28579, "", "=q4=Romulo's Poison Vial", "=ds=#s14#", "", "29.54%"};
		{ 19, 28572, "", "=q4=Blade of the Unrequited", "=ds=#h1#, #w4#", "", "13.52%"};
		{ 20, 28573, "", "=q4=Despair", "=ds=#h2#, #w10#", "", "30.07%"};
		{ 24, 0, "INV_Box_01", "=q6="..BabbleBoss["The Big Bad Wolf"], "=q5="..AL["Red Riding Hood"]};
		{ 25, 28582, "", "=q4=Red Riding Hood's Cloak", "=ds=#s4#", "", "12.85%"};
		{ 26, 28583, "", "=q4=Big Bad Wolf's Head", "=ds=#s1#, #a3#", "", "16.37%"};
		{ 27, 28584, "", "=q4=Big Bad Wolf's Paw", "=ds=#h3#, #w13#", "", "16.12%"};
		{ 28, 28581, "", "=q4=Wolfslayer Sniper Rifle", "=ds=#w5#", "", "22.42%"};
	};

	AtlasLoot_Data["KaraCurator"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=The Curator", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=The Curator", "=q5=ONE WILL DROP"};
    { 5, 29756, "", "=q4=Gloves of the Fallen Hero", "=ds=#e10#", "", "33.3%" };
    { 6, 29757, "", "=q4=Gloves of the Fallen Champion", "=ds=#e10#", "", "33.3%" };
    { 7, 29758, "", "=q4=Gloves of the Fallen Defender", "=ds=#e10#", "", "33.3%" };
    { 9, 0, "AO_Unknown", "=q6=The Curator", "=q5=ONE WILL DROP"};
    { 10, 28612, "", "=q4=Pauldrons of the Solace-Giver", "=ds=#a1#", "", "16.7%" };
    { 11, 28621, "", "=q4=Wrynn Dynasty Greaves", "=ds=#a4#", "", "16.7%" };
    { 12, 28631, "", "=q4=Dragon-Quake Shoulderguards", "=ds=#a3#", "", "16.7%" };
    { 13, 28633, "", "=q4=Staff of Infinite Mysteries", "=ds=#w9#", "", "16.7%" };
    { 14, 28647, "", "=q4=Forest Wind Shoulderpads", "=ds=#a2#", "", "16.7%" };
    { 15, 28649, "", "=q4=Garona's Signet Ring", "=ds=#s13#", "", "16.7%" };
	};

	AtlasLoot_Data["KaraIllhoof"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Terestian Illhoof", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Terestian Illhoof", "=q5=CHANCE TO DROP"};
    { 5, 22561, "", "=q3=Formula: Enchant Weapon - Soulfrost", "=ds=#e2#", "", "5.00%" };
    { 16, 0, "AO_Unknown", "=q6=Terestian Illhoof", "=q5=ONE WILL DROP"};
    { 17, 28652, "", "=q4=Cincture of Will", "=ds=#a1#", "", "8.33%" };
    { 18, 28653, "", "=q4=Shadowvine Cloak of Infusion", "=ds=#a1#", "", "8.33%" };
    { 19, 28654, "", "=q4=Malefic Girdle", "=ds=#a1#", "", "8.33%" };
    { 20, 28655, "", "=q4=Cord of Nature's Sustenance", "=ds=#a2#", "", "8.33%" };
    { 21, 28656, "", "=q4=Girdle of the Prowler", "=ds=#a3#", "", "8.33%" };
    { 22, 28657, "", "=q4=Fool's Bane", "=ds=#w6#", "", "8.33%" };
    { 23, 28658, "", "=q4=Terestian's Stranglestaff", "=ds=#w9#", "", "8.33%" };
    { 24, 28659, "", "=q4=Xavian Stiletto", "=ds=#w11#", "", "8.33%" };
    { 25, 28660, "", "=q4=Gilded Thorium Cloak", "=ds=#a1#", "", "8.33%" };
    { 26, 28661, "", "=q4=Mender's Heart-Ring", "=ds=#s13#", "", "8.33%" };
    { 27, 28662, "", "=q4=Breastplate of the Lightbinder", "=ds=#a4#", "", "8.33%" };
    { 28, 28785, "", "=q4=The Lightning Capacitor", "=ds=#s14#", "", "8.33%" };
	};

	AtlasLoot_Data["KaraAran"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Shade of Aran", "=q5=ALL WILL DROP"};
    { 2, 23933, "", "=q1=Medivh's Journal", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Shade of Aran", "=q5=CHANCE TO DROP"};
    { 6, 22560, "", "=q3=Formula: Enchant Weapon - Sunfire", "=ds=#e2#", "", "5.00%" };
    { 16, 0, "AO_Unknown", "=q6=Shade of Aran", "=q5=ONE WILL DROP"};
    { 17, 28663, "", "=q4=Boots of the Incorrupt", "=ds=#a1#", "", "8.33%" };
    { 18, 28666, "", "=q4=Pauldrons of the Justice-Seeker", "=ds=#a4#", "", "8.33%" };
    { 19, 28669, "", "=q4=Rapscallion Boots", "=ds=#a2#", "", "8.33%" };
    { 20, 28670, "", "=q4=Boots of the Infernal Coven", "=ds=#a1#", "", "8.33%" };
    { 21, 28671, "", "=q4=Steelspine Faceguard", "=ds=#a3#", "", "8.33%" };
    { 22, 28672, "", "=q4=Drape of the Dark Reavers", "=ds=#a1#", "", "8.33%" };
    { 23, 28673, "", "=q4=Tirisfal Wand of Ascendancy", "=ds=#w12#", "", "8.33%" };
    { 24, 28674, "", "=q4=Saberclaw Talisman", "=ds=#s2#", "", "8.33%" };
    { 25, 28675, "", "=q4=Shermanar Great-Ring", "=ds=#s13#", "", "8.33%" };
    { 26, 28726, "", "=q4=Mantle of the Mind Flayer", "=ds=#a1#", "", "8.33%" };
    { 27, 28727, "", "=q4=Pendant of the Violet Eye", "=ds=#s14#", "", "8.33%" };
    { 28, 28728, "", "=q4=Aran's Soothing Sapphire", "=ds=#s15#", "", "8.33%" };
	};

	AtlasLoot_Data["KaraNetherspite"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Netherspite", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Netherspite", "=q5=ONE WILL DROP"};
    { 5, 28729, "", "=q4=Spiteblade", "=ds=#w10#", "", "8.33%" };
    { 6, 28730, "", "=q4=Mithril Band of the Unscarred", "=ds=#s13#", "", "8.33%" };
    { 7, 28731, "", "=q4=Shining Chain of the Afterworld", "=ds=#s2#", "", "8.33%" };
    { 8, 28732, "", "=q4=Cowl of Defiance", "=ds=#a2#", "", "8.33%" };
    { 9, 28733, "", "=q4=Girdle of Truth", "=ds=#a4#", "", "8.33%" };
    { 10, 28734, "", "=q4=Jewel of Infinite Possibilities", "=ds=#s15#", "", "8.33%" };
    { 11, 28735, "", "=q4=Earthblood Chestguard", "=ds=#a3#", "", "8.33%" };
    { 12, 28740, "", "=q4=Rip-Flayer Leggings", "=ds=#a3#", "", "8.33%" };
    { 13, 28741, "", "=q4=Skulker's Greaves", "=ds=#a2#", "", "8.33%" };
    { 14, 28742, "", "=q4=Pantaloons of Repentance", "=ds=#a1#", "", "8.33%" };
    { 15, 28743, "", "=q4=Mantle of Abrahmis", "=ds=#a4#", "", "8.33%" };
    { 16, 28744, "", "=q4=Uni-Mind Headdress", "=ds=#a1#", "", "8.33%" };
	};

	AtlasLoot_Data["KaraChess"] = {
		{ 1, 28756, "", "=q4=Headdress of the High Potentate", "=ds=#s1#, #a1#", "", "17.98%"};
		{ 2, 28755, "", "=q4=Bladed Shoulderpads of the Merciless", "=ds=#s3#, #a2#", "", "13.55%"};
		{ 3, 28750, "", "=q4=Girdle of Treachery", "=ds=#s10#, #a2#", "", "15.02%"};
		{ 4, 28752, "", "=q4=Forestlord Striders", "=ds=#s12#, #a2#", "", "14.04%"};
		{ 5, 28751, "", "=q4=Heart-Flame Leggings", "=ds=#s11#, #a3#", "", "12.56%"};
		{ 6, 28746, "", "=q4=Fiend Slayer Boots", "=ds=#s12#, #a3#", "", "16.26%"};
		{ 7, 28748, "", "=q4=Legplates of the Innocent", "=ds=#s11#, #a4#", "", "13.79%"};
		{ 8, 28747, "", "=q4=Battlescar Boots", "=ds=#s12#, #a4#", "", "13.79%"};
		{ 16, 28745, "", "=q4=Mithril Chain of Heroism", "=ds=#s2#", "", "12.81%"};
		{ 17, 28753, "", "=q4=Ring of Recurrence", "=ds=#s13#", "", "12.56%"};
		{ 18, 28749, "", "=q4=King's Defender", "=ds=#h1#, #w10#", "", "12.07%"};
		{ 19, 28754, "", "=q4=Triptych Shield of the Ancients", "=ds=#w8#", "", "13.30%"};
		{ 21, 29434, "", "=q4=Badge of Justice", "=ds=#e15#", "", "100%"};
	};

	AtlasLoot_Data["KaraNightbane"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Nightbane", "=q5=ALL WILL DROP"};
    { 2, 24139, "", "=q1=Faint Arcane Essence", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 31751, "", "=q1=Blazing Signet", "=ds=#m3#", "", "100%" };
    { 16, 0, "AO_Unknown", "=q6=Nightbane", "=q5=ONE WILL DROP"};
    { 17, 28597, "", "=q4=Panzar'Thar Breastplate", "=ds=#a4#", "", "8.33%" };
    { 18, 28599, "", "=q4=Scaled Breastplate of Carnage", "=ds=#a3#", "", "8.33%" };
    { 19, 28600, "", "=q4=Stonebough Jerkin", "=ds=#a2#", "", "8.33%" };
    { 20, 28601, "", "=q4=Chestguard of the Conniver", "=ds=#a2#", "", "8.33%" };
    { 21, 28602, "", "=q4=Robe of the Elder Scribes", "=ds=#a1#", "", "8.33%" };
    { 22, 28603, "", "=q4=Talisman of Nightbane", "=ds=#s15#", "", "8.33%" };
    { 23, 28604, "", "=q4=Nightstaff of the Everliving", "=ds=#w9#", "", "8.33%" };
    { 24, 28606, "", "=q4=Shield of Impenetrable Darkness", "=ds=#w8#", "", "8.33%" };
    { 25, 28608, "", "=q4=Ironstriders of Urgency", "=ds=#a4#", "", "8.33%" };
    { 26, 28609, "", "=q4=Emberspur Talisman", "=ds=#s2#", "", "8.33%" };
    { 27, 28610, "", "=q4=Ferocious Swift-Kickers", "=ds=#a3#", "", "8.33%" };
    { 28, 28611, "", "=q4=Dragonheart Flameshield", "=ds=#w8#", "", "8.33%" };
	};

	AtlasLoot_Data["KaraPrince"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Prince Malchezaar", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Prince Malchezaar", "=q5=ONE WILL DROP"};
    { 5, 29759, "", "=q4=Helm of the Fallen Hero", "=ds=#e10#", "", "33.3%" };
    { 6, 29760, "", "=q4=Helm of the Fallen Champion", "=ds=#e10#", "", "33.3%" };
    { 7, 29761, "", "=q4=Helm of the Fallen Defender", "=ds=#e10#", "", "33.3%" };
    { 9, 0, "AO_Unknown", "=q6=Prince Malchezaar", "=q5=ONE WILL DROP"};
    { 10, 28767, "", "=q4=The Decapitator", "=ds=#w1#", "", "16.7%" };
    { 11, 28768, "", "=q4=Malchazeen", "=ds=#w4#", "", "16.7%" };
    { 12, 28770, "", "=q4=Nathrezim Mindblade", "=ds=#w4#", "", "16.7%" };
    { 13, 28771, "", "=q4=Light's Justice", "=ds=#w6#", "", "16.7%" };
    { 14, 28772, "", "=q4=Sunfury Bow of the Phoenix", "=ds=#w2#", "", "16.7%" };
    { 15, 28773, "", "=q4=Gorehowl", "=ds=#w1#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Prince Malchezaar", "=q5=ONE WILL DROP"};
    { 17, 28757, "", "=q4=Ring of a Thousand Marks", "=ds=#s13#", "", "16.7%" };
    { 18, 28762, "", "=q4=Adornment of Stolen Souls", "=ds=#s2#", "", "16.7%" };
    { 19, 28763, "", "=q4=Jade Ring of the Everliving", "=ds=#s13#", "", "16.7%" };
    { 20, 28764, "", "=q4=Farstrider Wildercloak", "=ds=#a1#", "", "16.7%" };
    { 21, 28765, "", "=q4=Stainless Cloak of the Pure Hearted", "=ds=#a1#", "", "16.7%" };
    { 22, 28766, "", "=q4=Ruby Drape of the Mysticant", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["KaraTrash"] = {
		{ 1, 30642, "", "=q4=Drape of the Righteous", "=ds=#s4#", "", "0.22%"};
		{ 2, 30668, "", "=q4=Grasp of the Dead", "=ds=#s9#, #a1#", "", "0.17%"};
		{ 3, 30673, "", "=q4=Inferno Waist Cord", "=ds=#s10#, #a1#", "", "0.21%"};
		{ 4, 30644, "", "=q4=Grips of the Deftness", "=ds=#s9#, #a2#", "", "0.23%"};
		{ 5, 30674, "", "=q4=Zierhut's Lost Treads", "=ds=#s12#, #a2#", "", "0.17%"};
		{ 6, 30643, "", "=q4=Belt of the Tracker", "=ds=#s10#, #a3#", "", "0.19%"};
		{ 7, 30641, "", "=q4=Boots of Elusion", "=ds=#s12#, #a4#", "", "0.13%"};
		{ 9, 23857, "", "=q1=Legacy of the Mountain King", "=ds="};
		{ 10, 23864, "", "=q1=Torment of the Worgen", "=ds="};
		{ 11, 23862, "", "=q1=Redemption of the Fallen", "=ds="};
		{ 12, 23865, "", "=q1=Wrath of the Titans", "=ds="};
		{ 14, 21882, "", "=q1=Soul Essence", "=ds=#e8#"};
		{ 16, 30666, "", "=q4=Ritssyn's Lost Pendant", "=ds=#s2#", "", "0.18%"};
		{ 17, 30667, "", "=q4=Ring of Unrelenting Storms", "=ds=#s13#", "", "0.17%"};
		{ 19, 21903, "", "=q4=Pattern: Soulcloth Shoulders", "=ds=#p8# (375)", "", "0.74%"};
		{ 20, 21904, "", "=q4=Pattern: Soulcloth Vest", "=ds=#p8# (375)", "", "1.07%"};
		{ 21, 22545, "", "=q2=Formula: Enchant Boots - Surefooted", "=ds=#p4# (370)", "", "0.66%"};
	};

		----------------------------------------
		--- Sunwell Isle: Magister's Terrace ---
		----------------------------------------

	AtlasLoot_Data["SMTFireheart"] = {
    { 1, 0, "AO_Unknown", "=q6=Selin Fireheart", "=q5=ONE WILL DROP"};
    { 2, 34697, "", "=q3=Bindings of Raging Fire", "=ds=#a1#", "", "16.7%" };
    { 3, 34698, "", "=q3=Bracers of the Forest Stalker", "=ds=#a3#", "", "16.7%" };
    { 4, 34699, "", "=q3=Sun-forged Cleaver", "=ds=#w1#", "", "16.7%" };
    { 5, 34700, "", "=q3=Gauntlets of Divine Blessings", "=ds=#a4#", "", "16.7%" };
    { 6, 34701, "", "=q3=Leggings of the Betrayed", "=ds=#a2#", "", "16.7%" };
    { 7, 34702, "", "=q3=Cloak of Swift Mending", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["SMTFireheartHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Selin Fireheart (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Selin Fireheart (1)", "=q5=ONE WILL DROP"};
    { 5, 34601, "", "=q4=Shoulderplates of Everlasting Pain", "=ds=#a4#", "", "25.0%" };
    { 6, 34602, "", "=q4=Eversong Cuffs", "=ds=#a2#", "", "25.0%" };
    { 7, 34603, "", "=q4=Distracting Blades", "=ds=#w11#", "", "25.0%" };
    { 8, 34604, "", "=q4=Jaded Crystal Dagger", "=ds=#w4#", "", "25.0%" };
	};

	AtlasLoot_Data["SMTDelrissa"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Priestess Delrissa", "=q5=CHANCE TO DROP"};
    { 2, 35756, "", "=q3=Formula: Enchant Cloak - Steelweave", "=ds=#e2#", "", "20.0%" };
    { 4, 0, "AO_Unknown", "=q6=Priestess Delrissa", "=q5=ONE WILL DROP"};
    { 5, 34783, "", "=q3=Nightstrike", "=ds=#w11#", "", "16.7%" };
    { 6, 34788, "", "=q3=Duskhallow Mantle", "=ds=#a1#", "", "16.7%" };
    { 7, 34789, "", "=q3=Bracers of Slaughter", "=ds=#a4#", "", "16.7%" };
    { 8, 34790, "", "=q3=Battle-mace of the High Priestess", "=ds=#w6#", "", "16.7%" };
    { 9, 34791, "", "=q3=Gauntlets of the Tranquil Waves", "=ds=#a3#", "", "16.7%" };
    { 10, 34792, "", "=q3=Cloak of the Betrayed", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["SMTDelrissaHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Priestess Delrissa (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Priestess Delrissa (1)", "=q5=CHANCE TO DROP"};
    { 5, 35756, "", "=q3=Formula: Enchant Cloak - Steelweave", "=ds=#e2#", "", "20.0%" };
    { 7, 0, "AO_Unknown", "=q6=Priestess Delrissa (1)", "=q5=ONE WILL DROP"};
    { 8, 34470, "", "=q4=Timbal's Focusing Crystal", "=ds=#s14#", "", "25.0%" };
    { 9, 34471, "", "=q4=Vial of the Sunwell", "=ds=#s14#", "", "25.0%" };
    { 10, 34472, "", "=q4=Shard of Contempt", "=ds=#s14#", "", "25.0%" };
    { 11, 34473, "", "=q4=Commendation of Kael'thas", "=ds=#s14#", "", "25.0%" };
	};

	AtlasLoot_Data["SMTKaelthasHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Kael'thas Sunstrider (1)", "=q5=ALL WILL DROP"};
    { 2, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 34157, "", "=q1=Head of Kael'thas", "=ds=#m3#", "", "100%" };
    { 5, 34160, "", "=q1=The Signet Ring of Prince Kael'thas", "=ds=#m3#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Kael'thas Sunstrider (1)", "=q5=CHANCE TO DROP"};
    { 8, 57459, "", "=q3=Technique: Scroll of Fire Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 9, 35504, "", "=q3=Phoenix Hatchling", "=ds=#e10#", "", "8.00%" };
    { 10, 35513, "", "=q4=Swift White Hawkstrider", "=ds=#e10#", "", "5.00%" };
    { 11, 35275, "", "=q3=Orb of the Sin'dorei", "", "", "3.00%" };
    { 12, 35516, "", "=q3=Sun Touched Satchel", "=ds=#e1#", "", "3.00%" };
    { 14, 0, "AO_Unknown", "=q6=Kael'thas Sunstrider (1)", "=q5=ONE WILL DROP"};
    { 15, 34609, "", "=q4=Quickening Blade of the Prince", "=ds=#w10#", "", "25.0%" };
    { 16, 34610, "", "=q4=Scarlet Sin'dorei Robes", "=ds=#a1#", "", "25.0%" };
    { 17, 34611, "", "=q4=Cudgel of Consecration", "=ds=#w6#", "", "25.0%" };
    { 18, 34612, "", "=q4=Greaves of the Penitent Knight", "=ds=#a4#", "", "25.0%" };
    { 20, 0, "AO_Unknown", "=q6=Kael'thas Sunstrider (1)", "=q5=ONE WILL DROP"};
    { 21, 34613, "", "=q4=Shoulderpads of the Silvermoon Retainer", "=ds=#a2#", "", "25.0%" };
    { 22, 34614, "", "=q4=Tunic of the Ranger Lord", "=ds=#a3#", "", "25.0%" };
    { 23, 34615, "", "=q4=Netherforce Chestplate", "=ds=#a4#", "", "25.0%" };
    { 24, 34616, "", "=q4=Breeching Comet", "=ds=#w1#", "", "25.0%" };
	};

	AtlasLoot_Data["SMTKaelthas"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Kael'thas Sunstrider", "=q5=ALL WILL DROP"};
    { 2, 34157, "", "=q1=Head of Kael'thas", "=ds=#m3#", "", "100%" };
    { 3, 901745, "", "=q1=Necro-demon Crystal", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Kael'thas Sunstrider", "=q5=CHANCE TO DROP"};
    { 6, 57459, "", "=q3=Technique: Scroll of Fire Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 7, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "5.00%" };
    { 8, 35504, "", "=q3=Phoenix Hatchling", "=ds=#e10#", "", "8.00%" };
    { 10, 0, "AO_Unknown", "=q6=Kael'thas Sunstrider", "=q5=ONE WILL DROP"};
    { 11, 34793, "", "=q3=Cord of Reconstruction", "=ds=#a1#", "", "16.7%" };
    { 12, 34794, "", "=q3=Axe of Shattered Dreams", "=ds=#w1#", "", "16.7%" };
    { 13, 34795, "", "=q3=Helm of Sanctification", "=ds=#a4#", "", "16.7%" };
    { 14, 34796, "", "=q3=Robes of Summer Flame", "=ds=#a2#", "", "16.7%" };
    { 15, 34797, "", "=q3=Sun-infused Focus Staff", "=ds=#w9#", "", "16.7%" };
    { 16, 34798, "", "=q3=Band of Celerity", "=ds=#s13#", "", "16.7%" };
    { 18, 0, "AO_Unknown", "=q6=Kael'thas Sunstrider", "=q5=ONE WILL DROP"};
    { 19, 34625, "", "=q4=Kharmaa's Ring of Fate", "=ds=#s13#", "", "16.7%" };
    { 20, 34799, "", "=q4=Hauberk of the War Bringer", "=ds=#a3#", "", "16.7%" };
    { 21, 34807, "", "=q4=Sunstrider Warboots", "=ds=#a4#", "", "16.7%" };
    { 22, 34808, "", "=q4=Gloves of Arcane Acuity", "=ds=#a1#", "", "16.7%" };
    { 23, 34809, "", "=q4=Sunrage Treads", "=ds=#a2#", "", "16.7%" };
    { 24, 34810, "", "=q4=Cloak of Blade Turning", "=ds=#a1#", "", "16.7%" };
	};

		-------------------------------------
		--- Sunwell Isle: Sunwell Plateau ---
		-------------------------------------

	AtlasLoot_Data["SPKalecgos"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Sathrovarr the Corruptor", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Sathrovarr the Corruptor", "=q5=CHANCE TO DROP"};
    { 5, 34664, "", "=q3=Sunmote", "=ds=#e7#", "", "15.0%" };
    { 7, 0, "AO_Unknown", "=q6=Sathrovarr the Corruptor", "=q5=ONE WILL DROP"};
    { 8, 34164, "", "=q4=Dragonscale-Encrusted Longblade", "=ds=#w10#", "", "14.3%" };
    { 9, 34165, "", "=q4=Fang of Kalecgos", "=ds=#w4#", "", "14.3%" };
    { 10, 34166, "", "=q4=Band of Lucent Beams", "=ds=#s13#", "", "14.3%" };
    { 11, 34167, "", "=q4=Legplates of the Holy Juggernaut", "=ds=#a4#", "", "14.3%" };
    { 12, 34168, "", "=q4=Starstalker Legguards", "=ds=#a3#", "", "14.3%" };
    { 13, 34169, "", "=q4=Breeches of Natural Aggression", "=ds=#a2#", "", "14.3%" };
    { 14, 34170, "", "=q4=Pantaloons of Calming Strife", "=ds=#a1#", "", "14.3%" };
    { 16, 0, "AO_Unknown", "=q6=Sathrovarr the Corruptor", "=q5=ONE WILL DROP"};
    { 17, 34848, "", "=q4=Bracers of the Forgotten Conqueror", "=ds=#e10#", "", "33.3%" };
    { 18, 34851, "", "=q4=Bracers of the Forgotten Protector", "=ds=#e10#", "", "33.3%" };
    { 19, 34852, "", "=q4=Bracers of the Forgotten Vanquisher", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["SPBrutallus"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Brutallus", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Brutallus", "=q5=CHANCE TO DROP"};
    { 5, 34664, "", "=q3=Sunmote", "=ds=#e7#", "", "15.0%" };
    { 7, 0, "AO_Unknown", "=q6=Brutallus", "=q5=ONE WILL DROP"};
    { 8, 34176, "", "=q4=Reign of Misery", "=ds=#w6#", "", "16.7%" };
    { 9, 34177, "", "=q4=Clutch of Demise", "=ds=#s2#", "", "16.7%" };
    { 10, 34178, "", "=q4=Collar of the Pit Lord", "=ds=#s2#", "", "16.7%" };
    { 11, 34179, "", "=q4=Heart of the Pit", "=ds=#s15#", "", "16.7%" };
    { 12, 34180, "", "=q4=Felfury Legplates", "=ds=#a4#", "", "16.7%" };
    { 13, 34181, "", "=q4=Leggings of Calamity", "=ds=#a1#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Brutallus", "=q5=ONE WILL DROP"};
    { 17, 34853, "", "=q4=Belt of the Forgotten Conqueror", "=ds=#e10#", "", "33.3%" };
    { 18, 34854, "", "=q4=Belt of the Forgotten Protector", "=ds=#e10#", "", "33.3%" };
    { 19, 34855, "", "=q4=Belt of the Forgotten Vanquisher", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["SPFelmyst"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Felmyst", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Felmyst", "=q5=CHANCE TO DROP"};
    { 5, 34664, "", "=q3=Sunmote", "=ds=#e7#", "", "15.0%" };
    { 7, 0, "AO_Unknown", "=q6=Felmyst", "=q5=ONE WILL DROP"};
    { 8, 34182, "", "=q4=Grand Magister's Staff of Torrents", "=ds=#w9#", "", "16.7%" };
    { 9, 34184, "", "=q4=Brooch of the Highborne", "=ds=#s2#", "", "16.7%" };
    { 10, 34185, "", "=q4=Sword Breaker's Bulwark", "=ds=#w8#", "", "16.7%" };
    { 11, 34186, "", "=q4=Chain Links of the Tumultuous Storm", "=ds=#a3#", "", "16.7%" };
    { 12, 34188, "", "=q4=Leggings of the Immortal Night", "=ds=#a2#", "", "16.7%" };
    { 13, 34352, "", "=q4=Borderland Fortress Grips", "=ds=#a4#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Felmyst", "=q5=ONE WILL DROP"};
    { 17, 34856, "", "=q4=Boots of the Forgotten Conqueror", "=ds=#e10#", "", "33.3%" };
    { 18, 34857, "", "=q4=Boots of the Forgotten Protector", "=ds=#e10#", "", "33.3%" };
    { 19, 34858, "", "=q4=Boots of the Forgotten Vanquisher", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["SPEredarTwins"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Lady Sacrolash", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 34664, "", "=q3=Sunmote", "=ds=#e7#", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Lady Sacrolash", "=q5=ONE WILL DROP"};
    { 6, 34848, "", "=q4=Bracers of the Forgotten Conqueror", "=ds=#e10#", "", "11.1%" };
    { 7, 34851, "", "=q4=Bracers of the Forgotten Protector", "=ds=#e10#", "", "11.1%" };
    { 8, 34852, "", "=q4=Bracers of the Forgotten Vanquisher", "=ds=#e10#", "", "11.1%" };
    { 9, 34853, "", "=q4=Belt of the Forgotten Conqueror", "=ds=#e10#", "", "11.1%" };
    { 10, 34854, "", "=q4=Belt of the Forgotten Protector", "=ds=#e10#", "", "11.1%" };
    { 11, 34855, "", "=q4=Belt of the Forgotten Vanquisher", "=ds=#e10#", "", "11.1%" };
    { 12, 34856, "", "=q4=Boots of the Forgotten Conqueror", "=ds=#e10#", "", "11.1%" };
    { 13, 34857, "", "=q4=Boots of the Forgotten Protector", "=ds=#e10#", "", "11.1%" };
    { 14, 34858, "", "=q4=Boots of the Forgotten Vanquisher", "=ds=#e10#", "", "11.1%" };
    { 16, 0, "AO_Unknown", "=q6=Lady Sacrolash", "=q5=ONE WILL DROP"};
    { 17, 35290, "", "=q4=Sin'dorei Pendant of Conquest", "=ds=#s2#", "", "33.3%" };
    { 18, 35291, "", "=q4=Sin'dorei Pendant of Salvation", "=ds=#s2#", "", "33.3%" };
    { 19, 35292, "", "=q4=Sin'dorei Pendant of Triumph", "=ds=#s2#", "", "33.3%" };
	};

	AtlasLoot_Data["SPMuru"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Entropius", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Entropius", "=q5=CHANCE TO DROP"};
    { 5, 34664, "", "=q3=Sunmote", "=ds=#e7#", "", "40.0%" };
    { 7, 0, "AO_Unknown", "=q6=Entropius", "=q5=ONE WILL DROP"};
    { 8, 35282, "", "=q4=Sin'dorei Band of Dominance", "=ds=#s13#", "", "33.3%" };
    { 9, 35283, "", "=q4=Sin'dorei Band of Salvation", "=ds=#s13#", "", "33.3%" };
    { 10, 35284, "", "=q4=Sin'dorei Band of Triumph", "=ds=#s13#", "", "33.3%" };
    { 12, 0, "AO_Unknown", "=q6=Entropius", "=q5=ONE WILL DROP"};
    { 13, 34211, "", "=q4=Harness of Carnal Instinct", "=ds=#a2#", "", "5.56%" };
    { 14, 34212, "", "=q4=Sunglow Vest", "=ds=#a2#", "", "5.56%" };
    { 15, 34213, "", "=q4=Ring of Hardened Resolve", "=ds=#s13#", "", "5.56%" };
    { 16, 34214, "", "=q4=Muramasa", "=ds=#w10#", "", "5.56%" };
    { 17, 34215, "", "=q4=Warharness of Reckless Fury", "=ds=#a4#", "", "5.56%" };
    { 18, 34216, "", "=q4=Heroic Judicator's Chestguard", "=ds=#a4#", "", "5.56%" };
    { 19, 34228, "", "=q4=Vicious Hawkstrider Hauberk", "=ds=#a3#", "", "5.56%" };
    { 20, 34229, "", "=q4=Garments of Serene Shores", "=ds=#a3#", "", "5.56%" };
    { 21, 34230, "", "=q4=Ring of Omnipotence", "=ds=#s13#", "", "5.56%" };
    { 22, 34231, "", "=q4=Aegis of Angelic Fortune", "=ds=#w8#", "", "5.56%" };
    { 23, 34232, "", "=q4=Fel Conquerer Raiments", "=ds=#a1#", "", "5.56%" };
    { 24, 34233, "", "=q4=Robes of Faltered Light", "=ds=#a1#", "", "5.56%" };
    { 25, 34234, "", "=q4=Shadowed Gauntlets of Paroxysm", "=ds=#a2#", "", "5.56%" };
    { 26, 34240, "", "=q4=Gauntlets of the Soothed Soul", "=ds=#a4#", "", "5.56%" };
    { 27, 34427, "", "=q4=Blackened Naaru Sliver", "=ds=#s14#", "", "5.56%" };
    { 28, 34428, "", "=q4=Steely Naaru Sliver", "=ds=#s14#", "", "5.56%" };
    { 29, 34429, "", "=q4=Shifting Naaru Sliver", "=ds=#s14#", "", "5.56%" };
    { 30, 34430, "", "=q4=Glimmering Naaru Sliver", "=ds=#s14#", "", "5.56%" };
	};

	AtlasLoot_Data["SPKiljaeden"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Kil'jaeden", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 34664, "", "=q3=Sunmote", "=ds=#e7#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Kil'jaeden", "=q5=CHANCE TO DROP"};
    { 6, 34334, "", "=q5=Thori'dal, the Stars' Fury", "=ds=#w2#", "", "6.00%" };
    { 8, 0, "AO_Unknown", "=q6=Kil'jaeden", "=q5=ONE WILL DROP"};
    { 9, 34247, "", "=q4=Apolyon, the Soul-Render", "=ds=#w10#", "", "16.7%" };
    { 10, 34329, "", "=q4=Crux of the Apocalypse", "=ds=#w4#", "", "16.7%" };
    { 11, 34331, "", "=q4=Hand of the Deceiver", "=ds=#w13#", "", "16.7%" };
    { 12, 34335, "", "=q4=Hammer of Sanctification", "=ds=#w6#", "", "16.7%" };
    { 13, 34336, "", "=q4=Sunflare", "=ds=#w4#", "", "16.7%" };
    { 14, 34337, "", "=q4=Golden Staff of the Sin'dorei", "=ds=#w9#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Kil'jaeden", "=q5=ONE WILL DROP"};
    { 17, 34241, "", "=q4=Cloak of Unforgivable Sin", "=ds=#a1#", "", "7.14%" };
    { 18, 34242, "", "=q4=Tattered Cape of Antonidas", "=ds=#a1#", "", "7.14%" };
    { 19, 34243, "", "=q4=Helm of Burning Righteousness", "=ds=#a4#", "", "7.14%" };
    { 20, 34244, "", "=q4=Duplicitous Guise", "=ds=#a2#", "", "7.14%" };
    { 21, 34245, "", "=q4=Cover of Ursol the Wise", "=ds=#a2#", "", "7.14%" };
    { 22, 34332, "", "=q4=Cowl of Gul'dan", "=ds=#a3#", "", "7.14%" };
    { 23, 34333, "", "=q4=Coif of Alleria", "=ds=#a3#", "", "7.14%" };
    { 24, 34339, "", "=q4=Cowl of Light's Purity", "=ds=#a1#", "", "7.14%" };
    { 25, 34340, "", "=q4=Dark Conjuror's Collar", "=ds=#a1#", "", "7.14%" };
    { 26, 34341, "", "=q4=Borderland Paingrips", "=ds=#a4#", "", "7.14%" };
    { 27, 34342, "", "=q4=Handguards of the Dawn", "=ds=#a1#", "", "7.14%" };
    { 28, 34343, "", "=q4=Thalassian Ranger Gauntlets", "=ds=#a3#", "", "7.14%" };
    { 29, 34344, "", "=q4=Handguards of Defiled Worlds", "=ds=#a1#", "", "7.14%" };
    { 30, 34345, "", "=q4=Crown of Anasterian", "=ds=#a4#", "", "7.14%" };
	};

	AtlasLoot_Data["SPTrash"] = {
		{ 1, 34351, "", "=q4=Tranquil Majesty Wraps", "=ds=#s9#, #a2#", "", "1%"};
		{ 2, 34407, "", "=q4=Tranquil Moonlight Wraps", "=ds=#m29#"};
		{ 3, 34350, "", "=q4=Gauntlets of the Ancient Shadowmoon", "=ds=#s9#, #a3#", "", "2%"};
		{ 4, 34409, "", "=q4=Gauntlets of the Ancient Frostwolf", "=ds=#m29#"};
		{ 5, 35733, "", "=q4=Ring of Harmonic Beauty", "=ds=#s13#", "", "8%"};
		{ 6, 34183, "", "=q4=Shivering Felspine", "=ds=#h2#, #w7#", "", "1%"};
		{ 7, 34346, "", "=q4=Mounting Vengeance", "=ds=#h4#, #w13#", "", "2%"};
		{ 8, 34349, "", "=q4=Blade of Life's Inevitability", "=ds=#w11#", "", "2%"};
		{ 9, 34348, "", "=q4=Wand of Cleansing Light", "=ds=#w12#", "", "4%"};
		{ 10, 34347, "", "=q4=Wand of the Demonsoul", "=ds=#w12#", "", "2%"};
		{ 12, 35273, "", "=q3=Study of Advanced Smelting", "=ds=#p23# (375)", "", "3%"};
		{ 14, 34664, "", "=q3=Sunmote", "=ds=#m20#", "", "66%"};
		{ 16, 32228, "", "=q4=Empyrean Sapphire", "=ds=#e7#", "", "12%"};
		{ 17, 32231, "", "=q4=Pyrestone", "=ds=#e7#", "", "8%"};
		{ 18, 32229, "", "=q4=Lionseye", "=ds=#e7#", "", "6%"};
		{ 19, 32249, "", "=q4=Seaspray Emerald", "=ds=#e7#", "", "9%"};
		{ 20, 32230, "", "=q4=Shadowsong Amethyst", "=ds=#e7#", "", "6%"};
		{ 21, 32227, "", "=q4=Crimson Spinel", "=ds=#e7#", "", "8%"};
		{ 23, 35208, "", "=q4=Plans: Sunblessed Gauntlets", "=ds=#p2# (365)", "", "0.25%"};
		{ 24, 35210, "", "=q4=Plans: Sunblessed Breastplate", "=ds=#p2# (365)", "", "0.25%"};
		{ 25, 35209, "", "=q4=Plans: Hard Khorium Battlefists", "=ds=#p2# (365)", "", "6%"};
		{ 26, 35211, "", "=q4=Plans: Hard Khorium Battleplate", "=ds=#p2# (365)", "", "0.38%"};
	};

	AtlasLoot_Data["SPPatterns"] = {
		{ 1, 35212, "", "=q4=Pattern: Leather Gauntlets of the Sun", "=ds=#p7# (365)"};
		{ 2, 35216, "", "=q4=Pattern: Leather Chestguard of the Sun", "=ds=#p7# (365)"};
		{ 3, 35213, "", "=q4=Pattern: Fletcher's Gloves of the Phoenix", "=ds=#p7# (365)"};
		{ 4, 35217, "", "=q4=Pattern: Pattern: Embrace of the Phoenix", "=ds=#p7# (365)"};
		{ 5, 35214, "", "=q4=Pattern: Gloves of Immortal Dusk", "=ds=#p7# (365)"};
		{ 6, 35218, "", "=q4=Pattern: Carapace of Sun and Shadow", "=ds=#p7# (365)"};
		{ 7, 35215, "", "=q4=Pattern: Sun-Drenched Scale Gloves", "=ds=#p7# (365)"};
		{ 8, 35219, "", "=q4=Pattern: Sun-Drenched Scale Chestguard", "=ds=#p7# (365)"};
		{ 9, 35204, "", "=q4=Pattern: Sunfire Handwraps", "=ds=#p8# (365)"};
		{ 10, 35206, "", "=q4=Pattern: Sunfire Robe", "=ds=#p8# (365)"};
		{ 11, 35205, "", "=q4=Pattern: Hands of Eternal Light", "=ds=#p8# (365)"};
		{ 12, 35207, "", "=q4=Pattern: Robe of Eternal Light", "=ds=#p8# (365)"};
		{ 13, 35198, "", "=q4=Design: Loop of Forged Power", "=ds=#p12# (365)"};
		{ 14, 35201, "", "=q4=Design: Pendant of Sunfire", "=ds=#p12# (365)"};
		{ 15, 35199, "", "=q4=Design: Ring of Flowing Life", "=ds=#p12# (365)"};
		{ 16, 35202, "", "=q4=Design: Amulet of Flowing Life", "=ds=#p12# (365)"};
		{ 17, 35200, "", "=q4=Design: Hard Khorium Band", "=ds=#p12# (365)"};
		{ 18, 35203, "", "=q4=Design: Hard Khorium Choker", "=ds=#p12# (365)"};
		{ 19, 35186, "", "=q4=Schematic: Annihilator Holo-Gogs", "=ds=#p5# (375)"};
		{ 20, 35187, "", "=q4=Schematic: Justicebringer 3000 Specs", "=ds=#p5# (375)"};
		{ 21, 35189, "", "=q4=Schematic: Powerheal 9000 Lens", "=ds=#p5# (375)"};
		{ 22, 35190, "", "=q4=Schematic: Hyper-Magnified Moon Specs", "=ds=#p5# (375)"};
		{ 23, 35191, "", "=q4=Schematic: Wonderheal XT68 Shades", "=ds=#p5# (375)"};
		{ 24, 35192, "", "=q4=Schematic: Primal-Attuned Goggles", "=ds=#p5# (375)"};
		{ 25, 35193, "", "=q4=Schematic: Lightning Etched Specs", "=ds=#p5# (375)"};
		{ 26, 35194, "", "=q4=Schematic: Surestrike Goggles v3.0", "=ds=#p5# (375)"};
		{ 27, 35195, "", "=q4=Schematic: Mayhem Projection Goggles", "=ds=#p5# (375)"};
		{ 28, 35196, "", "=q4=Schematic: Hard Khorium Goggles", "=ds=#p5# (375)"};
		{ 29, 35197, "", "=q4=Schematic: Quad Deathblow X44 Goggles", "=ds=#p5# (375)"};
	};

		----------------------------------
		--- Tempest Keep: The Arcatraz ---
		----------------------------------

	AtlasLoot_Data["TKArcUnbound"] = {
    { 1, 0, "AO_Unknown", "=q6=Zereketh the Unbound", "=q5=ONE WILL DROP"};
    { 2, 28372, "", "=q3=Idol of Feral Shadows", "", "", "20.0%" };
    { 3, 28373, "", "=q3=Cloak of Scintillating Auras", "=ds=#a1#", "", "20.0%" };
    { 4, 28374, "", "=q3=Mana-Sphere Shoulderguards", "=ds=#a1#", "", "20.0%" };
    { 5, 28375, "", "=q3=Rubium War-Girdle", "=ds=#a4#", "", "20.0%" };
    { 6, 28384, "", "=q3=Outland Striders", "=ds=#a3#", "", "20.0%" };
	};

	AtlasLoot_Data["TKArcUnboundHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Zereketh the Unbound (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Zereketh the Unbound (1)", "=q5=ONE WILL DROP"};
    { 5, 28372, "", "=q3=Idol of Feral Shadows", "", "", "20.0%" };
    { 6, 28373, "", "=q3=Cloak of Scintillating Auras", "=ds=#a1#", "", "20.0%" };
    { 7, 28374, "", "=q3=Mana-Sphere Shoulderguards", "=ds=#a1#", "", "20.0%" };
    { 8, 28375, "", "=q3=Rubium War-Girdle", "=ds=#a4#", "", "20.0%" };
    { 9, 28384, "", "=q3=Outland Striders", "=ds=#a3#", "", "20.0%" };
	};

	AtlasLoot_Data["TKArcDalliah"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Dalliah the Doomsayer", "=q5=CHANCE TO DROP"};
    { 2, 57469, "", "=q3=Technique: Scroll of Arcane Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 3, 24308, "", "=q4=Pattern: Whitemend Pants", "=ds=#e2#", "", "10.0%" };
    { 5, 0, "AO_Unknown", "=q6=Dalliah the Doomsayer", "=q5=ONE WILL DROP"};
    { 6, 28386, "", "=q3=Nether Core's Control Rod", "=ds=#w12#", "", "20.0%" };
    { 7, 28387, "", "=q3=Lamp of Peaceful Repose", "=ds=#s15#", "", "20.0%" };
    { 8, 28390, "", "=q3=Thatia's Self-Correcting Gauntlets", "=ds=#a4#", "", "20.0%" };
    { 9, 28391, "", "=q3=Worldfire Chestguard", "=ds=#a3#", "", "20.0%" };
    { 10, 28392, "", "=q3=Reflex Blades", "=ds=#w13#", "", "20.0%" };
	};

	AtlasLoot_Data["TKArcDalliahHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Dalliah the Doomsayer (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Dalliah the Doomsayer (1)", "=q5=CHANCE TO DROP"};
    { 5, 57469, "", "=q3=Technique: Scroll of Arcane Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 6, 24308, "", "=q4=Pattern: Whitemend Pants", "=ds=#e2#", "", "10.0%" };
    { 8, 0, "AO_Unknown", "=q6=Dalliah the Doomsayer (1)", "=q5=ONE WILL DROP"};
    { 9, 28386, "", "=q3=Nether Core's Control Rod", "=ds=#w12#", "", "20.0%" };
    { 10, 28387, "", "=q3=Lamp of Peaceful Repose", "=ds=#s15#", "", "20.0%" };
    { 11, 28390, "", "=q3=Thatia's Self-Correcting Gauntlets", "=ds=#a4#", "", "20.0%" };
    { 12, 28391, "", "=q3=Worldfire Chestguard", "=ds=#a3#", "", "20.0%" };
    { 13, 28392, "", "=q3=Reflex Blades", "=ds=#w13#", "", "20.0%" };
	};

	AtlasLoot_Data["TKTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Trash Mobs"], "=q5="..BabbleZone["The Botanica"]};
		{ 2, 24172, "", "=q4=Design: Coronet of Verdant Flame", "=ds=#p12# (370) =q1=#n92#", "", "0.27%"};
		{ 4, 0, "INV_Box_01", "=q6="..AL["Trash Mobs"], "=q5="..BabbleZone["The Mechanar"]};
		{ 5, 22920, "", "=q2=Recipe: Major Fire Protection Potion", "=ds=#p1# (360) =q1=#n93#", "", "0.30%"};
		{ 6, 21906, "", "=q2=Pattern: Arcanoweave Boots", "=ds=#p8# (360) =q1=#n93#", "", "0.57%"};
		{ 8, 0, "INV_Box_01", "=q6="..AL["Overcharged Manacell"], "=q5="..BabbleZone["The Mechanar"]};
		{ 9, 30824, "", "=q1=Overcharged Manacell", "=ds=#m3#"};
		{ 16, 0, "INV_Box_01", "=q6="..AL["Trash Mobs"], "=q5="..BabbleZone["The Arcatraz"]};
		{ 17, 23606, "", "=q3=Plans: Felsteel Leggings", "=ds=#p2# (360), =q1=#n57#", "", "3.93%"};
		{ 18, 22556, "", "=q2=Formula: Enchant 2H Weapon - Major Agility", "=ds=#p4# (360) =q1=#n89#", "", "1.68%"};
		{ 19, 29672, "", "=q2=Pattern: Flame Armor Kit", "=ds=#p7# (340) =q1=#n91#", "", "1.84%"};
		{ 20, 21905, "", "=q2=Pattern: Arcanoweave Bracers", "=ds=#p8# (350) =q1=#n90#", "", "1.21%"};
		{ 22, 0, "INV_Box_01", "=q6="..AL["Third Fragment Guardian"], "=q5="..BabbleZone["The Arcatraz"]};
		{ 23, 24488, "", "=q1=Third Key Fragment", "=ds=#m3#", "", "100%"};
	};

		----------------------------------
		--- Tempest Keep: The Botanica ---
		----------------------------------

	AtlasLoot_Data["TKBotSarannis"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Commander Sarannis", "=q5=ALL WILL DROP"};
    { 2, 28769, "", "=q1=The Keystone", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Commander Sarannis", "=q5=ONE WILL DROP"};
    { 5, 28296, "", "=q3=Libram of the Lightbringer", "", "", "20.0%" };
    { 6, 28301, "", "=q3=Syrannis' Mystic Sheen", "=ds=#a1#", "", "20.0%" };
    { 7, 28304, "", "=q3=Prismatic Mittens of Mending", "=ds=#a1#", "", "20.0%" };
    { 8, 28306, "", "=q3=Towering Mantle of the Hunt", "=ds=#a3#", "", "20.0%" };
    { 9, 28311, "", "=q3=Revenger", "=ds=#w10#", "", "20.0%" };
	};

	AtlasLoot_Data["TKBotSarannisHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Commander Sarannis (1)", "=q5=ALL WILL DROP"};
    { 2, 28769, "", "=q1=The Keystone", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Commander Sarannis (1)", "=q5=ONE WILL DROP"};
    { 6, 28296, "", "=q3=Libram of the Lightbringer", "", "", "20.0%" };
    { 7, 28301, "", "=q3=Syrannis' Mystic Sheen", "=ds=#a1#", "", "20.0%" };
    { 8, 28304, "", "=q3=Prismatic Mittens of Mending", "=ds=#a1#", "", "20.0%" };
    { 9, 28306, "", "=q3=Towering Mantle of the Hunt", "=ds=#a3#", "", "20.0%" };
    { 10, 28311, "", "=q3=Revenger", "=ds=#w10#", "", "20.0%" };
	};

	AtlasLoot_Data["TKBotThorngrin"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Thorngrin the Tender", "=q5=CHANCE TO DROP"};
    { 2, 24310, "", "=q4=Pattern: Battlecast Pants", "=ds=#e2#", "", "10.0%" };
    { 4, 0, "AO_Unknown", "=q6=Thorngrin the Tender", "=q5=ONE WILL DROP"};
    { 5, 28322, "", "=q3=Runed Dagger of Solace", "=ds=#w4#", "", "20.0%" };
    { 6, 28323, "", "=q3=Ring of Umbral Doom", "=ds=#s13#", "", "20.0%" };
    { 7, 28324, "", "=q3=Gauntlets of Cruel Intention", "=ds=#a4#", "", "20.0%" };
    { 8, 28325, "", "=q3=Dreamer's Dragonstaff", "=ds=#w9#", "", "20.0%" };
    { 9, 28327, "", "=q3=Arcane Netherband", "=ds=#s13#", "", "20.0%" };
	};

	AtlasLoot_Data["TKBotThorngrinHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Thorngrin the Tender (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Thorngrin the Tender (1)", "=q5=CHANCE TO DROP"};
    { 5, 24310, "", "=q4=Pattern: Battlecast Pants", "=ds=#e2#", "", "10.0%" };
    { 7, 0, "AO_Unknown", "=q6=Thorngrin the Tender (1)", "=q5=ONE WILL DROP"};
    { 8, 28322, "", "=q3=Runed Dagger of Solace", "=ds=#w4#", "", "20.0%" };
    { 9, 28323, "", "=q3=Ring of Umbral Doom", "=ds=#s13#", "", "20.0%" };
    { 10, 28324, "", "=q3=Gauntlets of Cruel Intention", "=ds=#a4#", "", "20.0%" };
    { 11, 28325, "", "=q3=Dreamer's Dragonstaff", "=ds=#w9#", "", "20.0%" };
    { 12, 28327, "", "=q3=Arcane Netherband", "=ds=#s13#", "", "20.0%" };
	};

	AtlasLoot_Data["TKBotSplinter"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Warp Splinter", "=q5=ALL WILL DROP"};
    { 2, 31085, "", "=q1=Top Shard of the Arcatraz Key", "=ds=#m3#", "", "100%" };
    { 3, 901742, "", "=q1=Arcane Warp Shard", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Warp Splinter", "=q5=CHANCE TO DROP"};
    { 6, 57464, "", "=q3=Technique: Scroll of Frost Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 7, 24311, "", "=q4=Pattern: Whitemend Hood", "=ds=#e2#", "", "10.0%" };
    { 8, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "5.00%" };
    { 16, 0, "AO_Unknown", "=q6=Warp Splinter", "=q5=ONE WILL DROP"};
    { 17, 28228, "", "=q3=Beast Lord Cuirass", "=ds=#a3#", "", "14.3%" };
    { 18, 28229, "", "=q3=Incanter's Robe", "=ds=#a1#", "", "14.3%" };
    { 19, 28341, "", "=q3=Warpstaff of Arcanum", "=ds=#w9#", "", "14.3%" };
    { 20, 28342, "", "=q3=Warp Infused Drape", "=ds=#a1#", "", "14.3%" };
    { 21, 28343, "", "=q3=Jagged Bark Pendant", "=ds=#s2#", "", "14.3%" };
    { 22, 28345, "", "=q3=Warp Splinter's Thorn", "=ds=#w4#", "", "14.3%" };
    { 23, 28347, "", "=q3=Warpscale Leggings", "=ds=#a2#", "", "14.3%" };
	};

	AtlasLoot_Data["TKBotSplinterHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Warp Splinter (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 31085, "", "=q1=Top Shard of the Arcatraz Key", "=ds=#m3#", "", "100%" };
    { 4, 33859, "", "=q1=Warp Splinter Clipping", "=ds=#m3#", "", "100%" };
    { 5, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Warp Splinter (1)", "=q5=CHANCE TO DROP"};
    { 8, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 9, 57464, "", "=q3=Technique: Scroll of Frost Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 10, 24311, "", "=q4=Pattern: Whitemend Hood", "=ds=#e2#", "", "10.0%" };
    { 12, 0, "AO_Unknown", "=q6=Warp Splinter (1)", "=q5=ONE WILL DROP"};
    { 13, 29258, "", "=q4=Boots of Ethereal Manipulation", "=ds=#a1#", "", "25.0%" };
    { 14, 29262, "", "=q4=Boots of the Endless Hunt", "=ds=#a3#", "", "25.0%" };
    { 15, 29359, "", "=q4=Feral Staff of Lashing", "=ds=#w9#", "", "25.0%" };
    { 16, 32072, "", "=q4=Gauntlets of Dissension", "=ds=#a4#", "", "25.0%" };
    { 18, 0, "AO_Unknown", "=q6=Warp Splinter (1)", "=q5=ONE WILL DROP"};
    { 19, 28228, "", "=q3=Beast Lord Cuirass", "=ds=#a3#", "", "14.3%" };
    { 20, 28229, "", "=q3=Incanter's Robe", "=ds=#a1#", "", "14.3%" };
    { 21, 28341, "", "=q3=Warpstaff of Arcanum", "=ds=#w9#", "", "14.3%" };
    { 22, 28342, "", "=q3=Warp Infused Drape", "=ds=#a1#", "", "14.3%" };
    { 23, 28343, "", "=q3=Jagged Bark Pendant", "=ds=#s2#", "", "14.3%" };
    { 24, 28345, "", "=q3=Warp Splinter's Thorn", "=ds=#w4#", "", "14.3%" };
    { 25, 28347, "", "=q3=Warpscale Leggings", "=ds=#a2#", "", "14.3%" };
	};

		----------------------------------
		--- Tempest Keep: The Mechanar ---
		----------------------------------

	AtlasLoot_Data["TKMechCacheoftheLegion"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Cache of the Legion"], ""};
		{ 2, 29434, "", "=q4=Badge of Justice", "=ds=#e15#", "", "100%"};
		{ 3, 28249, "", "=q3=Capacitus' Cloak of Calibration", "=ds=#s4#", "", "21.16%"};
		{ 4, 28250, "", "=q3=Vestia's Pauldrons of Inner Grace", "=ds=#s3#, #a1#", "", "17.89%"};
		{ 5, 28252, "", "=q3=Bloodfyre Robes of Annihilation", "=ds=#s5#, #a1#", "", "22.53%"};
		{ 6, 28251, "", "=q3=Boots of the Glade-Keeper", "=ds=#s12#, #a2#", "", "18.74%"};
		{ 7, 28248, "", "=q3=Totem of the Void", "=ds=#s16#, #w15#", "", "19.58%"};
		{ 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Gatewatcher Gyro-Kill"], ""};
		{ 17, 30436, "", "=q1=Jagged Blue Crystal", "=ds=#e9#", "", "100%"};
		{ 19, 0, "INV_Box_01", "=q6="..BabbleBoss["Gatewatcher Iron-Hand"], ""};
		{ 20, 30437, "", "=q1=Jagged Red Crystal", "=ds=#e9#", "", "100%"};
		Next = "TKMechCapacitus";
	};

	AtlasLoot_Data["TKMechCapacitus"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Mechano-Lord Capacitus", "=q5=CHANCE TO DROP"};
    { 2, 35582, "", "=q3=Schematic: Rocket Boots Xtreme Lite", "=ds=#e2#", "", "20.0%" };
    { 4, 0, "AO_Unknown", "=q6=Mechano-Lord Capacitus", "=q5=ONE WILL DROP"};
    { 5, 28253, "", "=q3=Plasma Rat's Hyper-Scythe", "=ds=#w7#", "", "20.0%" };
    { 6, 28254, "", "=q3=Warp Engineer's Prismatic Chain", "=ds=#s2#", "", "20.0%" };
    { 7, 28255, "", "=q3=Lunar-Claw Pauldrons", "=ds=#a2#", "", "20.0%" };
    { 8, 28256, "", "=q3=Thoriumweave Cloak", "=ds=#a1#", "", "20.0%" };
    { 9, 28257, "", "=q3=Hammer of the Penitent", "=ds=#w6#", "", "20.0%" };
	};

	AtlasLoot_Data["TKMechCapacitusHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Mechano-Lord Capacitus (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Mechano-Lord Capacitus (1)", "=q5=CHANCE TO DROP"};
    { 5, 35582, "", "=q3=Schematic: Rocket Boots Xtreme Lite", "=ds=#e2#", "", "38.0%" };
    { 7, 0, "AO_Unknown", "=q6=Mechano-Lord Capacitus (1)", "=q5=ONE WILL DROP"};
    { 8, 28253, "", "=q3=Plasma Rat's Hyper-Scythe", "=ds=#w7#", "", "20.0%" };
    { 9, 28254, "", "=q3=Warp Engineer's Prismatic Chain", "=ds=#s2#", "", "20.0%" };
    { 10, 28255, "", "=q3=Lunar-Claw Pauldrons", "=ds=#a2#", "", "20.0%" };
    { 11, 28256, "", "=q3=Thoriumweave Cloak", "=ds=#a1#", "", "20.0%" };
    { 12, 28257, "", "=q3=Hammer of the Penitent", "=ds=#w6#", "", "20.0%" };
	};

	AtlasLoot_Data["TKMechCalc"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Pathaleon the Calculator", "=q5=ALL WILL DROP"};
    { 2, 31086, "", "=q1=Bottom Shard of the Arcatraz Key", "=ds=#m3#", "", "100%" };
    { 3, 901743, "", "=q1=Arcane Abacus", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Pathaleon the Calculator", "=q5=CHANCE TO DROP"};
    { 6, 57459, "", "=q3=Technique: Scroll of Fire Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 7, 21907, "", "=q2=Pattern: Arcanoweave Robe", "=ds=#e2#", "", "10.0%" };
    { 8, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "5.00%" };
    { 10, 0, "AO_Unknown", "=q6=Pathaleon the Calculator", "=q5=ONE WILL DROP"};
    { 11, 28202, "", "=q3=Moonglade Robe", "=ds=#a2#", "", "16.7%" };
    { 12, 28204, "", "=q3=Tunic of Assassination", "=ds=#a2#", "", "16.7%" };
    { 13, 28265, "", "=q3=Dath'Remar's Ring of Defense", "=ds=#s13#", "", "16.7%" };
    { 14, 28266, "", "=q3=Molten Earth Kilt", "=ds=#a3#", "", "16.7%" };
    { 15, 28267, "", "=q3=Edge of the Cosmos", "=ds=#w10#", "", "16.7%" };
    { 16, 28269, "", "=q3=Baba's Cloak of Arcanistry", "=ds=#a1#", "", "16.7%" };
    { 18, 0, "AO_Unknown", "=q6=Pathaleon the Calculator", "=q5=ONE WILL DROP"};
    { 19, 27899, "", "=q3=Mana Wrath", "=ds=#w10#", "", "16.7%" };
    { 20, 28275, "", "=q3=Beast Lord Helm", "=ds=#a3#", "", "16.7%" };
    { 21, 28278, "", "=q3=Incanter's Cowl", "=ds=#a1#", "", "16.7%" };
    { 22, 28285, "", "=q3=Helm of the Righteous", "=ds=#a4#", "", "16.7%" };
    { 23, 28286, "", "=q3=Telescopic Sharprifle", "=ds=#w5#", "", "16.7%" };
    { 24, 28288, "", "=q3=Abacus of Violent Odds", "=ds=#s14#", "", "16.7%" };
	};

	AtlasLoot_Data["TKMechCalcHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Pathaleon the Calculator (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 31086, "", "=q1=Bottom Shard of the Arcatraz Key", "=ds=#m3#", "", "100%" };
    { 4, 33860, "", "=q1=Pathaleon's Projector", "=ds=#m3#", "", "100%" };
    { 5, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Pathaleon the Calculator (1)", "=q5=CHANCE TO DROP"};
    { 8, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 9, 57459, "", "=q3=Technique: Scroll of Fire Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 11, 0, "AO_Unknown", "=q6=Pathaleon the Calculator (1)", "=q5=ONE WILL DROP"};
    { 12, 29251, "", "=q4=Boots of the Pious", "=ds=#a1#", "", "25.0%" };
    { 13, 29362, "", "=q4=The Sun Eater", "=ds=#w10#", "", "25.0%" };
    { 14, 30533, "", "=q4=Vanquisher's Legplates", "=ds=#a4#", "", "25.0%" };
    { 15, 32076, "", "=q4=Handguards of the Steady", "=ds=#a3#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Pathaleon the Calculator (1)", "=q5=ONE WILL DROP"};
    { 17, 28202, "", "=q3=Moonglade Robe", "=ds=#a2#", "", "16.7%" };
    { 18, 28204, "", "=q3=Tunic of Assassination", "=ds=#a2#", "", "16.7%" };
    { 19, 28265, "", "=q3=Dath'Remar's Ring of Defense", "=ds=#s13#", "", "16.7%" };
    { 20, 28266, "", "=q3=Molten Earth Kilt", "=ds=#a3#", "", "16.7%" };
    { 21, 28267, "", "=q3=Edge of the Cosmos", "=ds=#w10#", "", "16.7%" };
    { 22, 28269, "", "=q3=Baba's Cloak of Arcanistry", "=ds=#a1#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Pathaleon the Calculator (1)", "=q5=ONE WILL DROP"};
    { 25, 27899, "", "=q3=Mana Wrath", "=ds=#w10#", "", "16.7%" };
    { 26, 28275, "", "=q3=Beast Lord Helm", "=ds=#a3#", "", "16.7%" };
    { 27, 28278, "", "=q3=Incanter's Cowl", "=ds=#a1#", "", "16.7%" };
    { 28, 28285, "", "=q3=Helm of the Righteous", "=ds=#a4#", "", "16.7%" };
    { 29, 28286, "", "=q3=Telescopic Sharprifle", "=ds=#w5#", "", "16.7%" };
    { 30, 28288, "", "=q3=Abacus of Violent Odds", "=ds=#s14#", "", "16.7%" };
	};

		-----------------------------
		--- Tempest Keep: The Eye ---
		-----------------------------

	AtlasLoot_Data["TKEyeAlar"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Al'ar", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 16, 0, "AO_Unknown", "=q6=Al'ar", "=q5=ONE WILL DROP"};
    { 17, 29918, "", "=q4=Mindstorm Wristbands", "=ds=#a1#", "", "7.69%" };
    { 18, 29920, "", "=q4=Phoenix-Ring of Rebirth", "=ds=#s13#", "", "7.69%" };
    { 19, 29921, "", "=q4=Fire Crest Breastplate", "=ds=#a3#", "", "7.69%" };
    { 20, 29922, "", "=q4=Band of Al'ar", "=ds=#s13#", "", "7.69%" };
    { 21, 29923, "", "=q4=Talisman of the Sun King", "=ds=#s15#", "", "7.69%" };
    { 22, 29924, "", "=q4=Netherbane", "=ds=#w1#", "", "7.69%" };
    { 23, 29925, "", "=q4=Phoenix-Wing Cloak", "=ds=#a1#", "", "7.69%" };
    { 24, 29947, "", "=q4=Gloves of the Searing Grip", "=ds=#a2#", "", "7.69%" };
    { 25, 29948, "", "=q4=Claw of the Phoenix", "=ds=#w13#", "", "7.69%" };
    { 26, 29949, "", "=q4=Arcanite Steam-Pistol", "=ds=#w5#", "", "7.69%" };
    { 27, 30447, "", "=q4=Tome of Fiery Redemption", "=ds=#s14#", "", "7.69%" };
    { 28, 30448, "", "=q4=Talon of Al'ar", "=ds=#s14#", "", "7.69%" };
    { 29, 32944, "", "=q4=Talon of the Phoenix", "=ds=#w13#", "", "7.69%" };
	};

	AtlasLoot_Data["TKEyeVoidReaver"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Void Reaver", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Void Reaver", "=q5=ONE WILL DROP"};
    { 5, 29983, "", "=q4=Fel-Steel Warhelm", "=ds=#a4#", "", "14.3%" };
    { 6, 29984, "", "=q4=Girdle of Zaetar", "=ds=#a2#", "", "14.3%" };
    { 7, 29985, "", "=q4=Void Reaver Greaves", "=ds=#a3#", "", "14.3%" };
    { 8, 29986, "", "=q4=Cowl of the Grand Engineer", "=ds=#a1#", "", "14.3%" };
    { 9, 30450, "", "=q4=Warp-Spring Coil", "=ds=#s14#", "", "14.3%" };
    { 10, 30619, "", "=q4=Fel Reaver's Piston", "=ds=#s14#", "", "14.3%" };
    { 11, 32515, "", "=q4=Wristguards of Determination", "=ds=#a4#", "", "14.3%" };
    { 13, 0, "AO_Unknown", "=q6=Void Reaver", "=q5=ONE WILL DROP"};
    { 14, 30248, "", "=q4=Pauldrons of the Vanquished Champion", "=ds=#e10#", "", "33.3%" };
    { 15, 30249, "", "=q4=Pauldrons of the Vanquished Defender", "=ds=#e10#", "", "33.3%" };
    { 16, 30250, "", "=q4=Pauldrons of the Vanquished Hero", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["TKEyeSolarian"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=High Astromancer Solarian", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=High Astromancer Solarian", "=q5=ONE WILL DROP"};
    { 5, 29950, "", "=q4=Greaves of the Bloodwarder", "=ds=#a4#", "", "25.0%" };
    { 6, 29951, "", "=q4=Star-Strider Boots", "=ds=#a3#", "", "25.0%" };
    { 7, 29965, "", "=q4=Girdle of the Righteous Path", "=ds=#a4#", "", "25.0%" };
    { 8, 29966, "", "=q4=Vambraces of Ending", "=ds=#a2#", "", "25.0%" };
    { 10, 0, "AO_Unknown", "=q6=High Astromancer Solarian", "=q5=ONE WILL DROP"};
    { 11, 29972, "", "=q4=Trousers of the Astromancer", "=ds=#a1#", "", "20.0%" };
    { 12, 29976, "", "=q4=Worldstorm Gauntlets", "=ds=#a3#", "", "20.0%" };
    { 13, 29977, "", "=q4=Star-Soul Breeches", "=ds=#a1#", "", "20.0%" };
    { 14, 29982, "", "=q4=Wand of the Forgotten Star", "=ds=#w12#", "", "20.0%" };
    { 15, 32267, "", "=q4=Boots of the Resilient", "=ds=#a4#", "", "20.0%" };
    { 16, 0, "AO_Unknown", "=q6=High Astromancer Solarian", "=q5=ONE WILL DROP"};
    { 17, 29962, "", "=q4=Heartrazor", "=ds=#w4#", "", "25.0%" };
    { 18, 29981, "", "=q4=Ethereum Life-Staff", "=ds=#w9#", "", "25.0%" };
    { 19, 30446, "", "=q4=Solarian's Sapphire", "=ds=#s14#", "", "25.0%" };
    { 20, 30449, "", "=q4=Void Star Talisman", "=ds=#s14#", "", "25.0%" };
	};

	AtlasLoot_Data["TKEyeKaelthas"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Kael'thas Sunstrider", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 30183, "", "=q4=Nether Vortex", "=ds=#e7#", "", "100%" };
    { 4, 32405, "", "=q4=Verdant Sphere", "=ds=#e10#", "", "100%" };
    { 6, 0, "RoM_stellar_dice", "=q6=Kael'thas Sunstrider", "=q5=CHANCE TO DROP"};
    { 7, 32458, "", "=q4=Ashes of Al'ar", "=ds=#e10#", "", "2.00%" };
    { 9, 0, "AO_Unknown", "=q6=Kael'thas Sunstrider", "=q5=ONE WILL DROP"};
    { 10, 29987, "", "=q4=Gauntlets of the Sun King", "=ds=#a1#", "", "16.7%" };
    { 11, 29988, "", "=q4=The Nexus Key", "=ds=#w9#", "", "16.7%" };
    { 12, 29989, "", "=q4=Sunshower Light Cloak", "=ds=#a1#", "", "16.7%" };
    { 13, 29990, "", "=q4=Crown of the Sun", "=ds=#a1#", "", "16.7%" };
    { 14, 29991, "", "=q4=Sunhawk Leggings", "=ds=#a3#", "", "16.7%" };
    { 15, 29992, "", "=q4=Royal Cloak of the Sunstriders", "=ds=#a1#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Kael'thas Sunstrider", "=q5=ONE WILL DROP"};
    { 17, 29993, "", "=q4=Twinblade of the Phoenix", "=ds=#w10#", "", "16.7%" };
    { 18, 29994, "", "=q4=Thalassian Wildercloak", "=ds=#a1#", "", "16.7%" };
    { 19, 29995, "", "=q4=Leggings of Murderous Intent", "=ds=#a2#", "", "16.7%" };
    { 20, 29996, "", "=q4=Rod of the Sun King", "=ds=#w6#", "", "16.7%" };
    { 21, 29997, "", "=q4=Band of the Ranger-General", "=ds=#s13#", "", "16.7%" };
    { 22, 29998, "", "=q4=Royal Gauntlets of Silvermoon", "=ds=#a4#", "", "16.7%" };
    { 24, 0, "AO_Unknown", "=q6=Kael'thas Sunstrider", "=q5=ONE WILL DROP"};
    { 25, 30236, "", "=q4=Chestguard of the Vanquished Champion", "=ds=#e10#", "", "33.3%" };
    { 26, 30237, "", "=q4=Chestguard of the Vanquished Defender", "=ds=#e10#", "", "33.3%" };
    { 27, 30238, "", "=q4=Chestguard of the Vanquished Hero", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["TKEyeTrash"] = {
		{ 1, 30024, "", "=q4=Mantle of the Elven Kings", "=ds=#s3#, #a1#", "", "3%"};
		{ 2, 30020, "", "=q4=Fire-Cord of the Magus", "=ds=#s10#, #a1#", "", "2%"};
		{ 3, 30029, "", "=q4=Bark-Gloves of Ancient Wisdom", "=ds=#s9#, #a2#", "", "2%"};
		{ 4, 30026, "", "=q4=Bands of the Celestial Archer", "=ds=#s8#, #a3#", "", "2%"};
		{ 5, 30030, "", "=q4=Girdle of Fallen Stars", "=ds=#s10#, #a3#", "", "2%"};
		{ 6, 30028, "", "=q4=Seventh Ring of the Tirisfalen", "=ds=#s13#", "", "2%"};
		{ 8, 30324, "", "=q4=Plans: Red Havoc Boots", "=ds=#p2# (375)", "", "1%"};
		{ 9, 30322, "", "=q4=Plans: Red Belt of Battle", "=ds=#p2# (375)", "", "2%"};
		{ 10, 30323, "", "=q4=Plans: Boots of the Protector", "=ds=#p2# (375)", "", "2%"};
		{ 11, 30321, "", "=q4=Plans: Belt of the Guardian", "=ds=#p2# (375)", "", "2%"};
		{ 12, 30280, "", "=q4=Pattern: Belt of Blasting", "=ds=#p8# (375)", "", "1%"};
		{ 13, 30282, "", "=q4=Pattern: Boots of Blasting", "=ds=#p8# (375)", "", "1%"};
		{ 14, 30283, "", "=q4=Pattern: Boots of the Long Road", "=ds=#p8# (375)", "", "2%"};
		{ 15, 30281, "", "=q4=Pattern: Belt of the Long Road", "=ds=#p8# (375)", "", "1%"};
		{ 16, 30308, "", "=q4=Pattern: Hurricane Boots", "=ds=#p7# (375)", "", "1%"};
		{ 17, 30304, "", "=q4=Pattern: Monsoon Belt", "=ds=#p7# (375)", "", "1%"};
		{ 18, 30305, "", "=q4=Pattern: Boots of Natural Grace", "=ds=#p7# (375)", "", "2%"};
		{ 19, 30307, "", "=q4=Pattern: Boots of the Crimson Hawk", "=ds=#p7# (375)", "", "1%"};
		{ 20, 30306, "", "=q4=Pattern: Boots of Utter Darkness", "=ds=#p7# (375)", "", "2%"};
		{ 21, 30301, "", "=q4=Pattern: Belt of Natural Power", "=ds=#p7# (375)", "", "1%"};
		{ 22, 30303, "", "=q4=Pattern: Belt of the Black Eagle", "=ds=#p7# (375)", "", "1%"};
		{ 23, 30302, "", "=q4=Pattern: Belt of Deep Shadow", "=ds=#p7# (375)", "", "1%"};
		{ 25, 30183, "", "=q4=Nether Vortex", "=ds=#e8#", "", "75%"};
		{ 27, 32897, "", "=q2=Mark of the Illidari", "=ds=#m20#", "", "27%"};
	};

	AtlasLoot_Data["TKEyeLegendaries"] = {
		{ 1, 30312, "", "=q5=Infinity Blade", "=ds=#h1#, #w4#"};
		{ 2, 30311, "", "=q5=Warp Slicer", "=ds=#h1#, #w10#"};
		{ 3, 30317, "", "=q5=Cosmic Infuser", "=ds=#h3#, #w6#"};
		{ 4, 30316, "", "=q5=Devastation", "=ds=#h2#, #w1#"};
		{ 5, 30313, "", "=q5=Staff of Disintegration", "=ds=#w9#"};
		{ 6, 30314, "", "=q5=Phaseshift Bulwark", "=ds=#w8#"};
		{ 7, 30318, "", "=q5=Netherstrand Longbow", "=ds=#w2#, =q1=#m1# =ds=#c2#"};
		{ 8, 30319, "", "=q5=Nether Spike", "=ds=#w17#"};
	};

		----------------
		--- Zul'Aman ---
		----------------

	AtlasLoot_Data["ZANalorakk"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Nalorakk", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Nalorakk", "=q5=CHANCE TO DROP"};
    { 5, 33307, "", "=q3=Formula: Enchant Weapon - Executioner", "=ds=#e2#", "", "5.00%" };
    { 7, 0, "AO_Unknown", "=q6=Nalorakk", "=q5=ONE WILL DROP"};
    { 8, 33191, "", "=q4=Jungle Stompers", "=ds=#a4#", "", "14.3%" };
    { 9, 33203, "", "=q4=Robes of Heavenly Purpose", "=ds=#a1#", "", "14.3%" };
    { 10, 33206, "", "=q4=Pauldrons of Primal Fury", "=ds=#a3#", "", "14.3%" };
    { 11, 33211, "", "=q4=Bladeangel's Money Belt", "=ds=#a2#", "", "14.3%" };
    { 12, 33285, "", "=q4=Fury of the Ursine", "=ds=#a1#", "", "14.3%" };
    { 13, 33327, "", "=q4=Mask of Introspection", "=ds=#a4#", "", "14.3%" };
    { 14, 33640, "", "=q4=Fury", "=ds=#w13#", "", "14.3%" };
	};

	AtlasLoot_Data["ZAAkilZon"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Akil'zon", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Akil'zon", "=q5=CHANCE TO DROP"};
    { 5, 33307, "", "=q3=Formula: Enchant Weapon - Executioner", "=ds=#e2#", "", "5.00%" };
    { 7, 0, "AO_Unknown", "=q6=Akil'zon", "=q5=ONE WILL DROP"};
    { 8, 33214, "", "=q4=Akil'zon's Talonblade", "=ds=#w10#", "", "14.3%" };
    { 9, 33215, "", "=q4=Bloodstained Elven Battlevest", "=ds=#a4#", "", "14.3%" };
    { 10, 33216, "", "=q4=Chestguard of Hidden Purpose", "=ds=#a4#", "", "14.3%" };
    { 11, 33281, "", "=q4=Brooch of Nature's Mercy", "=ds=#s2#", "", "14.3%" };
    { 12, 33283, "", "=q4=Amani Punisher", "=ds=#w6#", "", "14.3%" };
    { 13, 33286, "", "=q4=Mojo-mender's Mask", "=ds=#a3#", "", "14.3%" };
    { 14, 33293, "", "=q4=Signet of Ancient Magics", "=ds=#s13#", "", "14.3%" };
	};

	AtlasLoot_Data["ZAJanAlai"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Jan'alai", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Jan'alai", "=q5=CHANCE TO DROP"};
    { 5, 33307, "", "=q3=Formula: Enchant Weapon - Executioner", "=ds=#e2#", "", "5.00%" };
    { 7, 0, "AO_Unknown", "=q6=Jan'alai", "=q5=ONE WILL DROP"};
    { 8, 33326, "", "=q4=Bulwark of the Amani Empire", "=ds=#w8#", "", "14.3%" };
    { 9, 33328, "", "=q4=Arrow-fall Chestguard", "=ds=#a3#", "", "14.3%" };
    { 10, 33329, "", "=q4=Shadowtooth Trollskin Cuirass", "=ds=#a2#", "", "14.3%" };
    { 11, 33332, "", "=q4=Enamelled Disc of Mojo", "=ds=#w8#", "", "14.3%" };
    { 12, 33354, "", "=q4=Wub's Cursed Hexblade", "=ds=#w4#", "", "14.3%" };
    { 13, 33356, "", "=q4=Helm of Natural Regeneration", "=ds=#a2#", "", "14.3%" };
    { 14, 33357, "", "=q4=Footpads of Madness", "=ds=#a1#", "", "14.3%" };
	};

	AtlasLoot_Data["ZAHalazzi"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Halazzi", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Halazzi", "=q5=CHANCE TO DROP"};
    { 5, 33307, "", "=q3=Formula: Enchant Weapon - Executioner", "=ds=#e2#", "", "5.00%" };
    { 7, 0, "AO_Unknown", "=q6=Halazzi", "=q5=ONE WILL DROP"};
    { 8, 33297, "", "=q4=The Savage's Choker", "=ds=#s2#", "", "14.3%" };
    { 9, 33299, "", "=q4=Spaulders of the Advocate", "=ds=#a4#", "", "14.3%" };
    { 10, 33300, "", "=q4=Shoulderpads of Dancing Blades", "=ds=#a2#", "", "14.3%" };
    { 11, 33303, "", "=q4=Skullshatter Warboots", "=ds=#a4#", "", "14.3%" };
    { 12, 33317, "", "=q4=Robe of Departed Spirits", "=ds=#a1#", "", "14.3%" };
    { 13, 33322, "", "=q4=Shimmer-pelt Vest", "=ds=#a2#", "", "14.3%" };
    { 14, 33533, "", "=q4=Avalanche Leggings", "=ds=#a3#", "", "14.3%" };
	};

	AtlasLoot_Data["ZAMalacrass"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Hex Lord Malacrass", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Hex Lord Malacrass", "=q5=CHANCE TO DROP"};
    { 5, 34029, "", "=q4=Tiny Voodoo Mask", "=ds=#s14#", "", "30.0%" };
    { 6, 33307, "", "=q3=Formula: Enchant Weapon - Executioner", "=ds=#e2#", "", "5.00%" };
    { 16, 0, "AO_Unknown", "=q6=Hex Lord Malacrass", "=q5=ONE WILL DROP"};
    { 17, 33298, "", "=q4=Prowler's Strikeblade", "=ds=#w4#", "", "7.69%" };
    { 18, 33388, "", "=q4=Heartless", "=ds=#w10#", "", "7.69%" };
    { 19, 33389, "", "=q4=Dagger of Bad Mojo", "=ds=#w4#", "", "7.69%" };
    { 20, 33421, "", "=q4=Battleworn Tuskguard", "=ds=#a4#", "", "7.69%" };
    { 21, 33432, "", "=q4=Coif of the Jungle Stalker", "=ds=#a3#", "", "7.69%" };
    { 22, 33446, "", "=q4=Girdle of Stromgarde's Hope", "=ds=#a4#", "", "7.69%" };
    { 23, 33453, "", "=q4=Hood of Hexing", "=ds=#a1#", "", "7.69%" };
    { 24, 33463, "", "=q4=Hood of the Third Eye", "=ds=#a1#", "", "7.69%" };
    { 25, 33464, "", "=q4=Hex Lord's Voodoo Pauldrons", "=ds=#a3#", "", "7.69%" };
    { 26, 33465, "", "=q4=Staff of Primal Fury", "=ds=#w9#", "", "7.69%" };
    { 27, 33592, "", "=q4=Cloak of Ancient Rituals", "=ds=#a1#", "", "7.69%" };
    { 28, 33828, "", "=q4=Tome of Diabolic Remedy", "=ds=#s14#", "", "7.69%" };
    { 29, 33829, "", "=q4=Hex Shrunken Head", "=ds=#s14#", "", "7.69%" };
	};

	AtlasLoot_Data["ZAZuljin"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Zul'jin", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 33102, "", "=q4=Blood of Zul'jin", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Zul'jin", "=q5=CHANCE TO DROP"};
    { 6, 33307, "", "=q3=Formula: Enchant Weapon - Executioner", "=ds=#e2#", "", "5.00%" };
    { 16, 0, "AO_Unknown", "=q6=Zul'jin", "=q5=ONE WILL DROP"};
    { 17, 33466, "", "=q4=Loop of Cursed Bones", "=ds=#s2#", "", "8.33%" };
    { 18, 33467, "", "=q4=Blade of Twisted Visions", "=ds=#w10#", "", "8.33%" };
    { 19, 33468, "", "=q4=Dark Blessing", "=ds=#w6#", "", "8.33%" };
    { 20, 33469, "", "=q4=Hauberk of the Empire's Champion", "=ds=#a3#", "", "8.33%" };
    { 21, 33471, "", "=q4=Two-toed Sandals", "=ds=#a1#", "", "8.33%" };
    { 22, 33473, "", "=q4=Chestguard of the Warlord", "=ds=#a4#", "", "8.33%" };
    { 23, 33474, "", "=q4=Ancient Amani Longbow", "=ds=#w2#", "", "8.33%" };
    { 24, 33476, "", "=q4=Cleaver of the Unforgiving", "=ds=#w1#", "", "8.33%" };
    { 25, 33478, "", "=q4=Jin'rohk, The Great Apocalypse", "=ds=#w10#", "", "8.33%" };
    { 26, 33479, "", "=q4=Grimgrin Faceguard", "=ds=#a2#", "", "8.33%" };
    { 27, 33830, "", "=q4=Ancient Aqir Artifact", "=ds=#s14#", "", "8.33%" };
    { 28, 33831, "", "=q4=Berserker's Call", "=ds=#s14#", "", "8.33%" };
	};

	AtlasLoot_Data["ZATimedChest"] = {
		{ 1, 0, "INV_Box_01", "=q6=#x30#", ""};
		{ 2, 33590, "", "=q4=Cloak of Fiends", "=ds=#s4#", "", "10%"};
		{ 3, 33591, "", "=q4=Shadowcaster's Drape", "=ds=#s4#", "", "11%"};
		{ 4, 33489, "", "=q4=Mantle of Ill Intent", "=ds=#s3#, #a1#", "", "11%"};
		{ 5, 33480, "", "=q4=Cord of Braided Troll Hair", "=ds=#s10#, #a1#", "", "10%"};
		{ 6, 33483, "", "=q4=Life-step Belt", "=ds=#s10#, #a2#", "", "12%"};
		{ 7, 33971, "", "=q4=Elunite Imbued Leggings", "=ds=#s11#, #a2#", "", "10%"};
		{ 8, 33805, "", "=q4=Shadowhunter's Treads", "=ds=#s12#, #a3#", "", "10%"};
		{ 9, 33481, "", "=q4=Pauldrons of Stone Resolve", "=ds=#s3#, #a4#", "", "11%"};
		{ 16, 0, "INV_Box_01", "=q6=#x31#", ""};
		{ 17, 33495, "", "=q4=Rage", "=ds=#h3#, #w13#", "", "12%"};
		{ 18, 33493, "", "=q4=Umbral Shiv", "=ds=#h1#, #w4#", "", "12%"};
		{ 19, 33492, "", "=q4=Trollbane", "=ds=#h2#, #w1#", "", "11%"};
		{ 20, 33490, "", "=q4=Staff of Dark Mending", "=ds=#w9#", "", "13%"};
		{ 21, 33494, "", "=q4=Amani Divining Staff", "=ds=#w9#", "", "11%"};
		{ 22, 33491, "", "=q4=Tuskbreaker", "=ds=#w5#", "", "12%"};
		{ 24, 0, "INV_Box_01", "=q6=#x32#", ""};
		{ 25, 33497, "", "=q4=Mana Attuned Band", "=ds=#s13#", "", "18%"};
		{ 26, 33500, "", "=q4=Signet of Eternal Life", "=ds=#s13#", "", "20%"};
		{ 27, 33496, "", "=q4=Signet of Primal Wrath", "=ds=#s13#", "", "23%"};
		{ 28, 33499, "", "=q4=Signet of the Last Defender", "=ds=#s13#", "", "18%"};
		{ 29, 33498, "", "=q4=Signet of the Quiet Forest", "=ds=#s13#", "", "21%"};
	};

	AtlasLoot_Data["ZATrash"] = {
		{ 1, 33993, "", "=q3=Mojo", "=ds=#e13#"};
		{ 3, 33865, "", "=q2=Amani Hex Stick", "=ds=#m20#", "", "40%"};
		{ 4, 33930, "", "=q2=Amani Charm of the Bloodletter", "=ds=#m26#", "", "25%"};
		{ 5, 33932, "", "=q2=Amani Charm of the Witch Doctor", "=ds=#m26#", "", "24%"};
		{ 6, 33931, "", "=q2=Amani Charm of Mighty Mojo", "=ds=#m26#", "", "25%"};
		{ 7, 33933, "", "=q2=Amani Charm of the Raging Defender", "=ds=#m26#", "", "25%"};
	};

	AtlasLoot_Data["HCRampOmor"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Omor the Unscarred", "=q5=ALL WILL DROP"};
    { 2, 23886, "", "=q1=Omor's Hoof", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Omor the Unscarred", "=q5=ONE WILL DROP"};
    { 5, 24069, "", "=q3=Crystalfire Staff", "=ds=#w9#", "", "16.7%" };
    { 6, 24073, "", "=q3=Garrote-String Necklace", "=ds=#s2#", "", "16.7%" };
    { 7, 24090, "", "=q3=Bloodstained Ravager Gauntlets", "=ds=#a3#", "", "16.7%" };
    { 8, 24091, "", "=q3=Tenacious Defender", "=ds=#a4#", "", "16.7%" };
    { 9, 24094, "", "=q3=Heart Fire Warhammer", "=ds=#w6#", "", "16.7%" };
    { 10, 24096, "", "=q3=Heartblood Prayer Beads", "=ds=#s2#", "", "16.7%" };
	};

	AtlasLoot_Data["HCRampOmorHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Omor the Unscarred (1)", "=q5=ALL WILL DROP"};
    { 2, 23886, "", "=q1=Omor's Hoof", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 6, 0, "AO_Unknown", "=q6=Omor the Unscarred (1)", "=q5=ONE WILL DROP"};
    { 7, 27476, "", "=q3=Truncheon of Five Hells", "=ds=#w6#", "", "16.7%" };
    { 8, 27477, "", "=q3=Faol's Signet of Cleansing", "=ds=#s15#", "", "16.7%" };
    { 9, 27478, "", "=q3=Girdle of the Blasted Reaches", "=ds=#a3#", "", "16.7%" };
    { 10, 27539, "", "=q3=Justice Bearer's Pauldrons", "=ds=#a4#", "", "16.7%" };
    { 11, 27895, "", "=q3=Band of Many Prisms", "=ds=#s13#", "", "16.7%" };
    { 12, 27906, "", "=q3=Crimsonforge Breastplate", "=ds=#a4#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Omor the Unscarred (1)", "=q5=ONE WILL DROP"};
    { 17, 27462, "", "=q3=Crimson Bracers of Gloom", "=ds=#a1#", "", "16.7%" };
    { 18, 27463, "", "=q3=Terror Flame Dagger", "=ds=#w4#", "", "16.7%" };
    { 19, 27464, "", "=q3=Omor's Unyielding Will", "=ds=#s2#", "", "16.7%" };
    { 20, 27465, "", "=q3=Mana-Etched Gloves", "=ds=#a1#", "", "16.7%" };
    { 21, 27466, "", "=q3=Headdress of Alacrity", "=ds=#a1#", "", "16.7%" };
    { 22, 27467, "", "=q3=Silent-Strider Kneeboots", "=ds=#a2#", "", "16.7%" };
	};

	AtlasLoot_Data["HCHallsNethekurse"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Grand Warlock Nethekurse", "=q5=ALL WILL DROP"};
    { 2, 23735, "", "=q1=Grand Warlock's Amulet", "=ds=#m3#", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Grand Warlock Nethekurse", "=q5=CHANCE TO DROP"};
    { 5, 24312, "", "=q4=Pattern: Spellstrike Hood", "=ds=#e2#", "", "10.0%" };
    { 7, 0, "AO_Unknown", "=q6=Grand Warlock Nethekurse", "=q5=ONE WILL DROP"};
    { 8, 27517, "", "=q3=Bands of Nethekurse", "=ds=#a1#", "", "20.0%" };
    { 9, 27518, "", "=q3=Ivory Idol of the Moongoddess", "", "", "20.0%" };
    { 10, 27519, "", "=q3=Cloak of Malice", "=ds=#a1#", "", "20.0%" };
    { 11, 27520, "", "=q3=Greathelm of the Unbreakable", "=ds=#a4#", "", "20.0%" };
    { 12, 27521, "", "=q3=Telaari Hunting Girdle", "=ds=#a3#", "", "20.0%" };
	};

	AtlasLoot_Data["HCHallsNethekurseHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Grand Warlock Nethekurse (1)", "=q5=ALL WILL DROP"};
    { 2, 23735, "", "=q1=Grand Warlock's Amulet", "=ds=#m3#", "", "100%" };
    { 3, 25462, "", "=q1=Tome of Dusk", "=ds=#m3#", "", "100%" };
    { 4, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 6, 0, "RoM_stellar_dice", "=q6=Grand Warlock Nethekurse (1)", "=q5=CHANCE TO DROP"};
    { 7, 24312, "", "=q4=Pattern: Spellstrike Hood", "=ds=#e2#", "", "10.0%" };
    { 9, 0, "AO_Unknown", "=q6=Grand Warlock Nethekurse (1)", "=q5=ONE WILL DROP"};
    { 10, 27517, "", "=q3=Bands of Nethekurse", "=ds=#a1#", "", "20.0%" };
    { 11, 27518, "", "=q3=Ivory Idol of the Moongoddess", "", "", "20.0%" };
    { 12, 27519, "", "=q3=Cloak of Malice", "=ds=#a1#", "", "20.0%" };
    { 13, 27520, "", "=q3=Greathelm of the Unbreakable", "=ds=#a4#", "", "20.0%" };
    { 14, 27521, "", "=q3=Telaari Hunting Girdle", "=ds=#a3#", "", "20.0%" };
	};

	AtlasLoot_Data["HCHallsPorung"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Blood Guard Porung", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Blood Guard Porung", "=q5=ONE WILL DROP"};
    { 5, 30705, "", "=q3=Spaulders of Slaughter", "=ds=#a4#", "", "20.0%" };
    { 6, 30707, "", "=q3=Nimble-foot Treads", "=ds=#a2#", "", "20.0%" };
    { 7, 30708, "", "=q3=Belt of Flowing Thought", "=ds=#a3#", "", "20.0%" };
    { 8, 30709, "", "=q3=Pantaloons of Flaming Wrath", "=ds=#a1#", "", "20.0%" };
    { 9, 30710, "", "=q3=Blood Guard's Necklace of Ferocity", "=ds=#s2#", "", "20.0%" };
    { 11, 0, "AO_Unknown", "=q6=Blood Guard Porung", "=q5=ONE WILL DROP"};
    { 12, 21877, "", "=q1=Netherweave Cloth", "=ds=#e7#", "", "50.0%" };
    { 13, 27854, "", "=q1=Smoked Talbuk Venison", "=ds=#e0#", "", "50.0%" };
	};

	AtlasLoot_Data["HCHallsOmrogg"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Warbringer O'mrogg", "=q5=ALL WILL DROP"};
    { 2, 30829, "", "=q1=Tear of the Earthmother", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Warbringer O'mrogg", "=q5=ONE WILL DROP"};
    { 5, 27524, "", "=q3=Firemaul of Destruction", "=ds=#w6#", "", "20.0%" };
    { 6, 27525, "", "=q3=Jeweled Boots of Sanctification", "=ds=#a1#", "", "20.0%" };
    { 7, 27526, "", "=q3=Skyfire Hawk-Bow", "=ds=#w2#", "", "20.0%" };
    { 8, 27802, "", "=q3=Tidefury Shoulderguards", "=ds=#a3#", "", "20.0%" };
    { 9, 27868, "", "=q3=Runesong Dagger", "=ds=#w4#", "", "20.0%" };
	};

	AtlasLoot_Data["HCHallsOmroggHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Warbringer O'mrogg (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 30829, "", "=q1=Tear of the Earthmother", "=ds=#m3#", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Warbringer O'mrogg (1)", "=q5=ONE WILL DROP"};
    { 6, 21877, "", "=q1=Netherweave Cloth", "=ds=#e7#", "", "50.0%" };
    { 7, 27854, "", "=q1=Smoked Talbuk Venison", "=ds=#e0#", "", "50.0%" };
    { 9, 0, "AO_Unknown", "=q6=Warbringer O'mrogg (1)", "=q5=ONE WILL DROP"};
    { 10, 27524, "", "=q3=Firemaul of Destruction", "=ds=#w6#", "", "20.0%" };
    { 11, 27525, "", "=q3=Jeweled Boots of Sanctification", "=ds=#a1#", "", "20.0%" };
    { 12, 27526, "", "=q3=Skyfire Hawk-Bow", "=ds=#w2#", "", "20.0%" };
    { 13, 27802, "", "=q3=Tidefury Shoulderguards", "=ds=#a3#", "", "20.0%" };
    { 14, 27868, "", "=q3=Runesong Dagger", "=ds=#w4#", "", "20.0%" };
	};

	AtlasLoot_Data["HCHallsKargath"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Warchief Kargath Bladefist", "=q5=ALL WILL DROP"};
    { 2, 23723, "", "=q1=Warchief Kargath's Fist", "=ds=#m3#", "", "100%" };
    { 3, 901740, "", "=q1=Warchief Insignia", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Warchief Kargath Bladefist", "=q5=CHANCE TO DROP"};
    { 6, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "5.00%" };
    { 16, 0, "AO_Unknown", "=q6=Warchief Kargath Bladefist", "=q5=ONE WILL DROP"};
    { 17, 27474, "", "=q3=Beast Lord Handguards", "=ds=#a3#", "", "8.33%" };
    { 18, 27527, "", "=q3=Greaves of the Shatterer", "=ds=#a4#", "", "8.33%" };
    { 19, 27528, "", "=q3=Gauntlets of Desolation", "=ds=#a3#", "", "8.33%" };
    { 20, 27529, "", "=q3=Figurine of the Colossus", "=ds=#s14#", "", "8.33%" };
    { 21, 27531, "", "=q3=Wastewalker Gloves", "=ds=#a2#", "", "8.33%" };
    { 22, 27533, "", "=q3=Demonblood Eviscerator", "=ds=#w13#", "", "8.33%" };
    { 23, 27534, "", "=q3=Hortus' Seal of Brilliance", "=ds=#s15#", "", "8.33%" };
    { 24, 27535, "", "=q3=Gauntlets of the Righteous", "=ds=#a4#", "", "8.33%" };
    { 25, 27536, "", "=q3=Hallowed Handwraps", "=ds=#a1#", "", "8.33%" };
    { 26, 27537, "", "=q3=Gloves of Oblivion", "=ds=#a1#", "", "8.33%" };
    { 27, 27538, "", "=q3=Lightsworn Hammer", "=ds=#w6#", "", "8.33%" };
    { 28, 27540, "", "=q3=Nexus Torch", "=ds=#w12#", "", "8.33%" };
	};

	AtlasLoot_Data["HCHallsKargathHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Warchief Kargath Bladefist (1)", "=q5=ALL WILL DROP"};
    { 2, 23723, "", "=q1=Warchief Kargath's Fist", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 33815, "", "=q1=Bladefist's Seal", "=ds=#m3#", "", "100%" };
    { 5, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Warchief Kargath Bladefist (1)", "=q5=CHANCE TO DROP"};
    { 8, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 10, 0, "AO_Unknown", "=q6=Warchief Kargath Bladefist (1)", "=q5=ONE WILL DROP"};
    { 11, 29254, "", "=q4=Boots of the Righteous Path", "=ds=#a4#", "", "25.0%" };
    { 12, 29255, "", "=q4=Bands of Rarefied Magic", "=ds=#a1#", "", "25.0%" };
    { 13, 29263, "", "=q4=Forestheart Bracers", "=ds=#a2#", "", "25.0%" };
    { 14, 29348, "", "=q4=The Bladefist", "=ds=#w13#", "", "25.0%" };
    { 16, 0, "AO_Unknown", "=q6=Warchief Kargath Bladefist (1)", "=q5=ONE WILL DROP"};
    { 17, 27474, "", "=q3=Beast Lord Handguards", "=ds=#a3#", "", "8.33%" };
    { 18, 27527, "", "=q3=Greaves of the Shatterer", "=ds=#a4#", "", "8.33%" };
    { 19, 27528, "", "=q3=Gauntlets of Desolation", "=ds=#a3#", "", "8.33%" };
    { 20, 27529, "", "=q3=Figurine of the Colossus", "=ds=#s14#", "", "8.33%" };
    { 21, 27531, "", "=q3=Wastewalker Gloves", "=ds=#a2#", "", "8.33%" };
    { 22, 27533, "", "=q3=Demonblood Eviscerator", "=ds=#w13#", "", "8.33%" };
    { 23, 27534, "", "=q3=Hortus' Seal of Brilliance", "=ds=#s15#", "", "8.33%" };
    { 24, 27535, "", "=q3=Gauntlets of the Righteous", "=ds=#a4#", "", "8.33%" };
    { 25, 27536, "", "=q3=Hallowed Handwraps", "=ds=#a1#", "", "8.33%" };
    { 26, 27537, "", "=q3=Gloves of Oblivion", "=ds=#a1#", "", "8.33%" };
    { 27, 27538, "", "=q3=Lightsworn Hammer", "=ds=#w6#", "", "8.33%" };
    { 28, 27540, "", "=q3=Nexus Torch", "=ds=#w12#", "", "8.33%" };
	};

	AtlasLoot_Data["HCHallsTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Trash Mobs"], "=q5="..BabbleZone["The Shattered Halls"]};
		{ 2, 0, "INV_Box_01", "=q6=Trash loot not yet configured", ""};
	};

	AtlasLoot_Data["AuchShadowHellmaw"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Ambassador Hellmaw", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Ambassador Hellmaw", "=q5=ONE WILL DROP"};
    { 5, 27884, "", "=q3=Ornate Boots of the Sanctified", "=ds=#a4#", "", "16.7%" };
    { 6, 27885, "", "=q3=Soul-Wand of the Aldor", "=ds=#w12#", "", "16.7%" };
    { 7, 27886, "", "=q3=Idol of the Emerald Queen", "", "", "16.7%" };
    { 8, 27887, "", "=q3=Platinum Shield of the Valorous", "=ds=#w8#", "", "16.7%" };
    { 9, 27888, "", "=q3=Dream-Wing Helm", "=ds=#a3#", "", "16.7%" };
    { 10, 27889, "", "=q3=Jaedenfire Gloves of Annihilation", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchShadowHellmawHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Ambassador Hellmaw (1)", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Ambassador Hellmaw (1)", "=q5=ONE WILL DROP"};
    { 6, 27884, "", "=q3=Ornate Boots of the Sanctified", "=ds=#a4#", "", "16.7%" };
    { 7, 27885, "", "=q3=Soul-Wand of the Aldor", "=ds=#w12#", "", "16.7%" };
    { 8, 27886, "", "=q3=Idol of the Emerald Queen", "", "", "16.7%" };
    { 9, 27887, "", "=q3=Platinum Shield of the Valorous", "=ds=#w8#", "", "16.7%" };
    { 10, 27888, "", "=q3=Dream-Wing Helm", "=ds=#a3#", "", "16.7%" };
    { 11, 27889, "", "=q3=Jaedenfire Gloves of Annihilation", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchShadowBlackheart"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Blackheart the Inciter", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 30808, "", "=q1=Book of Fel Names", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Blackheart the Inciter", "=q5=CHANCE TO DROP"};
    { 6, 25728, "", "=q3=Pattern: Stylin' Purple Hat", "=ds=#e2#", "", "10.0%" };
    { 8, 0, "AO_Unknown", "=q6=Blackheart the Inciter", "=q5=ONE WILL DROP"};
    { 9, 27468, "", "=q3=Moonglade Handwraps", "=ds=#a2#", "", "16.7%" };
    { 10, 27890, "", "=q3=Wand of the Netherwing", "=ds=#w12#", "", "16.7%" };
    { 11, 27891, "", "=q3=Adamantine Figurine", "=ds=#s14#", "", "16.7%" };
    { 12, 27892, "", "=q3=Cloak of the Inciter", "=ds=#a1#", "", "16.7%" };
    { 13, 27893, "", "=q3=Ornate Leggings of the Venerated", "=ds=#a4#", "", "16.7%" };
    { 14, 28134, "", "=q3=Brooch of Heightened Potential", "=ds=#s2#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchShadowBlackheartHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Blackheart the Inciter (1)", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 30808, "", "=q1=Book of Fel Names", "=ds=#m3#", "", "100%" };
    { 6, 0, "RoM_stellar_dice", "=q6=Blackheart the Inciter (1)", "=q5=CHANCE TO DROP"};
    { 7, 25728, "", "=q3=Pattern: Stylin' Purple Hat", "=ds=#e2#", "", "10.0%" };
    { 9, 0, "AO_Unknown", "=q6=Blackheart the Inciter (1)", "=q5=ONE WILL DROP"};
    { 10, 27468, "", "=q3=Moonglade Handwraps", "=ds=#a2#", "", "16.7%" };
    { 11, 27890, "", "=q3=Wand of the Netherwing", "=ds=#w12#", "", "16.7%" };
    { 12, 27891, "", "=q3=Adamantine Figurine", "=ds=#s14#", "", "16.7%" };
    { 13, 27892, "", "=q3=Cloak of the Inciter", "=ds=#a1#", "", "16.7%" };
    { 14, 27893, "", "=q3=Ornate Leggings of the Venerated", "=ds=#a4#", "", "16.7%" };
    { 15, 28134, "", "=q3=Brooch of Heightened Potential", "=ds=#s2#", "", "16.7%" };
	};

	AtlasLoot_Data["AuchShadowGrandmaster"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Grandmaster Vorpil", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 30827, "", "=q1=Lexicon Demonica", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Grandmaster Vorpil", "=q5=CHANCE TO DROP"};
    { 6, 57474, "", "=q3=Technique: Scroll of Shadow Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 7, 100004, "", "=q3=Codex: Prayer of Spirit II", "=ds=#e2#", "", "12.0%" };
    { 9, 0, "AO_Unknown", "=q6=Grandmaster Vorpil", "=q5=ONE WILL DROP"};
    { 10, 27775, "", "=q3=Hallowed Pauldrons", "=ds=#a1#", "", "20.0%" };
    { 11, 27897, "", "=q3=Breastplate of Many Graces", "=ds=#a4#", "", "20.0%" };
    { 12, 27898, "", "=q3=Wrathfire Hand-Cannon", "=ds=#w5#", "", "20.0%" };
    { 13, 27900, "", "=q3=Jewel of Charismatic Mystique", "=ds=#s14#", "", "20.0%" };
    { 14, 27901, "", "=q3=Blackout Truncheon", "=ds=#w6#", "", "20.0%" };
	};

	AtlasLoot_Data["AuchShadowGrandmasterHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Grandmaster Vorpil (1)", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 30827, "", "=q1=Lexicon Demonica", "=ds=#m3#", "", "100%" };
    { 6, 0, "RoM_stellar_dice", "=q6=Grandmaster Vorpil (1)", "=q5=CHANCE TO DROP"};
    { 7, 57474, "", "=q3=Technique: Scroll of Shadow Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 8, 100004, "", "=q3=Codex: Prayer of Spirit II", "=ds=#e2#", "", "25.0%" };
    { 10, 0, "AO_Unknown", "=q6=Grandmaster Vorpil (1)", "=q5=ONE WILL DROP"};
    { 11, 27775, "", "=q3=Hallowed Pauldrons", "=ds=#a1#", "", "20.0%" };
    { 12, 27897, "", "=q3=Breastplate of Many Graces", "=ds=#a4#", "", "20.0%" };
    { 13, 27898, "", "=q3=Wrathfire Hand-Cannon", "=ds=#w5#", "", "20.0%" };
    { 14, 27900, "", "=q3=Jewel of Charismatic Mystique", "=ds=#s14#", "", "20.0%" };
    { 15, 27901, "", "=q3=Blackout Truncheon", "=ds=#w6#", "", "20.0%" };
	};

	AtlasLoot_Data["AuchShadowMurmur"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Murmur", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 901739, "", "=q1=Primordial Essence", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=Murmur", "=q5=CHANCE TO DROP"};
    { 6, 57474, "", "=q3=Technique: Scroll of Shadow Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 7, 24309, "", "=q4=Pattern: Spellstrike Pants", "=ds=#e2#", "", "10.0%" };
    { 8, 100004, "", "=q3=Codex: Prayer of Spirit II", "=ds=#e2#", "", "10.0%" };
    { 9, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "5.00%" };
    { 16, 0, "AO_Unknown", "=q6=Murmur", "=q5=ONE WILL DROP"};
    { 17, 27778, "", "=q3=Spaulders of Oblivion", "=ds=#a1#", "", "8.33%" };
    { 18, 27803, "", "=q3=Shoulderguards of the Bold", "=ds=#a4#", "", "8.33%" };
    { 19, 27902, "", "=q3=Silent Slippers of Meditation", "=ds=#a1#", "", "8.33%" };
    { 20, 27903, "", "=q3=Sonic Spear", "=ds=#w7#", "", "8.33%" };
    { 21, 27905, "", "=q3=Greatsword of Horrid Dreams", "=ds=#w10#", "", "8.33%" };
    { 22, 27908, "", "=q3=Leggings of Assassination", "=ds=#a2#", "", "8.33%" };
    { 23, 27909, "", "=q3=Tidefury Kilt", "=ds=#a3#", "", "8.33%" };
    { 24, 27910, "", "=q3=Silvermoon Crest Shield", "=ds=#w8#", "", "8.33%" };
    { 25, 27912, "", "=q3=Harness of the Deep Currents", "=ds=#a3#", "", "8.33%" };
    { 26, 27913, "", "=q3=Whispering Blade of Slaying", "=ds=#w4#", "", "8.33%" };
    { 27, 28230, "", "=q3=Hallowed Garments", "=ds=#a1#", "", "8.33%" };
    { 28, 28232, "", "=q3=Robe of Oblivion", "=ds=#a1#", "", "8.33%" };
	};

	AtlasLoot_Data["AuchShadowMurmurHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Murmur (1)", "=q5=ALL WILL DROP"};
    { 2, 28558, "", "=q1=Spirit Shard", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 31722, "", "=q1=Murmur's Essence", "=ds=#m3#", "", "100%" };
    { 5, 33840, "", "=q1=Murmur's Whisper", "=ds=#m3#", "", "100%" };
    { 6, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 8, 0, "RoM_stellar_dice", "=q6=Murmur (1)", "=q5=CHANCE TO DROP"};
    { 9, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "46.0%" };
    { 10, 57474, "", "=q3=Technique: Scroll of Shadow Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 11, 100004, "", "=q3=Codex: Prayer of Spirit II", "=ds=#e2#", "", "25.0%" };
    { 12, 24309, "", "=q4=Pattern: Spellstrike Pants", "=ds=#e2#", "", "10.0%" };
    { 14, 0, "AO_Unknown", "=q6=Murmur (1)", "=q5=ONE WILL DROP"};
    { 15, 29261, "", "=q4=Girdle of Ferocity", "=ds=#a3#", "", "25.0%" };
    { 16, 29353, "", "=q4=Shockwave Truncheon", "=ds=#w6#", "", "25.0%" };
    { 17, 29357, "", "=q4=Master Thief's Gloves", "=ds=#a2#", "", "25.0%" };
    { 18, 30532, "", "=q4=Kirin Tor Master's Trousers", "=ds=#a1#", "", "25.0%" };
	};

	AtlasLoot_Data["AuchTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Trash Mobs"], "=q5="..BabbleZone["Auchenai Crypts"]};
		{ 2, 23615, "", "=q3=Plans: Swiftsteel Gloves", "=ds=#p2# (365)", "", ""};
		{ 3, 22543, "", "=q2=Formula: Enchant Boots - Fortitude", "=ds=#p4# (320)", "", ""};
		{ 5, 25731, "", "=q3=Pattern: Stylin' Crimson Hat", "=ds=#p7# (350)", "", ""};
		{ 6, 29669, "", "=q2=Pattern: Shadow Armor Kit", "=ds=#p7# (340)", "", ""};
		{ 8, 27634, "", "=q1=The Saga of Terokk", "=ds=#m3#", "", ""};
		{ 10, 23605, "", "=q3=Plans: Felsteel Gloves", "=ds=#p2# (360)", "", ""};
		{ 11, 22544, "", "=q2=Formula: Enchant Boots - Dexterity", "=ds=#p4# (340)", "", ""};
		{ 13, 23607, "", "=q3=Plans: Felsteel Helm", "=ds=#p2# (365)", "", ""};
		{ 15, 24514, "", "=q1=First Key Fragment", "=ds=#m3#", "", ""};
	};

	AtlasLoot_Data["TKMechSepethrea"] = {
    { 1, 0, "RoM_stellar_dice", "=q6=Nethermancer Sepethrea", "=q5=CHANCE TO DROP"};
    { 2, 22920, "", "=q2=Recipe: Major Fire Protection Potion", "=ds=#e2#", "", "10.0%" };
    { 4, 0, "AO_Unknown", "=q6=Nethermancer Sepethrea", "=q5=ONE WILL DROP"};
    { 5, 28258, "", "=q3=Nethershrike", "=ds=#w11#", "", "20.0%" };
    { 6, 28259, "", "=q3=Cosmic Lifeband", "=ds=#s13#", "", "20.0%" };
    { 7, 28260, "", "=q3=Manual of the Nethermancer", "=ds=#s15#", "", "20.0%" };
    { 8, 28262, "", "=q3=Jade-Skull Breastplate", "=ds=#a4#", "", "20.0%" };
    { 9, 28263, "", "=q3=Stellaris", "=ds=#w1#", "", "20.0%" };
	};

	AtlasLoot_Data["TKMechSepethreaHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Nethermancer Sepethrea (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Nethermancer Sepethrea (1)", "=q5=CHANCE TO DROP"};
    { 5, 22920, "", "=q2=Recipe: Major Fire Protection Potion", "=ds=#e2#", "", "10.0%" };
    { 7, 0, "AO_Unknown", "=q6=Nethermancer Sepethrea (1)", "=q5=ONE WILL DROP"};
    { 8, 28258, "", "=q3=Nethershrike", "=ds=#w11#", "", "20.0%" };
    { 9, 28259, "", "=q3=Cosmic Lifeband", "=ds=#s13#", "", "20.0%" };
    { 10, 28260, "", "=q3=Manual of the Nethermancer", "=ds=#s15#", "", "20.0%" };
    { 11, 28262, "", "=q3=Jade-Skull Breastplate", "=ds=#a4#", "", "20.0%" };
    { 12, 28263, "", "=q3=Stellaris", "=ds=#w1#", "", "20.0%" };
	};

	AtlasLoot_Data["TKBotFreywinn"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=High Botanist Freywinn", "=q5=ALL WILL DROP"};
    { 2, 31744, "", "=q1=Botanist's Field Guide", "=ds=#m3#", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=High Botanist Freywinn", "=q5=CHANCE TO DROP"};
    { 5, 57464, "", "=q3=Technique: Scroll of Frost Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 6, 23617, "", "=q3=Plans: Earthpeace Breastplate", "=ds=#e2#", "", "10.0%" };
    { 8, 0, "AO_Unknown", "=q6=High Botanist Freywinn", "=q5=ONE WILL DROP"};
    { 9, 28315, "", "=q3=Stormreaver Warblades", "=ds=#w13#", "", "20.0%" };
    { 10, 28316, "", "=q3=Aegis of the Sunbird", "=ds=#w8#", "", "20.0%" };
    { 11, 28317, "", "=q3=Energis Armwraps", "=ds=#a1#", "", "20.0%" };
    { 12, 28318, "", "=q3=Obsidian Clodstompers", "=ds=#a4#", "", "20.0%" };
    { 13, 28321, "", "=q3=Enchanted Thorium Torque", "=ds=#s2#", "", "20.0%" };
	};

	AtlasLoot_Data["TKBotFreywinnHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=High Botanist Freywinn (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 31744, "", "=q1=Botanist's Field Guide", "=ds=#m3#", "", "100%" };
    { 5, 0, "RoM_stellar_dice", "=q6=High Botanist Freywinn (1)", "=q5=CHANCE TO DROP"};
    { 6, 57464, "", "=q3=Technique: Scroll of Frost Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 7, 23617, "", "=q3=Plans: Earthpeace Breastplate", "=ds=#e2#", "", "14.0%" };
    { 9, 0, "AO_Unknown", "=q6=High Botanist Freywinn (1)", "=q5=ONE WILL DROP"};
    { 10, 28315, "", "=q3=Stormreaver Warblades", "=ds=#w13#", "", "20.0%" };
    { 11, 28316, "", "=q3=Aegis of the Sunbird", "=ds=#w8#", "", "20.0%" };
    { 12, 28317, "", "=q3=Energis Armwraps", "=ds=#a1#", "", "20.0%" };
    { 13, 28318, "", "=q3=Obsidian Clodstompers", "=ds=#a4#", "", "20.0%" };
    { 14, 28321, "", "=q3=Enchanted Thorium Torque", "=ds=#s2#", "", "20.0%" };
	};

	AtlasLoot_Data["TKBotLaj"] = {
    { 1, 0, "AO_Unknown", "=q6=Laj", "=q5=ONE WILL DROP"};
    { 2, 27739, "", "=q3=Spaulders of the Righteous", "=ds=#a4#", "", "20.0%" };
    { 3, 28328, "", "=q3=Mithril-Bark Cloak", "=ds=#a1#", "", "20.0%" };
    { 4, 28338, "", "=q3=Devil-Stitched Leggings", "=ds=#a1#", "", "20.0%" };
    { 5, 28339, "", "=q3=Boots of the Shifting Sands", "=ds=#a2#", "", "20.0%" };
    { 6, 28340, "", "=q3=Mantle of Autumn", "=ds=#a2#", "", "20.0%" };
	};

	AtlasLoot_Data["TKBotLajHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Laj (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Laj (1)", "=q5=ONE WILL DROP"};
    { 5, 27739, "", "=q3=Spaulders of the Righteous", "=ds=#a4#", "", "20.0%" };
    { 6, 28328, "", "=q3=Mithril-Bark Cloak", "=ds=#a1#", "", "20.0%" };
    { 7, 28338, "", "=q3=Devil-Stitched Leggings", "=ds=#a1#", "", "20.0%" };
    { 8, 28339, "", "=q3=Boots of the Shifting Sands", "=ds=#a2#", "", "20.0%" };
    { 9, 28340, "", "=q3=Mantle of Autumn", "=ds=#a2#", "", "20.0%" };
	};

	AtlasLoot_Data["SMTVexallus"] = {
    { 1, 0, "AO_Unknown", "=q6=Vexallus", "=q5=ONE WILL DROP"};
    { 2, 34703, "", "=q3=Latro's Dancing Blade", "=ds=#w10#", "", "16.7%" };
    { 3, 34704, "", "=q3=Band of Arcane Alacrity", "=ds=#s13#", "", "16.7%" };
    { 4, 34705, "", "=q3=Bracers of Divine Infusion", "=ds=#a1#", "", "16.7%" };
    { 5, 34706, "", "=q3=Band of Determination", "=ds=#s13#", "", "16.7%" };
    { 6, 34707, "", "=q3=Boots of Resuscitation", "=ds=#a2#", "", "16.7%" };
    { 7, 34708, "", "=q3=Cloak of the Coming Night", "=ds=#a1#", "", "16.7%" };
	};

	AtlasLoot_Data["SMTVexallusHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Vexallus (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Vexallus (1)", "=q5=ONE WILL DROP"};
    { 5, 34605, "", "=q4=Breastplate of Fierce Survival", "=ds=#a4#", "", "25.0%" };
    { 6, 34606, "", "=q4=Edge of Oppression", "=ds=#w4#", "", "25.0%" };
    { 7, 34607, "", "=q4=Fel-tinged Mantle", "=ds=#a1#", "", "25.0%" };
    { 8, 34608, "", "=q4=Rod of the Blazing Light", "=ds=#w9#", "", "25.0%" };
	};

	AtlasLoot_Data["GruulsLairHighKingMaulgar"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=High King Maulgar", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=High King Maulgar", "=q5=ONE WILL DROP"};
    { 5, 28795, "", "=q4=Bladespire Warbands", "=ds=#a4#", "", "16.7%" };
    { 6, 28796, "", "=q4=Malefic Mask of the Shadows", "=ds=#a2#", "", "16.7%" };
    { 7, 28797, "", "=q4=Brute Cloak of the Ogre-Magi", "=ds=#a1#", "", "16.7%" };
    { 8, 28799, "", "=q4=Belt of Divine Inspiration", "=ds=#a1#", "", "16.7%" };
    { 9, 28800, "", "=q4=Hammer of the Naaru", "=ds=#w6#", "", "16.7%" };
    { 10, 28801, "", "=q4=Maulgar's Warhelm", "=ds=#a3#", "", "16.7%" };
    { 12, 0, "AO_Unknown", "=q6=High King Maulgar", "=q5=ONE WILL DROP"};
    { 13, 29762, "", "=q4=Pauldrons of the Fallen Hero", "=ds=#e10#", "", "33.3%" };
    { 14, 29763, "", "=q4=Pauldrons of the Fallen Champion", "=ds=#e10#", "", "33.3%" };
    { 15, 29764, "", "=q4=Pauldrons of the Fallen Defender", "=ds=#e10#", "", "33.3%" };
	};

	AtlasLoot_Data["GruulGruul"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Gruul the Dragonkiller", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 29765, "", "=q4=Leggings of the Fallen Hero", "=ds=#e10#", "", "100%" };
    { 4, 29766, "", "=q4=Leggings of the Fallen Champion", "=ds=#e10#", "", "100%" };
    { 5, 29767, "", "=q4=Leggings of the Fallen Defender", "=ds=#e10#", "", "100%" };
    { 6, 31750, "", "=q1=Earthen Signet", "=ds=#m3#", "", "100%" };
    { 16, 0, "AO_Unknown", "=q6=Gruul the Dragonkiller", "=q5=ONE WILL DROP"};
    { 17, 28794, "", "=q4=Axe of the Gronn Lords", "=ds=#w1#", "", "7.69%" };
    { 18, 28802, "", "=q4=Bloodmaw Magus-Blade", "=ds=#w10#", "", "7.69%" };
    { 19, 28803, "", "=q4=Cowl of Nature's Breath", "=ds=#a2#", "", "7.69%" };
    { 20, 28804, "", "=q4=Collar of Cho'gall", "=ds=#a1#", "", "7.69%" };
    { 21, 28810, "", "=q4=Windshear Boots", "=ds=#a3#", "", "7.69%" };
    { 22, 28822, "", "=q4=Teeth of Gruul", "=ds=#s2#", "", "7.69%" };
    { 23, 28823, "", "=q4=Eye of Gruul", "=ds=#s14#", "", "7.69%" };
    { 24, 28824, "", "=q4=Gauntlets of Martial Perfection", "=ds=#a4#", "", "7.69%" };
    { 25, 28825, "", "=q4=Aldori Legacy Defender", "=ds=#w8#", "", "7.69%" };
    { 26, 28826, "", "=q4=Shuriken of Negation", "=ds=#w11#", "", "7.69%" };
    { 27, 28827, "", "=q4=Gauntlets of the Dragonslayer", "=ds=#a3#", "", "7.69%" };
    { 28, 28828, "", "=q4=Gronn-Stitched Girdle", "=ds=#a2#", "", "7.69%" };
    { 29, 28830, "", "=q4=Dragonspine Trophy", "=ds=#s14#", "", "7.69%" };
	};

	AtlasLoot_Data["BTNajentus"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=High Warlord Naj'entus", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=High Warlord Naj'entus", "=q5=ONE WILL DROP"};
    { 5, 32232, "", "=q4=Eternium Shell Bracers", "=ds=#a4#", "", "14.3%" };
    { 6, 32234, "", "=q4=Fists of Mukoa", "=ds=#a3#", "", "14.3%" };
    { 7, 32236, "", "=q4=Rising Tide", "=ds=#w1#", "", "14.3%" };
    { 8, 32237, "", "=q4=The Maelstrom's Fury", "=ds=#w4#", "", "14.3%" };
    { 9, 32238, "", "=q4=Ring of Calming Waves", "=ds=#s13#", "", "14.3%" };
    { 10, 32243, "", "=q4=Pearl Inlaid Boots", "=ds=#a4#", "", "14.3%" };
    { 11, 32377, "", "=q4=Mantle of Darkness", "=ds=#a2#", "", "14.3%" };
    { 16, 0, "AO_Unknown", "=q6=High Warlord Naj'entus", "=q5=ONE WILL DROP"};
    { 17, 32239, "", "=q4=Slippers of the Seacaller", "=ds=#a1#", "", "14.3%" };
    { 18, 32240, "", "=q4=Guise of the Tidal Lurker", "=ds=#a2#", "", "14.3%" };
    { 19, 32241, "", "=q4=Helm of Soothing Currents", "=ds=#a3#", "", "14.3%" };
    { 20, 32242, "", "=q4=Boots of Oceanic Fury", "=ds=#a3#", "", "14.3%" };
    { 21, 32245, "", "=q4=Tide-stomper's Greaves", "=ds=#a4#", "", "14.3%" };
    { 22, 32247, "", "=q4=Ring of Captured Storms", "=ds=#s13#", "", "14.3%" };
    { 23, 32248, "", "=q4=Halberd of Desolation", "=ds=#w7#", "", "14.3%" };
	};

	AtlasLoot_Data["BTSupremus"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Supremus", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Supremus", "=q5=ONE WILL DROP"};
    { 5, 32256, "", "=q4=Waistwrap of Infinity", "=ds=#a1#", "", "14.3%" };
    { 6, 32257, "", "=q4=Idol of the White Stag", "", "", "14.3%" };
    { 7, 32258, "", "=q4=Naturalist's Preserving Cinch", "=ds=#a3#", "", "14.3%" };
    { 8, 32259, "", "=q4=Bands of the Coming Storm", "=ds=#a3#", "", "14.3%" };
    { 9, 32260, "", "=q4=Choker of Endless Nightmares", "=ds=#s2#", "", "14.3%" };
    { 10, 32261, "", "=q4=Band of the Abyssal Lord", "=ds=#s13#", "", "14.3%" };
    { 11, 32262, "", "=q4=Syphon of the Nathrezim", "=ds=#w6#", "", "14.3%" };
    { 16, 0, "AO_Unknown", "=q6=Supremus", "=q5=ONE WILL DROP"};
    { 17, 32250, "", "=q4=Pauldrons of Abyssal Fury", "=ds=#a4#", "", "16.7%" };
    { 18, 32251, "", "=q4=Wraps of Precise Flight", "=ds=#a3#", "", "16.7%" };
    { 19, 32252, "", "=q4=Nether Shadow Tunic", "=ds=#a2#", "", "16.7%" };
    { 20, 32253, "", "=q4=Legionkiller", "=ds=#w3#", "", "16.7%" };
    { 21, 32254, "", "=q4=The Brutalizer", "=ds=#w1#", "", "16.7%" };
    { 22, 32255, "", "=q4=Felstone Bulwark", "=ds=#w8#", "", "16.7%" };
	};

	AtlasLoot_Data["HCRampWatchkeeper"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Watchkeeper Gargolmar", "=q5=ALL WILL DROP"};
    { 2, 23881, "", "=q1=Gargolmar's Hand", "=ds=#m3#", "", "100%" };
    { 3, 57207, "", "=q3=Schematic: Fel Iron Arrows", "=ds=#e2#", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Watchkeeper Gargolmar", "=q5=ONE WILL DROP"};
    { 6, 24020, "", "=q3=Shadowrend Longblade", "=ds=#w10#", "", "20.0%" };
    { 7, 24021, "", "=q3=Light-Touched Breastplate", "=ds=#a4#", "", "20.0%" };
    { 8, 24022, "", "=q3=Scale Leggings of the Skirmisher", "=ds=#a3#", "", "20.0%" };
    { 9, 24023, "", "=q3=Bracers of Finesse", "=ds=#a2#", "", "20.0%" };
    { 10, 24024, "", "=q3=Pauldrons of Arcane Rage", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["HCRampWatchkeeperHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Watchkeeper Gargolmar (1)", "=q5=ALL WILL DROP"};
    { 2, 23881, "", "=q1=Gargolmar's Hand", "=ds=#m3#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 5, 0, "AO_Unknown", "=q6=Watchkeeper Gargolmar (1)", "=q5=ONE WILL DROP"};
    { 6, 27447, "", "=q3=Bracers of Just Rewards", "=ds=#a4#", "", "20.0%" };
    { 7, 27448, "", "=q3=Cloak of the Everliving", "=ds=#a1#", "", "20.0%" };
    { 8, 27449, "", "=q3=Blood Knight Defender", "=ds=#w8#", "", "20.0%" };
    { 9, 27450, "", "=q3=Wild Stalker Boots", "=ds=#a3#", "", "20.0%" };
    { 10, 27451, "", "=q3=Boots of the Darkwalker", "=ds=#a1#", "", "20.0%" };
	};

	AtlasLoot_Data["HCRampVazruden"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Vazruden the Herald", "=q5=ALL WILL DROP"};
    { 2, 23890, "", "=q1=Ominous Letter", "=ds=#m3#", "", "100%" };
    { 3, 23892, "", "=q1=Ominous Letter", "=ds=#m3#", "", "100%" };
    { 5, 0, "AO_ChestWithTreasures", "=q6=Nazan", "=q5=ALL WILL DROP"};
    { 6, 23901, "", "=q1=Nazan's Head", "=ds=#m3#", "", "100%" };
    { 7, 901730, "", "=q1=Fel Nether Essence", "=ds=#m3#", "", "100%" };
    { 16, 0, "AO_Unknown", "=q6=Reinforced Fel Iron Chest", "=q5=ONE WILL DROP"};
    { 17, 24044, "", "=q3=Hellreaver", "=ds=#w7#", "", "10.0%" };
    { 18, 24045, "", "=q3=Band of Renewal", "=ds=#s13#", "", "10.0%" };
    { 19, 24046, "", "=q3=Kilt of Rolling Thunders", "=ds=#a3#", "", "10.0%" };
    { 20, 24063, "", "=q3=Shifting Sash of Midnight", "=ds=#a2#", "", "10.0%" };
    { 21, 24064, "", "=q3=Ironsole Clompers", "=ds=#a4#", "", "10.0%" };
    { 22, 24083, "", "=q3=Lifegiver Britches", "=ds=#a1#", "", "10.0%" };
    { 23, 24150, "", "=q3=Mok'Nathal Wildercloak", "=ds=#a1#", "", "10.0%" };
    { 24, 24151, "", "=q3=Mok'Nathal Clan Ring", "=ds=#s13#", "", "10.0%" };
    { 25, 24154, "", "=q3=Witching Band", "=ds=#s13#", "", "10.0%" };
    { 26, 24155, "", "=q3=Ursol's Claw", "=ds=#w9#", "", "10.0%" };
	};

	AtlasLoot_Data["HCRampVazrudenHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Nazan", "=q5=ALL WILL DROP"};
    { 2, 23901, "", "=q1=Nazan's Head", "=ds=#m3#", "", "100%" };
    { 3, 33833, "", "=q1=Nazan's Riding Crop", "=ds=#m3#", "", "100%" };
    { 5, 0, "AO_ChestWithTreasures", "=q6=Reinforced Fel Iron Chest", "=q5=ALL WILL DROP"};
    { 6, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 8, 0, "RoM_stellar_dice", "=q6=Reinforced Fel Iron Chest", "=q5=CHANCE TO DROP"};
    { 9, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "30.0%" };
    { 10, 29238, "", "=q4=Lion's Heart Girdle", "=ds=#a4#", "", "25.0%" };
    { 11, 29264, "", "=q4=Tree-Mender's Belt", "=ds=#a2#", "", "25.0%" };
    { 12, 29346, "", "=q4=Feltooth Eviscerator", "=ds=#w4#", "", "25.0%" };
    { 13, 32077, "", "=q4=Wrath Infused Gauntlets", "=ds=#a3#", "", "25.0%" };
    { 14, 27457, "", "=q3=Life Bearer's Gauntlets", "=ds=#a4#", "", "20.0%" };
    { 15, 27458, "", "=q3=Oceansong Kilt", "=ds=#a3#", "", "20.0%" };
    { 16, 27459, "", "=q3=Vambraces of Daring", "=ds=#a4#", "", "20.0%" };
    { 17, 27460, "", "=q3=Reavers' Ring", "=ds=#s13#", "", "20.0%" };
    { 18, 27461, "", "=q3=Chestguard of the Prowler", "=ds=#a2#", "", "20.0%" };
    { 20, 0, "AO_Unknown", "=q6=Reinforced Fel Iron Chest", "=q5=ONE WILL DROP"};
    { 21, 27452, "", "=q3=Light Scribe Bands", "=ds=#a1#", "", "20.0%" };
    { 22, 27453, "", "=q3=Averinn's Ring of Slaying", "=ds=#s13#", "", "20.0%" };
    { 23, 27454, "", "=q3=Volcanic Pauldrons", "=ds=#a3#", "", "20.0%" };
    { 24, 27455, "", "=q3=Irondrake Faceguard", "=ds=#a4#", "", "20.0%" };
    { 25, 27456, "", "=q3=Raiments of Nature's Breath", "=ds=#a2#", "", "20.0%" };
	};

	AtlasLoot_Data["HCRampReinforcedChest"] = {
    { 1, 0, "AO_Unknown", "=q6=Reinforced Fel Iron Chest", "=q5=ONE WILL DROP"};
    { 2, 24044, "", "=q3=Hellreaver", "=ds=#w7#", "", "10.0%" };
    { 3, 24045, "", "=q3=Band of Renewal", "=ds=#s13#", "", "10.0%" };
    { 4, 24046, "", "=q3=Kilt of Rolling Thunders", "=ds=#a3#", "", "10.0%" };
    { 5, 24063, "", "=q3=Shifting Sash of Midnight", "=ds=#a2#", "", "10.0%" };
    { 6, 24064, "", "=q3=Ironsole Clompers", "=ds=#a4#", "", "10.0%" };
    { 7, 24083, "", "=q3=Lifegiver Britches", "=ds=#a1#", "", "10.0%" };
    { 8, 24150, "", "=q3=Mok'Nathal Wildercloak", "=ds=#a1#", "", "10.0%" };
    { 9, 24151, "", "=q3=Mok'Nathal Clan Ring", "=ds=#s13#", "", "10.0%" };
    { 10, 24154, "", "=q3=Witching Band", "=ds=#s13#", "", "10.0%" };
    { 11, 24155, "", "=q3=Ursol's Claw", "=ds=#w9#", "", "10.0%" };
	};

	AtlasLoot_Data["HCRampReinforcedChestHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Reinforced Fel Iron Chest", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Reinforced Fel Iron Chest", "=q5=CHANCE TO DROP"};
    { 5, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "30.0%" };
    { 6, 29238, "", "=q4=Lion's Heart Girdle", "=ds=#a4#", "", "25.0%" };
    { 7, 29264, "", "=q4=Tree-Mender's Belt", "=ds=#a2#", "", "25.0%" };
    { 8, 29346, "", "=q4=Feltooth Eviscerator", "=ds=#w4#", "", "25.0%" };
    { 9, 32077, "", "=q4=Wrath Infused Gauntlets", "=ds=#a3#", "", "25.0%" };
    { 10, 27457, "", "=q3=Life Bearer's Gauntlets", "=ds=#a4#", "", "20.0%" };
    { 11, 27458, "", "=q3=Oceansong Kilt", "=ds=#a3#", "", "20.0%" };
    { 12, 27459, "", "=q3=Vambraces of Daring", "=ds=#a4#", "", "20.0%" };
    { 13, 27460, "", "=q3=Reavers' Ring", "=ds=#s13#", "", "20.0%" };
    { 14, 27461, "", "=q3=Chestguard of the Prowler", "=ds=#a2#", "", "20.0%" };
    { 16, 0, "AO_Unknown", "=q6=Reinforced Fel Iron Chest", "=q5=ONE WILL DROP"};
    { 17, 27452, "", "=q3=Light Scribe Bands", "=ds=#a1#", "", "20.0%" };
    { 18, 27453, "", "=q3=Averinn's Ring of Slaying", "=ds=#s13#", "", "20.0%" };
    { 19, 27454, "", "=q3=Volcanic Pauldrons", "=ds=#a3#", "", "20.0%" };
    { 20, 27455, "", "=q3=Irondrake Faceguard", "=ds=#a4#", "", "20.0%" };
    { 21, 27456, "", "=q3=Raiments of Nature's Breath", "=ds=#a2#", "", "20.0%" };
	};

	AtlasLoot_Data["HCMagtheridon"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Magtheridon", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 3, 32385, "", "=q4=Magtheridon's Head", "=ds=#e10#", "", "100%" };
    { 4, 32386, "", "=q4=Magtheridon's Head", "=ds=#e10#", "", "100%" };
    { 5, 34845, "", "=q4=Pit Lord's Satchel", "=ds=#e1#", "", "100%" };
    { 16, 0, "AO_Unknown", "=q6=Magtheridon", "=q5=ONE WILL DROP"};
    { 17, 28774, "", "=q4=Glaive of the Pit", "=ds=#w7#", "", "8.33%" };
    { 18, 28775, "", "=q4=Thundering Greathelm", "=ds=#a4#", "", "8.33%" };
    { 19, 28776, "", "=q4=Liar's Tongue Gloves", "=ds=#a2#", "", "8.33%" };
    { 20, 28777, "", "=q4=Cloak of the Pit Stalker", "=ds=#a1#", "", "8.33%" };
    { 21, 28778, "", "=q4=Terror Pit Girdle", "=ds=#a3#", "", "8.33%" };
    { 22, 28779, "", "=q4=Girdle of the Endless Pit", "=ds=#a4#", "", "8.33%" };
    { 23, 28780, "", "=q4=Soul-Eater's Handwraps", "=ds=#a1#", "", "8.33%" };
    { 24, 28781, "", "=q4=Karaborian Talisman", "=ds=#s15#", "", "8.33%" };
    { 25, 28782, "", "=q4=Crystalheart Pulse-Staff", "=ds=#w9#", "", "8.33%" };
    { 26, 28783, "", "=q4=Eredar Wand of Obliteration", "=ds=#w12#", "", "8.33%" };
    { 27, 28789, "", "=q4=Eye of Magtheridon", "=ds=#s14#", "", "8.33%" };
    { 28, 29458, "", "=q4=Aegis of the Vindicator", "=ds=#w8#", "", "8.33%" };
	};

	AtlasLoot_Data["TKArcScryer"] = {
    { 1, 0, "AO_Unknown", "=q6=Wrath-Scryer Soccothrates", "=q5=ONE WILL DROP"};
    { 2, 28393, "", "=q3=Warmaul of Infused Light", "=ds=#w6#", "", "20.0%" };
    { 3, 28394, "", "=q3=Ryngo's Band of Ingenuity", "=ds=#s13#", "", "20.0%" };
    { 4, 28396, "", "=q3=Gloves of the Unbound", "=ds=#a2#", "", "20.0%" };
    { 5, 28397, "", "=q3=Emberhawk Crossbow", "=ds=#w3#", "", "20.0%" };
    { 6, 28398, "", "=q3=The Sleeper's Cord", "=ds=#a2#", "", "20.0%" };
	};

	AtlasLoot_Data["TKArcScryerHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Wrath-Scryer Soccothrates (1)", "=q5=ALL WILL DROP"};
    { 2, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 0, "AO_Unknown", "=q6=Wrath-Scryer Soccothrates (1)", "=q5=ONE WILL DROP"};
    { 5, 28393, "", "=q3=Warmaul of Infused Light", "=ds=#w6#", "", "20.0%" };
    { 6, 28394, "", "=q3=Ryngo's Band of Ingenuity", "=ds=#s13#", "", "20.0%" };
    { 7, 28396, "", "=q3=Gloves of the Unbound", "=ds=#a2#", "", "20.0%" };
    { 8, 28397, "", "=q3=Emberhawk Crossbow", "=ds=#w3#", "", "20.0%" };
    { 9, 28398, "", "=q3=The Sleeper's Cord", "=ds=#a2#", "", "20.0%" };
	};

	AtlasLoot_Data["TKArcHarbinger"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Harbinger Skyriss", "=q5=ALL WILL DROP"};
    { 2, 901744, "", "=q1=Qiraji Hive Mind", "=ds=#m3#", "", "100%" };
    { 4, 0, "RoM_stellar_dice", "=q6=Harbinger Skyriss", "=q5=CHANCE TO DROP"};
    { 5, 57469, "", "=q3=Technique: Scroll of Arcane Resistance VI", "=ds=#e2#", "", "15.0%" };
    { 6, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "5.00%" };
    { 8, 0, "AO_Unknown", "=q6=Harbinger Skyriss", "=q5=ONE WILL DROP"};
    { 9, 28205, "", "=q3=Breastplate of the Bold", "=ds=#a4#", "", "16.7%" };
    { 10, 28231, "", "=q3=Tidefury Chestpiece", "=ds=#a3#", "", "16.7%" };
    { 11, 28403, "", "=q3=Doomplate Chestguard", "=ds=#a4#", "", "16.7%" };
    { 12, 28406, "", "=q3=Sigil-Laced Boots", "=ds=#a1#", "", "16.7%" };
    { 13, 28407, "", "=q3=Elementium Band of the Sentry", "=ds=#s13#", "", "16.7%" };
    { 14, 28412, "", "=q3=Lamp of Peaceful Radiance", "=ds=#s15#", "", "16.7%" };
    { 16, 0, "AO_Unknown", "=q6=Harbinger Skyriss", "=q5=ONE WILL DROP"};
    { 17, 28413, "", "=q3=Hallowed Crown", "=ds=#a1#", "", "16.7%" };
    { 18, 28414, "", "=q3=Helm of Assassination", "=ds=#a2#", "", "16.7%" };
    { 19, 28415, "", "=q3=Hood of Oblivion", "=ds=#a1#", "", "16.7%" };
    { 20, 28416, "", "=q3=Hungering Spineripper", "=ds=#w4#", "", "16.7%" };
    { 21, 28418, "", "=q3=Shiffar's Nexus-Horn", "=ds=#s14#", "", "16.7%" };
    { 22, 28419, "", "=q3=Choker of Fluid Thought", "=ds=#s2#", "", "16.7%" };
	};

	AtlasLoot_Data["TKArcHarbingerHEROIC"] = {
    { 1, 0, "AO_ChestWithTreasures", "=q6=Harbinger Skyriss (1)", "=q5=ALL WILL DROP"};
    { 2, 23572, "", "=q3=Primal Nether", "=ds=#e7#", "", "100%" };
    { 3, 29434, "", "=q4=Badge of Justice", "", "", "100%" };
    { 4, 33861, "", "=q1=The Scroll of Skyriss", "=ds=#m3#", "", "100%" };
    { 5, 59338, "", "=q3=Ornate Gem Cache", "=ds=#e10#", "", "100%" };
    { 7, 0, "RoM_stellar_dice", "=q6=Harbinger Skyriss (1)", "=q5=CHANCE TO DROP"};
    { 8, 57469, "", "=q3=Technique: Scroll of Arcane Resistance VI", "=ds=#e2#", "", "25.0%" };
    { 10, 0, "AO_Unknown", "=q6=Harbinger Skyriss (1)", "=q5=ONE WILL DROP"};
    { 11, 28205, "", "=q3=Breastplate of the Bold", "=ds=#a4#", "", "16.7%" };
    { 12, 28231, "", "=q3=Tidefury Chestpiece", "=ds=#a3#", "", "16.7%" };
    { 13, 28403, "", "=q3=Doomplate Chestguard", "=ds=#a4#", "", "16.7%" };
    { 14, 28406, "", "=q3=Sigil-Laced Boots", "=ds=#a1#", "", "16.7%" };
    { 15, 28407, "", "=q3=Elementium Band of the Sentry", "=ds=#s13#", "", "16.7%" };
    { 16, 28412, "", "=q3=Lamp of Peaceful Radiance", "=ds=#s15#", "", "16.7%" };
    { 18, 0, "AO_Unknown", "=q6=Harbinger Skyriss (1)", "=q5=ONE WILL DROP"};
    { 19, 28413, "", "=q3=Hallowed Crown", "=ds=#a1#", "", "16.7%" };
    { 20, 28414, "", "=q3=Helm of Assassination", "=ds=#a2#", "", "16.7%" };
    { 21, 28415, "", "=q3=Hood of Oblivion", "=ds=#a1#", "", "16.7%" };
    { 22, 28416, "", "=q3=Hungering Spineripper", "=ds=#w4#", "", "16.7%" };
    { 23, 28418, "", "=q3=Shiffar's Nexus-Horn", "=ds=#s14#", "", "16.7%" };
    { 24, 28419, "", "=q3=Choker of Fluid Thought", "=ds=#s2#", "", "16.7%" };
    { 26, 0, "AO_Unknown", "=q6=Harbinger Skyriss (1)", "=q5=ONE WILL DROP"};
    { 27, 29241, "", "=q4=Belt of Depravity", "=ds=#a1#", "", "25.0%" };
    { 28, 29248, "", "=q4=Shadowstep Striders", "=ds=#a2#", "", "25.0%" };
    { 29, 29252, "", "=q4=Bracers of Dignity", "=ds=#a4#", "", "25.0%" };
    { 30, 29360, "", "=q4=Vileblade of the Betrayer", "=ds=#w4#", "", "25.0%" };
	};

	AtlasLoot_Data["PVP70RepPlate"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#pvprep704_1#", "=ec1=#c4#"};
		{ 2, 35414, "", "=q3=Crusader's Scaled Helm", "=ds=#f5#, =ec1=#r3#"};
		{ 3, 35416, "", "=q3=Crusader's Scaled Shoulders", "=ds=#f2#, =ec1=#r3#"};
		{ 4, 35412, "", "=q3=Crusader's Scaled Chestpiece", "=ds=#f1#, =ec1=#r3#"};
		{ 5, 35413, "", "=q3=Crusader's Scaled Gauntlets", "=ds=#s5#, #a4#"};
		{ 6, 35415, "", "=q3=Crusader's Scaled Legguards", "=ds=#f6#, =ec1=#r3#"};
		{ 8, 0, "INV_BannerPVP_02", "=q6=#pvprep704_2#", "=ec1=#c4#"};
		{ 9, 35404, "", "=q3=Crusader's Ornamented Headguard", "=ds=#f2#, =ec1=#r3#"};
		{ 10, 35406, "", "=q3=Crusader's Ornamented Spaulders", "=ds=#s4#, #a4#"};
		{ 11, 35402, "", "=q3=Crusader's Ornamented Chestplate", "=ds=#f5#, =ec1=#r3#"};
		{ 12, 35403, "", "=q3=Crusader's Ornamented Gloves", "=ds=#f6#, =ec1=#r3#"};
		{ 13, 35405, "", "=q3=Crusader's Ornamented Leggings", "=ds=#f1#, =ec1=#r3#"};
		{ 16, 0, "INV_BannerPVP_02", "=q6=#pvprep709#", "=ec1=#c9#"};
		{ 17, 35409, "", "=q3=Savage Plate Helm", "=ds=#s1#, #a4#"};
		{ 18, 35411, "", "=q3=Savage Plate Shoulders", "=ds=#f1#, =ec1=#r3#"};
		{ 19, 35407, "", "=q3=Savage Plate Chestpiece", "=ds=#f2#, =ec1=#r3#"};
		{ 20, 35408, "", "=q3=Savage Plate Gauntlets", "=ds=#f6#, =ec1=#r3#"};
		{ 21, 35410, "", "=q3=Savage Plate Legguards", "=ds=#f5#, =ec1=#r3#"};
		Prev = "PVP70RepMail";
		Back = "PVP70RepSET";
	};

		----------------------------------
		--- PvP Level 70 - Accessories ---
		----------------------------------
		
	AtlasLoot_Data["PvP70Accessories1_A"] = {
		{ 1, 28235, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 2, 28237, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 3, 28238, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 4, 28236, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 5, 30349, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 6, 28234, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 7, 30351, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 8, 30348, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 9, 30350, "", "=q3=Medallion of the Alliance", "=ds=", "8000 #alliance#"};
		{ 11, 31853, "", "=q1=Major Combat Healing Potion", "=ds=", "200 #faction#"};
		{ 12, 31839, "", "=q1=Major Combat Healing Potion", "=ds=", "200 #faction#"};
		{ 13, 31855, "", "=q1=Major Combat Mana Potion", "=ds=", "200 #faction#"};
		{ 14, 31841, "", "=q1=Major Combat Mana Potion", "=ds=", "200 #faction#"};
		{ 15, 32453, "", "=q1=Star's Tears", "=ds=", "1 #gold# 8 #faction#"};
		{ 16, 37864, "", "=q4=Medallion of the Alliance", "=ds=", "40000 #alliance#"};
		{ 17, 25829, "", "=q4=Talisman of the Alliance", "=ds=", "23000 #alliance#"};
		{ 19, 28120, "", "=q4=Gleaming Ornate Dawnstone", "=ds=", "6885 #faction#"};
		{ 20, 28119, "", "=q4=Smooth Ornate Dawnstone", "=ds=", "6885 #faction#"};
		{ 21, 28362, "", "=q4=Bold Ornate Ruby", "=ds=", "6885 #faction#"};
		{ 22, 28118, "", "=q4=Runed Ornate Ruby", "=ds=", "6885 #faction#"};
		{ 23, 28363, "", "=q4=Inscribed Ornate Topaz", "=ds=", "8500 #faction#"};
		{ 24, 28123, "", "=q4=Potent Ornate Topaz", "=ds=", "8500 #faction#"};
		{ 26, 31838, "", "=q1=Major Combat Healing Potion", "=ds=", "200 #faction#"};
		{ 27, 31852, "", "=q1=Major Combat Healing Potion", "=ds=", "200 #faction#"};
		{ 28, 31840, "", "=q1=Major Combat Mana Potion", "=ds=", "200 #faction#"};
		{ 29, 31854, "", "=q1=Major Combat Mana Potion", "=ds=", "200 #faction#"};
		Next = "PvP70Accessories2";
		Back = "PVPMENU";
	};

	AtlasLoot_Data["PvP70Accessories1_H"] = {
		{ 1, 28241, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 2, 28243, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 3, 28239, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 4, 28242, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 5, 30346, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 6, 28240, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 7, 30345, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 8, 30343, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 9, 30344, "", "=q3=Medallion of the Horde", "=ds=", "8000 #horde#"};
		{ 11, 31853, "", "=q1=Major Combat Healing Potion", "=ds=", "200 #faction#"};
		{ 12, 31839, "", "=q1=Major Combat Healing Potion", "=ds=", "200 #faction#"};
		{ 13, 31855, "", "=q1=Major Combat Mana Potion", "=ds=", "200 #faction#"};
		{ 14, 31841, "", "=q1=Major Combat Mana Potion", "=ds=", "200 #faction#"};
		{ 15, 32453, "", "=q1=Star's Tears", "=ds=", "1 #gold# 8 #faction#"};
		{ 16, 37865, "", "=q4=Medallion of the Horde", "=ds=", "40000 #horde#"};
		{ 17, 24551, "", "=q4=Talisman of the Horde", "=ds=", "23000 #horde#"};
		{ 19, 28120, "", "=q4=Gleaming Ornate Dawnstone", "=ds=", "6885 #faction#"};
		{ 20, 28119, "", "=q4=Smooth Ornate Dawnstone", "=ds=", "6885 #faction#"};
		{ 21, 28362, "", "=q4=Bold Ornate Ruby", "=ds=", "6885 #faction#"};
		{ 22, 28118, "", "=q4=Runed Ornate Ruby", "=ds=", "6885 #faction#"};
		{ 23, 28363, "", "=q4=Inscribed Ornate Topaz", "=ds=", "8500 #faction#"};
		{ 24, 28123, "", "=q4=Potent Ornate Topaz", "=ds=", "8500 #faction#"};
		{ 26, 31838, "", "=q1=Major Combat Healing Potion", "=ds=", "200 #faction#"};
		{ 27, 31852, "", "=q1=Major Combat Healing Potion", "=ds=", "200 #faction#"};
		{ 28, 31840, "", "=q1=Major Combat Mana Potion", "=ds=", "200 #faction#"};
		{ 29, 31854, "", "=q1=Major Combat Mana Potion", "=ds=", "200 #faction#"};
		Next = "PvP70Accessories2";
		Back = "PVPMENU";
	};
	
	AtlasLoot_Data["PvP70Accessories2"] = {
		{ 1, 28378, "", "=q4=Sergeant's Heavy Cape", "=ds=", "8000 #faction#"};
		{ 2, 28377, "", "=q4=Sergeant's Heavy Cloak", "=ds=", "8000 #faction#"};
		{ 4, 44431, "", "=q4=Cloak of Certain Reprieve", "=ds=", "21000 #faction#"};
		{ 5, 41591, "", "=q4=Sergeant's Reinforced Cape", "=ds=", "21000 #faction#"};
		{ 6, 41592, "", "=q4=The Gladiator's Resolution", "=ds=", "21000 #faction#"};
		{ 7, 44429, "", "=q4=Volanthius Shroud", "=ds=", "21000 #faction#"};
		{ 9, 41588, "", "=q4=Battlemaster's Aggression", "=ds=", "36000 #faction#"};
		{ 10, 41587, "", "=q4=Battlemaster's Celerity", "=ds=", "36000 #faction#"};
		{ 11, 41590, "", "=q4=Battlemaster's Courage", "=ds=", "36000 #faction#"};
		{ 12, 41589, "", "=q4=Battlemaster's Resolve", "=ds=", "36000 #faction#"};
		{ 14, 28247, "", "=q3=Band of Dominance", "=ds=", "10000 #alliance#"};
		{ 15, 28246, "", "=q3=Band of Triumph", "=ds=", "10000 #alliance#"};
		{ 16, 35132, "", "=q4=Guardian's Pendant of Conquest", "=ds=", "16000 #faction#"};
		{ 17, 35133, "", "=q4=Guardian's Pendant of Dominance", "=ds=", "16000 #faction#"};
		{ 18, 37929, "", "=q4=Guardian's Pendant of Reprieve", "=ds=", "16000 #faction#"};
		{ 19, 35134, "", "=q4=Guardian's Pendant of Salvation", "=ds=", "16000 #faction#"};
		{ 20, 37928, "", "=q4=Guardian's Pendant of Subjugation", "=ds=", "16000 #faction#"};
		{ 21, 35135, "", "=q4=Guardian's Pendant of Triumph", "=ds=", "16000 #faction#"};
		{ 23, 35129, "", "=q4=Guardian's Band of Dominance", "=ds=", "16000 #faction#"};
		{ 24, 35130, "", "=q4=Guardian's Band of Salvation", "=ds=", "16000 #faction#"};
		{ 25, 37927, "", "=q4=Guardian's Band of Subjugation", "=ds=", "16000 #faction#"};
		{ 26, 35131, "", "=q4=Guardian's Band of Triumph", "=ds=", "16000 #faction#"};
		{ 27, 33853, "", "=q4=Vindicator's Band of Dominance", "=ds=", "12000 #faction#"};
		{ 28, 33918, "", "=q4=Vindicator's Band of Salvation", "=ds=", "12000 #faction#"};
		{ 29, 35320, "", "=q4=Vindicator's Band of Subjugation", "=ds=", "12000 #faction#"};
		{ 30, 33919, "", "=q4=Vindicator's Band of Triumph", "=ds=", "12000 #faction#"};
		Prev = "PvP70Accessories1_A";
		Back = "PVPMENU";
	};

		------------------------------------
		--- PvP Level 70 - Non Set Epics ---
		------------------------------------

	AtlasLoot_Data["PvP70NonSet1"] = {
		{ 1, 35168, "", "=q4=Guardian's Dreadweave Cuffs", "=ds=", "13000 #faction#"};
		{ 2, 35153, "", "=q4=Guardian's Dreadweave Belt", "=ds=", "18000 #faction#"};
		{ 3, 35138, "", "=q4=Guardian's Dreadweave Stalkers", "=ds=", "18000 #faction#"};
		{ 5, 35174, "", "=q4=Guardian's Mooncloth Cuffs", "=ds=", "13000 #faction#"};
		{ 6, 35159, "", "=q4=Guardian's Mooncloth Belt", "=ds=", "18000 #faction#"};
		{ 7, 35144, "", "=q4=Guardian's Mooncloth Slippers", "=ds=", "18000 #faction#"};
		{ 9, 35179, "", "=q4=Guardian's Silk Cuffs", "=ds=", "13000 #faction#"};
		{ 10, 35164, "", "=q4=Guardian's Silk Belt", "=ds=", "18000 #faction#"};
		{ 11, 35149, "", "=q4=Guardian's Silk Footguards", "=ds=", "18000 #faction#"};
		{ 16, 35167, "", "=q4=Guardian's Dragonhide Bracers", "=ds=", "13000 #faction#"};
		{ 17, 35152, "", "=q4=Guardian's Dragonhide Belt", "=ds=", "18000 #faction#"};
		{ 18, 35137, "", "=q4=Guardian's Dragonhide Boots", "=ds=", "18000 #faction#"};
		{ 20, 35169, "", "=q4=Guardian's Kodohide Bracers", "=ds=", "13000 #faction#"};
		{ 21, 35154, "", "=q4=Guardian's Kodohide Belt", "=ds=", "18000 #faction#"};
		{ 22, 35139, "", "=q4=Guardian's Kodohide Boots", "=ds=", "18000 #faction#"};
		{ 24, 35171, "", "=q4=Guardian's Leather Bracers", "=ds=", "13000 #faction#"};
		{ 25, 35156, "", "=q4=Guardian's Leather Belt", "=ds=", "18000 #faction#"};
		{ 26, 35141, "", "=q4=Guardian's Leather Boots", "=ds=", "18000 #faction#"};
		{ 28, 35180, "", "=q4=Guardian's Wyrmhide Bracers", "=ds=", "13000 #faction#"};
		{ 29, 35165, "", "=q4=Guardian's Wyrmhide Belt", "=ds=", "18000 #faction#"};
		{ 30, 35150, "", "=q4=Guardian's Wyrmhide Boots", "=ds=", "18000 #faction#"};
		Next = "PvP70NonSet2";
		Back = "PVPMENU";
	};

	AtlasLoot_Data["PvP70NonSet2"] = {
		{ 1, 35166, "", "=q4=Guardian's Chain Bracers", "=ds=", "13000 #faction#"};
		{ 2, 35151, "", "=q4=Guardian's Chain Girdle", "=ds=", "18000 #faction#"};
		{ 3, 35136, "", "=q4=Guardian's Chain Sabatons", "=ds=", "18000 #faction#"};
		{ 5, 35172, "", "=q4=Guardian's Linked Bracers", "=ds=", "13000 #faction#"};
		{ 6, 35157, "", "=q4=Guardian's Linked Girdle", "=ds=", "18000 #faction#"};
		{ 7, 35142, "", "=q4=Guardian's Linked Sabatons", "=ds=", "18000 #faction#"};
		{ 9, 35173, "", "=q4=Guardian's Mail Bracers", "=ds=", "13000 #faction#"};
		{ 10, 35158, "", "=q4=Guardian's Mail Girdle", "=ds=", "18000 #faction#"};
		{ 11, 35143, "", "=q4=Guardian's Mail Sabatons", "=ds=", "18000 #faction#"};
		{ 13, 35177, "", "=q4=Guardian's Ringmail Bracers", "=ds=", "13000 #faction#"};
		{ 14, 35162, "", "=q4=Guardian's Ringmail Girdle", "=ds=", "18000 #faction#"};
		{ 15, 35147, "", "=q4=Guardian's Ringmail Sabatons", "=ds=", "18000 #faction#"};
		{ 16, 35170, "", "=q4=Guardian's Lamellar Bracers", "=ds=", "13000 #faction#"};
		{ 17, 35155, "", "=q4=Guardian's Lamellar Belt", "=ds=", "18000 #faction#"};
		{ 18, 35140, "", "=q4=Guardian's Lamellar Greaves", "=ds=", "18000 #faction#"};
		{ 20, 35175, "", "=q4=Guardian's Ornamented Bracers", "=ds=", "13000 #faction#"};
		{ 21, 35160, "", "=q4=Guardian's Ornamented Belt", "=ds=", "18000 #faction#"};
		{ 22, 35145, "", "=q4=Guardian's Ornamented Greaves", "=ds=", "18000 #faction#"};
		{ 24, 35176, "", "=q4=Guardian's Plate Bracers", "=ds=", "13000 #faction#"};
		{ 25, 35161, "", "=q4=Guardian's Plate Belt", "=ds=", "18000 #faction#"};
		{ 26, 35146, "", "=q4=Guardian's Plate Greaves", "=ds=", "18000 #faction#"};
		{ 28, 35178, "", "=q4=Guardian's Scaled Bracers", "=ds=", "13000 #faction#"};
		{ 29, 35163, "", "=q4=Guardian's Scaled Belt", "=ds=", "18000 #faction#"};
		{ 30, 35148, "", "=q4=Guardian's Scaled Greaves", "=ds=", "18000 #faction#"};
		Prev = "PvP70NonSet1";
		Back = "PVPMENU";
	};

		--------------------------
		--- Arena - Armor Sets ---
		--------------------------

	AtlasLoot_Data["ArenaDruidFeral"] = {
		{ 1, 0, "Ability_Druid_Maul", "=q6=#arenas1_1#", "=q1=#m21# #e15#"};
		{ 2, 28127, "", "=q4=Gladiator's Dragonhide Helm", "=ds=#s1#"};
		{ 3, 28129, "", "=q4=Gladiator's Dragonhide Spaulders", "=ds=#s3#"};
		{ 4, 28130, "", "=q4=Gladiator's Dragonhide Tunic", "=ds=#s5#"};
		{ 5, 28126, "", "=q4=Gladiator's Dragonhide Gloves", "=ds=#s9#"};
		{ 6, 28128, "", "=q4=Gladiator's Dragonhide Legguards", "=ds=#s11#"};
		{ 8, 0, "Ability_Druid_Maul", "=q6=#arenas1_1#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 31968, "", "=q4=Merciless Gladiator's Dragonhide Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 31971, "", "=q4=Merciless Gladiator's Dragonhide Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 31972, "", "=q4=Merciless Gladiator's Dragonhide Tunic", "=ds=#s5#", "15000 #faction#"};
		{ 12, 31967, "", "=q4=Merciless Gladiator's Dragonhide Gloves", "=ds=#s9#", "12000 #faction#"};
		{ 13, 31969, "", "=q4=Merciless Gladiator's Dragonhide Legguards", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Ability_Druid_Maul", "=q6=#arenas1_1#", "=q1=#m36#"};
		{ 17, 33672, "", "=q4=Vengeful Gladiator's Dragonhide Helm", "=ds=#s1#", ""};
		{ 18, 33674, "", "=q4=Vengeful Gladiator's Dragonhide Spaulders", "=ds=#s3#", ""};
		{ 19, 33675, "", "=q4=Vengeful Gladiator's Dragonhide Tunic", "=ds=#s5#", ""};
		{ 20, 33671, "", "=q4=Vengeful Gladiator's Dragonhide Gloves", "=ds=#s9#", ""};
		{ 21, 33673, "", "=q4=Vengeful Gladiator's Dragonhide Legguards", "=ds=#s11#", ""};
		{ 23, 0, "Ability_Druid_Maul", "=q6=#arenas1_1#", ""};
		{ 24, 34999, "", "=q4=Brutal Gladiator's Dragonhide Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35001, "", "=q4=Brutal Gladiator's Dragonhide Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35002, "", "=q4=Brutal Gladiator's Dragonhide Tunic", "=ds=", "1875 #arena#", ""};
		{ 27, 34998, "", "=q4=Brutal Gladiator's Dragonhide Gloves", "=ds=", "1125 #arena#", ""};
		{ 28, 35000, "", "=q4=Brutal Gladiator's Dragonhide Legguards", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaDruidBalance"] = {
		{ 1, 0, "Spell_Nature_InsectSwarm", "=q6=#arenas1_2#", "=q1=#m21# #e15#"};
		{ 2, 28137, "", "=q4=Gladiator's Wyrmhide Helm", "=ds=#s1#"};
		{ 3, 28139, "", "=q4=Gladiator's Wyrmhide Spaulders", "=ds=#s3#"};
		{ 4, 28140, "", "=q4=Gladiator's Wyrmhide Tunic", "=ds=#s5#"};
		{ 5, 28136, "", "=q4=Gladiator's Wyrmhide Gloves", "=ds=#s9#"};
		{ 6, 28138, "", "=q4=Gladiator's Wyrmhide Legguards", "=ds=#s11#"};
		{ 8, 0, "Spell_Nature_InsectSwarm", "=q6=#arenas1_2#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32057, "", "=q4=Merciless Gladiator's Wyrmhide Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32059, "", "=q4=Merciless Gladiator's Wyrmhide Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32060, "", "=q4=Merciless Gladiator's Wyrmhide Tunic", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32056, "", "=q4=Merciless Gladiator's Wyrmhide Gloves", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32058, "", "=q4=Merciless Gladiator's Wyrmhide Legguards", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Nature_InsectSwarm", "=q6=#arenas1_2#", "=q1=#m36#"};
		{ 17, 33768, "", "=q4=Vengeful Gladiator's Wyrmhide Helm", "=ds=#s1#", ""};
		{ 18, 33770, "", "=q4=Vengeful Gladiator's Wyrmhide Spaulders", "=ds=#s3#", ""};
		{ 19, 33771, "", "=q4=Vengeful Gladiator's Wyrmhide Tunic", "=ds=#s5#", ""};
		{ 20, 33767, "", "=q4=Vengeful Gladiator's Wyrmhide Gloves", "=ds=#s9#", ""};
		{ 21, 33769, "", "=q4=Vengeful Gladiator's Wyrmhide Legguards", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Nature_InsectSwarm", "=q6=#arenas1_2#", ""};
		{ 24, 35112, "", "=q4=Brutal Gladiator's Wyrmhide Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35114, "", "=q4=Brutal Gladiator's Wyrmhide Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35115, "", "=q4=Brutal Gladiator's Wyrmhide Tunic", "=ds=", "1875 #arena#", ""};
		{ 27, 35111, "", "=q4=Brutal Gladiator's Wyrmhide Gloves", "=ds=", "1125 #arena#", ""};
		{ 28, 35113, "", "=q4=Brutal Gladiator's Wyrmhide Legguards", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaDruidRestoration"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#arenas1_3#", "=q1=#m21# #e15#"};
		{ 2, 31376, "", "=q4=Gladiator's Kodohide Helm", "=ds=#s1#"};
		{ 3, 31378, "", "=q4=Gladiator's Kodohide Spaulders", "=ds=#s3#"};
		{ 4, 31379, "", "=q4=Gladiator's Kodohide Tunic", "=ds=#s5#"};
		{ 5, 31375, "", "=q4=Gladiator's Kodohide Gloves", "=ds=#s9#"};
		{ 6, 31377, "", "=q4=Gladiator's Kodohide Legguards", "=ds=#s11#"};
		{ 8, 0, "Spell_Nature_Regeneration", "=q6=#arenas1_3#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 31988, "", "=q4=Merciless Gladiator's Kodohide Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 31990, "", "=q4=Merciless Gladiator's Kodohide Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 31991, "", "=q4=Merciless Gladiator's Kodohide Tunic", "=ds=#s5#", "15000 #faction#"};
		{ 12, 31987, "", "=q4=Merciless Gladiator's Kodohide Gloves", "=ds=#s9#", "12000 #faction#"};
		{ 13, 31989, "", "=q4=Merciless Gladiator's Kodohide Legguards", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Nature_Regeneration", "=q6=#arenas1_3#", "=q1=#m36#"};
		{ 17, 33691, "", "=q4=Vengeful Gladiator's Kodohide Helm", "=ds=#s1#", ""};
		{ 18, 33693, "", "=q4=Vengeful Gladiator's Kodohide Spaulders", "=ds=#s3#", ""};
		{ 19, 33694, "", "=q4=Vengeful Gladiator's Kodohide Tunic", "=ds=#s5#", ""};
		{ 20, 33690, "", "=q4=Vengeful Gladiator's Kodohide Gloves", "=ds=#s9#", ""};
		{ 21, 33692, "", "=q4=Vengeful Gladiator's Kodohide Legguards", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Nature_Regeneration", "=q6=#arenas1_3#", ""};
		{ 24, 35023, "", "=q4=Brutal Gladiator's Kodohide Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35025, "", "=q4=Brutal Gladiator's Kodohide Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35026, "", "=q4=Brutal Gladiator's Kodohide Tunic", "=ds=", "1875 #arena#", ""};
		{ 27, 35022, "", "=q4=Brutal Gladiator's Kodohide Gloves", "=ds=", "1125 #arena#", ""};
		{ 28, 35024, "", "=q4=Brutal Gladiator's Kodohide Legguards", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaHunter"] = {
		{ 1, 0, "Ability_Hunter_RunningShot", "=q6=#arenas2#", "=q1=#m21# #e15#"};
		{ 2, 28331, "", "=q4=Gladiator's Chain Helm", "=ds=#s1#"};
		{ 3, 28333, "", "=q4=Gladiator's Chain Spaulders", "=ds=#s3#"};
		{ 4, 28334, "", "=q4=Gladiator's Chain Armor", "=ds=#s5#"};
		{ 5, 28335, "", "=q4=Gladiator's Chain Gauntlets", "=ds=#s9#"};
		{ 6, 28332, "", "=q4=Gladiator's Chain Leggings", "=ds=#s11#"};
		{ 8, 0, "Ability_Hunter_RunningShot", "=q6=#arenas2#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 31962, "", "=q4=Merciless Gladiator's Chain Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 31964, "", "=q4=Merciless Gladiator's Chain Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 31960, "", "=q4=Merciless Gladiator's Chain Armor", "=ds=#s5#", "15000 #faction#"};
		{ 12, 31961, "", "=q4=Merciless Gladiator's Chain Gauntlets", "=ds=#s9#", "12000 #faction#"};
		{ 13, 31963, "", "=q4=Merciless Gladiator's Chain Leggings", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Ability_Hunter_RunningShot", "=q6=#arenas2#", "=q1=#m36#"};
		{ 17, 33666, "", "=q4=Vengeful Gladiator's Chain Helm", "=ds=#s1#", ""};
		{ 18, 33668, "", "=q4=Vengeful Gladiator's Chain Spaulders", "=ds=#s3#", ""};
		{ 19, 33664, "", "=q4=Vengeful Gladiator's Chain Armor", "=ds=#s5#", ""};
		{ 20, 33665, "", "=q4=Vengeful Gladiator's Chain Gauntlets", "=ds=#s9#", ""};
		{ 21, 33667, "", "=q4=Vengeful Gladiator's Chain Leggings", "=ds=#s11#", ""};
		{ 23, 0, "Ability_Hunter_RunningShot", "=q6=#arenas2#", ""};
		{ 24, 34992, "", "=q4=Brutal Gladiator's Chain Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 34994, "", "=q4=Brutal Gladiator's Chain Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 34990, "", "=q4=Brutal Gladiator's Chain Armor", "=ds=", "1875 #arena#", ""};
		{ 27, 34991, "", "=q4=Brutal Gladiator's Chain Gauntlets", "=ds=", "1125 #arena#", ""};
		{ 28, 34993, "", "=q4=Brutal Gladiator's Chain Leggings", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaMage"] = {
		{ 1, 0, "Spell_Frost_IceStorm", "=q6=#arenas3#", "=q1=#m21# #e15#"};
		{ 2, 25855, "", "=q4=Gladiator's Silk Cowl", "=ds=#s1#"};
		{ 3, 25854, "", "=q4=Gladiator's Silk Amice", "=ds=#s3#"};
		{ 4, 25856, "", "=q4=Gladiator's Silk Raiment", "=ds=#s5#"};
		{ 5, 25857, "", "=q4=Gladiator's Silk Handguards", "=ds=#s9#"};
		{ 6, 25858, "", "=q4=Gladiator's Silk Trousers", "=ds=#s11#"};
		{ 8, 0, "Spell_Frost_IceStorm", "=q6=#arenas3#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32048, "", "=q4=Merciless Gladiator's Silk Cowl", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32047, "", "=q4=Merciless Gladiator's Silk Amice", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32050, "", "=q4=Merciless Gladiator's Silk Raiment", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32049, "", "=q4=Merciless Gladiator's Silk Handguards", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32051, "", "=q4=Merciless Gladiator's Silk Trousers", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Frost_IceStorm", "=q6=#arenas3#", "=q1=#m36#"};
		{ 17, 33758, "", "=q4=Vengeful Gladiator's Silk Cowl", "=ds=#s1#", ""};
		{ 18, 33757, "", "=q4=Vengeful Gladiator's Silk Amice", "=ds=#s3#", ""};
		{ 19, 33760, "", "=q4=Vengeful Gladiator's Silk Raiment", "=ds=#s5#", ""};
		{ 20, 33759, "", "=q4=Vengeful Gladiator's Silk Handguards", "=ds=#s9#", ""};
		{ 21, 33761, "", "=q4=Vengeful Gladiator's Silk Trousers", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Frost_IceStorm", "=q6=#arenas3#", ""};
		{ 24, 35097, "", "=q4=Brutal Gladiator's Silk Cowl", "=ds=", "1875 #arena#", ""};
		{ 25, 35096, "", "=q4=Brutal Gladiator's Silk Amice", "=ds=", "1500 #arena#", ""};
		{ 26, 35099, "", "=q4=Brutal Gladiator's Silk Raiment", "=ds=", "1875 #arena#", ""};
		{ 27, 35098, "", "=q4=Brutal Gladiator's Silk Handguards", "=ds=", "1125 #arena#", ""};
		{ 28, 35100, "", "=q4=Brutal Gladiator's Silk Trousers", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaPaladinProtection"] = {
		{ 1, 0, "Spell_Holy_SealOfMight", "=q6=#arenas4_1#", "=q1=#m21# #e15#"};
		{ 2, 27704, "", "=q4=Gladiator's Lamellar Helm", "=ds=#s1#"};
		{ 3, 27706, "", "=q4=Gladiator's Lamellar Shoulders", "=ds=#s3#"};
		{ 4, 27702, "", "=q4=Gladiator's Lamellar Chestpiece", "=ds=#s5#"};
		{ 5, 27703, "", "=q4=Gladiator's Lamellar Gauntlets", "=ds=#s9#"};
		{ 6, 27705, "", "=q4=Gladiator's Lamellar Legguards", "=ds=#s11#"};
		{ 8, 0, "Spell_Holy_SealOfMight", "=q6=#arenas4_1#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 31997, "", "=q4=Merciless Gladiator's Lamellar Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 31996, "", "=q4=Merciless Gladiator's Lamellar Shoulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 31992, "", "=q4=Merciless Gladiator's Lamellar Chestpiece", "=ds=#s5#", "15000 #faction#"};
		{ 12, 31993, "", "=q4=Merciless Gladiator's Lamellar Gauntlets", "=ds=#s9#", "12000 #faction#"};
		{ 13, 31995, "", "=q4=Merciless Gladiator's Lamellar Legguards", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Holy_SealOfMight", "=q6=#arenas4_1#", "=q1=#m36#"};
		{ 17, 33697, "", "=q4=Vengeful Gladiator's Lamellar Helm", "=ds=#s1#", ""};
		{ 18, 33699, "", "=q4=Vengeful Gladiator's Lamellar Shoulders", "=ds=#s3#", ""};
		{ 19, 33695, "", "=q4=Vengeful Gladiator's Lamellar Chestpiece", "=ds=#s5#", ""};
		{ 20, 33696, "", "=q4=Vengeful Gladiator's Lamellar Gauntlets", "=ds=#s9#", ""};
		{ 21, 33698, "", "=q4=Vengeful Gladiator's Lamellar Legguards", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Holy_SealOfMight", "=q6=#arenas4_1#", ""};
		{ 24, 35029, "", "=q4=Brutal Gladiator's Lamellar Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35031, "", "=q4=Brutal Gladiator's Lamellar Shoulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35027, "", "=q4=Brutal Gladiator's Lamellar Chestpiece", "=ds=", "1875 #arena#", ""};
		{ 27, 35028, "", "=q4=Brutal Gladiator's Lamellar Gauntlets", "=ds=", "1125 #arena#", ""};
		{ 28, 35030, "", "=q4=Brutal Gladiator's Lamellar Legguards", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaPaladinRetribution"] = {
		{ 1, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", "=q1=#m21# #e15#"};
		{ 2, 27881, "", "=q4=Gladiator's Scaled Helm", "=ds=#s1#"};
		{ 3, 27883, "", "=q4=Gladiator's Scaled Shoulders", "=ds=#s3#"};
		{ 4, 27879, "", "=q4=Gladiator's Scaled Chestpiece", "=ds=#s5#"};
		{ 5, 27880, "", "=q4=Gladiator's Scaled Gauntlets", "=ds=#s9#"};
		{ 6, 27882, "", "=q4=Gladiator's Scaled Legguards", "=ds=#s11#"};
		{ 8, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32041, "", "=q4=Merciless Gladiator's Scaled Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32043, "", "=q4=Merciless Gladiator's Scaled Shoulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32039, "", "=q4=Merciless Gladiator's Scaled Chestpiece", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32040, "", "=q4=Merciless Gladiator's Scaled Gauntlets", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32042, "", "=q4=Merciless Gladiator's Scaled Legguards", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", "=q1=#m36#"};
		{ 17, 33751, "", "=q4=Vengeful Gladiator's Scaled Helm", "=ds=#s1#", ""};
		{ 18, 33753, "", "=q4=Vengeful Gladiator's Scaled Shoulders", "=ds=#s3#", ""};
		{ 19, 33749, "", "=q4=Vengeful Gladiator's Scaled Chestpiece", "=ds=#s5#", ""};
		{ 20, 33750, "", "=q4=Vengeful Gladiator's Scaled Gauntlets", "=ds=#s9#", ""};
		{ 21, 33752, "", "=q4=Vengeful Gladiator's Scaled Legguards", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", ""};
		{ 24, 35090, "", "=q4=Brutal Gladiator's Scaled Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35092, "", "=q4=Brutal Gladiator's Scaled Shoulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35088, "", "=q4=Brutal Gladiator's Scaled Chestpiece", "=ds=", "1875 #arena#", ""};
		{ 27, 35089, "", "=q4=Brutal Gladiator's Scaled Gauntlets", "=ds=", "1125 #arena#", ""};
		{ 28, 35091, "", "=q4=Brutal Gladiator's Scaled Legguards", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaPaladinHoly"] = {
		{ 1, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", "=q1=#m21# #e15#"};
		{ 2, 31616, "", "=q4=Gladiator's Ornamented Headcover", "=ds=#s1#"};
		{ 3, 31619, "", "=q4=Gladiator's Ornamented Spaulders", "=ds=#s3#"};
		{ 4, 31613, "", "=q4=Gladiator's Ornamented Chestguard", "=ds=#s5#"};
		{ 5, 31614, "", "=q4=Gladiator's Ornamented Gloves", "=ds=#s9#"};
		{ 6, 31618, "", "=q4=Gladiator's Ornamented Legplates", "=ds=#s11#"};
		{ 8, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32022, "", "=q4=Merciless Gladiator's Ornamented Headcover", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32024, "", "=q4=Merciless Gladiator's Ornamented Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32020, "", "=q4=Merciless Gladiator's Ornamented Chestguard", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32021, "", "=q4=Merciless Gladiator's Ornamented Gloves", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32023, "", "=q4=Merciless Gladiator's Ornamented Legplates", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", "=q1=#m36#"};
		{ 17, 33724, "", "=q4=Vengeful Gladiator's Ornamented Headcover", "=ds=#s1#", ""};
		{ 18, 33726, "", "=q4=Vengeful Gladiator's Ornamented Spaulders", "=ds=#s3#", ""};
		{ 19, 33722, "", "=q4=Vengeful Gladiator's Ornamented Chestguard", "=ds=#s5#", ""};
		{ 20, 33723, "", "=q4=Vengeful Gladiator's Ornamented Gloves", "=ds=#s9#", ""};
		{ 21, 33725, "", "=q4=Vengeful Gladiator's Ornamented Legplates", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", ""};
		{ 24, 35061, "", "=q4=Brutal Gladiator's Ornamented Headcover", "=ds=", "1875 #arena#", ""};
		{ 25, 35063, "", "=q4=Brutal Gladiator's Ornamented Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35059, "", "=q4=Brutal Gladiator's Ornamented Chestguard", "=ds=", "1875 #arena#", ""};
		{ 27, 35060, "", "=q4=Brutal Gladiator's Ornamented Gloves", "=ds=", "1125 #arena#", ""};
		{ 28, 35062, "", "=q4=Brutal Gladiator's Ornamented Legplates", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaPriestShadow"] = {
		{ 1, 0, "Spell_Shadow_AntiShadow", "=q6=#arenas5_1#", "=q1=#m21# #e15#"};
		{ 2, 27708, "", "=q4=Gladiator's Satin Hood", "=ds=#s1#"};
		{ 3, 27710, "", "=q4=Gladiator's Satin Mantle", "=ds=#s3#"};
		{ 4, 27711, "", "=q4=Gladiator's Satin Robe", "=ds=#s5#"};
		{ 5, 27707, "", "=q4=Gladiator's Satin Gloves", "=ds=#s9#"};
		{ 6, 27709, "", "=q4=Gladiator's Satin Leggings", "=ds=#s11#"};
		{ 8, 0, "Spell_Shadow_AntiShadow", "=q6=#arenas5_1#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32035, "", "=q4=Merciless Gladiator's Satin Hood", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32037, "", "=q4=Merciless Gladiator's Satin Mantle", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32038, "", "=q4=Merciless Gladiator's Satin Robe", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32034, "", "=q4=Merciless Gladiator's Satin Gloves", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32036, "", "=q4=Merciless Gladiator's Satin Leggings", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Shadow_AntiShadow", "=q6=#arenas5_1#", "=q1=#m36#"};
		{ 17, 33745, "", "=q4=Vengeful Gladiator's Satin Hood", "=ds=#s1#", ""};
		{ 18, 33747, "", "=q4=Vengeful Gladiator's Satin Mantle", "=ds=#s3#", ""};
		{ 19, 33748, "", "=q4=Vengeful Gladiator's Satin Robe", "=ds=#s5#", ""};
		{ 20, 33744, "", "=q4=Vengeful Gladiator's Satin Gloves", "=ds=#s9#", ""};
		{ 21, 33746, "", "=q4=Vengeful Gladiator's Satin Leggings", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Shadow_AntiShadow", "=q6=#arenas5_1#", ""};
		{ 24, 35084, "", "=q4=Brutal Gladiator's Satin Hood", "=ds=", "1875 #arena#", ""};
		{ 25, 35086, "", "=q4=Brutal Gladiator's Satin Mantle", "=ds=", "1500 #arena#", ""};
		{ 26, 35087, "", "=q4=Brutal Gladiator's Satin Robe", "=ds=", "1875 #arena#", ""};
		{ 27, 35083, "", "=q4=Brutal Gladiator's Satin Gloves", "=ds=", "1125 #arena#", ""};
		{ 28, 35085, "", "=q4=Brutal Gladiator's Satin Leggings", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaPriestHoly"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#arenas5_2#", "=q1=#m21# #e15#"};
		{ 2, 31410, "", "=q4=Gladiator's Mooncloth Hood", "=ds=#s1#"};
		{ 3, 31412, "", "=q4=Gladiator's Mooncloth Mantle", "=ds=#s3#"};
		{ 4, 31413, "", "=q4=Gladiator's Mooncloth Robe", "=ds=#s5#"};
		{ 5, 31409, "", "=q4=Gladiator's Mooncloth Gloves", "=ds=#s9#"};
		{ 6, 31411, "", "=q4=Gladiator's Mooncloth Leggings", "=ds=#s11#"};
		{ 8, 0, "Spell_Holy_PowerWordShield", "=q6=#arenas5_2#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32016, "", "=q4=Merciless Gladiator's Mooncloth Hood", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32018, "", "=q4=Merciless Gladiator's Mooncloth Mantle", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32019, "", "=q4=Merciless Gladiator's Mooncloth Robe", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32015, "", "=q4=Merciless Gladiator's Mooncloth Gloves", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32017, "", "=q4=Merciless Gladiator's Mooncloth Leggings", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Holy_PowerWordShield", "=q6=#arenas5_2#", "=q1=#m36#"};
		{ 17, 33718, "", "=q4=Vengeful Gladiator's Mooncloth Hood", "=ds=#s1#", ""};
		{ 18, 33720, "", "=q4=Vengeful Gladiator's Mooncloth Mantle", "=ds=#s3#", ""};
		{ 19, 33721, "", "=q4=Vengeful Gladiator's Mooncloth Robe", "=ds=#s5#", ""};
		{ 20, 33717, "", "=q4=Vengeful Gladiator's Mooncloth Gloves", "=ds=#s9#", ""};
		{ 21, 33719, "", "=q4=Vengeful Gladiator's Mooncloth Leggings", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Holy_PowerWordShield", "=q6=#arenas5_2#", ""};
		{ 24, 35054, "", "=q4=Brutal Gladiator's Mooncloth Hood", "=ds=", "1875 #arena#", ""};
		{ 25, 35056, "", "=q4=Brutal Gladiator's Mooncloth Mantle", "=ds=", "1500 #arena#", ""};
		{ 26, 35057, "", "=q4=Brutal Gladiator's Mooncloth Robe", "=ds=", "1875 #arena#", ""};
		{ 27, 35053, "", "=q4=Brutal Gladiator's Mooncloth Gloves", "=ds=", "1125 #arena#", ""};
		{ 28, 35055, "", "=q4=Brutal Gladiator's Mooncloth Leggings", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaRogue"] = {
		{ 1, 0, "Ability_BackStab", "=q6=#arenas6#", "=q1=#m21# #e15#"};
		{ 2, 25830, "", "=q4=Gladiator's Leather Helm", "=ds=#s1#"};
		{ 3, 25832, "", "=q4=Gladiator's Leather Spaulders", "=ds=#s3#"};
		{ 4, 25831, "", "=q4=Gladiator's Leather Tunic", "=ds=#s5#"};
		{ 5, 25834, "", "=q4=Gladiator's Leather Gloves", "=ds=#s9#"};
		{ 6, 25833, "", "=q4=Gladiator's Leather Legguards", "=ds=#s11#"};
		{ 8, 0, "Ability_BackStab", "=q6=#arenas6#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 31999, "", "=q4=Merciless Gladiator's Leather Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32001, "", "=q4=Merciless Gladiator's Leather Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32002, "", "=q4=Merciless Gladiator's Leather Tunic", "=ds=#s5#", "15000 #faction#"};
		{ 12, 31998, "", "=q4=Merciless Gladiator's Leather Gloves", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32000, "", "=q4=Merciless Gladiator's Leather Legguards", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Ability_BackStab", "=q6=#arenas6#", "=q1=#m36#"};
		{ 17, 33701, "", "=q4=Vengeful Gladiator's Leather Helm", "=ds=#s1#", ""};
		{ 18, 33703, "", "=q4=Vengeful Gladiator's Leather Spaulders", "=ds=#s3#", ""};
		{ 19, 33704, "", "=q4=Vengeful Gladiator's Leather Tunic", "=ds=#s5#", ""};
		{ 20, 33700, "", "=q4=Vengeful Gladiator's Leather Gloves", "=ds=#s9#", ""};
		{ 21, 33702, "", "=q4=Vengeful Gladiator's Leather Legguards", "=ds=#s11#", ""};
		{ 23, 0, "Ability_BackStab", "=q6=#arenas6#", ""};
		{ 24, 35033, "", "=q4=Brutal Gladiator's Leather Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35035, "", "=q4=Brutal Gladiator's Leather Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35036, "", "=q4=Brutal Gladiator's Leather Tunic", "=ds=", "1875 #arena#", ""};
		{ 27, 35032, "", "=q4=Brutal Gladiator's Leather Gloves", "=ds=", "1125 #arena#", ""};
		{ 28, 35034, "", "=q4=Brutal Gladiator's Leather Legguards", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaWarlockDemonology"] = {
		{ 1, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_1#", "=q1=#m21# #e15#"};
		{ 2, 24553, "", "=q4=Gladiator's Dreadweave Hood", "=ds=#s1#"};
		{ 3, 24554, "", "=q4=Gladiator's Dreadweave Mantle", "=ds=#s3#"};
		{ 4, 24552, "", "=q4=Gladiator's Dreadweave Robe", "=ds=#s5#"};
		{ 5, 24556, "", "=q4=Gladiator's Dreadweave Gloves", "=ds=#s9#"};
		{ 6, 24555, "", "=q4=Gladiator's Dreadweave Leggings", "=ds=#s11#"};
		{ 8, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_1#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 31974, "", "=q4=Merciless Gladiator's Dreadweave Hood", "=ds=#s1#", "15000 #faction#"};
		{ 10, 31976, "", "=q4=Merciless Gladiator's Dreadweave Mantle", "=ds=#s3#", "13000 #faction#"};
		{ 11, 31977, "", "=q4=Merciless Gladiator's Dreadweave Robe", "=ds=#s5#", "15000 #faction#"};
		{ 12, 31973, "", "=q4=Merciless Gladiator's Dreadweave Gloves", "=ds=#s9#", "12000 #faction#"};
		{ 13, 31975, "", "=q4=Merciless Gladiator's Dreadweave Leggings", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_1#", "=q1=#m36#"};
		{ 17, 33677, "", "=q4=Vengeful Gladiator's Dreadweave Hood", "=ds=#s1#", ""};
		{ 18, 33679, "", "=q4=Vengeful Gladiator's Dreadweave Mantle", "=ds=#s3#", ""};
		{ 19, 33680, "", "=q4=Vengeful Gladiator's Dreadweave Robe", "=ds=#s5#", ""};
		{ 20, 33676, "", "=q4=Vengeful Gladiator's Dreadweave Gloves", "=ds=#s9#", ""};
		{ 21, 33678, "", "=q4=Vengeful Gladiator's Dreadweave Leggings", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_1#", ""};
		{ 24, 35004, "", "=q4=Brutal Gladiator's Dreadweave Hood", "=ds=", "1875 #arena#", ""};
		{ 25, 35006, "", "=q4=Brutal Gladiator's Dreadweave Mantle", "=ds=", "1500 #arena#", ""};
		{ 26, 35007, "", "=q4=Brutal Gladiator's Dreadweave Robe", "=ds=", "1875 #arena#", ""};
		{ 27, 35003, "", "=q4=Brutal Gladiator's Dreadweave Gloves", "=ds=", "1125 #arena#", ""};
		{ 28, 35005, "", "=q4=Brutal Gladiator's Dreadweave Leggings", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaWarlockDestruction"] = {
		{ 1, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_2#", "=q1=#m21# #e15#"};
		{ 2, 30187, "", "=q4=Gladiator's Felweave Cowl", "=ds=#s1#"};
		{ 3, 30186, "", "=q4=Gladiator's Felweave Amice", "=ds=#s3#"};
		{ 4, 30200, "", "=q4=Gladiator's Felweave Raiment", "=ds=#s5#"};
		{ 5, 30188, "", "=q4=Gladiator's Felweave Handguards", "=ds=#s9#"};
		{ 6, 30201, "", "=q4=Gladiator's Felweave Trousers", "=ds=#s11#"};
		{ 8, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_2#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 31980, "", "=q4=Merciless Gladiator's Felweave Cowl", "=ds=#s1#", "15000 #faction#"};
		{ 10, 31979, "", "=q4=Merciless Gladiator's Felweave Amice", "=ds=#s3#", "13000 #faction#"};
		{ 11, 31982, "", "=q4=Merciless Gladiator's Felweave Raiment", "=ds=#s5#", "15000 #faction#"};
		{ 12, 31981, "", "=q4=Merciless Gladiator's Felweave Handguards", "=ds=#s9#", "12000 #faction#"};
		{ 13, 31983, "", "=q4=Merciless Gladiator's Felweave Trousers", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_2#", "=q1=#m36#"};
		{ 17, 33683, "", "=q4=Vengeful Gladiator's Felweave Cowl", "=ds=#s1#", ""};
		{ 18, 33682, "", "=q4=Vengeful Gladiator's Felweave Amice", "=ds=#s3#", ""};
		{ 19, 33685, "", "=q4=Vengeful Gladiator's Felweave Raiment", "=ds=#s5#", ""};
		{ 20, 33684, "", "=q4=Vengeful Gladiator's Felweave Handguards", "=ds=#s9#", ""};
		{ 21, 33686, "", "=q4=Vengeful Gladiator's Felweave Trousers", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_2#", ""};
		{ 24, 35010, "", "=q4=Brutal Gladiator's Felweave Cowl", "=ds=", "1875 #arena#", ""};
		{ 25, 35009, "", "=q4=Brutal Gladiator's Felweave Amice", "=ds=", "1500 #arena#", ""};
		{ 26, 35012, "", "=q4=Brutal Gladiator's Felweave Raiment", "=ds=", "1875 #arena#", ""};
		{ 27, 35011, "", "=q4=Brutal Gladiator's Felweave Handguards", "=ds=", "1125 #arena#", ""};
		{ 28, 35013, "", "=q4=Brutal Gladiator's Felweave Trousers", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaShamanEnhancement"] = {
		{ 1, 0, "Spell_FireResistanceTotem_01", "=q6=#arenas7_1#", "=q1=#m21# #e15#"};
		{ 2, 25998, "", "=q4=Gladiator's Linked Helm", "=ds=#s1#"};
		{ 3, 25999, "", "=q4=Gladiator's Linked Spaulders", "=ds=#s3#"};
		{ 4, 25997, "", "=q4=Gladiator's Linked Armor", "=ds=#s5#"};
		{ 5, 26000, "", "=q4=Gladiator's Linked Gauntlets", "=ds=#s9#"};
		{ 6, 26001, "", "=q4=Gladiator's Linked Leggings", "=ds=#s11#"};
		{ 8, 0, "Spell_FireResistanceTotem_01", "=q6=#arenas7_1#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32006, "", "=q4=Merciless Gladiator's Linked Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32008, "", "=q4=Merciless Gladiator's Linked Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32004, "", "=q4=Merciless Gladiator's Linked Armor", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32005, "", "=q4=Merciless Gladiator's Linked Gauntlets", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32007, "", "=q4=Merciless Gladiator's Linked Leggings", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_FireResistanceTotem_01", "=q6=#arenas7_1#", "=q1=#m36#"};
		{ 17, 33708, "", "=q4=Vengeful Gladiator's Linked Helm", "=ds=#s1#", ""};
		{ 18, 33710, "", "=q4=Vengeful Gladiator's Linked Spaulders", "=ds=#s3#", ""};
		{ 19, 33706, "", "=q4=Vengeful Gladiator's Linked Armor", "=ds=#s5#", ""};
		{ 20, 33707, "", "=q4=Vengeful Gladiator's Linked Gauntlets", "=ds=#s9#", ""};
		{ 21, 33709, "", "=q4=Vengeful Gladiator's Linked Leggings", "=ds=#s11#", ""};
		{ 23, 0, "Spell_FireResistanceTotem_01", "=q6=#arenas7_1#", ""};
		{ 24, 35044, "", "=q4=Brutal Gladiator's Linked Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35046, "", "=q4=Brutal Gladiator's Linked Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35042, "", "=q4=Brutal Gladiator's Linked Armor", "=ds=", "1875 #arena#", ""};
		{ 27, 35043, "", "=q4=Brutal Gladiator's Linked Gauntlets", "=ds=", "1125 #arena#", ""};
		{ 28, 35045, "", "=q4=Brutal Gladiator's Linked Leggings", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaShamanElemental"] = {
		{ 1, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q1=#m21# #e15#"};
		{ 2, 27471, "", "=q4=Gladiator's Mail Helm", "=ds=#s1#"};
		{ 3, 27473, "", "=q4=Gladiator's Mail Spaulders", "=ds=#s3#"};
		{ 4, 27469, "", "=q4=Gladiator's Mail Armor", "=ds=#s5#"};
		{ 5, 27470, "", "=q4=Gladiator's Mail Gauntlets", "=ds=#s9#"};
		{ 6, 27472, "", "=q4=Gladiator's Mail Leggings", "=ds=#s11#"};
		{ 8, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32011, "", "=q4=Merciless Gladiator's Mail Helm", "=ds=#s1#", ""};
		{ 10, 32013, "", "=q4=Merciless Gladiator's Mail Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32009, "", "=q4=Merciless Gladiator's Mail Armor", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32010, "", "=q4=Merciless Gladiator's Mail Gauntlets", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32012, "", "=q4=Merciless Gladiator's Mail Leggings", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", "=q1=#m36#"};
		{ 17, 33713, "", "=q4=Vengeful Gladiator's Mail Helm", "=ds=#s1#", ""};
		{ 18, 33715, "", "=q4=Vengeful Gladiator's Mail Spaulders", "=ds=#s3#", ""};
		{ 19, 33711, "", "=q4=Vengeful Gladiator's Mail Armor", "=ds=#s5#", ""};
		{ 20, 33712, "", "=q4=Vengeful Gladiator's Mail Gauntlets", "=ds=#s9#", ""};
		{ 21, 33714, "", "=q4=Vengeful Gladiator's Mail Leggings", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", ""};
		{ 24, 35050, "", "=q4=Brutal Gladiator's Mail Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35052, "", "=q4=Brutal Gladiator's Mail Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35048, "", "=q4=Brutal Gladiator's Mail Armor", "=ds=", "1875 #arena#", ""};
		{ 27, 35049, "", "=q4=Brutal Gladiator's Mail Gauntlets", "=ds=", "1125 #arena#", ""};
		{ 28, 35051, "", "=q4=Brutal Gladiator's Mail Leggings", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaShamanRestoration"] = {
		{ 1, 0, "Spell_Nature_HealingWaveGreater", "=q6=#arenas7_3#", "=q1=#m21# #e15#"};
		{ 2, 31400, "", "=q4=Gladiator's Ringmail Helm", "=ds=#s1#"};
		{ 3, 31407, "", "=q4=Gladiator's Ringmail Spaulders", "=ds=#s3#"};
		{ 4, 31396, "", "=q4=Gladiator's Ringmail Armor", "=ds=#s5#"};
		{ 5, 31397, "", "=q4=Gladiator's Ringmail Gauntlets", "=ds=#s9#"};
		{ 6, 31406, "", "=q4=Gladiator's Ringmail Leggings", "=ds=#s11#"};
		{ 8, 0, "Spell_Nature_HealingWaveGreater", "=q6=#arenas7_3#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 32031, "", "=q4=Merciless Gladiator's Ringmail Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 32033, "", "=q4=Merciless Gladiator's Ringmail Spaulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 32029, "", "=q4=Merciless Gladiator's Ringmail Armor", "=ds=#s5#", "15000 #faction#"};
		{ 12, 32030, "", "=q4=Merciless Gladiator's Ringmail Gauntlets", "=ds=#s9#", "12000 #faction#"};
		{ 13, 32032, "", "=q4=Merciless Gladiator's Ringmail Leggings", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Spell_Nature_HealingWaveGreater", "=q6=#arenas7_3#", "=q1=#m36#"};
		{ 17, 33740, "", "=q4=Vengeful Gladiator's Ringmail Helm", "=ds=#s1#", ""};
		{ 18, 33742, "", "=q4=Vengeful Gladiator's Ringmail Spaulders", "=ds=#s3#", ""};
		{ 19, 33738, "", "=q4=Vengeful Gladiator's Ringmail Armor", "=ds=#s5#", ""};
		{ 20, 33739, "", "=q4=Vengeful Gladiator's Ringmail Gauntlets", "=ds=#s9#", ""};
		{ 21, 33741, "", "=q4=Vengeful Gladiator's Ringmail Leggings", "=ds=#s11#", ""};
		{ 23, 0, "Spell_Nature_HealingWaveGreater", "=q6=#arenas7_3#", ""};
		{ 24, 35079, "", "=q4=Brutal Gladiator's Ringmail Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35081, "", "=q4=Brutal Gladiator's Ringmail Spaulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35077, "", "=q4=Brutal Gladiator's Ringmail Armor", "=ds=", "1875 #arena#", ""};
		{ 27, 35078, "", "=q4=Brutal Gladiator's Ringmail Gauntlets", "=ds=", "1125 #arena#", ""};
		{ 28, 35080, "", "=q4=Brutal Gladiator's Ringmail Leggings", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

	AtlasLoot_Data["ArenaWarrior"] = {
		{ 1, 0, "Ability_Warrior_BattleShout", "=q6=#arenas9#", "=q1=#m21# #e15#"};
		{ 2, 24545, "", "=q4=Gladiator's Plate Helm", "=ds=#s1#"};
		{ 3, 24546, "", "=q4=Gladiator's Plate Shoulders", "=ds=#s3#"};
		{ 4, 24544, "", "=q4=Gladiator's Plate Chestpiece", "=ds=#s5#"};
		{ 5, 24549, "", "=q4=Gladiator's Plate Gauntlets", "=ds=#s9#"};
		{ 6, 24547, "", "=q4=Gladiator's Plate Legguards", "=ds=#s11#"};
		{ 8, 0, "Ability_Warrior_BattleShout", "=q6=#arenas9#", "=q1=#m22#/#m23# #e15#"};
		{ 9, 30488, "", "=q4=Merciless Gladiator's Plate Helm", "=ds=#s1#", "15000 #faction#"};
		{ 10, 30490, "", "=q4=Merciless Gladiator's Plate Shoulders", "=ds=#s3#", "13000 #faction#"};
		{ 11, 30486, "", "=q4=Merciless Gladiator's Plate Chestpiece", "=ds=#s5#", "15000 #faction#"};
		{ 12, 30487, "", "=q4=Merciless Gladiator's Plate Gauntlets", "=ds=#s9#", "12000 #faction#"};
		{ 13, 30489, "", "=q4=Merciless Gladiator's Plate Legguards", "=ds=#s11#", "15000 #faction#"};
		{ 16, 0, "Ability_Warrior_BattleShout", "=q6=#arenas9#", "=q1=#m36#"};
		{ 17, 33730, "", "=q4=Vengeful Gladiator's Plate Helm", "=ds=#s1#", ""};
		{ 18, 33732, "", "=q4=Vengeful Gladiator's Plate Shoulders", "=ds=#s3#", ""};
		{ 19, 33728, "", "=q4=Vengeful Gladiator's Plate Chestpiece", "=ds=#s5#", ""};
		{ 20, 33729, "", "=q4=Vengeful Gladiator's Plate Gauntlets", "=ds=#s9#", ""};
		{ 21, 33731, "", "=q4=Vengeful Gladiator's Plate Legguards", "=ds=#s11#", ""};
		{ 23, 0, "Ability_Warrior_BattleShout", "=q6=#arenas9#", ""};
		{ 24, 35068, "", "=q4=Brutal Gladiator's Plate Helm", "=ds=", "1875 #arena#", ""};
		{ 25, 35070, "", "=q4=Brutal Gladiator's Plate Shoulders", "=ds=", "1500 #arena#", ""};
		{ 26, 35066, "", "=q4=Brutal Gladiator's Plate Chestpiece", "=ds=", "1875 #arena#", ""};
		{ 27, 35067, "", "=q4=Brutal Gladiator's Plate Gauntlets", "=ds=", "1125 #arena#", ""};
		{ 28, 35069, "", "=q4=Brutal Gladiator's Plate Legguards", "=ds=", "1875 #arena#", ""};
		Back = "ARENASET";
	};

		--------------------------------
		--- Arena Season 4 - Weapons ---
		--------------------------------

	AtlasLoot_Data["Arena4Weapons1"] = {
		{ 1, 35076, "", "=q4=Brutal Gladiator's Right Ripper", "=ds=#h3#, #w13#", "2625 #arena#", ""};
		{ 2, 35038, "", "=q4=Brutal Gladiator's Left Ripper", "=ds=#h4#, #w13#", "1125 #arena#", ""};
		{ 3, 35037, "", "=q4=Brutal Gladiator's Left Render", "=ds=#h4#, #w13#", "1125 #arena#", ""};
		{ 4, 35102, "", "=q4=Brutal Gladiator's Spellblade", "=ds=#h3#, #w4#", "3150 #arena#", ""};
		{ 5, 37739, "", "=q4=Brutal Gladiator's Blade of Alacrity", "=ds=#h3#, #w4#", "3150 #arena#", ""};
		{ 6, 35093, "", "=q4=Brutal Gladiator's Shanker", "=ds=#h1#, #w4#", "2625 #arena#", ""};
		{ 7, 35058, "", "=q4=Brutal Gladiator's Mutilator", "=ds=#h4#, #w4#", "1125 #arena#", ""};
		{ 8, 35095, "", "=q4=Brutal Gladiator's Shiv", "=ds=#h4#, #w4#", "1125 #arena#", ""};
		{ 9, 35101, "", "=q4=Brutal Gladiator's Slicer", "=ds=#h1#, #w10#", "2625 #arena#", ""};
		{ 10, 35072, "", "=q4=Brutal Gladiator's Quickblade", "=ds=#h4#, #w10#", "1125 #arena#", ""};
		{ 11, 35015, "", "=q4=Brutal Gladiator's Greatsword", "=ds=#h2#, #w10#", "3750 #arena#", ""};
		{ 12, 34996, "", "=q4=Brutal Gladiator's Cleaver", "=ds=#h1#, #w1#", "2625 #arena#", ""};
		{ 13, 34995, "", "=q4=Brutal Gladiator's Chopper", "=ds=#h4#, #w1#", "1125 #arena#", ""};
		{ 14, 36737, "", "=q4=Brutal Gladiator's Hatchet", "=ds=#h4#, #w1#", "650 #arena#", ""};
		{ 15, 35017, "", "=q4=Brutal Gladiator's Hacker", "=ds=#h4#, #w1#", "1125 #arena#", ""};
		{ 16, 34997, "", "=q4=Brutal Gladiator's Decapitator", "=ds=#h2#, #w1#", "3750 #arena#", ""};
		{ 17, 35110, "", "=q4=Brutal Gladiator's Waraxe", "=ds=#h3#, #w1#", "650 #arena#", ""};
		{ 18, 35014, "", "=q4=Brutal Gladiator's Gavel", "=ds=#h3#, #w6#", "3150 #arena#", ""};
		{ 19, 35082, "", "=q4=Brutal Gladiator's Salvation", "=ds=#h3#, #w6#", "3150 #arena#", ""};
		{ 20, 37740, "", "=q4=Brutal Gladiator's Swift Judgement", "=ds=#h3#, #w6#", "3150 #arena#", ""};
		{ 21, 35071, "", "=q4=Brutal Gladiator's Pummeler", "=ds=#h1#, #w6#", "2625 #arena#", ""};
		{ 22, 34988, "", "=q4=Brutal Gladiator's Bonecracker", "=ds=#h4#, #w6#", "3150 #arena#", ""};
		{ 23, 34989, "", "=q4=Brutal Gladiator's Bonegrinder", "=ds=#h2#, #w6#", "3750 #arena#", ""};
		{ 24, 35064, "", "=q4=Brutal Gladiator's Painsaw", "=ds=#w7#", "3750 #arena#", ""};
		{ 25, 34987, "", "=q4=Brutal Gladiator's Battle Staff", "=ds=#w9#", "3750 #arena#", ""};
		{ 26, 35103, "", "=q4=Brutal Gladiator's Staff", "=ds=#w9#", "3750 #arena#", ""};
		{ 27, 35109, "", "=q4=Brutal Gladiator's War Staff", "=ds=#w9#", "3750 #arena#", ""};
		Next = "Arena4Weapons2";
		Back = "PVPMENU";
	};

	AtlasLoot_Data["Arena4Weapons2"] = {
		{ 1, 34986, "", "=q4=Brutal Gladiator's Barrier", "=ds=#w8#", "1875 #arena#", ""};
		{ 2, 35073, "", "=q4=Brutal Gladiator's Redoubt", "=ds=#w8#", "1875 #arena#", ""};
		{ 3, 35094, "", "=q4=Brutal Gladiator's Shield Wall", "=ds=#w8#", "1875 #arena#", ""};
		{ 4, 35108, "", "=q4=Brutal Gladiator's War Edge", "=ds=#w11#", "1000 #arena#", ""};
		{ 5, 35047, "", "=q4=Brutal Gladiator's Longbow", "=ds=#w2#", "3750 #arena#", ""};
		{ 6, 35018, "", "=q4=Brutal Gladiator's Heavy Crossbow", "=ds=#w3#", "3750 #arena#", ""};
		{ 7, 35075, "", "=q4=Brutal Gladiator's Rifle", "=ds=#w5#", "3750 #arena#", ""};
		{ 8, 34985, "", "=q4=Brutal Gladiator's Baton of Light", "=ds=#w12#", "1000 #arena#", ""};
		{ 9, 35065, "", "=q4=Brutal Gladiator's Piercing Touch", "=ds=#w12#", "1000 #arena#", ""};
		{ 10, 35107, "", "=q4=Brutal Gladiator's Touch of Defeat", "=ds=#w12#", "1000 #arena#", ""};
		{ 11, 35008, "", "=q4=Brutal Gladiator's Endgame", "=ds=#s15#", "1125 #arena#", ""};
		{ 12, 35016, "", "=q4=Brutal Gladiator's Grimoire", "=ds=#s15#", "1125 #arena#", ""};
		{ 13, 35074, "", "=q4=Brutal Gladiator's Reprieve", "=ds=#s15#", "1125 #arena#", ""};
		{ 16, 35019, "", "=q4=Brutal Gladiator's Idol of Resolve", "=ds=#w14#", "1000 #arena#", ""};
		{ 17, 35020, "", "=q4=Brutal Gladiator's Idol of Steadfastness#w14#", "=ds=", "1000 #arena#", ""};
		{ 18, 35021, "", "=q4=Brutal Gladiator's Idol of Tenacity", "=ds=#w14#", "1000 #arena#", ""};
		{ 19, 35039, "", "=q4=Brutal Gladiator's Libram of Fortitude", "=ds=#w16#", "1000 #arena#", ""};
		{ 20, 35040, "", "=q4=Brutal Gladiator's Libram of Justice", "=ds=#w16#", "1000 #arena#", ""};
		{ 21, 35041, "", "=q4=Brutal Gladiator's Libram of Vengeance", "=ds=#w16#", "1000 #arena#", ""};
		{ 22, 35104, "", "=q4=Brutal Gladiator's Totem of Indomitability", "=ds=#w15#", "1000 #arena#", ""};
		{ 23, 35105, "", "=q4=Brutal Gladiator's Totem of Survival", "=ds=#w15#", "1000 #arena#", ""};
		{ 24, 35106, "", "=q4=Brutal Gladiator's Totem of the Third Wind", "=ds=#w15#", "1000 #arena#", ""};
		Prev = "Arena4Weapons1";
		Back = "PVPMENU";
	};

	--------------------------
	--- Sets & Collections ---
	--------------------------

		---------------------------
		--- Dungeon 3 Sets (D3) ---
		---------------------------

	AtlasLoot_Data["DS3Cloth"] = {
		{ 1, 0, "Spell_Holy_InnerFire", "=q6=#ds3s1#", ""};
		{ 2, 28413, "", "=q3=Hallowed Crown", "=ds="..BabbleBoss["Harbinger Skyriss"].." ("..BabbleZone["The Arcatraz"]..")"};
		{ 3, 27775, "", "=q3=Hallowed Pauldrons", "=ds="..BabbleBoss["Grandmaster Vorpil"].." ("..BabbleZone["Shadow Labyrinth"]..")"};
		{ 4, 28230, "", "=q3=Hallowed Garments", "=ds="..BabbleBoss["Murmur"].." ("..BabbleZone["Shadow Labyrinth"]..")"};
		{ 5, 27536, "", "=q3=Hallowed Handwraps", "=ds="..BabbleBoss["Warchief Kargath Bladefist"].." ("..BabbleZone["The Shattered Halls"]..")"};
		{ 6, 27875, "", "=q3=Hallowed Trousers", "=ds="..BabbleBoss["Talon King Ikiss"].." ("..BabbleZone["Sethekk Halls"]..")"};
		{ 8, 0, "INV_Elemental_Mote_Nether", "=q6=#ds3s3#", ""};
		{ 9, 28193, "", "=q3=Mana-Etched Crown", "=ds="..BabbleBoss["Aeonus"].." ("..BabbleZone["The Black Morass"]..")"};
		{ 10, 27796, "", "=q3=Mana-Etched Spaulders", "=ds="..BabbleBoss["Quagmirran"].." (#j3#)"};
		{ 11, 28191, "", "=q3=Mana-Etched Vestments", "=ds="..BabbleBoss["Epoch Hunter"].." ("..BabbleZone["Old Hillsbrad Foothills"]..") (#j3#)"};
		{ 12, 27465, "", "=q3=Mana-Etched Gloves", "=ds="..BabbleBoss["Omor the Unscarred"].." ("..BabbleZone["Hellfire Ramparts"]..") (#j3#)"};
		{ 13, 27907, "", "=q3=Mana-Etched Pantaloons", "=ds="..BabbleBoss["The Black Stalker"].." (#j3#)"};
		{ 16, 0, "Ability_Creature_Cursed_04", "=q6=#ds3s2#", ""};
		{ 17, 28278, "", "=q3=Incanter's Cowl", "=ds="..BabbleBoss["Pathaleon the Calculator"].." ("..BabbleZone["The Mechanar"]..")"};
		{ 18, 27738, "", "=q3=Incanter's Pauldrons", "=ds="..BabbleBoss["Warlord Kalithresh"].." ("..BabbleZone["The Steamvault"]..")"};
		{ 19, 28229, "", "=q3=Incanter's Robe", "=ds="..BabbleBoss["Warp Splinter"].." ("..BabbleZone["The Botanica"]..")"};
		{ 20, 27508, "", "=q3=Incanter's Gloves", "=ds="..BabbleBoss["Hydromancer Thespia"].." ("..BabbleZone["The Steamvault"]..")"}; 
		{ 21, 27838, "", "=q3=Incanter's Trousers", "=ds="..BabbleBoss["Talon King Ikiss"].." ("..BabbleZone["Sethekk Halls"]..")"};
		{ 23, 0, "Ability_Creature_Cursed_03", "=q6=#ds3s4#", ""};
		{ 24, 28415, "", "=q3=Hood of Oblivion", "=ds="..BabbleBoss["Harbinger Skyriss"].." ("..BabbleZone["The Arcatraz"]..")"};
		{ 25, 27778, "", "=q3=Spaulders of Oblivion", "=ds="..BabbleBoss["Murmur"].." ("..BabbleZone["Shadow Labyrinth"]..")"};
		{ 26, 28232, "", "=q3=Robe of Oblivion", "=ds="..BabbleBoss["Murmur"].." ("..BabbleZone["Shadow Labyrinth"]..")"};
		{ 27, 27537, "", "=q3=Gloves of Oblivion", "=ds="..BabbleBoss["Warchief Kargath Bladefist"].." ("..BabbleZone["The Shattered Halls"]..")"};
		{ 28, 27948, "", "=q3=Trousers of Oblivion", "=ds="..BabbleBoss["Talon King Ikiss"].." ("..BabbleZone["Sethekk Halls"]..")"};
		Next = "DS3Leather";
		Back = "DS3SET";
	};

	AtlasLoot_Data["DS3Leather"] = {
		{ 1, 0, "Ability_Rogue_SinisterCalling", "=q6=#ds3s5#", ""};
		{ 2, 28414, "", "=q3=Helm of Assassination", "=ds="..BabbleBoss["Harbinger Skyriss"].." ("..BabbleZone["The Arcatraz"]..")"};
		{ 3, 27776, "", "=q3=Shoulderpads of Assassination", "=ds="..BabbleBoss["Talon King Ikiss"].." ("..BabbleZone["Sethekk Halls"]..")"};
		{ 4, 28204, "", "=q3=Tunic of Assassination", "=ds="..BabbleBoss["Pathaleon the Calculator"].." ("..BabbleZone["The Mechanar"]..")"};
		{ 5, 27509, "", "=q3=Handgrips of Assassination", "=ds="..BabbleBoss["Aeonus"].." ("..BabbleZone["The Black Morass"]..")"};
		{ 6, 27908, "", "=q3=Leggings of Assassination", "=ds="..BabbleBoss["Murmur"].." ("..BabbleZone["Shadow Labyrinth"]..")"};
		{ 8, 0, "Ability_Hunter_RapidKilling", "=q6=#ds3s7#", ""};
		{ 9, 28224, "", "=q3=Wastewalker Helm", "=ds="..BabbleBoss["Epoch Hunter"].." ("..BabbleZone["Old Hillsbrad Foothills"]..") (#j3#)"};
		{ 10, 27797, "", "=q3=Wastewalker Shoulderpads", "=ds="..AL["Avatar"].." ("..BabbleZone["Auchenai Crypts"]..") (#j3#)"};
		{ 11, 28264, "", "=q3=Wastewalker Tunic", "=ds="..BabbleBoss["Keli'dan the Breaker"].." ("..BabbleZone["The Blood Furnace"]..") (#j3#)"};
		{ 12, 27531, "", "=q3=Wastewalker Gloves", "=ds="..BabbleBoss["Warchief Kargath Bladefist"].." ("..BabbleZone["The Shattered Halls"]..")"};
		{ 13, 27837, "", "=q3=Wastewalker Leggings", "=ds="..BabbleBoss["Nexus-Prince Shaffar"].." ("..BabbleZone["Mana-Tombs"]..") (#j3#)"};
		{ 16, 0, "Spell_Holy_SealOfRighteousness", "=q6=#ds3s6#", ""};
		{ 17, 28348, "", "=q3=Moonglade Cowl", "=ds="..BabbleBoss["Warp Splinter"].." ("..BabbleZone["The Botanica"]..")"};
		{ 18, 27737, "", "=q3=Moonglade Shoulders", "=ds="..BabbleBoss["Warlord Kalithresh"].." ("..BabbleZone["The Steamvault"]..")"};
		{ 19, 28202, "", "=q3=Moonglade Robe", "=ds="..BabbleBoss["Pathaleon the Calculator"].." ("..BabbleZone["The Mechanar"]..")"};
		{ 20, 27468, "", "=q3=Moonglade Handwraps", "=ds="..BabbleBoss["Blackheart the Inciter"].." ("..BabbleZone["Shadow Labyrinth"]..")"};
		{ 21, 27873, "", "=q3=Moonglade Pants", "=ds="..BabbleBoss["Aeonus"].." ("..BabbleZone["The Black Morass"]..")"};
		Prev = "DS3Cloth";
		Next = "DS3Mail";
		Back = "DS3SET";
	};

	AtlasLoot_Data["DS3Mail"] = {
		{ 1, 0, "Ability_Hunter_Pet_Wolf", "=q6=#ds3s8#", ""};
		{ 2, 28275, "", "=q3=Beast Lord Helm", "=ds="..BabbleBoss["Pathaleon the Calculator"].." ("..BabbleZone["The Mechanar"]..")"};
		{ 3, 27801, "", "=q3=Beast Lord Mantle", "=ds="..BabbleBoss["Warlord Kalithresh"].." ("..BabbleZone["The Steamvault"]..")"};
		{ 4, 28228, "", "=q3=Beast Lord Curiass", "=ds="..BabbleBoss["Warp Splinter"].." ("..BabbleZone["The Botanica"]..")"};
		{ 5, 27474, "", "=q3=Beast Lord Handguards", "=ds="..BabbleBoss["Warchief Kargath Bladefist"].." ("..BabbleZone["The Shattered Halls"]..")"};
		{ 6, 27874, "", "=q3=Beast Lord Leggings", "=ds="..BabbleBoss["Warlord Kalithresh"].." ("..BabbleZone["The Steamvault"]..")"};
		{ 8, 0, "INV_Helmet_70", "=q6=#ds3s10#", ""};
		{ 9, 28349, "", "=q3=Tidefury Helm", "=ds="..BabbleBoss["Warp Splinter"].." ("..BabbleZone["The Botanica"]..")"};
		{ 10, 27802, "", "=q3=Tidefury Shoulderguards", "=ds="..BabbleBoss["Warbringer O'mrogg"].." ("..BabbleZone["The Shattered Halls"]..")"};
		{ 11, 28231, "", "=q3=Tidefury Chestpiece", "=ds="..BabbleBoss["Harbinger Skyriss"].." ("..BabbleZone["The Arcatraz"]..")"};
		{ 12, 27510, "", "=q3=Tidefury Gauntlets", "=ds="..BabbleBoss["Warlord Kalithresh"].." ("..BabbleZone["The Steamvault"]..")"};
		{ 13, 27909, "", "=q3=Tidefury Kilt", "=ds="..BabbleBoss["Murmur"].." ("..BabbleZone["Shadow Labyrinth"]..")"};
		{ 16, 0, "Ability_FiegnDead", "=q6=#ds3s9#", ""};
		{ 17, 28192, "", "=q3=Helm of Desolation", "=ds="..BabbleBoss["Aeonus"].." ("..BabbleZone["The Black Morass"]..")"};
		{ 18, 27713, "", "=q3=Pauldrons of Desolation", "=ds="..BabbleBoss["Quagmirran"].." (#j3#)"};
		{ 19, 28401, "", "=q3=Hauberk of Desolation", "=ds="..BabbleBoss["Epoch Hunter"].." ("..BabbleZone["Old Hillsbrad Foothills"]..") (#j3#)"};
		{ 20, 27528, "", "=q3=Gauntlets of Desolation", "=ds="..BabbleBoss["Warchief Kargath Bladefist"].." ("..BabbleZone["The Shattered Halls"]..")"};
		{ 21, 27936, "", "=q3=Greaves of Desolation", "=ds="..BabbleBoss["Talon King Ikiss"].." ("..BabbleZone["Sethekk Halls"]..")"};
		Prev = "DS3Leather";
		Next = "DS3Plate";
		Back = "DS3SET";
	};

	AtlasLoot_Data["DS3Plate"] = {
		{ 1, 0, "Spell_Fire_EnchantWeapon", "=q6=#ds3s11#", ""};
		{ 2, 28350, "", "=q3=Warhelm of the Bold", "=ds="..BabbleBoss["Warp Splinter"].." ("..BabbleZone["The Botanica"]..")"};
		{ 3, 27803, "", "=q3=Shoulderguards of the Bold", "=ds="..BabbleBoss["Murmur"].." ("..BabbleZone["Shadow Labyrinth"]..")"};
		{ 4, 28205, "", "=q3=Breastplate of the Bold", "=ds="..BabbleBoss["Harbinger Skyriss"].." ("..BabbleZone["The Arcatraz"]..")"};
		{ 5, 27475, "", "=q3=Gauntlets of the Bold", "=ds="..BabbleBoss["Warlord Kalithresh"].." ("..BabbleZone["The Steamvault"]..")"};
		{ 6, 27977, "", "=q3=Legplates of the Bold", "=ds="..BabbleBoss["Aeonus"].." ("..BabbleZone["The Black Morass"]..")"};
		{ 8, 0, "INV_Hammer_02", "=q6=#ds3s13#", ""};
		{ 9, 28285, "", "=q3=Helm of the Righteous", "=ds="..BabbleBoss["Pathaleon the Calculator"].." ("..BabbleZone["The Mechanar"]..")"};
		{ 10, 27739, "", "=q3=Spaulders of the Righteous", "=ds="..BabbleBoss["Laj"].." ("..BabbleZone["The Botanica"]..")"};
		{ 11, 28203, "", "=q3=Breastplate of the Righteous", "=ds="..BabbleBoss["Warlord Kalithresh"].." ("..BabbleZone["The Steamvault"]..")"};
		{ 12, 27535, "", "=q3=Gauntlets of the Righteous", "=ds="..BabbleBoss["Warbringer O'mrogg"].." ("..BabbleZone["The Shattered Halls"]..")"};
		{ 13, 27839, "", "=q3=Legplates of the Righteous", "=ds="..BabbleBoss["Aeonus"].." ("..BabbleZone["The Black Morass"]..")"};
		{ 16, 0, "INV_Helmet_08", "=q6=#ds3s12#", ""};
		{ 17, 28225, "", "=q3=Doomplate Warhelm", "=ds="..BabbleBoss["Epoch Hunter"].." ("..BabbleZone["Old Hillsbrad Foothills"]..") (#j3#)"};
		{ 18, 27771, "", "=q3=Doomplate Shouldergards", "=ds="..BabbleBoss["The Black Stalker"].." (#j3#)"};
		{ 19, 28403, "", "=q3=Doomplate Chestguard", "=ds="..BabbleBoss["Harbinger Skyriss"].." ("..BabbleZone["The Arcatraz"]..")"};
		{ 20, 27497, "", "=q3=Doomplate Gauntlets", "=ds="..BabbleBoss["Keli'dan the Breaker"].." ("..BabbleZone["The Blood Furnace"]..") (#j3#)"};
		{ 21, 27870, "", "=q3=Doomplate Legguards", "=ds="..BabbleBoss["Exarch Maladaar"].." ("..BabbleZone["Auchenai Crypts"]..") (#j3#)"};
		Prev = "DS3Mail";
		Back = "DS3SET";
	};

		----------------------------
		--- Tier 4/Tier 5/Tier 6 ---
		----------------------------

	AtlasLoot_Data["T456DruidFeral"] = {
		{ 1, 0, "Ability_Druid_Maul", "=q6=#t4s1_1#", "=ec1=#m21#"};
		{ 2, 29098, "", "=q4=Stag-Helm of Malorne", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29100, "", "=q4=Mantle of Malorne", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29096, "", "=q4=Breastplate of Malorne", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29097, "", "=q4=Gauntlets of Malorne", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29099, "", "=q4=Greaves of Malorne", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Ability_Druid_Maul", "=q6=#t5s1_1#", "=ec1=#m22#"};
		{ 9, 30228, "", "=q4=Nordrassil Headdress", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30230, "", "=q4=Nordrassil Feral-Mantle", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30222, "", "=q4=Nordrassil Chestplate", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30223, "", "=q4=Nordrassil Handgrips", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30229, "", "=q4=Nordrassil Feral-Kilt", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Ability_Druid_Maul", "=q6=#t6s1_1#", "=ec1=#m23#"};
		{ 17, 31039, "", "=q4=Thunderheart Cover", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31048, "", "=q4=Thunderheart Pauldrons", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31042, "", "=q4=Thunderheart Chestguard", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34444, "", "=q4=Thunderheart Wristguards", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31034, "", "=q4=Thunderheart Gauntlets", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34556, "", "=q4=Thunderheart Waistguard", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31044, "", "=q4=Thunderheart Leggings", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34573, "", "=q4=Thunderheart Treads", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456DruidRestoration"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#t4s1_2#", "=ec1=#m21#"};
		{ 2, 29086, "", "=q4=Crown of Malorne", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29089, "", "=q4=Shoulderguards of Malorne", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29087, "", "=q4=Chestguard of Malorne", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29090, "", "=q4=Handguards of Malorne", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29088, "", "=q4=Legguards of Malorne", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Nature_Regeneration", "=q6=#t5s1_2#", "=ec1=#m22#"};
		{ 9, 30219, "", "=q4=Nordrassil Headguard", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30221, "", "=q4=Nordrassil Life-Mantle", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30216, "", "=q4=Nordrassil Chestguard", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30217, "", "=q4=Nordrassil Gloves", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30220, "", "=q4=Nordrassil Life-Kilt", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Nature_Regeneration", "=q6=#t6s1_2#", "=ec1=#m23#"};
		{ 17, 31037, "", "=q4=Thunderheart Helmet", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31047, "", "=q4=Thunderheart Spaulders", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31041, "", "=q4=Thunderheart Tunic", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34445, "", "=q4=Thunderheart Bracers", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31032, "", "=q4=Thunderheart Gloves", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34554, "", "=q4=Thunderheart Belt", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31045, "", "=q4=Thunderheart Legguards", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34571, "", "=q4=Thunderheart Boots", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456DruidBalance"] = {
		{ 1, 0, "Spell_Nature_InsectSwarm", "=q6=#t4s1_3#", "=ec1=#m21#"};
		{ 2, 29093, "", "=q4=Antlers of Malorne", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29095, "", "=q4=Pauldrons of Malorne", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29091, "", "=q4=Chestpiece of Malorne", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29092, "", "=q4=Gloves of Malorne", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29094, "", "=q4=Britches of Malorne", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Nature_InsectSwarm", "=q6=#t5s1_3#", "=ec1=#m22#"};
		{ 9, 30233, "", "=q4=Nordrassil Headpiece", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30235, "", "=q4=Nordrassil Wrath-Mantle", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30231, "", "=q4=Nordrassil Chestpiece", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30232, "", "=q4=Nordrassil Gauntlets", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30234, "", "=q4=Nordrassil Wrath-Kilt", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Nature_InsectSwarm", "=q6=#t6s1_3#", "=ec1=#m23#"};
		{ 17, 31040, "", "=q4=Thunderheart Headguard", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31049, "", "=q4=Thunderheart Shoulderpads", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31043, "", "=q4=Thunderheart Vest", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34446, "", "=q4=Thunderheart Bands", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31035, "", "=q4=Thunderheart Handguards", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34555, "", "=q4=Thunderheart Cord", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31046, "", "=q4=Thunderheart Pants", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34572, "", "=q4=Thunderheart Footwraps", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456Hunter"] = {
		{ 1, 0, "Ability_Hunter_RunningShot", "=q6=#t4s2#", "=ec1=#m21#"};
		{ 2, 29081, "", "=q4=Demon Stalker Greathelm", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29084, "", "=q4=Demon Stalker Shoulderguards", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29082, "", "=q4=Demon Stalker Harness", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29085, "", "=q4=Demon Stalker Gauntlets", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29083, "", "=q4=Demon Stalker Greaves", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Ability_Hunter_RunningShot", "=q6=#t5s2#", "=ec1=#m22#"};
		{ 9, 30141, "", "=q4=Rift Stalker Helm", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30143, "", "=q4=Rift Stalker Mantle", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30139, "", "=q4=Rift Stalker Hauberk", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30140, "", "=q4=Rift Stalker Gauntlets", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30142, "", "=q4=Rift Stalker Leggings", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Ability_Hunter_RunningShot", "=q6=#t6s2#", "=ec1=#m23#"};
		{ 17, 31003, "", "=q4=Gronnstalker's Helmet", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31006, "", "=q4=Gronnstalker's Spaulders", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31004, "", "=q4=Gronnstalker's Chestguard", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34443, "", "=q4=Gronnstalker's Bracers", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31001, "", "=q4=Gronnstalker's Gloves", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34549, "", "=q4=Gronnstalker's Belt", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31005, "", "=q4=Gronnstalker's Leggings", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34570, "", "=q4=Gronnstalker's Boots", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456Mage"] = {
		{ 1, 0, "Spell_Frost_IceStorm", "=q6=#t4s3#", "=ec1=#m21#"};
		{ 2, 29076, "", "=q4=Collar of the Aldor", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29079, "", "=q4=Pauldrons of the Aldor", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29077, "", "=q4=Vestments of the Aldor", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29080, "", "=q4=Gloves of the Aldor", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29078, "", "=q4=Legwraps of the Aldor", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Frost_IceStorm", "=q6=#t5s3#", "=ec1=#m22#"};
		{ 9, 30206, "", "=q4=Cowl of Tirisfal", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30210, "", "=q4=Mantle of Tirisfal", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30196, "", "=q4=Robes of Tirisfal", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30205, "", "=q4=Gloves of Tirisfal", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30207, "", "=q4=Leggings of Tirisfal", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Frost_IceStorm", "=q6=#t6s3#", "=ec1=#m23#"};
		{ 17, 31056, "", "=q4=Cowl of the Tempest", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31059, "", "=q4=Mantle of the Tempest", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31057, "", "=q4=Robes of the Tempest", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34447, "", "=q4=Bracers of the Tempest", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31055, "", "=q4=Gloves of the Tempest", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34557, "", "=q4=Belt of the Tempest", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31058, "", "=q4=Leggings of the Tempest", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34574, "", "=q4=Boots of the Tempest", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};
	
	AtlasLoot_Data["T456PaladinProtection"] = {
		{ 1, 0, "Spell_Holy_SealOfMight", "=q6=#t4s4_1#", "=ec1=#m21#"};
		{ 2, 29068, "", "=q4=Justicar Faceguard", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29070, "", "=q4=Justicar Shoulderguards", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29066, "", "=q4=Justicar Chestguard", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29067, "", "=q4=Justicar Handguards", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29069, "", "=q4=Justicar Legguards", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Holy_SealOfMight", "=q6=#t5s4_1#", "=ec1=#m22#"};
		{ 9, 30125, "", "=q4=Crystalforge Faceguard", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30127, "", "=q4=Crystalforge Shoulderguards", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30123, "", "=q4=Crystalforge Chestguard", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30124, "", "=q4=Crystalforge Handguards", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30126, "", "=q4=Crystalforge Legguards", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Holy_SealOfMight", "=q6=#t6s4_1#", "=ec1=#m23#"};
		{ 17, 30987, "", "=q4=Lightbringer Faceguard", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 30998, "", "=q4=Lightbringer Shoulderguards", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 30991, "", "=q4=Lightbringer Chestguard", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34433, "", "=q4=Lightbringer Wristguards", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 30985, "", "=q4=Lightbringer Handguards", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34488, "", "=q4=Lightbringer Waistguard", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 30995, "", "=q4=Lightbringer Legguards", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34560, "", "=q4=Lightbringer Greaves", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456PaladinRetribution"] = {
		{ 1, 0, "Spell_Holy_AuraOfLight", "=q6=#t4s4_2#", "=ec1=#m21#"};
		{ 2, 29073, "", "=q4=Justicar Crown", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29075, "", "=q4=Justicar Shoulderplates", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29071, "", "=q4=Justicar Breastplate", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29072, "", "=q4=Justicar Gauntlets", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29074, "", "=q4=Justicar Greaves", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Holy_AuraOfLight", "=q6=#t5s4_2#", "=ec1=#m22#"};
		{ 9, 30131, "", "=q4=Crystalforge War-Helm", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30133, "", "=q4=Crystalforge Shoulderbraces", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30129, "", "=q4=Crystalforge Breastplate", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30130, "", "=q4=Crystalforge Gauntlets", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30132, "", "=q4=Crystalforge Greaves", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Holy_AuraOfLight", "=q6=#t6s4_2#", "=ec1=#m23#"};
		{ 17, 30989, "", "=q4=Lightbringer War-Helm", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 30997, "", "=q4=Lightbringer Shoulderbraces", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 30990, "", "=q4=Lightbringer Breastplate", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34431, "", "=q4=Lightbringer Bands", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 30982, "", "=q4=Lightbringer Gauntlets", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34485, "", "=q4=Lightbringer Girdle", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 30993, "", "=q4=Lightbringer Greaves", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34561, "", "=q4=Lightbringer Boots", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456PaladinHoly"] = {
		{ 1, 0, "Spell_Holy_HolyBolt", "=q6=#t4s4_3#", "=ec1=#m21#"};
		{ 2, 29061, "", "=q4=Justicar Diadem", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29064, "", "=q4=Justicar Pauldrons", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29062, "", "=q4=Justicar Chestpiece", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29065, "", "=q4=Justicar Gloves", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29063, "", "=q4=Justicar Leggings", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Holy_HolyBolt", "=q6=#t5s4_3#", "=ec1=#m22#"};
		{ 9, 30136, "", "=q4=Crystalforge Greathelm", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30138, "", "=q4=Crystalforge Pauldrons", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30134, "", "=q4=Crystalforge Chestpiece", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30135, "", "=q4=Crystalforge Gloves", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30137, "", "=q4=Crystalforge Leggings", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Holy_HolyBolt", "=q6=#t6s4_3#", "=ec1=#m23#"};
		{ 17, 30988, "", "=q4=Lightbringer Greathelm", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 30996, "", "=q4=Lightbringer Pauldrons", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 30992, "", "=q4=Lightbringer Chestpiece", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34432, "", "=q4=Lightbringer Bracers", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 30983, "", "=q4=Lightbringer Gloves", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34487, "", "=q4=Lightbringer Belt", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 30994, "", "=q4=Lightbringer Leggings", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34559, "", "=q4=Lightbringer Treads", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456PriestHoly"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#t4s5_1#", "=ec1=#m21#"};
		{ 2, 29049, "", "=q4=Light-Collar of the Incarnate", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29054, "", "=q4=Light-Mantle of the Incarnate", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29050, "", "=q4=Robes of the Incarnate", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29055, "", "=q4=Handwraps of the Incarnate", "The Curator ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29053, "", "=q4=Trousers of the Incarnate", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Holy_PowerWordShield", "=q6=#t5s5_1#", "=ec1=#m22#"};
		{ 9, 30152, "", "=q4=Cowl of the Avatar", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30154, "", "=q4=Mantle of the Avatar", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30150, "", "=q4=Vestments of the Avatar", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30151, "", "=q4=Gloves of the Avatar", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30153, "", "=q4=Breeches of the Avatar", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Holy_PowerWordShield", "=q6=#t6s5_1#", "=ec1=#m23#"};
		{ 17, 31063, "", "=q4=Cowl of Absolution", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31069, "", "=q4=Mantle of Absolution", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31066, "", "=q4=Vestments of Absolution", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34435, "", "=q4=Cuffs of Absolution", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31060, "", "=q4=Gloves of Absolution", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34527, "", "=q4=Belt of Absolution", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31068, "", "=q4=Breeches of Absolution", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34562, "", "=q4=Boots of Absolution", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456PriestShadow"] = {
		{ 1, 0, "Spell_Shadow_AntiShadow", "=q6=#t4s5_2#", "=ec1=#m21#"};
		{ 2, 29058, "", "=q4=Soul-Collar of the Incarnate", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29060, "", "=q4=Soul-Mantle of the Incarnate", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29056, "", "=q4=Shroud of the Incarnate", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29057, "", "=q4=Gloves of the Incarnate", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29059, "", "=q4=Leggings of the Incarnate", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Shadow_AntiShadow", "=q6=#t5s5_2#", "=ec1=#m22#"};
		{ 9, 30161, "", "=q4=Hood of the Avatar", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30163, "", "=q4=Wings of the Avatar", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30159, "", "=q4=Shroud of the Avatar", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30160, "", "=q4=Handguards of the Avatar", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30162, "", "=q4=Leggings of the Avatar", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Shadow_AntiShadow", "=q6=#t6s5_2#", "=ec1=#m23#"};
		{ 17, 31064, "", "=q4=Hood of Absolution", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31070, "", "=q4=Shoulderpads of Absolution", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31065, "", "=q4=Shroud of Absolution", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34434, "", "=q4=Bracers of Absolution", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31061, "", "=q4=Handguards of Absolution", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34528, "", "=q4=Cord of Absolution", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31067, "", "=q4=Leggings of Absolution", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34563, "", "=q4=Treads of Absolution", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456Rogue"] = {
		{ 1, 0, "Ability_BackStab", "=q6=#t4s6#", "=ec1=#m21#"};
		{ 2, 29044, "", "=q4=Netherblade Facemask", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29047, "", "=q4=Netherblade Shoulderpads", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29045, "", "=q4=Netherblade Chestpiece", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29048, "", "=q4=Netherblade Gloves", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29046, "", "=q4=Netherblade Breeches", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Ability_BackStab", "=q6=#t5s6#", "=ec1=#m22#"};
		{ 9, 30146, "", "=q4=Deathmantle Helm", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30149, "", "=q4=Deathmantle Shoulderpads", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30144, "", "=q4=Deathmantle Chestguard", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30145, "", "=q4=Deathmantle Handguards", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30148, "", "=q4=Deathmantle Legguards", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Ability_BackStab", "=q6=#t6s6#", "=ec1=#m23#"};
		{ 17, 31027, "", "=q4=Slayer's Helm", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31030, "", "=q4=Slayer's Shoulderpads", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31028, "", "=q4=Slayer's Chestguard", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34448, "", "=q4=Slayer's Bracers", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31026, "", "=q4=Slayer's Handguards", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34558, "", "=q4=Slayer's Belt", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31029, "", "=q4=Slayer's Legguards", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34575, "", "=q4=Slayer's Boots", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456ShamanEnhancement"] = {
		{ 1, 0, "Spell_FireResistanceTotem_01", "=q6=#t4s7_1#", "=ec1=#m21#"};
		{ 2, 29040, "", "=q4=Cyclone Helm", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29043, "", "=q4=Cyclone Shoulderplates", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29038, "", "=q4=Cyclone Breastplate", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29039, "", "=q4=Cyclone Gauntlets", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29042, "", "=q4=Cyclone War-Kilt", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_FireResistanceTotem_01", "=q6=#t5s7_1#", "=ec1=#m22#"};
		{ 9, 30190, "", "=q4=Cataclysm Helm", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30194, "", "=q4=Cataclysm Shoulderplates", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30185, "", "=q4=Cataclysm Chestplate", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30189, "", "=q4=Cataclysm Gauntlets", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30192, "", "=q4=Cataclysm Leggings", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_FireResistanceTotem_01", "=q6=#t6s7_1#", "=ec1=#m23#"};
		{ 17, 31015, "", "=q4=Skyshatter Cover", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31024, "", "=q4=Skyshatter Pauldrons", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31018, "", "=q4=Skyshatter Tunic", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34439, "", "=q4=Skyshatter Wristguards", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31011, "", "=q4=Skyshatter Grips", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34545, "", "=q4=Skyshatter Girdle", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31021, "", "=q4=Skyshatter Pants", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34567, "", "=q4=Skyshatter Greaves", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456ShamanRestoration"] = {
		{ 1, 0, "Spell_Nature_HealingWaveGreater", "=q6=#t4s7_2#", "=ec1=#m21#"};
		{ 2, 29028, "", "=q4=Cyclone Headdress", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29031, "", "=q4=Cyclone Shoulderpads", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29029, "", "=q4=Cyclone Hauberk", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29032, "", "=q4=Cyclone Gloves", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29030, "", "=q4=Cyclone Kilt", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Nature_HealingWaveGreater", "=q6=#t5s7_2#", "=ec1=#m22#"};
		{ 9, 30166, "", "=q4=Cataclysm Headguard", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30168, "", "=q4=Cataclysm Shoulderguards", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30164, "", "=q4=Cataclysm Chestguard", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30165, "", "=q4=Cataclysm Gloves", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30167, "", "=q4=Cataclysm Legguards", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Nature_HealingWaveGreater", "=q6=#t6s7_2#", "=ec1=#m23#"};
		{ 17, 31012, "", "=q4=Skyshatter Helmet", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31022, "", "=q4=Skyshatter Shoulderpads", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31016, "", "=q4=Skyshatter Chestguard", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34438, "", "=q4=Skyshatter Bracers", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31007, "", "=q4=Skyshatter Gloves", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34543, "", "=q4=Skyshatter Belt", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31019, "", "=q4=Skyshatter Leggings", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34565, "", "=q4=Skyshatter Boots", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456ShamanElemental"] = {
		{ 1, 0, "Spell_Nature_Lightning", "=q6=#t4s7_3#", "=ec1=#m21#"};
		{ 2, 29035, "", "=q4=Cyclone Faceguard", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29037, "", "=q4=Cyclone Shoulderguards", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29033, "", "=q4=Cyclone Chestguard", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29034, "", "=q4=Cyclone Handguards", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29036, "", "=q4=Cyclone Legguards", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Nature_Lightning", "=q6=#t5s7_3#", "=ec1=#m22#"};
		{ 9, 30171, "", "=q4=Cataclysm Headpiece", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30173, "", "=q4=Cataclysm Shoulderpads", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30169, "", "=q4=Cataclysm Chestpiece", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30170, "", "=q4=Cataclysm Handgrips", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30172, "", "=q4=Cataclysm Legguards", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Nature_Lightning", "=q6=#t6s7_3#", "=ec1=#m23#"};
		{ 17, 31014, "", "=q4=Skyshatter Headguard", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31023, "", "=q4=Skyshatter Mantle", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31017, "", "=q4=Skyshatter Breastplate", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34437, "", "=q4=Skyshatter Bands", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31008, "", "=q4=Skyshatter Gauntlets", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34542, "", "=q4=Skyshatter Cord", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31020, "", "=q4=Skyshatter Legguards", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34566, "", "=q4=Skyshatter Treads", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456Warlock"] = {
		{ 1, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t4s8#", "=ec1=#m21#"};
		{ 2, 28963, "", "=q4=Voidheart Crown", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 28967, "", "=q4=Voidheart Mantle", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 28964, "", "=q4=Voidheart Robe", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 28968, "", "=q4=Voidheart Gloves", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 28966, "", "=q4=Voidheart Leggings", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t5s8#", "=ec1=#m22#"};
		{ 9, 30212, "", "=q4=Hood of the Corruptor", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30215, "", "=q4=Mantle of the Corruptor", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30214, "", "=q4=Robe of the Corruptor", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30211, "", "=q4=Gloves of the Corruptor", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30213, "", "=q4=Leggings of the Corruptor", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t6s8#", "=ec1=#m23#"};
		{ 17, 31051, "", "=q4=Hood of the Malefic", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 31054, "", "=q4=Mantle of the Malefic", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 31052, "", "=q4=Robe of the Malefic", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34436, "", "=q4=Bracers of the Malefic", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 31050, "", "=q4=Gloves of the Malefic", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34541, "", "=q4=Belt of the Malefic", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 31053, "", "=q4=Leggings of the Malefic", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34564, "", "=q4=Boots of the Malefic", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456WarriorProtection"] = {
		{ 1, 0, "INV_Shield_05", "=q6=#t4s9_1#", "=ec1=#m21#"};
		{ 2, 29011, "", "=q4=Warbringer Greathelm", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29016, "", "=q4=Warbringer Shoulderguards", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29012, "", "=q4=Warbringer Chestguard", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29017, "", "=q4=Warbringer Handguards", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29015, "", "=q4=Warbringer Legguards", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "INV_Shield_05", "=q6=#t5s9_1#", "=ec1=#m22#"};
		{ 9, 30115, "", "=q4=Destroyer Greathelm", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30117, "", "=q4=Destroyer Shoulderguards", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30113, "", "=q4=Destroyer Chestguard", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30114, "", "=q4=Destroyer Handguards", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30116, "", "=q4=Destroyer Legguards", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "INV_Shield_05", "=q6=#t6s9_1#", "=ec1=#m23#"};
		{ 17, 30974, "", "=q4=Onslaught Greathelm", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 30980, "", "=q4=Onslaught Shoulderguards", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 30976, "", "=q4=Onslaught Chestguard", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34442, "", "=q4=Onslaught Wristguards", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 30970, "", "=q4=Onslaught Handguards", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34547, "", "=q4=Onslaught Waistguard", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 30978, "", "=q4=Onslaught Legguards", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34568, "", "=q4=Onslaught Boots", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

	AtlasLoot_Data["T456WarriorFury"] = {
		{ 1, 0, "Ability_Warrior_BattleShout", "=q6=#t4s9_2#", "=ec1=#m21#"};
		{ 2, 29021, "", "=q4=Warbringer Battle-Helm", "=ds="..BabbleBoss["Prince Malchezaar"].." ("..BabbleZone["Karazhan"]..")"};
		{ 3, 29023, "", "=q4=Warbringer Shoulderplates", "=ds="..BabbleBoss["High King Maulgar"]};
		{ 4, 29019, "", "=q4=Warbringer Breastplate", "=ds="..BabbleBoss["Magtheridon"]};
		{ 5, 29020, "", "=q4=Warbringer Gauntlets", "=ds="..BabbleBoss["The Curator"].." ("..BabbleZone["Karazhan"]..")"};
		{ 6, 29022, "", "=q4=Warbringer Greaves", "=ds="..BabbleBoss["Gruul the Dragonkiller"]};
		{ 8, 0, "Ability_Warrior_BattleShout", "=q6=#t5s9_2#", "=ec1=#m22#"};
		{ 9, 30120, "", "=q4=Destroyer Battle-Helm", "=ds="..BabbleBoss["Lady Vashj"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 10, 30122, "", "=q4=Destroyer Shoulderblades", "=ds="..BabbleBoss["Void Reaver"].." ("..BabbleZone["The Eye"]..")"};
		{ 11, 30118, "", "=q4=Destroyer Breastplate", "=ds="..BabbleBoss["Kael'thas Sunstrider"].." ("..BabbleZone["The Eye"]..")"};
		{ 12, 30119, "", "=q4=Destroyer Gauntlets", "=ds="..BabbleBoss["Leotheras the Blind"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 13, 30121, "", "=q4=Destroyer Greaves", "=ds="..BabbleBoss["Fathom-Lord Karathress"].." ("..BabbleZone["Serpentshrine Cavern"]..")"};
		{ 16, 0, "Ability_Warrior_BattleShout", "=q6=#t6s9_2#", "=ec1=#m23#"};
		{ 17, 30972, "", "=q4=Onslaught Battle-Helm", "=ds="..BabbleBoss["Archimonde"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 18, 30979, "", "=q4=Onslaught Shoulderblades", "=ds="..BabbleBoss["Mother Shahraz"].." ("..BabbleZone["Black Temple"]..")"};
		{ 19, 30975, "", "=q4=Onslaught Breastplate", "=ds="..BabbleBoss["Illidan Stormrage"].." ("..BabbleZone["Black Temple"]..")"};
		{ 20, 34441, "", "=q4=Onslaught Bracers", "=ds="..BabbleBoss["Kalecgos"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 21, 30969, "", "=q4=Onslaught Gauntlets", "=ds="..BabbleBoss["Azgalor"].." ("..BabbleZone["Hyjal Summit"]..")"};
		{ 22, 34546, "", "=q4=Onslaught Belt", "=ds="..BabbleBoss["Brutallus"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		{ 23, 30977, "", "=q4=Onslaught Greaves", "=ds="..BabbleBoss["The Illidari Council"].." ("..BabbleZone["Black Temple"]..")"};
		{ 24, 34569, "", "=q4=Onslaught Treads", "=ds="..BabbleBoss["Felmyst"].." ("..BabbleZone["Sunwell Plateau"]..")"};
		Back = "T456SET";
	};

		--------------------------------
		--- The Burning Crusade Sets ---
		--------------------------------

	AtlasLoot_Data["TBCSets"] = {
		{ 1, 0, "INV_Box_01", "=q6=#bcs3#", "=q1=#z7#"};
		{ 2, 34703, "", "=q3=Latro's Dancing Blade", "=ds=#h1#, #w10#, =q2=#n138# (#z30#)", "", ""};
		{ 3, 28189, "", "=q3=Latro's Shifting Sword", "=ds=#h1#, #w10#, =q2=#n139# (#z33#)", "", ""};
		{ 5, 0, "INV_Box_01", "=q6=#bcs1#", "=q1=#z17#"};
		{ 6, 31338, "", "=q4=Charlotte's Ivy", "=ds=#s2#", "", "0.01%"};
		{ 7, 31339, "", "=q4=Lola's Eve", "=ds=#s13#", "", "0.01%"};
		{ 16, 0, "INV_Box_01", "=q6=#bcs4#", "=q2=#n11#, =q1=#z34#"};
		{ 17, 32946, "", "=q4=Claw of Molten Fury", "=ds=#h3#, #w13#"};
		{ 18, 32945, "", "=q4=Fist of Molten Fury", "=ds=#h4#, #w13#"};
		{ 20, 0, "INV_Box_01", "=q6=#bcs2#", "=q2=#n137#, =q1=#z18#"};
		{ 21, 32837, "", "=q5=Warglaive of Azzinoth", "=ds=#h3#, #w10#, =q1=#m1# =ds=#c9#, #c6#"};
		{ 22, 32838, "", "=q5=Warglaive of Azzinoth", "=ds=#h4#, #w10#, =q1=#m1# =ds=#c9#, #c6#"};
		Back = "SETSBURNINGCURSADE";
	};

		--------------------------------
		--- Badge of Justice Rewards ---
		--------------------------------

	AtlasLoot_Data["HardModeCloth"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z31#", ""};
		{ 2, 32090, "", "=q4=Cowl of Naaru Blessings", "=ds=#s1#", "50 #heroic#", ""};
		{ 3, 32089, "", "=q4=Mana-Binders Cowl", "=ds=#s1#", "50 #heroic#", ""};
		{ 4, 33588, "", "=q4=Runed Spell-cuffs", "=ds=#s8#", "35 #heroic#", ""};
		{ 5, 33589, "", "=q4=Wristguards of Tranquil Thought", "=ds=#s8#", "35 #heroic#", ""};
		{ 6, 33587, "", "=q4=Light-Blessed Bonds", "=ds=#s9#", "60 #heroic#", ""};
		{ 7, 33586, "", "=q4=Studious Wraps", "=ds=#s9#", "60 #heroic#", ""};
		{ 8, 33291, "", "=q4=Voodoo-woven Belt", "=ds=#s10#", "60 #heroic#", ""};
		{ 9, 33585, "", "=q4=Achromic Trousers of the Naaru", "=ds=#s11#", "75 #heroic#", ""};
		{ 10, 33584, "", "=q4=Pantaloons of Arcane Annihilation", "=ds=#s11#", "75 #heroic#", ""};
		{ 16, 0, "INV_Box_01", "=q6=#z32#", ""};
		{ 17, 34924, "", "=q4=Gown of Spiritual Wonder", "=ds=#s5#", "100 #heroic#", ""};
		{ 18, 34917, "", "=q4=Shroud of the Lore`nial", "=ds=#s5#", "100 #heroic#", ""};
		{ 19, 34936, "", "=q4=Tormented Demonsoul Robes", "=ds=#s5#", "100 #heroic#", ""};
		{ 20, 34938, "", "=q4=Enslaved Doomguard Soulgrips", "=ds=#s9#", "75 #heroic#", ""};
		{ 21, 34925, "", "=q4=Adorned Supernal Legwraps", "=ds=#s11#", "100 #heroic#", ""};
		{ 22, 34937, "", "=q4=Corrupted Soulcloth Pantaloons", "=ds=#s11#", "100 #heroic#", ""};
		{ 23, 34918, "", "=q4=Legwraps of Sweltering Flame", "=ds=#s11#", "100 #heroic#", ""};
		{ 24, 34919, "", "=q4=Boots of Incantations", "=ds=#s12#", "75 #heroic#", ""};
		{ 25, 34926, "", "=q4=Slippers of Dutiful Mending", "=ds=#s12#", "75 #heroic#", ""};
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeLeather"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z31#", ""};
		{ 2, 32088, "", "=q4=Cowl of Beastly Rage", "=ds=#s1#", "50 #heroic#", ""};
		{ 3, 33972, "", "=q4=Mask of Primal Power", "=ds=#s1#", "75 #heroic#", ""};
		{ 4, 32087, "", "=q4=Mask of the Deceiver", "=ds=#s1#", "50 #heroic#", ""};
		{ 5, 33287, "", "=q4=Gnarled Ironwood Pauldrons", "=ds=#s3#", "60 #heroic#", ""};
		{ 6, 33973, "", "=q4=Pauldrons of Tribal Fury", "=ds=#s3#", "60 #heroic#", ""};
		{ 7, 33566, "", "=q4=Blessed Elunite Coverings", "=ds=#s5#", "75 #heroic#", ""};
		{ 8, 33579, "", "=q4=Vestments of Hibernation", "=ds=#s5#", "75 #heroic#", ""};
		{ 9, 33578, "", "=q4=Armwraps of the Kaldorei Protector", "=ds=#s8#", "35 #heroic#", ""};
		{ 10, 33580, "", "=q4=Band of the Swift Paw", "=ds=#s8#", "35 #heroic#", ""};
		{ 11, 33557, "", "=q4=Gargon's Bracers Peaceful Slumber", "=ds=#s8#", "35 #heroic#", ""};
		{ 12, 33540, "", "=q4=Master Assassin Wristwraps", "=ds=#s8#", "35 #heroic#", ""};
		{ 13, 33974, "", "=q4=Grasp of the Moonkin", "=ds=#s9#", "60 #heroic#", ""};
		{ 14, 33539, "", "=q4=Trickster's Stickyfingers", "=ds=#s9#", "60 #heroic#", ""};
		{ 15, 33559, "", "=q4=Starfire Waistband", "=ds=#s10#", "60 #heroic#", ""};
		{ 17, 33583, "", "=q4=Waistguard of the Great Beast", "=ds=#s10#", "60 #heroic#", ""};
		{ 18, 33552, "", "=q4=Pants of Splendid Recovery", "=ds=#s11#", "75 #heroic#", ""};
		{ 19, 33538, "", "=q4=Shallow-grave Trousers", "=ds=#s11#", "75 #heroic#", ""};
		{ 20, 33582, "", "=q4=Footwraps of Wild Encroachment", "=ds=#s12#", "60 #heroic#", ""};
		{ 21, 33577, "", "=q4=Moon-walkers", "=ds=#s12#", "60 #heroic#", ""};
		{ 22, 33222, "", "=q4=Nyn'jah's Tabi Boots", "=ds=#s12#", "60 #heroic#", ""};
		Next = "HardModeLeather2";
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeLeather2"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z32#", ""};
		{ 2, 34906, "", "=q4=Embrace of Everlasting Prowess", "=ds=#s5#", "100 #heroic#", ""};
		{ 3, 34903, "", "=q4=Embrace of Starlight", "=ds=#s5#", "100 #heroic#", ""};
		{ 4, 34900, "", "=q4=Shroud of Nature's Harmony", "=ds=#s5#", "100 #heroic#", ""};
		{ 5, 34927, "", "=q4=Tunic of the Dark Hour", "=ds=#s5#", "100 #heroic#", ""};
		{ 6, 34904, "", "=q4=Barbed Gloves of the Sage", "=ds=#s9#", "75 #heroic#", ""};
		{ 7, 34911, "", "=q4=Handwraps of the Aggressor", "=ds=#s9#", "75 #heroic#", ""};
		{ 8, 34902, "", "=q4=Oakleaf-Spun Handguards", "=ds=#s9#", "75 #heroic#", ""};
		{ 9, 34929, "", "=q4=Belt of the Silent Path", "=ds=#s10#", "75 #heroic#", ""};
		{ 10, 34905, "", "=q4=Crystalwind Leggings", "=ds=#s11#", "100 #heroic#", ""};
		{ 11, 34901, "", "=q4=Grovewalker's Leggings", "=ds=#s11#", "100 #heroic#", ""};
		{ 12, 34910, "", "=q4=Tameless Breeches", "=ds=#s11#", "100 #heroic#", ""};
		{ 13, 34928, "", "=q4=Trousers of the Scryers' Retainer", "=ds=#s11#", "100 #heroic#", ""};
		Prev = "HardModeLeather";
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeMail"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z31#", ""};
		{ 2, 32086, "", "=q4=Storm Master's Helmet", "=ds=#s1#, #a3#", "50 #heroic#", ""};
		{ 3, 32085, "", "=q4=Warpstalker Helm", "=ds=#s1#, #a3#", "50 #heroic#", ""};
		{ 4, 33970, "", "=q4=Pauldrons of the Furious Elements", "=ds=#s3#, #a3#", "60 #heroic#", ""};
		{ 5, 33965, "", "=q4=Hauberk of the Furious Elements", "=ds=#s5#, #a3#", "75 #heroic#", ""};
		{ 6, 33535, "", "=q4=Earthquake Bracers", "=ds=#s8#, #a3#", "35 #heroic#", ""};
		{ 7, 33532, "", "=q4=Gleaming Earthen Bracers", "=ds=#s8#, #a3#", "35 #heroic#", ""};
		{ 8, 33529, "", "=q4=Steadying Bracers", "=ds=#s8#, #a3#", "35 #heroic#", ""};
		{ 9, 33528, "", "=q4=Gauntlets of Sniping", "=ds=#s9#, #a3#", "60 #heroic#", ""};
		{ 10, 33534, "", "=q4=Grips of Nature's Wrath", "=ds=#s9#, #a3#", "60 #heroic#", ""};
		{ 11, 33531, "", "=q4=Polished Waterscale Gloves", "=ds=#s9#, #a3#", "60 #heroic#", ""};
		{ 12, 33386, "", "=q4=Man'kin'do's Belt", "=ds=#s10#, #a3#", "60 #heroic#", ""};
		{ 13, 33536, "", "=q4=Stormwrap", "=ds=#s10#, #a3#", "60 #heroic#", ""};
		{ 14, 33280, "", "=q4=War-Feathered Loop", "=ds=#s10#, #a3#", "60 #heroic#", ""};
		{ 15, 33530, "", "=q4=Natural Life Leggings", "=ds=#s11#, #a3#", "75 #heroic#", ""};
		{ 16, 33527, "", "=q4=Shifting Camouflage Pants", "=ds=#s11#, #a3#", "75 #heroic#", ""};
		{ 17, 33537, "", "=q4=Treads of Booming Thunder", "=ds=#s12#, #a3#", "60 #heroic#", ""};
		{ 18, 33324, "", "=q4=Treads of Life Path", "=ds=#s12#, #a3#", "60 #heroic#", ""};
		{ 21, 0, "INV_Box_01", "=q6=#z32#", ""};
		{ 22, 34933, "", "=q4=Hauberk of Whirling Fury", "=ds=#s5#", "100 #heroic#", ""};
		{ 23, 34912, "", "=q4=Scaled Drakeskin Chestguard", "=ds=#s5#", "100 #heroic#", ""};
		{ 24, 34930, "", "=q4=Wave of Life Chestguard", "=ds=#s5#", "100 #heroic#", ""};
		{ 25, 34916, "", "=q4=Gauntlets of Rapidity", "=ds=#s9#", "75 #heroic#", ""};
		{ 26, 34935, "", "=q4=Aftershock Waistguard", "=ds=#s10#", "75 #heroic#", ""};
		{ 27, 34932, "", "=q4=Clutch of the Soothing Breeze", "=ds=#s10#", "75 #heroic#", ""};
		{ 28, 34914, "", "=q4=Leggings of the Pursuit", "=ds=#s11#", "100 #heroic#", ""};
		{ 29, 34931, "", "=q4=Runed Scales of Antiquity", "=ds=#s11#", "100 #heroic#", ""};
		{ 30, 34934, "", "=q4=Rushing Storm Kilt", "=ds=#s11#", "100 #heroic#", ""};
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModePlate"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z31#", ""};
		{ 2, 33810, "", "=q4=Amani Mask of Death", "=ds=#s1#, #a4#", "75 #heroic#", ""};
		{ 3, 32083, "", "=q4=Faceguard of Determination", "=ds=#s1#, #a4#", "50 #heroic#", ""};
		{ 4, 32084, "", "=q4=Helmet of the Steadfast Champion", "=ds=#s1#, #a4#", "50 #heroic#", ""};
		{ 5, 33514, "", "=q4=Pauldrons of Gruesome Fate", "=ds=#s3#, #a4#", "60 #heroic#", ""};
		{ 6, 33522, "", "=q4=Chestguard of the Stoic Guardian", "=ds=#s5#, #a4#", "75 #heroic#", ""};
		{ 7, 33516, "", "=q4=Bracers of the Ancient Phalanx", "=ds=#s8#, #a4#", "35 #heroic#", ""};
		{ 8, 33513, "", "=q4=Eternium Rage-shackles", "=ds=#s8#, #a4#", "35 #heroic#", ""};
		{ 9, 33520, "", "=q4=Vambraces of the Naaru", "=ds=#s8#, #a4#", "35 #heroic#", ""};
		{ 10, 33517, "", "=q4=Bonefist Gauntlets", "=ds=#s9#, #a4#", "60 #heroic#", ""};
		{ 11, 33512, "", "=q4=Furious Deathgrips", "=ds=#s9#, #a4#", "60 #heroic#", ""};
		{ 12, 33519, "", "=q4=Handguards of the Templar", "=ds=#s9#, #a4#", "60 #heroic#", ""};
		{ 13, 33331, "", "=q4=Chain of Unleashed Rage", "=ds=#s10#, #a4#", "60 #heroic#", ""};
		{ 14, 33524, "", "=q4=Girdle of the Protector", "=ds=#s10#, #a4#", "60 #heroic#", ""};
		{ 15, 33279, "", "=q4=Iron-tusk Girdle", "=ds=#s10#, #a4#", "60 #heroic#", ""};
		{ 17, 33501, "", "=q4=Bloodthirster's Greaves", "=ds=#s11#, #a4#", "75 #heroic#", ""};
		{ 18, 33518, "", "=q4=High Justicar's Legplates", "=ds=#s11#, #a4#", "75 #heroic#", ""};
		{ 19, 33515, "", "=q4=Unwavering Legguards", "=ds=#s11#, #a4#", "75 #heroic#", ""};
		{ 20, 33207, "", "=q4=Implacable Guardian Sabatons", "=ds=#s12#, #a4#", "60 #heroic#", ""};
		{ 21, 33523, "", "=q4=Sabatons of the Righteous Defender", "=ds=#s12#, #a4#", "60 #heroic#", ""};
		Next = "HardModePlate2";
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModePlate2"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z32#", ""};
		{ 2, 34942, "", "=q4=Breastplate of Ire", "=ds=#s5#", "100 #heroic#", ""};
		{ 3, 34939, "", "=q4=Chestplate of Stoicism", "=ds=#s5#", "100 #heroic#", ""};
		{ 4, 34921, "", "=q4=Ecclesiastical Cuirass", "=ds=#s5#", "100 #heroic#", ""};
		{ 5, 34945, "", "=q4=Shattrath Protectorate's Breastplate", "=ds=#s5#", "100 #heroic#", ""};
		{ 6, 34944, "", "=q4=Girdle of Seething Rage", "=ds=#s10#", "75 #heroic#", ""};
		{ 7, 34941, "", "=q4=Girdle of the Fearless", "=ds=#s10#", "75 #heroic#", ""};
		{ 8, 34923, "", "=q4=Waistguard of Reparation", "=ds=#s10#", "75 #heroic#", ""};
		{ 9, 34922, "", "=q4=Greaves of Pacification", "=ds=#s11#", "100 #heroic#", ""};
		{ 10, 34946, "", "=q4=Inscribed Legplates of the Aldor", "=ds=#s11#", "100 #heroic#", ""};
		{ 11, 34943, "", "=q4=Legplates of Unending Fury", "=ds=#s11#", "100 #heroic#", ""};
		{ 12, 34940, "", "=q4=Sunguard Legplates", "=ds=#s11#", "100 #heroic#", ""};
		{ 13, 34947, "", "=q4=Blue's Greaves of the Righteous Guardian", "=ds=#s12#", "75 #heroic#", ""};
		Prev = "HardModePlate";
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeResist"] = {
		{ 1, 0, "INV_Box_01", "=q6=#a1#", ""};
		{ 2, 30762, "", "=q4=Infernoweave Robe", "=ds=#a1#, #s5#", "30 #heroic#", ""};
		{ 3, 30764, "", "=q4=Infernoweave Gloves", "=ds=#a1#, #s9#", "20 #heroic#", ""};
		{ 4, 30761, "", "=q4=Infernoweave Leggings", "=ds=#a1#, #s11#", "30 #heroic#", ""};
		{ 5, 30763, "", "=q4=Infernoweave Boots", "=ds=#a1#, #s12#", "20 #heroic#", ""};
		{ 7, 0, "INV_Box_01", "=q6=#a2#", ""};
		{ 8, 30776, "", "=q4=Inferno Hardened Chestguard", "=ds=#a2#, #s5#", "30 #heroic#", ""};
		{ 9, 30780, "", "=q4=Inferno Hardened Gloves", "=ds=#a2#, #s9#", "20 #heroic#", ""};
		{ 10, 30778, "", "=q4=Inferno Hardened Leggings", "=ds=#a2#, #s11#", "30 #heroic#", ""};
		{ 11, 30779, "", "=q4=Inferno Hardened Boots", "=ds=#a2#, #s12#", "20 #heroic#", ""};
		{ 13, 29434, "", "=q4=Badge of Justice", "=ds=#m17#"};
		{ 16, 0, "INV_Box_01", "=q6=#a3#", ""};
		{ 17, 30773, "", "=q4=Inferno Forged Hauberk", "=ds=#a3#, #s5#", "30 #heroic#", ""};
		{ 18, 30774, "", "=q4=Inferno Forged Gloves", "=ds=#a3#, #s9#", "20 #heroic#", ""};
		{ 19, 30772, "", "=q4=Inferno Forged Leggings", "=ds=#a3#, #s11#", "30 #heroic#", ""};
		{ 20, 30770, "", "=q4=Inferno Forged Boots", "=ds=#a3#, #s12#", "20 #heroic#", ""};
		{ 22, 0, "INV_Box_01", "=q6=#a4#", ""};
		{ 23, 30769, "", "=q4=Inferno Tempered Chestguard", "=ds=#a4#, #s5#", "30 #heroic#", ""};
		{ 24, 30767, "", "=q4=Inferno Tempered Gauntlets", "=ds=#a4#, #s9#", "20 #heroic#", ""};
		{ 25, 30766, "", "=q4=Inferno Tempered Leggings", "=ds=#a4#, #s11#", "30 #heroic#", ""};
		{ 26, 30768, "", "=q4=Inferno Tempered Boots", "=ds=#a4#, #s12#", "20 #heroic#", ""};
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeCloaks"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z31#", ""};
		{ 2, 29375, "", "=q4=Bishop's Cloak", "=ds=#s4#", "25 #heroic#", ""};
		{ 3, 29382, "", "=q4=Blood Knight War Cloak", "=ds=#s4#", "25 #heroic#", ""};
		{ 4, 35321, "", "=q4=Cloak of Arcane Alacrity", "=ds=#s4#", "60 #heroic#", ""};
		{ 5, 33304, "", "=q4=Cloak of Subjugated Power", "=ds=#s4#", "60 #heroic#", ""};
		{ 6, 35324, "", "=q4=Cloak of Swift Reprieve", "=ds=#s4#", "60 #heroic#", ""};
		{ 7, 33484, "", "=q4=Dory's Embrace", "=ds=#s4#", "60 #heroic#", ""};
		{ 8, 29385, "", "=q4=Farstrider Defender's Cloak", "=ds=#s4#", "25 #heroic#", ""};
		{ 9, 33333, "", "=q4=Kharmaa's Shroud of Hope", "=ds=#s4#", "60 #heroic#", ""};
		{ 10, 29369, "", "=q4=Shawl of Shifting Probabilities", "=ds=#s4#", "25 #heroic#", ""};
		{ 11, 33593, "", "=q4=Slikk's Cloak of Placation", "=ds=#s4#", "35 #heroic#", ""};
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeRelic"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z31#", ""};
		{ 2, 29390, "", "=q4=Everbloom Idol", "=ds=#s16#, #w14#", "15 #heroic#", ""};
		{ 3, 33508, "", "=q4=Idol of Budding Life", "=ds=#s16#, #w14#", "20 #heroic#", ""};
		{ 4, 33509, "", "=q4=Idol of Terror", "=ds=#s16#, #w14#", "20 #heroic#", ""};
		{ 5, 33510, "", "=q4=Idol of the Unseen Moon", "=ds=#s16#, #w14#", "20 #heroic#", ""};
		{ 7, 33506, "", "=q4=Skycall Totem", "=ds=#s16#, #w15#", "20 #heroic#", ""};
		{ 8, 33507, "", "=q4=Stonebreaker's Totem", "=ds=#s16#, #w15#", "20 #heroic#", ""};
		{ 9, 33505, "", "=q4=Totem of Living Water", "=ds=#s16#, #w15#", "20 #heroic#", ""};
		{ 10, 29389, "", "=q4=Totem of the Pulsing Earth", "=ds=#s16#, #w15#", "15 #heroic#", ""};
		{ 17, 33503, "", "=q4=Libram of Divine Judgement", "=ds=#s16#, #w16#", "20 #heroic#", ""};
		{ 18, 33504, "", "=q4=Libram of Divine Purpose", "=ds=#s16#, #w16#", "20 #heroic#", ""};
		{ 19, 33502, "", "=q4=Libram of Mending", "=ds=#s16#, #w16#", "20 #heroic#", ""};
		{ 20, 29388, "", "=q4=Libram of Repentance", "=ds=#s16#, #w16#", "15 #heroic#", ""};
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeArena"] = {
		{ 1, 32811, "", "=q4=Veteran's Dreadweave Cuffs", "=ds=#s8#, #a1#", "25 #heroic#", ""};
		{ 2, 32799, "", "=q4=Veteran's Dreadweave Belt", "=ds=#s10#, #a1#", "40 #heroic#", ""};
		{ 3, 32787, "", "=q4=Veteran's Dreadweave Stalkers", "=ds=#s12#, #a1#", "40 #heroic#", ""};
		{ 5, 32980, "", "=q4=Veteran's Mooncloth Cuffs", "=ds=#s8#, #a1#", "25 #heroic#", ""};
		{ 6, 32979, "", "=q4=Veteran's Mooncloth Belt", "=ds=#s10#, #a1#", "40 #heroic#", ""};
		{ 7, 32981, "", "=q4=Veteran's Mooncloth Slippers", "=ds=#s12#, #a1#", "40 #heroic#", ""};
		{ 9, 32820, "", "=q4=Veteran's Silk Cuffs", "=ds=#s8#, #a1#", "25 #heroic#", ""};
		{ 10, 32807, "", "=q4=Veteran's Silk Belt", "=ds=#s10#, #a1#", "40 #heroic#", ""};
		{ 11, 32795, "", "=q4=Veteran's Silk Footguards", "=ds=#s12#, #a1#", "40 #heroic#", ""};
		{ 16, 32810, "", "=q4=Veteran's Dragonhide Bracers", "=ds=#s8#, #a2#", "25 #heroic#", ""};
		{ 17, 32798, "", "=q4=Veteran's Dragonhide Belt", "=ds=#s10#, #a2#", "40 #heroic#", ""};
		{ 18, 32786, "", "=q4=Veteran's Dragonhide Boots", "=ds=#s12#, #a2#", "40 #heroic#", ""};
		{ 20, 32812, "", "=q4=Veteran's Kodohide Bracers", "=ds=#s8#, #a2#", "25 #heroic#", ""};
		{ 21, 32800, "", "=q4=Veteran's Kodohide Belt", "=ds=#s10#, #a2#", "40 #heroic#", ""};
		{ 22, 32788, "", "=q4=Veteran's Kodohide Boots", "=ds=#s12#, #a2#", "40 #heroic#", ""};
		{ 24, 32814, "", "=q4=Veteran's Leather Bracers", "=ds=#s8#, #a2#", "25 #heroic#", ""};
		{ 25, 32802, "", "=q4=Veteran's Leather Belt", "=ds=#s10#, #a2#", "40 #heroic#", ""};
		{ 26, 32790, "", "=q4=Veteran's Leather Boots", "=ds=#s12#, #a2#", "40 #heroic#", ""};
		{ 28, 32821, "", "=q4=Veteran's Wyrmhide Bracers", "=ds=#s8#, #a2#", "25 #heroic#", ""};
		{ 29, 32808, "", "=q4=Veteran's Wyrmhide Belt", "=ds=#s10#, #a2#", "40 #heroic#", ""};
		{ 30, 32796, "", "=q4=Veteran's Wyrmhide Boots", "=ds=#s12#, #a2#", "40 #heroic#", ""};
		Next = "HardModeArena2";
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeArena2"] = {
		{ 1, 32809, "", "=q4=Veteran's Chain Bracers", "=ds=#s8#, #a3#", "25 #heroic#", ""};
		{ 2, 32797, "", "=q4=Veteran's Chain Girdle", "=ds=#s10#, #a3#", "40 #heroic#", ""};
		{ 3, 32785, "", "=q4=Veteran's Chain Sabatons", "=ds=#s12#, #a3#", "40 #heroic#", ""};
		{ 5, 32816, "", "=q4=Veteran's Linked Bracers", "=ds=#s8#, #a3#", "25 #heroic#", ""};
		{ 6, 32803, "", "=q4=Veteran's Linked Girdle", "=ds=#s10#, #a3#", "40 #heroic#", ""};
		{ 7, 32791, "", "=q4=Veteran's Linked Sabatons", "=ds=#s12#, #a3#", "40 #heroic#", ""};
		{ 9, 32817, "", "=q4=Veteran's Mail Bracers", "=ds=#s8#, #a3#", "25 #heroic#", ""};
		{ 10, 32804, "", "=q4=Veteran's Mail Girdle", "=ds=#s10#, #a3#", "40 #heroic#", ""};
		{ 11, 32792, "", "=q4=Veteran's Mail Sabatons", "=ds=#s12#, #a3#", "40 #heroic#", ""};
		{ 13, 32997, "", "=q4=Veteran's Ringmail Bracers", "=ds=#s8#, #a3#", "25 #heroic#", ""};
		{ 14, 32998, "", "=q4=Veteran's Ringmail Girdle", "=ds=#s10#, #a3#", "40 #heroic#", ""};
		{ 15, 32999, "", "=q4=Veteran's Ringmail Sabatons", "=ds=#s12#, #a3#", "40 #heroic#", ""};
		{ 16, 32813, "", "=q4=Veteran's Lamellar Bracers", "=ds=#s8#, #a4#", "25 #heroic#", ""};
		{ 17, 32801, "", "=q4=Veteran's Lamellar Belt", "=ds=#s10#, #a4#", "40 #heroic#", ""};
		{ 18, 32789, "", "=q4=Veteran's Lamellar Greaves", "=ds=#s12#, #a4#", "40 #heroic#", ""};
		{ 20, 32989, "", "=q4=Veteran's Ornamented Bracers", "=ds=#s8#, #a4#", "25 #heroic#", ""};
		{ 21, 32988, "", "=q4=Veteran's Ornamented Belt", "=ds=#s10#, #a4#", "40 #heroic#", ""};
		{ 22, 32990, "", "=q4=Veteran's Ornamented Greaves", "=ds=#s12#, #a4#", "40 #heroic#", ""};
		{ 24, 32818, "", "=q4=Veteran's Plate Bracers", "=ds=#s8#, #a4#", "25 #heroic#", ""};
		{ 25, 32805, "", "=q4=Veteran's Plate Belt", "=ds=#s10#, #a4#", "40 #heroic#", ""};
		{ 26, 32793, "", "=q4=Veteran's Plate Greaves", "=ds=#s12#, #a4#", "40 #heroic#", ""};
		{ 28, 32819, "", "=q4=Veteran's Scaled Bracers", "=ds=#s8#, #a4#", "25 #heroic#", ""};
		{ 29, 32806, "", "=q4=Veteran's Scaled Belt", "=ds=#s10#, #a4#", "40 #heroic#", ""};
		{ 30, 32794, "", "=q4=Veteran's Scaled Greaves", "=ds=#s12#, #a4#", "40 #heroic#", ""};
		Prev = "HardModeArena";
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeWeapons"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z31#", ""};
		{ 2, 29275, "", "=q4=Searing Sunblade", "=ds=#h4#, #w4#", "50 #heroic#", ""};
		{ 3, 33192, "", "=q4=Carved Witch Doctor's Stick", "=ds=#w12#", "25 #heroic#", ""};
		{ 4, 29266, "", "=q4=Azure-Shield of Coldarra", "=ds=#w8#", "33 #heroic#", ""};
		{ 5, 29267, "", "=q4=Light-Bearer's Faith Shield", "=ds=#w8#", "33 #heroic#", ""};
		{ 6, 29268, "", "=q4=Mazthoril Honor Shield", "=ds=#w8#", "33 #heroic#", ""};
		{ 7, 33334, "", "=q4=Fetish of the Primal Gods", "=ds=#s15#", "35 #heroic#", ""};
		{ 8, 29270, "", "=q4=Flametounge Seal", "=ds=#s15#", "25 #heroic#", ""};
		{ 9, 29273, "", "=q4=Khadgar's Knapsack", "=ds=#s15#", "25 #heroic#", ""};
		{ 10, 29272, "", "=q4=Orb of the Soul-Eater", "=ds=#s15#", "25 #heroic#", ""};
		{ 11, 29269, "", "=q4=Sapphiron's Wing Bone", "=ds=#s15#", "25 #heroic#", ""};
		{ 12, 29271, "", "=q4=Talisman of Kalecgos", "=ds=#s15#", "25 #heroic#", ""};
		{ 13, 29274, "", "=q4=Tears of Heaven", "=ds=#s15#", "25 #heroic#", ""};
		{ 14, 33325, "", "=q4=Voodoo Shaker", "=ds=#s15#", "35 #heroic#", ""};
		{ 16, 0, "INV_Box_01", "=q6=#z32#", ""};
		{ 17, 34893, "", "=q4=Vanir's Right Fist of Brutality", "=ds=#h3#, #w13#", "105 #heroic#", ""};
		{ 18, 34951, "", "=q4=Vanir's Left Fist of Brutality", "=ds=#h4#, #w13#", "45 #heroic#", ""};
		{ 19, 34950, "", "=q4=Vanir's Left Fist of Savagery", "=ds=#h4#, #w13#", "45 #heroic#", ""};
		{ 20, 34895, "", "=q4=Scryer's Blade of Focus", "=ds=#h3#, #w4#", "150 #heroic#", ""};
		{ 21, 34894, "", "=q4=Blade of Serration", "=ds=#h1#, #w4#", "105 #heroic#", ""};
		{ 22, 34949, "", "=q4=Swift Blade of Uncertainty", "=ds=#h4#, #w4#", "45 #heroic#", ""};
		{ 23, 34952, "", "=q4=The Mutilator", "=ds=#h4#, #w4#", "45 #heroic#", ""};
		{ 24, 34891, "", "=q4=The Blade of Harbingers", "=ds=#h2#, #w1#", "150 #heroic#", ""};
		{ 25, 34896, "", "=q4=Gavel of Naaru Blessings", "=ds=#h3#, #w6#", "150 #heroic#", ""};
		{ 26, 34898, "", "=q4=Staff of the Forest Lord", "=ds=#w9#", "150 #heroic#", ""};
		{ 27, 34892, "", "=q4=Crossbow of Relentless Strikes", "=ds=#w3#", "150 #heroic#", ""};
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeAccessories"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z31#", ""};
		{ 2, 33296, "", "=q4=Brooch of Deftness", "=ds=#s2#", "35 #heroic#", ""};
		{ 3, 29381, "", "=q4=Choker of Vile Intent", "=ds=#s2#", "25 #heroic#", ""};
		{ 4, 29374, "", "=q4=Necklace of Eternal Hope", "=ds=#s2#", "25 #heroic#", ""};
		{ 5, 29368, "", "=q4=Manasurge Pendant", "=ds=#s2#", "25 #heroic#", ""};
		{ 6, 29386, "", "=q4=Necklace of the Juggernaut", "=ds=#s2#", "25 #heroic#", ""};
		{ 7, 29373, "", "=q4=Band of Halos", "=ds=#s13#", "25 #heroic#", ""};
		{ 8, 29379, "", "=q4=Ring of Arathi Warlords", "=ds=#s13#", "25 #heroic#", ""};
		{ 9, 29367, "", "=q4=Ring of Cryptic Dreams", "=ds=#s13#", "25 #heroic#", ""};
		{ 10, 29384, "", "=q4=Ring of Unyielding Force", "=ds=#s13#", "25 #heroic#", ""};
		{ 12, 23572, "", "=q3=Primal Nether", "=ds=#e8#", "10 #heroic#", ""};
		{ 13, 32227, "", "=q4=Crimson Spinel", "=ds=#e7#", "15 #heroic#", ""};
		{ 14, 32229, "", "=q4=Lionseye", "=ds=#e7#", "15 #heroic#", ""};
		{ 15, 32249, "", "=q4=Seaspray Emerald", "=ds=#e7#", "15 #heroic#", ""};
		{ 16, 35326, "", "=q4=Battlemaster's Alacrity", "=ds=#s14#", "75 #heroic#", ""};
		{ 17, 34049, "", "=q4=Battlemaster's Audacity", "=ds=#s14#", "75 #heroic#", ""};
		{ 18, 34163, "", "=q4=Battlemaster's Cruelty", "=ds=#s14#", "75 #heroic#", ""};
		{ 19, 34162, "", "=q4=Battlemaster's Depravity", "=ds=#s14#", "75 #heroic#", ""};
		{ 20, 33832, "", "=q4=Battlemaster's Determination", "=ds=#s14#", "75 #heroic#", ""};
		{ 21, 34050, "", "=q4=Battlemaster's Perseverance", "=ds=#s14#", "75 #heroic#", ""};
		{ 22, 29383, "", "=q4=Bloodlust Brooch", "=ds=#s14#", "41 #heroic#", ""};
		{ 23, 29376, "", "=q4=Essence of the Martyr", "=ds=#s14#", "41 #heroic#", ""};
		{ 24, 29387, "", "=q4=Gnomeregan Auto-Blocker 600", "=ds=#s14#", "41 #heroic#", ""};
		{ 25, 29370, "", "=q4=Icon of the Silver Crescent", "=ds=#s14#", "41 #heroic#", ""};
		{ 27, 30183, "", "=q4=Nether Vortex", "=ds=#e8#", "15 #heroic#", ""};
		{ 28, 32228, "", "=q4=Empyrean Sapphire", "=ds=#e7#", "15 #heroic#", ""};
		{ 29, 32231, "", "=q4=Pyrestone", "=ds=#e7#", "15 #heroic#", ""};
		{ 30, 32230, "", "=q4=Shadowsong Amethyst", "=ds=#e7#", "15 #heroic#", ""};
		Next = "HardModeAccessories2";
		Back = "70TOKENMENU";
	};

	AtlasLoot_Data["HardModeAccessories2"] = {
		{ 1, 0, "INV_Box_01", "=q6=#z32#", ""};
		{ 2, 34887, "", "=q4=Angelista's Revenge", "=ds=#s13#", "60 #heroic#", ""};
		{ 3, 34890, "", "=q4=Anveena's Touch", "=ds=#s13#", "60 #heroic#", ""};
		{ 4, 34889, "", "=q4=Fused Nethergon Band", "=ds=#s13#", "60 #heroic#", ""};
		{ 5, 34888, "", "=q4=Ring of the Stalwart Protector", "=ds=#s13#", "60 #heroic#", ""};
		Prev = "HardModeAccessories";
		Back = "70TOKENMENU";
	};

		-----------------------
		--- BoE World Epics ---
		-----------------------

	AtlasLoot_Data["WorldEpics4"] = {
		{ 1, 31329, "", "=q4=Lifegiving Cloak", "=ds=#s4#", "", ""};
		{ 2, 31340, "", "=q4=Will of Edward the Odd", "=ds=#s5#, #a1#", "", ""};
		{ 3, 31343, "", "=q4=Kamaei's Cerulean Skirt", "=ds=#s11#, #a1#", "", ""};
		{ 4, 31333, "", "=q4=The Night Watchman", "=ds=#s1#, #a2#", "", ""};
		{ 5, 31335, "", "=q4=Pants of Living Growth", "=ds=#s11#, #a2#", "", ""};
		{ 6, 31330, "", "=q4=Lightning Crown", "=ds=#s1#, #a3#", "", ""};
		{ 7, 31328, "", "=q4=Leggings of Beast Mastery", "=ds=#s11#, #a3#", "", ""};
		{ 8, 31320, "", "=q4=Chestguard of Exile", "=ds=#s5#, #a4#", "", ""};
		{ 9, 31338, "", "=q4=Charlotte's Ivy", "=ds=#s2#", "", ""};
		{ 10, 31321, "", "=q4=Choker of Repentance", "=ds=#s2#", "", ""};
		{ 11, 31319, "", "=q4=Band of Impenetrable Defenses", "=ds=#s13#", "", ""};
		{ 12, 31339, "", "=q4=Lola's Eve", "=ds=#s13#", "", ""};
		{ 13, 31326, "", "=q4=Truestrike Ring", "=ds=#s13#", "", ""};
		{ 16, 31331, "", "=q4=The Night Blade", "=ds=#h1#, #w4#", "", ""};
		{ 17, 31336, "", "=q4=Blade of Wizardry", "=ds=#h3#, #w10#", "", ""};
		{ 18, 31332, "", "=q4=Blinkstrike", "=ds=#h1#, #w10#", "", ""};
		{ 19, 31318, "", "=q4=Singing Crystal Axe", "=ds=#h2#, #w1#", "", ""};
		{ 20, 31342, "", "=q4=The Ancient Scepter of Sue-Min", "=ds=#h3#, #w6#", "", ""};
		{ 21, 31322, "", "=q4=The Hammer of Destiny", "=ds=#h2#, #w6#", "", ""};
		{ 22, 31334, "", "=q4=Staff of Natural Fury", "=ds=#w9#", "", ""};
		{ 23, 34622, "", "=q4=Spinesever", "=ds=#w11#", "", ""};
		{ 24, 31323, "", "=q4=Don Santos' Famous Hunting Rifle", "=ds=#w5#", "", ""};
		Next = "WorldEpicsWrath1";
		Prev = "WorldEpics3";
		Back = "WORLDEPICS";
	};

	--------------------
	--- World Bosses ---
	--------------------

	AtlasLoot_Data["WorldBossesBC"] = {
		{ 1, 0, "INV_Box_01", "=q6="..BabbleBoss["Doom Lord Kazzak"], ""};
		{ 2, 30735, "", "=q4=Ancient Spellcloak of the Highborne", "=ds=#s4#", "", "16.5%"};
		{ 3, 30734, "", "=q4=Leggings of the Seventh Circle", "=ds=#s11#, #a1#", "", "17.0%"};
		{ 4, 30737, "", "=q4=Gold-Leaf Wildboots", "=ds=#s12#, #a2#", "", "21.1%"};
		{ 5, 30739, "", "=q4=Scaled Greaves of the Marksman", "=ds=#s11#, #a3#", "", "14.0%"};
		{ 6, 30740, "", "=q4=Ripfiend Shoulderplates", "=ds=#s3#, #a4#", "", "16.1%"};
		{ 7, 30741, "", "=q4=Topaz-Studded Battlegrips", "=ds=#s9#, #a4#", "", "17.0%"};
		{ 8, 30736, "", "=q4=Ring of Flowing Light", "=ds=#s13#", "", "15.8%"};
		{ 9, 30738, "", "=q4=Ring of Reciprocity", "=ds=#s13#", "", "23.4%"};
		{ 10, 30733, "", "=q4=Hope Ender", "=ds=#h1#, #w10#", "", "16.7%"};
		{ 11, 30732, "", "=q4=Exodar Life-Staff", "=ds=#w9#", "", "17.1%"};
		{ 16, 0, "INV_Box_01", "=q6="..BabbleBoss["Doomwalker"], ""};
		{ 17, 30729, "", "=q4=Black-Iron Battlecloak", "=ds=#s4#", "", "19.6%"};
		{ 18, 30725, "", "=q4=Anger-Spark Gloves", "=ds=#s9#, #a1#", "", "17.9%"};
		{ 19, 30727, "", "=q4=Gilded Trousers of Benediction", "=ds=#s11#, #a1#", "", "18.1%"};
		{ 20, 30730, "", "=q4=Terrorweave Tunic", "=ds=#s5#, #a2#", "", "18.8%"};
		{ 21, 30728, "", "=q4=Fathom-Helm of the Deeps", "=ds=#s1#, #a3#", "", "16.2%"};
		{ 22, 30731, "", "=q4=Faceguard of the Endless Watch", "=ds=#s1#, #a4#", "", "18.1%"};
		{ 23, 30726, "", "=q4=Archaic Charm of Presence", "=ds=#s2#", "", "20.9%"};
		{ 24, 30723, "", "=q4=Talon of the Tempest", "=ds=#h3#, #w4#", "", "15.4%"};
		{ 25, 30722, "", "=q4=Ethereum Nexus-Reaver", "=ds=#h2#, #w1#", "", "16.0%"};
		{ 26, 30724, "", "=q4=Barrel-Blade Longrifle", "=ds=#w5#", "", "20.0%"};
	};

	----------------------------
	--- Factions: Hellfire Peninsula
	----------------------------

	AtlasLoot_Data["Thrallmar1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..BabbleFaction["Thrallmar"], "=q5=Reputation Rewards"};
		{ 2, 0, "INV_Box_01", "=q6=Faction rewards not yet configured", ""};
	};

	AtlasLoot_Data["Thrallmar2"] = {
		{ 1, 0, "INV_Box_01", "=q6="..BabbleFaction["Thrallmar"], "=q5=Reputation Rewards"};
		{ 2, 0, "INV_Box_01", "=q6=Faction rewards not yet configured", ""};
	};

	AtlasLoot_Data["HonorHold1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..BabbleFaction["Honor Hold"], "=q5=Reputation Rewards"};
		{ 2, 0, "INV_Box_01", "=q6=Faction rewards not yet configured", ""};
	};

	AtlasLoot_Data["HonorHold2"] = {
		{ 1, 0, "INV_Box_01", "=q6="..BabbleFaction["Honor Hold"], "=q5=Reputation Rewards"};
		{ 2, 0, "INV_Box_01", "=q6=Faction rewards not yet configured", ""};
	};