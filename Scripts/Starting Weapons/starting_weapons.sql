-- Human Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 10;

-- Undead Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 34;

-- Human Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 39;

-- Undead Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 61;

-- Gnome Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 294;

-- Gnome Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 306;

-- Troll Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 317;

-- Troll Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 318;

-- Blood Elf Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 323;

-- Blood Elf Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 327;

-- Draenei Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 341;

-- Draenei Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 342;

-- Goblin Rogue (Male): Add Thrown (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 25861, `invType4` = 26 WHERE `ID` = 372;

-- Goblin Rogue (Female): Add Thrown (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 25861, `invType4` = 26 WHERE `ID` = 373;

-- Goblin Mage (Male): Add Staves (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 35, `invType3` = 17 WHERE `ID` = 380;

-- Goblin Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 380;

-- Goblin Mage (Female): Add Staves (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 35, `invType3` = 17 WHERE `ID` = 381;

-- Goblin Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 381;

-- Worgen Rogue (Male): Add Thrown (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 25861, `invType4` = 26 WHERE `ID` = 388;

-- Worgen Rogue (Female): Add Thrown (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 25861, `invType4` = 26 WHERE `ID` = 389;

-- Worgen Mage (Male): Add Staves (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 35, `invType4` = 17 WHERE `ID` = 394;

-- Worgen Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 394;

-- Worgen Mage (Female): Add Staves (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 35, `invType4` = 17 WHERE `ID` = 395;

-- Worgen Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 395;

-- ============================================================================
-- CLEANUP: REMOVE DUPLICATE WEAPONS/AMMO
-- ============================================================================

-- Human Mage (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 10;
-- Dwarf Priest (Male): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 22;
-- Night Elf Hunter (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 24;
-- Undead Priest (Male): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 32;
-- Undead Mage (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 34;
-- Human Priest (Female): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 38;
-- Human Mage (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 39;
-- Dwarf Priest (Female): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 50;
-- Night Elf Hunter (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 54;
-- Night Elf Priest (Female): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 56;
-- Undead Priest (Female): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 60;
-- Undead Mage (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 61;
-- Gnome Mage (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 294;
-- Gnome Mage (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 306;
-- Troll Mage (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 317;
-- Troll Mage (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 318;
-- Blood Elf Priest (Male): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 321;
-- Blood Elf Mage (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 323;
-- Blood Elf Priest (Female): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 326;
-- Blood Elf Mage (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 327;
-- Draenei Priest (Male): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 339;
-- Draenei Priest (Female): Multiple melee weapons (keeping first, removing extra One-Handed Maces)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 340;
-- Draenei Mage (Male): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 341;
-- Draenei Mage (Female): Multiple melee weapons (keeping first, removing extra Daggers)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 342;

-- Cleaned up 24 duplicate weapons/ammo
