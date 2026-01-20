-- ============================================================================
-- DISPLAY INFO FIXES
-- ============================================================================
-- Fixes displayInfo values that don't match item_template.displayid
-- The client uses displayInfo for character creation preview models
-- ============================================================================

-- Human Warrior (Male): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5996 WHERE `ID` = 1;

-- Orc Warrior (Male): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo8` = 5996 WHERE `ID` = 2;

-- Dwarf Warrior (Male): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo8` = 5998 WHERE `ID` = 3;

-- Night Elf Warrior (Male): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5996 WHERE `ID` = 4;

-- Human Warrior (Female): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5996 WHERE `ID` = 14;

-- Night Elf Hunter (Male): Fix Worn Battleaxe displayInfo 9976 -> 22291
UPDATE `dbc`.`charstartoutfit` SET `displayInfo1` = 22291 WHERE `ID` = 24;

-- Night Elf Hunter (Male): Fix Worn Shortbow displayInfo -1 -> 8106
UPDATE `dbc`.`charstartoutfit` SET `displayInfo6` = 8106 WHERE `ID` = 24;

-- Night Elf Priest (Male): Fix Bent Staff displayInfo 18530 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo1` = 472 WHERE `ID` = 26;

-- Tauren Warrior (Male): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5998 WHERE `ID` = 27;

-- Undead Warrior (Male): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5996 WHERE `ID` = 30;

-- Orc Warrior (Female): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo8` = 5996 WHERE `ID` = 41;

-- Dwarf Warrior (Female): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo8` = 5998 WHERE `ID` = 47;

-- Night Elf Warrior (Female): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5996 WHERE `ID` = 53;

-- Night Elf Hunter (Female): Fix Worn Battleaxe displayInfo 9976 -> 22291
UPDATE `dbc`.`charstartoutfit` SET `displayInfo1` = 22291 WHERE `ID` = 54;

-- Night Elf Hunter (Female): Fix Worn Shortbow displayInfo -1 -> 8106
UPDATE `dbc`.`charstartoutfit` SET `displayInfo6` = 8106 WHERE `ID` = 54;

-- Undead Warrior (Female): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5996 WHERE `ID` = 58;

-- Tauren Warrior (Female): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5998 WHERE `ID` = 63;

-- Gnome Warrior (Male): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5998 WHERE `ID` = 291;

-- Gnome Warrior (Female): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 5998 WHERE `ID` = 314;

-- Blood Elf Warlock (Male): Fix Bent Staff displayInfo 33299 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 322;

-- Blood Elf Warlock (Female): Fix Bent Staff displayInfo 33299 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 328;

-- Draenei Warrior (Male): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo8` = 5996 WHERE `ID` = 331;

-- Draenei Warrior (Female): Fix Rough Arrow displayInfo -1 -> 5996
UPDATE `dbc`.`charstartoutfit` SET `displayInfo8` = 5996 WHERE `ID` = 332;

-- Tauren Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 348;

-- Tauren Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 349;

-- Gnome Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 350;

-- Gnome Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 351;

-- Human Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 352;

-- Human Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 353;

-- Orc Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 354;

-- Orc Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 355;

-- Dwarf Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 356;

-- Dwarf Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 357;

-- Night Elf Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 358;

-- Night Elf Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 359;

-- Undead Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 360;

-- Undead Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 361;

-- Troll Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 362;

-- Troll Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 363;

-- Blood Elf Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 364;

-- Blood Elf Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 365;

-- Draenei Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 366;

-- Draenei Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 367;

-- Goblin Warrior (Male): Fix Battleworn Hammer displayInfo 8688 -> 8690
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 8690 WHERE `ID` = 368;

-- Goblin Warrior (Male): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo9` = 5998 WHERE `ID` = 368;

-- Goblin Warrior (Female): Fix Battleworn Hammer displayInfo 8688 -> 8690
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 8690 WHERE `ID` = 369;

-- Goblin Warrior (Female): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo9` = 5998 WHERE `ID` = 369;

-- Goblin Hunter (Male): Fix Worn Axe displayInfo -1 -> 14029
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 14029 WHERE `ID` = 370;

-- Goblin Hunter (Male): Fix Small Ammo Pouch displayInfo -1 -> 1816
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 1816 WHERE `ID` = 370;

-- Goblin Hunter (Male): Fix Old Blunderbuss displayInfo 2409 -> 6606
UPDATE `dbc`.`charstartoutfit` SET `displayInfo8` = 6606 WHERE `ID` = 370;

-- Goblin Hunter (Male): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo9` = 5998 WHERE `ID` = 370;

-- Goblin Hunter (Female): Fix Worn Axe displayInfo -1 -> 14029
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 14029 WHERE `ID` = 371;

-- Goblin Hunter (Female): Fix Small Ammo Pouch displayInfo -1 -> 1816
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 1816 WHERE `ID` = 371;

-- Goblin Hunter (Female): Fix Old Blunderbuss displayInfo 2409 -> 6606
UPDATE `dbc`.`charstartoutfit` SET `displayInfo8` = 6606 WHERE `ID` = 371;

-- Goblin Hunter (Female): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo9` = 5998 WHERE `ID` = 371;

