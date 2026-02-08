-- Orc Rogue (Male): Move Daggers from slot 5 to slot 7 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 19;
UPDATE `charstartoutfit` SET `item_7` = 2092, `inventory_type_7` = 13 WHERE `id` = 19;

-- Orc Rogue (Female): Move Daggers from slot 5 to slot 7 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 20;
UPDATE `charstartoutfit` SET `item_7` = 2092, `inventory_type_7` = 13 WHERE `id` = 20;

-- Dwarf Rogue (Male): Move Daggers from slot 1 to slot 5 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 33;
UPDATE `charstartoutfit` SET `item_5` = 2092, `inventory_type_5` = 13 WHERE `id` = 33;

-- Dwarf Rogue (Female): Move Daggers from slot 1 to slot 5 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 34;
UPDATE `charstartoutfit` SET `item_5` = 2092, `inventory_type_5` = 13 WHERE `id` = 34;

-- Night Elf Hunter (Male): Move Two-Handed Axes from slot 5 to slot 1 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 43;
UPDATE `charstartoutfit` SET `item_1` = 12282, `inventory_type_1` = 17 WHERE `id` = 43;

-- Night Elf Hunter (Male): Replace Guns with Bows
UPDATE `charstartoutfit` SET `item_8` = 2504 WHERE `id` = 43;

-- Night Elf Hunter (Female): Move Two-Handed Axes from slot 5 to slot 1 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 44;
UPDATE `charstartoutfit` SET `item_1` = 12282, `inventory_type_1` = 17 WHERE `id` = 44;

-- Night Elf Hunter (Female): Replace Guns with Bows
UPDATE `charstartoutfit` SET `item_8` = 2504 WHERE `id` = 44;

-- Night Elf Rogue (Male): Move Daggers from slot 1 to slot 6 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 45;
UPDATE `charstartoutfit` SET `item_6` = 2092, `inventory_type_6` = 13 WHERE `id` = 45;

-- Night Elf Rogue (Female): Move Daggers from slot 1 to slot 6 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 46;
UPDATE `charstartoutfit` SET `item_6` = 2092, `inventory_type_6` = 13 WHERE `id` = 46;

-- Undead Rogue (Male): Move Daggers from slot 1 to slot 6 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 55;
UPDATE `charstartoutfit` SET `item_6` = 2092, `inventory_type_6` = 13 WHERE `id` = 55;

-- Undead Rogue (Female): Move Daggers from slot 1 to slot 6 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 56;
UPDATE `charstartoutfit` SET `item_6` = 2092, `inventory_type_6` = 13 WHERE `id` = 56;

-- Gnome Rogue (Male): Move Daggers from slot 4 to slot 5 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_4` = 0, `inventory_type_4` = 0 WHERE `id` = 77;
UPDATE `charstartoutfit` SET `item_5` = 2092, `inventory_type_5` = 13 WHERE `id` = 77;

-- Gnome Rogue (Female): Move Daggers from slot 4 to slot 5 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_4` = 0, `inventory_type_4` = 0 WHERE `id` = 78;
UPDATE `charstartoutfit` SET `item_5` = 2092, `inventory_type_5` = 13 WHERE `id` = 78;

-- Troll Rogue (Male): Move Daggers from slot 1 to slot 6 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 89;
UPDATE `charstartoutfit` SET `item_6` = 2092, `inventory_type_6` = 13 WHERE `id` = 89;

-- Troll Rogue (Female): Move Daggers from slot 1 to slot 6 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 90;
UPDATE `charstartoutfit` SET `item_6` = 2092, `inventory_type_6` = 13 WHERE `id` = 90;

-- Blood Elf Rogue (Male): Move Daggers from slot 1 to slot 6 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 103;
UPDATE `charstartoutfit` SET `item_6` = 20982, `inventory_type_6` = 13 WHERE `id` = 103;

-- Blood Elf Rogue (Female): Move Daggers from slot 1 to slot 6 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 104;
UPDATE `charstartoutfit` SET `item_6` = 20982, `inventory_type_6` = 13 WHERE `id` = 104;

-- Human Rogue (Male): Move Daggers from slot 5 to slot 7 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 207;
UPDATE `charstartoutfit` SET `item_7` = 2092, `inventory_type_7` = 13 WHERE `id` = 207;

