-- ========================================
-- F-089: Jewelcrafting Trainers for every capital city
-- ========================================
-- Stock 3.3.5a only trains JC in Exodar, Silvermoon, Shattrath and Dalaran; Faris
-- (900950, zz_[F-089]_classic_trainers.sql) covers Stormwind. This file fills the
-- other five capitals with the trainer retail Cataclysm put there (names, cities and
-- positions from the TDB 4.3.4 world dump), validated on our WotLK navmesh.
--
--   900952 Hanner Gembold      Ironforge     dwarf male      display 5041
--   900953 Aessa Silverdew     Darnassus     night elf fem.  display 2212
--   900954 Lugrah              Orgrimmar     orc female      display 4352
--   900955 Neller Fayne        Undercity     undead male     display 2611
--   900956 Nahari Cloudchaser  Thunder Bluff tauren female   display 4375
-- plus a Jewelcrafting Supplies vendor beside each (900957-900961, see below).
--
-- Displays: the retail Cata displays (379xx/352xx) do not exist in our 3.3.5a DBC,
-- so each uses a stock, no-helm display of the right race/gender that no spawned
-- creature wears (all bakes ship in the HD packs).
-- Positions: retail spots for IF/Darn/TB (IF nudged 5 yd so Hanner does not stand
-- inside Geofram Bouldertoe). Retail Neller (1645.5, 331.0) is hidden inside the stone
-- pillar at the end of the WotLK mining counter (seen in the F-219 client) -- he stands
-- on the open floor beside Brom Killian instead. Retail Lugrah stands in the Cata-rebuilt Drag, which is
-- off-mesh in WotLK Orgrimmar -- she stands beside Makaru at Red Canyon Mining instead.
-- Trainer 113 = base JC (0-290), same as Faris/Farii. Gossip 7815 = stock JC trainer
-- menu (retail uses it for these NPCs; its vendor option hides without npcflag 128).

SET @HANNER := 900952;
SET @AESSA  := 900953;
SET @LUGRAH := 900954;
SET @NELLER := 900955;
SET @NAHARI := 900956;

DELETE FROM `creature_template` WHERE `entry` BETWEEN @HANNER AND @NAHARI;
INSERT INTO `creature_template`
SET `entry` = @HANNER,
    `name` = 'Hanner Gembold',
    `subname` = 'Jewelcrafting Trainer',
    `gossip_menu_id` = 7815,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 55, -- Ironforge
    `npcflag` = 81, -- Gossip + Trainer + Profession (1 + 16 + 64)
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `type_flags` = 134217728, -- FORCE_GOSSIP
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2; -- Civilian/No aggro

INSERT INTO `creature_template`
SET `entry` = @AESSA,
    `name` = 'Aessa Silverdew',
    `subname` = 'Jewelcrafting Trainer',
    `gossip_menu_id` = 7815,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 80, -- Darnassus
    `npcflag` = 81,
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7,
    `type_flags` = 134217728,
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2;

INSERT INTO `creature_template`
SET `entry` = @LUGRAH,
    `name` = 'Lugrah',
    `subname` = 'Jewelcrafting Trainer',
    `gossip_menu_id` = 7815,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 29, -- Orgrimmar
    `npcflag` = 81,
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7,
    `type_flags` = 134217728,
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2;

INSERT INTO `creature_template`
SET `entry` = @NELLER,
    `name` = 'Neller Fayne',
    `subname` = 'Jewelcrafting Trainer',
    `gossip_menu_id` = 7815,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 68, -- Undercity
    `npcflag` = 81,
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7,
    `type_flags` = 134217728,
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2;

INSERT INTO `creature_template`
SET `entry` = @NAHARI,
    `name` = 'Nahari Cloudchaser',
    `subname` = 'Jewelcrafting Trainer',
    `gossip_menu_id` = 7815,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 104, -- Thunder Bluff
    `npcflag` = 81,
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7,
    `type_flags` = 134217728,
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2;

DELETE FROM `creature_template_model` WHERE `CreatureID` BETWEEN @HANNER AND @NAHARI;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(@HANNER, 0, 5041, 1, 1), -- dwarf male ([UNUSED] Hurom Juggendolf)
(@AESSA,  0, 2212, 1, 1), -- night elf female (Kitari Farseeker, unspawned)
(@LUGRAH, 0, 4352, 1, 1), -- orc female ([UNUSED] Shikar)
(@NELLER, 0, 2611, 1, 1), -- undead male ([UNUSED] Alexander Lister)
(@NAHARI, 0, 4375, 1, 1); -- tauren female (Moorah Stormhoof, unspawned)

DELETE FROM `creature_default_trainer` WHERE `CreatureId` BETWEEN @HANNER AND @NAHARI;
INSERT INTO `creature_default_trainer` (`CreatureId`, `TrainerId`) VALUES
(@HANNER, 113),
(@AESSA,  113),
(@LUGRAH, 113),
(@NELLER, 113),
(@NAHARI, 113);