-- Goblin Rogue (Male): Fix Crude Throwing Axe displayInfo 40187 -> 20777
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 20777 WHERE `ID` = 372;

-- Goblin Rogue (Male): Fix Worn Dagger displayInfo 5194 -> 6442
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 6442 WHERE `ID` = 372;

-- Goblin Rogue (Female): Fix Crude Throwing Axe displayInfo 40187 -> 20777
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 20777 WHERE `ID` = 373;

-- Goblin Rogue (Female): Fix Worn Dagger displayInfo 5194 -> 6442
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 6442 WHERE `ID` = 373;

-- Goblin Priest (Male): Fix Worn Mace displayInfo 472 -> 5194
UPDATE `dbc`.`charstartoutfit` SET `displayInfo1` = 5194 WHERE `ID` = 374;

-- Goblin Priest (Female): Fix Worn Mace displayInfo 472 -> 5194
UPDATE `dbc`.`charstartoutfit` SET `displayInfo1` = 5194 WHERE `ID` = 375;

-- Goblin Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 376;

-- Goblin Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 377;

-- Goblin Mage (Male): Fix Bent Staff displayInfo 9929 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 380;

-- Goblin Mage (Female): Fix Bent Staff displayInfo 9929 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 381;

-- Worgen Warrior (Male): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo10` = 5998 WHERE `ID` = 384;

-- Worgen Warrior (Female): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo10` = 5998 WHERE `ID` = 385;

-- Worgen Hunter (Male): Fix Worn Dagger displayInfo 65743 -> 6442
UPDATE `dbc`.`charstartoutfit` SET `displayInfo1` = 6442 WHERE `ID` = 386;

-- Worgen Hunter (Male): Fix Old Blunderbuss displayInfo 2409 -> 6606
UPDATE `dbc`.`charstartoutfit` SET `displayInfo6` = 6606 WHERE `ID` = 386;

-- Worgen Hunter (Male): Fix Small Ammo Pouch displayInfo -1 -> 1816
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 1816 WHERE `ID` = 386;

-- Worgen Hunter (Male): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo9` = 5998 WHERE `ID` = 386;

-- Worgen Hunter (Female): Fix Worn Dagger displayInfo 65743 -> 6442
UPDATE `dbc`.`charstartoutfit` SET `displayInfo1` = 6442 WHERE `ID` = 387;

-- Worgen Hunter (Female): Fix Old Blunderbuss displayInfo 2409 -> 6606
UPDATE `dbc`.`charstartoutfit` SET `displayInfo6` = 6606 WHERE `ID` = 387;

-- Worgen Hunter (Female): Fix Small Ammo Pouch displayInfo -1 -> 1816
UPDATE `dbc`.`charstartoutfit` SET `displayInfo7` = 1816 WHERE `ID` = 387;

-- Worgen Hunter (Female): Fix Light Shot displayInfo -1 -> 5998
UPDATE `dbc`.`charstartoutfit` SET `displayInfo9` = 5998 WHERE `ID` = 387;

-- Worgen Rogue (Male): Fix Crude Throwing Axe displayInfo 40187 -> 20777
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 20777 WHERE `ID` = 388;

-- Worgen Rogue (Male): Fix Worn Dagger displayInfo 8483 -> 6442
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 6442 WHERE `ID` = 388;

-- Worgen Rogue (Female): Fix Crude Throwing Axe displayInfo 40187 -> 20777
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 20777 WHERE `ID` = 389;

-- Worgen Rogue (Female): Fix Worn Dagger displayInfo 8483 -> 6442
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 6442 WHERE `ID` = 389;

-- Worgen Priest (Male): Fix Worn Mace displayInfo 472 -> 5194
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 5194 WHERE `ID` = 390;

-- Worgen Priest (Female): Fix Worn Mace displayInfo 472 -> 5194
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 5194 WHERE `ID` = 391;

-- Worgen Death Knight (Male): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 392;

-- Worgen Death Knight (Female): Fix Worn Shortsword displayInfo -1 -> 1542
UPDATE `dbc`.`charstartoutfit` SET `displayInfo5` = 1542 WHERE `ID` = 393;

-- Worgen Mage (Male): Fix Bent Staff displayInfo -1 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 394;

-- Worgen Mage (Female): Fix Bent Staff displayInfo -1 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 395;

-- Worgen Warlock (Male): Fix Bent Staff displayInfo -1 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 396;

-- Worgen Warlock (Female): Fix Bent Staff displayInfo -1 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 397;

-- Worgen Druid (Male): Fix Bent Staff displayInfo -1 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 398;

-- Worgen Druid (Female): Fix Bent Staff displayInfo -1 -> 472
UPDATE `dbc`.`charstartoutfit` SET `displayInfo4` = 472 WHERE `ID` = 399;