-- Human Rogue (Female): Move Daggers from slot 5 to slot 7 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 208;
UPDATE `charstartoutfit` SET `item_7` = 2092, `inventory_type_7` = 13 WHERE `id` = 208;

-- Goblin Rogue (Male): Replace One-Handed Maces with Daggers
UPDATE `charstartoutfit` SET `item_5` = 2092 WHERE `id` = 506;

-- Goblin Rogue (Female): Replace One-Handed Maces with Daggers
UPDATE `charstartoutfit` SET `item_5` = 2092 WHERE `id` = 507;

-- Goblin Priest (Male): Move Staves from slot 1 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 508;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 508;

-- Goblin Priest (Female): Move Staves from slot 1 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 509;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 509;

-- Goblin Mage (Male): Move Staves from slot 9 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_9` = 0, `inventory_type_9` = 0 WHERE `id` = 514;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 514;

-- Goblin Mage (Female): Move Staves from slot 9 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_9` = 0, `inventory_type_9` = 0 WHERE `id` = 515;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 515;

-- Worgen Rogue (Male): Replace One-Handed Axes with Daggers
UPDATE `charstartoutfit` SET `item_5` = 2092 WHERE `id` = 536;

-- Worgen Rogue (Female): Replace One-Handed Axes with Daggers
UPDATE `charstartoutfit` SET `item_5` = 2092 WHERE `id` = 537;

-- Worgen Priest (Male): Move Staves from slot 5 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 538;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 538;

-- Worgen Priest (Female): Move Staves from slot 5 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 539;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 539;

-- Worgen Mage (Male): Move Staves from slot 5 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 544;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 544;

-- Worgen Mage (Female): Move Staves from slot 5 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 545;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 545;

-- Worgen Warlock (Male): Move Staves from slot 5 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 546;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 546;

-- Worgen Warlock (Female): Move Staves from slot 5 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 547;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 547;

-- Worgen Druid (Female): Move Staves from slot 1 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 548;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 548;

-- Worgen Druid (Male): Move Staves from slot 1 to slot 4 (stock WOTLK position)
UPDATE `charstartoutfit` SET `item_1` = 0, `inventory_type_1` = 0 WHERE `id` = 549;
UPDATE `charstartoutfit` SET `item_4` = 35, `inventory_type_4` = 17 WHERE `id` = 549;

-- ============================================================================
-- CLEANUP: REMOVE DUPLICATE WEAPONS/AMMO
-- ============================================================================