-- Explicit guids (see zz_[F-089]_classic_trainers.sql): guid-less inserts land in the
-- 12000000-12999999 block that zz_[AUTO,F-011]_40_creature.sql wipes.
DELETE FROM `creature` WHERE `id` BETWEEN @HANNER AND @NAHARI OR `guid` BETWEEN 3110714 AND 3110718;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(3110714, @HANNER, 0, -4709.5,  -1114.0,  504.53,   3.01942, 300), -- Ironforge, Deepmountain Mining Guild
(3110715, @AESSA,  1, 10145.0,  2356.48,  1332.05,  6.07375, 300), -- Darnassus, Craftsmen's Terrace
(3110716, @LUGRAH, 1, 2028.5,   -4701.5,  27.17,    3.35,    300), -- Orgrimmar, Red Canyon Mining (Valley of Honor)
(3110717, @NELLER, 0, 1640.6,   340.2,    -62.11,   0.63,    300), -- Undercity, War Quarter beside Brom Killian
(3110718, @NAHARI, 1, -1225.76, 153.337,  133.357,  5.09636, 300); -- Thunder Bluff, lower rise by Stonehoof Geology

-- ========================================
-- JEWELCRAFTING SUPPLY VENDORS - one beside each trainer
-- ========================================
-- Retail Cata names/genders; stock look-alike displays (unspawned merchants, bakes ship
-- in the HD packs). Stock same as Nessera (76, Stormwind) = Inessera's Exodar list.
-- Org: retail Taryssa Lazuria stood in the Cata Drag (off-mesh here) -- beside Lugrah.
-- UC: retail Sara Lanner's spot is taken by stock Sarah Killian -- beside Neller.

SET @LAIDA   := 900957;
SET @TARIEN  := 900958;
SET @TARYSSA := 900959;
SET @SARA    := 900960;
SET @PAKU    := 900961;

DELETE FROM `creature_template` WHERE `entry` BETWEEN @LAIDA AND @PAKU;
INSERT INTO `creature_template`
SET `entry` = @LAIDA,
    `name` = 'Laida Gembold',
    `subname` = 'Jewelcrafting Supplies',
    `gossip_menu_id` = 0,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 55, -- Ironforge
    `npcflag` = 128, -- Vendor
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2; -- Civilian/No aggro

INSERT INTO `creature_template`
SET `entry` = @TARIEN,
    `name` = 'Tarien Silverdew',
    `subname` = 'Jewelcrafting Supplies',
    `gossip_menu_id` = 0,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 80, -- Darnassus
    `npcflag` = 128, -- Vendor
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2; -- Civilian/No aggro

INSERT INTO `creature_template`
SET `entry` = @TARYSSA,
    `name` = 'Taryssa Lazuria',
    `subname` = 'Jewelcrafting Supplies',
    `gossip_menu_id` = 0,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 29, -- Orgrimmar
    `npcflag` = 128, -- Vendor
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2; -- Civilian/No aggro

INSERT INTO `creature_template`
SET `entry` = @SARA,
    `name` = 'Sara Lanner',
    `subname` = 'Jewelcrafting Supplies',
    `gossip_menu_id` = 0,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 68, -- Undercity
    `npcflag` = 128, -- Vendor
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2; -- Civilian/No aggro

INSERT INTO `creature_template`
SET `entry` = @PAKU,
    `name` = 'Paku Cloudchaser',
    `subname` = 'Jewelcrafting Supplies',
    `gossip_menu_id` = 0,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 104, -- Thunder Bluff
    `npcflag` = 128, -- Vendor
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2; -- Civilian/No aggro

DELETE FROM `creature_template_model` WHERE `CreatureID` BETWEEN @LAIDA AND @PAKU;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(@LAIDA,   0, 3060,  1, 1), -- dwarf female ([UNUSED] Kiren Tyrngaarde)
(@TARIEN,  0, 2260,  1, 1), -- night elf male (Lewin Starfeather, unspawned)
(@TARYSSA, 0, 14781, 1, 1), -- orc female (Zora Guthrek, unspawned)
(@SARA,    0, 9808,  1, 1), -- undead female ([UNUSED] Mallory Welsh)
(@PAKU,    0, 12058, 1, 1); -- tauren male (Sun Rock Blacksmithing Supplies, unspawned)

