-- Human Warrior (Male): Add Bows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2504, `invType4` = 15 WHERE `ID` = 1;

-- Human Warrior (Male): Replace Two-Handed Swords with One-Handed Maces
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 36 WHERE `ID` = 1;

-- Human Warrior (Male): Add Ammo for Bows
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2512, `invType6` = 24 WHERE `ID` = 1;

-- Orc Warrior (Male): Add Bows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2504, `invType6` = 15 WHERE `ID` = 2;

-- Orc Warrior (Male): Add Ammo for Bows
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 2512, `invType7` = 24 WHERE `ID` = 2;

-- Dwarf Warrior (Male): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2508, `invType4` = 15 WHERE `ID` = 3;

-- Dwarf Warrior (Male): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 2516, `invType7` = 24 WHERE `ID` = 3;

-- Night Elf Warrior (Male): Replace Two-Handed Swords with One-Handed Maces
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 36 WHERE `ID` = 4;

-- Night Elf Warrior (Male): Add Bows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2504, `invType5` = 15 WHERE `ID` = 4;

-- Night Elf Warrior (Male): Add Ammo for Bows
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2512, `invType6` = 24 WHERE `ID` = 4;

-- Human Mage (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 10;

-- Human Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 10;

-- Human Priest (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902 WHERE `ID` = 11;

-- Human Priest (Male): Add One-Handed Maces (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 36, `invType6` = 13 WHERE `ID` = 11;

-- Human Warlock (Male): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 12;

-- Human Warlock (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 12;

-- Human Warrior (Female): Add Bows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2504, `invType4` = 15 WHERE `ID` = 14;

-- Human Warrior (Female): Replace Two-Handed Swords with One-Handed Maces
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 36 WHERE `ID` = 14;

-- Human Warrior (Female): Add Ammo for Bows
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2512, `invType6` = 24 WHERE `ID` = 14;

-- Tauren Hunter (Male): Replace Two-Handed Axes with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 37 WHERE `ID` = 15;

-- Orc Hunter (Male): Replace Two-Handed Axes with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 37 WHERE `ID` = 16;

-- Orc Warlock (Male): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 20;

-- Orc Warlock (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 20;

-- Dwarf Hunter (Male): Replace Two-Handed Axes with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 37 WHERE `ID` = 21;

-- Dwarf Priest (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902 WHERE `ID` = 22;

-- Night Elf Hunter (Male): Replace Two-Handed Axes with Daggers
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 2092 WHERE `ID` = 24;

-- Night Elf Priest (Male): Add One-Handed Maces (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 36, `invType1` = 13 WHERE `ID` = 26;

-- Night Elf Priest (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 26;

-- Tauren Warrior (Male): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 2508, `invType3` = 15 WHERE `ID` = 27;

-- Tauren Warrior (Male): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2516, `invType6` = 24 WHERE `ID` = 27;

-- Undead Warrior (Male): Add Bows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2504, `invType5` = 15 WHERE `ID` = 30;

-- Undead Warrior (Male): Add Ammo for Bows
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2512, `invType6` = 24 WHERE `ID` = 30;

-- Undead Priest (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 4902 WHERE `ID` = 32;

-- Undead Warlock (Male): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 33;

-- Undead Warlock (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902 WHERE `ID` = 33;

-- Undead Mage (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 34;

-- Undead Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 34;

-- Human Priest (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902 WHERE `ID` = 38;

-- Human Mage (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 39;

-- Human Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 39;

-- Human Warlock (Female): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 40;

-- Human Warlock (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 40;

-- Orc Warrior (Female): Add Bows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2504, `invType6` = 15 WHERE `ID` = 41;

-- Orc Warrior (Female): Add Ammo for Bows
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 2512, `invType7` = 24 WHERE `ID` = 41;

-- Orc Hunter (Female): Replace Two-Handed Axes with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 37 WHERE `ID` = 42;

-- Orc Warlock (Female): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 46;

-- Orc Warlock (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 46;

-- Dwarf Warrior (Female): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2508, `invType4` = 15 WHERE `ID` = 47;

-- Dwarf Warrior (Female): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 2516, `invType7` = 24 WHERE `ID` = 47;

-- Dwarf Hunter (Female): Replace Two-Handed Axes with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 37 WHERE `ID` = 49;

-- Dwarf Priest (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902 WHERE `ID` = 50;

-- Night Elf Warrior (Female): Replace Two-Handed Swords with One-Handed Maces
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 36 WHERE `ID` = 53;

-- Night Elf Warrior (Female): Add Bows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2504, `invType5` = 15 WHERE `ID` = 53;

-- Night Elf Warrior (Female): Add Ammo for Bows
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2512, `invType6` = 24 WHERE `ID` = 53;

-- Night Elf Hunter (Female): Replace Two-Handed Axes with Daggers
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 2092 WHERE `ID` = 54;

-- Night Elf Priest (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 4902 WHERE `ID` = 56;

-- Undead Warrior (Female): Add Bows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2504, `invType5` = 15 WHERE `ID` = 58;

-- Undead Warrior (Female): Add Ammo for Bows
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2512, `invType6` = 24 WHERE `ID` = 58;

-- Undead Priest (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 4902 WHERE `ID` = 60;

-- Undead Mage (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 61;

-- Undead Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 61;

-- Undead Warlock (Female): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 62;

-- Undead Warlock (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902 WHERE `ID` = 62;

-- Tauren Warrior (Female): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 2508, `invType3` = 15 WHERE `ID` = 63;

-- Tauren Warrior (Female): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2516, `invType5` = 24 WHERE `ID` = 63;

-- Tauren Hunter (Female): Replace Two-Handed Axes with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 37 WHERE `ID` = 64;

-- Gnome Warrior (Male): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2508, `invType4` = 15 WHERE `ID` = 291;

-- Gnome Warrior (Male): Replace Two-Handed Swords with One-Handed Maces
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 36 WHERE `ID` = 291;

-- Gnome Warrior (Male): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2516, `invType6` = 24 WHERE `ID` = 291;

-- Troll Warrior (Male): Replace Two-Handed Swords with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 37 WHERE `ID` = 292;

-- Gnome Mage (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902, `invType5` = 26 WHERE `ID` = 294;

-- Gnome Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 294;

-- Gnome Warlock (Male): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2092, `invType5` = 13 WHERE `ID` = 295;

-- Gnome Warlock (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 295;

-- Troll Hunter (Male): Replace Two-Handed Axes with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 37 WHERE `ID` = 297;

-- Troll Priest (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 4902 WHERE `ID` = 298;

-- Troll Priest (Male): Add One-Handed Maces (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId2` = 36, `invType2` = 13 WHERE `ID` = 298;

-- Gnome Mage (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902, `invType5` = 26 WHERE `ID` = 306;

-- Gnome Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 306;

-- Gnome Warlock (Female): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2092, `invType5` = 13 WHERE `ID` = 308;

-- Gnome Warlock (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 308;

-- Troll Hunter (Female): Replace Two-Handed Axes with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 37 WHERE `ID` = 310;

-- Troll Priest (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 4902 WHERE `ID` = 311;

-- Troll Priest (Female): Add One-Handed Maces (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId2` = 36, `invType2` = 13 WHERE `ID` = 311;

-- Gnome Warrior (Female): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2508, `invType4` = 15 WHERE `ID` = 314;

-- Gnome Warrior (Female): Replace Two-Handed Swords with One-Handed Maces
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 36 WHERE `ID` = 314;

-- Gnome Warrior (Female): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2516, `invType6` = 24 WHERE `ID` = 314;

-- Troll Warrior (Female): Replace Two-Handed Swords with One-Handed Axes
UPDATE `dbc`.`charstartoutfit` SET `itemId1` = 37 WHERE `ID` = 316;

-- Troll Mage (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 317;

-- Troll Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 317;

-- Troll Mage (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 318;

-- Troll Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 318;

-- Blood Elf Priest (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 4902 WHERE `ID` = 321;

-- Blood Elf Warlock (Male): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 322;

-- Blood Elf Warlock (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 322;

-- Blood Elf Mage (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 323;

-- Blood Elf Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 323;

-- Blood Elf Priest (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 4902 WHERE `ID` = 326;

-- Blood Elf Mage (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 327;

-- Blood Elf Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 327;

-- Blood Elf Warlock (Female): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 328;

-- Blood Elf Warlock (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 328;

-- Blood Elf Hunter (Male): Replace Two-Handed Axes with Daggers
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2092 WHERE `ID` = 329;

-- Blood Elf Hunter (Female): Replace Two-Handed Axes with Daggers
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2092 WHERE `ID` = 330;

-- Draenei Warrior (Male): Add Crossbows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 23347, `invType6` = 15 WHERE `ID` = 331;

-- Draenei Warrior (Male): Add Ammo for Crossbows
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 2512, `invType7` = 24 WHERE `ID` = 331;

-- Draenei Warrior (Female): Add Crossbows (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 23347, `invType6` = 15 WHERE `ID` = 332;

-- Draenei Warrior (Female): Add Ammo for Crossbows
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 2512, `invType7` = 24 WHERE `ID` = 332;

-- Draenei Hunter (Male): Replace Two-Handed Axes with One-Handed Swords
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 25 WHERE `ID` = 335;

-- Draenei Hunter (Female): Replace Two-Handed Axes with One-Handed Swords
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 25 WHERE `ID` = 336;

-- Draenei Priest (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 4902 WHERE `ID` = 339;

-- Draenei Priest (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 4902 WHERE `ID` = 340;

-- Draenei Mage (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 341;

-- Draenei Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 341;

-- Draenei Mage (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 342;

-- Draenei Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 0, `invType7` = 0 WHERE `ID` = 342;

-- Goblin Warrior (Male): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2508, `invType6` = 15 WHERE `ID` = 368;

-- Goblin Warrior (Male): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 2516, `invType7` = 24 WHERE `ID` = 368;

-- Goblin Warrior (Female): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2508, `invType6` = 15 WHERE `ID` = 369;

-- Goblin Warrior (Female): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId7` = 2516, `invType7` = 24 WHERE `ID` = 369;

-- Goblin Rogue (Male): Add Thrown (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 25861, `invType4` = 26 WHERE `ID` = 372;

-- Goblin Rogue (Female): Add Thrown (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 25861, `invType4` = 26 WHERE `ID` = 373;

-- Goblin Priest (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId2` = 4902, `invType2` = 26 WHERE `ID` = 374;

-- Goblin Priest (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId2` = 4902, `invType2` = 26 WHERE `ID` = 375;

-- Goblin Mage (Male): Add Staves (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 35, `invType3` = 17 WHERE `ID` = 380;

-- Goblin Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 380;

-- Goblin Mage (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 380;

-- Goblin Mage (Female): Add Staves (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 35, `invType3` = 17 WHERE `ID` = 381;

-- Goblin Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 0, `invType5` = 0 WHERE `ID` = 381;

-- Goblin Mage (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902, `invType6` = 26 WHERE `ID` = 381;

-- Goblin Warlock (Male): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 382;

-- Goblin Warlock (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 382;

-- Goblin Warlock (Female): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 2092, `invType4` = 13 WHERE `ID` = 383;

-- Goblin Warlock (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 4902 WHERE `ID` = 383;

-- Worgen Warrior (Male): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2508, `invType6` = 15 WHERE `ID` = 384;

-- Worgen Warrior (Male): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId9` = 2516, `invType9` = 24 WHERE `ID` = 384;

-- Worgen Warrior (Female): Add Guns (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 2508, `invType6` = 15 WHERE `ID` = 385;

-- Worgen Warrior (Female): Add Ammo for Guns
UPDATE `dbc`.`charstartoutfit` SET `itemId9` = 2516, `invType9` = 24 WHERE `ID` = 385;

-- Worgen Rogue (Male): Add Thrown (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 25861, `invType4` = 26 WHERE `ID` = 388;

-- Worgen Rogue (Female): Add Thrown (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 25861, `invType4` = 26 WHERE `ID` = 389;

-- Worgen Priest (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 4902, `invType3` = 26 WHERE `ID` = 390;

-- Worgen Priest (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId3` = 4902, `invType3` = 26 WHERE `ID` = 391;

-- Worgen Mage (Male): Add Staves (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 35, `invType4` = 17 WHERE `ID` = 394;

-- Worgen Mage (Male): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902, `invType5` = 26 WHERE `ID` = 394;

-- Worgen Mage (Male): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 394;

-- Worgen Mage (Female): Add Staves (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 35, `invType4` = 17 WHERE `ID` = 395;

-- Worgen Mage (Female): Add Wands (Has ranged skill, needs ranged weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 4902, `invType5` = 26 WHERE `ID` = 395;

-- Worgen Mage (Female): Remove Daggers (no suitable replacement)
UPDATE `dbc`.`charstartoutfit` SET `itemId6` = 0, `invType6` = 0 WHERE `ID` = 395;

-- Worgen Warlock (Male): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 4902 WHERE `ID` = 396;

-- Worgen Warlock (Male): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2092, `invType5` = 13 WHERE `ID` = 396;

-- Worgen Warlock (Female): Replace Staves with Wands
UPDATE `dbc`.`charstartoutfit` SET `itemId4` = 4902 WHERE `ID` = 397;

-- Worgen Warlock (Female): Add Daggers (Has melee skill, needs melee weapon)
UPDATE `dbc`.`charstartoutfit` SET `itemId5` = 2092, `invType5` = 13 WHERE `ID` = 397;

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
