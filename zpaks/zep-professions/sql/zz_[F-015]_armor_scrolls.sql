-- F-015: Armor (Protection) Warding Scrolls - Inscription craft layer
-- ============================================================================
-- The armor scroll BUFF line already exists: the vanilla Scroll of Protection
-- items (3013/1478/4421/10305/27500/33459/43467/43468) cast the renamed
-- "Warding: Protection" spells (8091-58453), which are already members of
-- defensive stacking group 2019. The only gap was craftability.
--
-- This file adds the missing Inscription craft layer for armor, mirroring the
-- 6 resistance schools in zz_[F-015]_resistance_scrolls.sql:
--   - Crafting spells 103348-103355 (DBC, in [F-015]_spell.sql) create the
--     vanilla Scroll of Protection items.
--   - skilllineability 100051-100058 (DBC, in [F-015]_skilllineability.sql).
--   - Trainer entries for starter ranks I/V/VII (below).
--   - Recipe drop items + loot for progression ranks II/III/IV/VI/VIII (below).
--
-- Premium reagents (metal bars) at ranks IV/VI/VIII: Thorium Bar (12359, IV),
-- Adamantite Bar (23446, VI), Titansteel Bar (37663, VIII) - vanilla/TBC/WotLK.
--
-- Recipe item IDs (Inscription block 57400-57499):
--   II=57402  III=57403  IV=57497  VI=57498  VIII=57499
--
-- Execute against acore_world database.

-- =====================================================
-- RENAME PRODUCED SCROLL ITEMS -> "Scroll of Armor Warding"
-- =====================================================
-- The craft spells (103348-103355) are named "Scroll of Armor Warding <rank>",
-- but they create the vanilla "Scroll of Protection" items. Rename those stock
-- items so the produced consumable matches the recipe name across all 8 ranks.
-- These are stock rows (not defined by us), so one consolidated UPDATE per ID.
UPDATE `item_template` SET `name` = 'Scroll of Armor Warding'      WHERE `entry` = 3013;   -- Rank I
UPDATE `item_template` SET `name` = 'Scroll of Armor Warding II'   WHERE `entry` = 1478;   -- Rank II
UPDATE `item_template` SET `name` = 'Scroll of Armor Warding III'  WHERE `entry` = 4421;   -- Rank III
UPDATE `item_template` SET `name` = 'Scroll of Armor Warding IV'   WHERE `entry` = 10305;  -- Rank IV
UPDATE `item_template` SET `name` = 'Scroll of Armor Warding V'    WHERE `entry` = 27500;  -- Rank V
UPDATE `item_template` SET `name` = 'Scroll of Armor Warding VI'   WHERE `entry` = 33459;  -- Rank VI
UPDATE `item_template` SET `name` = 'Scroll of Armor Warding VII'  WHERE `entry` = 43467;  -- Rank VII
UPDATE `item_template` SET `name` = 'Scroll of Armor Warding VIII' WHERE `entry` = 43468;  -- Rank VIII

-- =====================================================
-- INSCRIPTION TRAINER ENTRIES (Starter Ranks Only)
-- =====================================================
-- Only starter ranks are trainer-taught (same as resistance schools):
--   Rank I  (103348, skill 40)  - all trainers (121, 120, 119)
--   Rank V  (103352, skill 325) - Master + Grand Master (120, 119)
--   Rank VII(103354, skill 395) - Grand Master only (119)
-- Progression ranks (II, III, IV, VI, VIII) are dungeon recipe drops.

DELETE FROM `trainer_spell` WHERE `SpellId` IN (103348, 103352, 103354);

-- Rank I - Vanilla starter (skill 40, cost 50c)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(121, 103348, 50, 773, 40, 0, 0, 0, 0),    -- Armor Warding I (Artisan)
(120, 103348, 50, 773, 40, 0, 0, 0, 0),    -- Armor Warding I (Master)
(119, 103348, 50, 773, 40, 0, 0, 0, 0);    -- Armor Warding I (Grand Master)

-- Rank V - TBC starter (skill 325, cost 1g 50s)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(120, 103352, 15000, 773, 325, 0, 0, 0, 0), -- Armor Warding V (Master)
(119, 103352, 15000, 773, 325, 0, 0, 0, 0); -- Armor Warding V (Grand Master)

-- Rank VII - WotLK starter (skill 395, cost 5g)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(119, 103354, 50000, 773, 395, 0, 0, 0, 0); -- Armor Warding VII (Grand Master)

-- =====================================================
-- PROGRESSION RANK RECIPE ITEMS (Dungeon Drops)
-- =====================================================
-- "Technique: Scroll of Armor Warding <rank>" - teach the matching crafting spell.
-- displayid 140301 (AO_Scroll_01) - already shipped by [F-015]_itemdisplayinfo.