-- Human Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 207;
-- Human Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 207;
-- Human Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 208;
-- Human Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 208;
-- Orc Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 19;
-- Orc Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 19;
-- Orc Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 20;
-- Orc Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 20;
-- Dwarf Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 33;
-- Dwarf Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 33;
-- Dwarf Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 34;
-- Dwarf Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 34;
-- Night Elf Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 45;
-- Night Elf Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 45;
-- Night Elf Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 46;
-- Night Elf Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 46;
-- Undead Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 55;
-- Undead Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 55;
-- Undead Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 56;
-- Undead Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 56;
-- Tauren Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 167;
-- Tauren Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 167;
-- Tauren Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 168;
-- Tauren Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 168;
-- Gnome Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 77;
-- Gnome Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 77;
-- Gnome Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 78;
-- Gnome Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_5` = 0, `inventory_type_5` = 0 WHERE `id` = 78;
-- Troll Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 89;
-- Troll Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 89;
-- Troll Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 90;
-- Troll Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 90;
-- Goblin Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_8` = 0, `inventory_type_8` = 0 WHERE `id` = 506;
-- Goblin Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_8` = 0, `inventory_type_8` = 0 WHERE `id` = 507;
-- Blood Elf Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 103;
-- Blood Elf Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 103;
-- Blood Elf Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 104;
-- Blood Elf Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 104;
-- Draenei Rogue (Male): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 197;
-- Draenei Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 197;
-- Draenei Rogue (Female): Duplicate same weapon type
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 198;
-- Draenei Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_7` = 0, `inventory_type_7` = 0 WHERE `id` = 198;
-- Worgen Rogue (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 536;
-- Worgen Rogue (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `charstartoutfit` SET `item_6` = 0, `inventory_type_6` = 0 WHERE `id` = 537;

-- Cleaned up 44 duplicate weapons/ammo


-- ============================================================================
-- DISPLAY INFO FIXES
-- ============================================================================
-- Fixes display_item_ values that don't match item_template.displayid
-- The client uses display_item_ for character creation preview models
-- ============================================================================

-- Goblin Warrior (Male): Fix Battleworn Hammer display_item_ 8688 -> 8690
UPDATE `charstartoutfit` SET `display_item_5` = 8690 WHERE `id` = 500;

-- Goblin Warrior (Female): Fix Battleworn Hammer display_item_ 8688 -> 8690
UPDATE `charstartoutfit` SET `display_item_5` = 8690 WHERE `id` = 501;

-- Goblin Hunter (Male): Fix Small Ammo Pouch display_item_ -1 -> 1816
UPDATE `charstartoutfit` SET `display_item_7` = 1816 WHERE `id` = 504;

-- Goblin Hunter (Male): Fix Old Blunderbuss display_item_ 2409 -> 6606
UPDATE `charstartoutfit` SET `display_item_8` = 6606 WHERE `id` = 504;

-- Goblin Hunter (Male): Fix Light Shot display_item_ -1 -> 5998
UPDATE `charstartoutfit` SET `display_item_9` = 5998 WHERE `id` = 504;

-- Goblin Hunter (Female): Fix Small Ammo Pouch display_item_ -1 -> 1816
UPDATE `charstartoutfit` SET `display_item_7` = 1816 WHERE `id` = 505;

-- Goblin Hunter (Female): Fix Old Blunderbuss display_item_ 2409 -> 6606
UPDATE `charstartoutfit` SET `display_item_8` = 6606 WHERE `id` = 505;

-- Goblin Hunter (Female): Fix Light Shot display_item_ -1 -> 5998
UPDATE `charstartoutfit` SET `display_item_9` = 5998 WHERE `id` = 505;

-- Goblin Hunter (Female): Fix Worn Wood Chopper display_item_ -1 -> 65743
UPDATE `charstartoutfit` SET `display_item_11` = 65743 WHERE `id` = 505;

-- Goblin Rogue (Male): Fix Worn Dirk display_item_ 2704 -> 6442
UPDATE `charstartoutfit` SET `display_item_8` = 6442 WHERE `id` = 506;

-- Goblin Rogue (Female): Fix Worn Dirk display_item_ 2704 -> 6442
UPDATE `charstartoutfit` SET `display_item_8` = 6442 WHERE `id` = 507;

-- Worgen Hunter (Male): Fix Old Blunderbuss display_item_ 2409 -> 6606
UPDATE `charstartoutfit` SET `display_item_6` = 6606 WHERE `id` = 534;

-- Worgen Hunter (Male): Fix Small Ammo Pouch display_item_ -1 -> 1816
UPDATE `charstartoutfit` SET `display_item_7` = 1816 WHERE `id` = 534;

-- Worgen Hunter (Male): Fix Light Shot display_item_ -1 -> 5998
UPDATE `charstartoutfit` SET `display_item_9` = 5998 WHERE `id` = 534;

-- Worgen Hunter (Female): Fix Old Blunderbuss display_item_ 2409 -> 6606
UPDATE `charstartoutfit` SET `display_item_6` = 6606 WHERE `id` = 535;

-- Worgen Hunter (Female): Fix Small Ammo Pouch display_item_ -1 -> 1816
UPDATE `charstartoutfit` SET `display_item_7` = 1816 WHERE `id` = 535;

-- Worgen Hunter (Female): Fix Light Shot display_item_ -1 -> 5998
UPDATE `charstartoutfit` SET `display_item_9` = 5998 WHERE `id` = 535;

-- Worgen Rogue (Male): Fix Worn Axe display_item_ 8483 -> 14029
UPDATE `charstartoutfit` SET `display_item_5` = 14029 WHERE `id` = 536;

-- Worgen Rogue (Male): Fix Worn Dirk display_item_ 2704 -> 6442
UPDATE `charstartoutfit` SET `display_item_6` = 6442 WHERE `id` = 536;

-- Worgen Rogue (Female): Fix Worn Axe display_item_ 8483 -> 14029
UPDATE `charstartoutfit` SET `display_item_5` = 14029 WHERE `id` = 537;

-- Worgen Rogue (Female): Fix Worn Dirk display_item_ 2704 -> 6442
UPDATE `charstartoutfit` SET `display_item_6` = 6442 WHERE `id` = 537;