DELETE FROM `npc_vendor` WHERE `entry` BETWEEN @LAIDA AND @PAKU;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`)
SELECT v.`entry`, 0, i.`item`, 0, 0, 0
FROM (SELECT @LAIDA AS `entry` UNION ALL SELECT @TARIEN UNION ALL SELECT @TARYSSA
      UNION ALL SELECT @SARA UNION ALL SELECT @PAKU) v
CROSS JOIN (SELECT 20815 AS `item` -- Jeweler's Kit
      UNION ALL SELECT 20824 -- Simple Grinder
      UNION ALL SELECT 28458 UNION ALL SELECT 28459 UNION ALL SELECT 28460 -- Tourmalines
      UNION ALL SELECT 28461 UNION ALL SELECT 28462
      UNION ALL SELECT 28463 UNION ALL SELECT 28464 UNION ALL SELECT 28465 -- Zircons
      UNION ALL SELECT 28466 UNION ALL SELECT 28467 UNION ALL SELECT 28468 -- Ambers
      UNION ALL SELECT 28469 UNION ALL SELECT 28470) i;

DELETE FROM `creature` WHERE `id` BETWEEN @LAIDA AND @PAKU OR `guid` IN (3110719, 3110723, 3110724, 3110725, 3110726);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(3110719, @LAIDA,   0, -4714.22, -1113.47, 504.53,  6.16101, 300), -- Ironforge (retail spot)
(3110723, @TARIEN,  1, 10149.4,  2350.4,   1332.05, 0.314159, 300), -- Darnassus (retail spot)
(3110724, @TARYSSA, 1, 2031.5,   -4702.0,  27.23,   3.35,    300), -- Orgrimmar, beside Lugrah
(3110725, @SARA,    0, 1643.0,   341.5,    -62.11,  0.63,    300), -- Undercity, beside Neller
(3110726, @PAKU,    1, -1222.18, 153.882,  133.229, 4.43314, 300); -- Thunder Bluff (retail spot)

-- ========================================
-- GUARD GOSSIP - "Jewelcrafting" in each city's profession submenu
-- ========================================
-- Same shape as Stormwind's (POI 1010 / menu 2363 / text 3045). Undercity has two
-- guard profession menus (2847, 10767) that point at the same POIs; both get it.

DELETE FROM `points_of_interest` WHERE `ID` BETWEEN 1021 AND 1025;
INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`) VALUES
(1021, -4709.5, -1114.0, 7, 99, 0, 'Ironforge Jewelcrafting Trainer'),
(1022, 10145.0, 2356.48, 7, 99, 0, 'Darnassus Jewelcrafting Trainer'),
(1023, 2028.5, -4701.5, 7, 99, 0, 'Orgrimmar Jewelcrafting Trainer'),
(1024, 1640.6, 340.2, 7, 99, 0, 'Undercity Jewelcrafting Trainer'),
(1025, -1225.76, 153.337, 7, 99, 0, 'Thunder Bluff Jewelcrafting Trainer');

DELETE FROM `npc_text` WHERE `ID` BETWEEN 66010 AND 66014;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(66010, 'Hanner Gembold teaches the jeweler''s craft. You''ll find him at the Deepmountain Mining Guild on the northern side of The Great Forge.'),
(66011, 'Aessa Silverdew can teach you to cut and set gems. She works on the Craftsmen''s Terrace.'),
(66012, 'Lugrah teaches jewelcrafting. Look for her at Red Canyon Mining, northeast of the lake in the Valley of Honor, beside Makaru.'),
(66013, 'Neller Fayne instructs those who would learn jewelcrafting. He works beside Brom Killian in the inner ring of the War Quarter.'),
(66014, 'Nahari Cloudchaser can teach you jewelcrafting. You will find her near Stonehoof Geology on the lower rise.');

DELETE FROM `gossip_menu` WHERE `MenuID` BETWEEN 66010 AND 66014;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(66010, 66010),
(66011, 66011),
(66012, 66012),
(66013, 66013),
(66014, 66014);

DELETE FROM `gossip_menu_option` WHERE (`MenuID` = 2168 AND `OptionID` = 13)
                                    OR (`MenuID` = 2351 AND `OptionID` = 12)
                                    OR (`MenuID` = 1942 AND `OptionID` = 13)
                                    OR (`MenuID` IN (2847, 10767) AND `OptionID` = 13)
                                    OR (`MenuID` = 751 AND `OptionID` = 12);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`) VALUES
(2168,  13, 0, 'Jewelcrafting', 1, 1, 66010, 1021), -- Ironforge guard
(2351,  12, 0, 'Jewelcrafting', 1, 1, 66011, 1022), -- Darnassus sentinel
(1942,  13, 0, 'Jewelcrafting', 1, 1, 66012, 1023), -- Orgrimmar grunt
(2847,  13, 0, 'Jewelcrafting', 1, 1, 66013, 1024), -- Undercity guardian
(10767, 13, 0, 'Jewelcrafting', 1, 1, 66013, 1024), -- Undercity guardian (alt menu)
(751,   12, 0, 'Jewelcrafting', 1, 1, 66014, 1025); -- Thunder Bluff brave