-- Technique: Scroll of Armor Warding II (Rank II, skill 95)
DELETE FROM `item_template` WHERE `entry` = 57402;
INSERT INTO `item_template` SET
    `entry` = 57402,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Armor Warding II',
    `displayid` = 140301,
    `Quality` = 1,
    `BuyPrice` = 2000,
    `SellPrice` = 500,
    `ItemLevel` = 25,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 95,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103349,
    `description` = 'Teaches you how to scribe Scroll of Armor Warding II.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;

-- Technique: Scroll of Armor Warding III (Rank III, skill 170)
DELETE FROM `item_template` WHERE `entry` = 57403;
INSERT INTO `item_template` SET
    `entry` = 57403,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Armor Warding III',
    `displayid` = 140301,
    `Quality` = 1,
    `BuyPrice` = 5000,
    `SellPrice` = 1250,
    `ItemLevel` = 40,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 170,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103350,
    `description` = 'Teaches you how to scribe Scroll of Armor Warding III.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;

-- Technique: Scroll of Armor Warding IV (Rank IV, skill 240)
DELETE FROM `item_template` WHERE `entry` = 57497;
INSERT INTO `item_template` SET
    `entry` = 57497,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Armor Warding IV',
    `displayid` = 140301,
    `Quality` = 1,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `ItemLevel` = 55,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 240,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103351,
    `description` = 'Teaches you how to scribe Scroll of Armor Warding IV.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;

-- Technique: Scroll of Armor Warding VI (Rank VI, skill 375)
DELETE FROM `item_template` WHERE `entry` = 57498;
INSERT INTO `item_template` SET
    `entry` = 57498,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Armor Warding VI',
    `displayid` = 140301,
    `Quality` = 1,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `ItemLevel` = 78,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 375,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103353,
    `description` = 'Teaches you how to scribe Scroll of Armor Warding VI.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;

-- Technique: Scroll of Armor Warding VIII (Rank VIII, skill 435)
DELETE FROM `item_template` WHERE `entry` = 57499;
INSERT INTO `item_template` SET
    `entry` = 57499,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Armor Warding VIII',
    `displayid` = 140301,
    `Quality` = 1,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `ItemLevel` = 85,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 435,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103355,
    `description` = 'Teaches you how to scribe Scroll of Armor Warding VIII.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;

-- =====================================================
-- RECIPE DROP LOOT TABLES
-- =====================================================
-- Armor/stone/golem-themed bosses. Normal-mode 15%; TBC/WotLK heroic 25%.
-- Vanilla ranks (II/III/IV) are normal-only, matching the resistance schools.

DELETE FROM `creature_loot_template` WHERE `Item` IN (57402, 57403, 57497, 57498, 57499);

-- Rank II - Vanilla low-level dungeons (15%)
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(644,  57402, 15, 'Rhahk''Zor - Technique: Scroll of Armor Warding II'),
(1696, 57402, 15, 'Targorr the Dread - Technique: Scroll of Armor Warding II');

-- Rank III - Vanilla mid-level dungeons (15%) - Uldaman stone wing
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(7228, 57403, 15, 'Ironaya - Technique: Scroll of Armor Warding III'),
(6910, 57403, 15, 'Revelosh - Technique: Scroll of Armor Warding III');

-- Rank IV - Vanilla high-level dungeons (15%) - golem/earthen bosses
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(2748, 57497, 15, 'Archaedas - Technique: Scroll of Armor Warding IV'),
(8983, 57497, 15, 'Golem Lord Argelmach - Technique: Scroll of Armor Warding IV');

-- Rank VI - TBC dungeons (15% normal) - Mechanar
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(19219, 57498, 15, 'Mechano-Lord Capacitus - Technique: Scroll of Armor Warding VI'),
(19220, 57498, 15, 'Pathaleon the Calculator - Technique: Scroll of Armor Warding VI');

-- Rank VI - TBC heroic Mechanar (25%)
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(21533, 57498, 25, 'Mechano-Lord Capacitus (Heroic) - Technique: Scroll of Armor Warding VI'),
(21537, 57498, 25, 'Pathaleon the Calculator (Heroic) - Technique: Scroll of Armor Warding VI');

-- Rank VIII - WotLK dungeons (15% normal) - Halls of Stone
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(27977, 57499, 15, 'Krystallus - Technique: Scroll of Armor Warding VIII'),
(27978, 57499, 15, 'Sjonnir The Ironshaper - Technique: Scroll of Armor Warding VIII');

-- Rank VIII - WotLK heroic Halls of Stone (25%)
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(31381, 57499, 25, 'Krystallus (Heroic) - Technique: Scroll of Armor Warding VIII'),
(31386, 57499, 25, 'Sjonnir The Ironshaper (Heroic) - Technique: Scroll of Armor Warding VIII');
