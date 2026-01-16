-- F-015: Magic Resistance Scrolls - Item Templates
-- Creates 48 scroll consumable items (6 types × 8 ranks)
-- Item IDs: 902331 - 902378
-- Links to spell IDs: 103198 - 103245
--
-- Note: Scroll of Protection (vanilla item) already provides armor buff
-- Execute against acore_world database

-- ============================================================================
-- FIRE RESISTANCE SCROLLS (Spell IDs: 103198-103205)
-- ============================================================================

-- Scroll of Fire Resistance (Rank I) - Item 902331, Spell 103198
DELETE FROM `item_template` WHERE `entry` = 902331;

INSERT INTO `item_template` SET
    `entry` = 902331,
    `subclass` = 4,
    `name` = 'Scroll of Fire Resistance',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 150,
    `SellPrice` = 37,
    `ItemLevel` = 15,
    `RequiredLevel` = 5,
    `stackable` = 20,
    `spellid_1` = 103198,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Fire Resistance II (Rank II) - Item 902332, Spell 103199
DELETE FROM `item_template` WHERE `entry` = 902332;

INSERT INTO `item_template` SET
    `entry` = 902332,
    `subclass` = 4,
    `name` = 'Scroll of Fire Resistance II',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 300,
    `SellPrice` = 75,
    `ItemLevel` = 30,
    `RequiredLevel` = 20,
    `stackable` = 20,
    `spellid_1` = 103199,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Fire Resistance III (Rank III) - Item 902333, Spell 103200
DELETE FROM `item_template` WHERE `entry` = 902333;

INSERT INTO `item_template` SET
    `entry` = 902333,
    `subclass` = 4,
    `name` = 'Scroll of Fire Resistance III',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 900,
    `SellPrice` = 225,
    `ItemLevel` = 45,
    `RequiredLevel` = 35,
    `stackable` = 20,
    `spellid_1` = 103200,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Fire Resistance IV (Rank IV) - Item 902334, Spell 103201
DELETE FROM `item_template` WHERE `entry` = 902334;

INSERT INTO `item_template` SET
    `entry` = 902334,
    `subclass` = 4,
    `name` = 'Scroll of Fire Resistance IV',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 1800,
    `SellPrice` = 450,
    `ItemLevel` = 60,
    `RequiredLevel` = 50,
    `stackable` = 20,
    `spellid_1` = 103201,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Fire Resistance V (Rank V) - Item 902335, Spell 103202
DELETE FROM `item_template` WHERE `entry` = 902335;

INSERT INTO `item_template` SET
    `entry` = 902335,
    `subclass` = 4,
    `name` = 'Scroll of Fire Resistance V',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 2700,
    `SellPrice` = 675,
    `ItemLevel` = 70,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103202,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Fire Resistance VI (Rank VI) - Item 902336, Spell 103203
DELETE FROM `item_template` WHERE `entry` = 902336;

INSERT INTO `item_template` SET
    `entry` = 902336,
    `subclass` = 4,
    `name` = 'Scroll of Fire Resistance VI',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 3600,
    `SellPrice` = 900,
    `ItemLevel` = 75,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103203,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Fire Resistance VII (Rank VII) - Item 902337, Spell 103204
DELETE FROM `item_template` WHERE `entry` = 902337;

INSERT INTO `item_template` SET
    `entry` = 902337,
    `subclass` = 4,
    `name` = 'Scroll of Fire Resistance VII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 4500,
    `SellPrice` = 1125,
    `ItemLevel` = 80,
    `RequiredLevel` = 70,
    `stackable` = 20,
    `spellid_1` = 103204,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Fire Resistance VIII (Rank VIII) - Item 902338, Spell 103205
DELETE FROM `item_template` WHERE `entry` = 902338;

INSERT INTO `item_template` SET
    `entry` = 902338,
    `subclass` = 4,
    `name` = 'Scroll of Fire Resistance VIII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 6000,
    `SellPrice` = 1500,
    `ItemLevel` = 85,
    `RequiredLevel` = 80,
    `stackable` = 20,
    `spellid_1` = 103205,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- ============================================================================
-- FROST RESISTANCE SCROLLS (Spell IDs: 103206-103213)
-- ============================================================================

-- Scroll of Frost Resistance (Rank I) - Item 902339, Spell 103206
DELETE FROM `item_template` WHERE `entry` = 902339;

INSERT INTO `item_template` SET
    `entry` = 902339,
    `subclass` = 4,
    `name` = 'Scroll of Frost Resistance',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 150,
    `SellPrice` = 37,
    `ItemLevel` = 15,
    `RequiredLevel` = 5,
    `stackable` = 20,
    `spellid_1` = 103206,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Frost Resistance II (Rank II) - Item 902340, Spell 103207
DELETE FROM `item_template` WHERE `entry` = 902340;

INSERT INTO `item_template` SET
    `entry` = 902340,
    `subclass` = 4,
    `name` = 'Scroll of Frost Resistance II',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 300,
    `SellPrice` = 75,
    `ItemLevel` = 30,
    `RequiredLevel` = 20,
    `stackable` = 20,
    `spellid_1` = 103207,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Frost Resistance III (Rank III) - Item 902341, Spell 103208
DELETE FROM `item_template` WHERE `entry` = 902341;

INSERT INTO `item_template` SET
    `entry` = 902341,
    `subclass` = 4,
    `name` = 'Scroll of Frost Resistance III',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 900,
    `SellPrice` = 225,
    `ItemLevel` = 45,
    `RequiredLevel` = 35,
    `stackable` = 20,
    `spellid_1` = 103208,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Frost Resistance IV (Rank IV) - Item 902342, Spell 103209
DELETE FROM `item_template` WHERE `entry` = 902342;

INSERT INTO `item_template` SET
    `entry` = 902342,
    `subclass` = 4,
    `name` = 'Scroll of Frost Resistance IV',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 1800,
    `SellPrice` = 450,
    `ItemLevel` = 60,
    `RequiredLevel` = 50,
    `stackable` = 20,
    `spellid_1` = 103209,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Frost Resistance V (Rank V) - Item 902343, Spell 103210
DELETE FROM `item_template` WHERE `entry` = 902343;

INSERT INTO `item_template` SET
    `entry` = 902343,
    `subclass` = 4,
    `name` = 'Scroll of Frost Resistance V',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 2700,
    `SellPrice` = 675,
    `ItemLevel` = 70,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103210,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Frost Resistance VI (Rank VI) - Item 902344, Spell 103211
DELETE FROM `item_template` WHERE `entry` = 902344;

INSERT INTO `item_template` SET
    `entry` = 902344,
    `subclass` = 4,
    `name` = 'Scroll of Frost Resistance VI',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 3600,
    `SellPrice` = 900,
    `ItemLevel` = 75,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103211,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Frost Resistance VII (Rank VII) - Item 902345, Spell 103212
DELETE FROM `item_template` WHERE `entry` = 902345;

INSERT INTO `item_template` SET
    `entry` = 902345,
    `subclass` = 4,
    `name` = 'Scroll of Frost Resistance VII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 4500,
    `SellPrice` = 1125,
    `ItemLevel` = 80,
    `RequiredLevel` = 70,
    `stackable` = 20,
    `spellid_1` = 103212,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Frost Resistance VIII (Rank VIII) - Item 902346, Spell 103213
DELETE FROM `item_template` WHERE `entry` = 902346;

INSERT INTO `item_template` SET
    `entry` = 902346,
    `subclass` = 4,
    `name` = 'Scroll of Frost Resistance VIII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 6000,
    `SellPrice` = 1500,
    `ItemLevel` = 85,
    `RequiredLevel` = 80,
    `stackable` = 20,
    `spellid_1` = 103213,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- ============================================================================
-- ARCANE RESISTANCE SCROLLS (Spell IDs: 103214-103221)
-- ============================================================================

-- Scroll of Arcane Resistance (Rank I) - Item 902347, Spell 103214
DELETE FROM `item_template` WHERE `entry` = 902347;

INSERT INTO `item_template` SET
    `entry` = 902347,
    `subclass` = 4,
    `name` = 'Scroll of Arcane Resistance',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 150,
    `SellPrice` = 37,
    `ItemLevel` = 15,
    `RequiredLevel` = 5,
    `stackable` = 20,
    `spellid_1` = 103214,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Arcane Resistance II (Rank II) - Item 902348, Spell 103215
DELETE FROM `item_template` WHERE `entry` = 902348;

INSERT INTO `item_template` SET
    `entry` = 902348,
    `subclass` = 4,
    `name` = 'Scroll of Arcane Resistance II',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 300,
    `SellPrice` = 75,
    `ItemLevel` = 30,
    `RequiredLevel` = 20,
    `stackable` = 20,
    `spellid_1` = 103215,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Arcane Resistance III (Rank III) - Item 902349, Spell 103216
DELETE FROM `item_template` WHERE `entry` = 902349;

INSERT INTO `item_template` SET
    `entry` = 902349,
    `subclass` = 4,
    `name` = 'Scroll of Arcane Resistance III',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 900,
    `SellPrice` = 225,
    `ItemLevel` = 45,
    `RequiredLevel` = 35,
    `stackable` = 20,
    `spellid_1` = 103216,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Arcane Resistance IV (Rank IV) - Item 902350, Spell 103217
DELETE FROM `item_template` WHERE `entry` = 902350;

INSERT INTO `item_template` SET
    `entry` = 902350,
    `subclass` = 4,
    `name` = 'Scroll of Arcane Resistance IV',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 1800,
    `SellPrice` = 450,
    `ItemLevel` = 60,
    `RequiredLevel` = 50,
    `stackable` = 20,
    `spellid_1` = 103217,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Arcane Resistance V (Rank V) - Item 902351, Spell 103218
DELETE FROM `item_template` WHERE `entry` = 902351;

INSERT INTO `item_template` SET
    `entry` = 902351,
    `subclass` = 4,
    `name` = 'Scroll of Arcane Resistance V',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 2700,
    `SellPrice` = 675,
    `ItemLevel` = 70,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103218,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Arcane Resistance VI (Rank VI) - Item 902352, Spell 103219
DELETE FROM `item_template` WHERE `entry` = 902352;

INSERT INTO `item_template` SET
    `entry` = 902352,
    `subclass` = 4,
    `name` = 'Scroll of Arcane Resistance VI',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 3600,
    `SellPrice` = 900,
    `ItemLevel` = 75,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103219,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Arcane Resistance VII (Rank VII) - Item 902353, Spell 103220
DELETE FROM `item_template` WHERE `entry` = 902353;

INSERT INTO `item_template` SET
    `entry` = 902353,
    `subclass` = 4,
    `name` = 'Scroll of Arcane Resistance VII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 4500,
    `SellPrice` = 1125,
    `ItemLevel` = 80,
    `RequiredLevel` = 70,
    `stackable` = 20,
    `spellid_1` = 103220,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Arcane Resistance VIII (Rank VIII) - Item 902354, Spell 103221
DELETE FROM `item_template` WHERE `entry` = 902354;

INSERT INTO `item_template` SET
    `entry` = 902354,
    `subclass` = 4,
    `name` = 'Scroll of Arcane Resistance VIII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 6000,
    `SellPrice` = 1500,
    `ItemLevel` = 85,
    `RequiredLevel` = 80,
    `stackable` = 20,
    `spellid_1` = 103221,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- ============================================================================
-- SHADOW RESISTANCE SCROLLS (Spell IDs: 103222-103229)
-- ============================================================================

-- Scroll of Shadow Resistance (Rank I) - Item 902355, Spell 103222
DELETE FROM `item_template` WHERE `entry` = 902355;

INSERT INTO `item_template` SET
    `entry` = 902355,
    `subclass` = 4,
    `name` = 'Scroll of Shadow Resistance',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 150,
    `SellPrice` = 37,
    `ItemLevel` = 15,
    `RequiredLevel` = 5,
    `stackable` = 20,
    `spellid_1` = 103222,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Shadow Resistance II (Rank II) - Item 902356, Spell 103223
DELETE FROM `item_template` WHERE `entry` = 902356;

INSERT INTO `item_template` SET
    `entry` = 902356,
    `subclass` = 4,
    `name` = 'Scroll of Shadow Resistance II',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 300,
    `SellPrice` = 75,
    `ItemLevel` = 30,
    `RequiredLevel` = 20,
    `stackable` = 20,
    `spellid_1` = 103223,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Shadow Resistance III (Rank III) - Item 902357, Spell 103224
DELETE FROM `item_template` WHERE `entry` = 902357;

INSERT INTO `item_template` SET
    `entry` = 902357,
    `subclass` = 4,
    `name` = 'Scroll of Shadow Resistance III',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 900,
    `SellPrice` = 225,
    `ItemLevel` = 45,
    `RequiredLevel` = 35,
    `stackable` = 20,
    `spellid_1` = 103224,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Shadow Resistance IV (Rank IV) - Item 902358, Spell 103225
DELETE FROM `item_template` WHERE `entry` = 902358;

INSERT INTO `item_template` SET
    `entry` = 902358,
    `subclass` = 4,
    `name` = 'Scroll of Shadow Resistance IV',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 1800,
    `SellPrice` = 450,
    `ItemLevel` = 60,
    `RequiredLevel` = 50,
    `stackable` = 20,
    `spellid_1` = 103225,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Shadow Resistance V (Rank V) - Item 902359, Spell 103226
DELETE FROM `item_template` WHERE `entry` = 902359;

INSERT INTO `item_template` SET
    `entry` = 902359,
    `subclass` = 4,
    `name` = 'Scroll of Shadow Resistance V',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 2700,
    `SellPrice` = 675,
    `ItemLevel` = 70,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103226,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Shadow Resistance VI (Rank VI) - Item 902360, Spell 103227
DELETE FROM `item_template` WHERE `entry` = 902360;

INSERT INTO `item_template` SET
    `entry` = 902360,
    `subclass` = 4,
    `name` = 'Scroll of Shadow Resistance VI',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 3600,
    `SellPrice` = 900,
    `ItemLevel` = 75,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103227,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Shadow Resistance VII (Rank VII) - Item 902361, Spell 103228
DELETE FROM `item_template` WHERE `entry` = 902361;

INSERT INTO `item_template` SET
    `entry` = 902361,
    `subclass` = 4,
    `name` = 'Scroll of Shadow Resistance VII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 4500,
    `SellPrice` = 1125,
    `ItemLevel` = 80,
    `RequiredLevel` = 70,
    `stackable` = 20,
    `spellid_1` = 103228,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Shadow Resistance VIII (Rank VIII) - Item 902362, Spell 103229
DELETE FROM `item_template` WHERE `entry` = 902362;

INSERT INTO `item_template` SET
    `entry` = 902362,
    `subclass` = 4,
    `name` = 'Scroll of Shadow Resistance VIII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 6000,
    `SellPrice` = 1500,
    `ItemLevel` = 85,
    `RequiredLevel` = 80,
    `stackable` = 20,
    `spellid_1` = 103229,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- ============================================================================
-- NATURE RESISTANCE SCROLLS (Spell IDs: 103230-103237)
-- ============================================================================

-- Scroll of Nature Resistance (Rank I) - Item 902363, Spell 103230
DELETE FROM `item_template` WHERE `entry` = 902363;

INSERT INTO `item_template` SET
    `entry` = 902363,
    `subclass` = 4,
    `name` = 'Scroll of Nature Resistance',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 150,
    `SellPrice` = 37,
    `ItemLevel` = 15,
    `RequiredLevel` = 5,
    `stackable` = 20,
    `spellid_1` = 103230,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Nature Resistance II (Rank II) - Item 902364, Spell 103231
DELETE FROM `item_template` WHERE `entry` = 902364;

INSERT INTO `item_template` SET
    `entry` = 902364,
    `subclass` = 4,
    `name` = 'Scroll of Nature Resistance II',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 300,
    `SellPrice` = 75,
    `ItemLevel` = 30,
    `RequiredLevel` = 20,
    `stackable` = 20,
    `spellid_1` = 103231,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Nature Resistance III (Rank III) - Item 902365, Spell 103232
DELETE FROM `item_template` WHERE `entry` = 902365;

INSERT INTO `item_template` SET
    `entry` = 902365,
    `subclass` = 4,
    `name` = 'Scroll of Nature Resistance III',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 900,
    `SellPrice` = 225,
    `ItemLevel` = 45,
    `RequiredLevel` = 35,
    `stackable` = 20,
    `spellid_1` = 103232,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Nature Resistance IV (Rank IV) - Item 902366, Spell 103233
DELETE FROM `item_template` WHERE `entry` = 902366;

INSERT INTO `item_template` SET
    `entry` = 902366,
    `subclass` = 4,
    `name` = 'Scroll of Nature Resistance IV',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 1800,
    `SellPrice` = 450,
    `ItemLevel` = 60,
    `RequiredLevel` = 50,
    `stackable` = 20,
    `spellid_1` = 103233,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Nature Resistance V (Rank V) - Item 902367, Spell 103234
DELETE FROM `item_template` WHERE `entry` = 902367;

INSERT INTO `item_template` SET
    `entry` = 902367,
    `subclass` = 4,
    `name` = 'Scroll of Nature Resistance V',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 2700,
    `SellPrice` = 675,
    `ItemLevel` = 70,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103234,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Nature Resistance VI (Rank VI) - Item 902368, Spell 103235
DELETE FROM `item_template` WHERE `entry` = 902368;

INSERT INTO `item_template` SET
    `entry` = 902368,
    `subclass` = 4,
    `name` = 'Scroll of Nature Resistance VI',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 3600,
    `SellPrice` = 900,
    `ItemLevel` = 75,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103235,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Nature Resistance VII (Rank VII) - Item 902369, Spell 103236
DELETE FROM `item_template` WHERE `entry` = 902369;

INSERT INTO `item_template` SET
    `entry` = 902369,
    `subclass` = 4,
    `name` = 'Scroll of Nature Resistance VII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 4500,
    `SellPrice` = 1125,
    `ItemLevel` = 80,
    `RequiredLevel` = 70,
    `stackable` = 20,
    `spellid_1` = 103236,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Nature Resistance VIII (Rank VIII) - Item 902370, Spell 103237
DELETE FROM `item_template` WHERE `entry` = 902370;

INSERT INTO `item_template` SET
    `entry` = 902370,
    `subclass` = 4,
    `name` = 'Scroll of Nature Resistance VIII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 6000,
    `SellPrice` = 1500,
    `ItemLevel` = 85,
    `RequiredLevel` = 80,
    `stackable` = 20,
    `spellid_1` = 103237,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- ============================================================================
-- HOLY RESISTANCE SCROLLS (Spell IDs: 103238-103245) [CUSTOM]
-- ============================================================================

-- Scroll of Holy Resistance (Rank I) - Item 902371, Spell 103238
DELETE FROM `item_template` WHERE `entry` = 902371;

INSERT INTO `item_template` SET
    `entry` = 902371,
    `subclass` = 4,
    `name` = 'Scroll of Holy Resistance',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 150,
    `SellPrice` = 37,
    `ItemLevel` = 15,
    `RequiredLevel` = 5,
    `stackable` = 20,
    `spellid_1` = 103238,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Holy Resistance II (Rank II) - Item 902372, Spell 103239
DELETE FROM `item_template` WHERE `entry` = 902372;

INSERT INTO `item_template` SET
    `entry` = 902372,
    `subclass` = 4,
    `name` = 'Scroll of Holy Resistance II',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 300,
    `SellPrice` = 75,
    `ItemLevel` = 30,
    `RequiredLevel` = 20,
    `stackable` = 20,
    `spellid_1` = 103239,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Holy Resistance III (Rank III) - Item 902373, Spell 103240
DELETE FROM `item_template` WHERE `entry` = 902373;

INSERT INTO `item_template` SET
    `entry` = 902373,
    `subclass` = 4,
    `name` = 'Scroll of Holy Resistance III',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 900,
    `SellPrice` = 225,
    `ItemLevel` = 45,
    `RequiredLevel` = 35,
    `stackable` = 20,
    `spellid_1` = 103240,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Holy Resistance IV (Rank IV) - Item 902374, Spell 103241
DELETE FROM `item_template` WHERE `entry` = 902374;

INSERT INTO `item_template` SET
    `entry` = 902374,
    `subclass` = 4,
    `name` = 'Scroll of Holy Resistance IV',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 1800,
    `SellPrice` = 450,
    `ItemLevel` = 60,
    `RequiredLevel` = 50,
    `stackable` = 20,
    `spellid_1` = 103241,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Holy Resistance V (Rank V) - Item 902375, Spell 103242
DELETE FROM `item_template` WHERE `entry` = 902375;

INSERT INTO `item_template` SET
    `entry` = 902375,
    `subclass` = 4,
    `name` = 'Scroll of Holy Resistance V',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 2700,
    `SellPrice` = 675,
    `ItemLevel` = 70,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103242,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Holy Resistance VI (Rank VI) - Item 902376, Spell 103243
DELETE FROM `item_template` WHERE `entry` = 902376;

INSERT INTO `item_template` SET
    `entry` = 902376,
    `subclass` = 4,
    `name` = 'Scroll of Holy Resistance VI',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 3600,
    `SellPrice` = 900,
    `ItemLevel` = 75,
    `RequiredLevel` = 60,
    `stackable` = 20,
    `spellid_1` = 103243,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Holy Resistance VII (Rank VII) - Item 902377, Spell 103244
DELETE FROM `item_template` WHERE `entry` = 902377;

INSERT INTO `item_template` SET
    `entry` = 902377,
    `subclass` = 4,
    `name` = 'Scroll of Holy Resistance VII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 4500,
    `SellPrice` = 1125,
    `ItemLevel` = 80,
    `RequiredLevel` = 70,
    `stackable` = 20,
    `spellid_1` = 103244,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;



-- Scroll of Holy Resistance VIII (Rank VIII) - Item 902378, Spell 103245
DELETE FROM `item_template` WHERE `entry` = 902378;

INSERT INTO `item_template` SET
    `entry` = 902378,
    `subclass` = 4,
    `name` = 'Scroll of Holy Resistance VIII',
    `displayid` = 1093,
    `Quality` = 1,
    `BuyPrice` = 6000,
    `SellPrice` = 1500,
    `ItemLevel` = 85,
    `RequiredLevel` = 80,
    `stackable` = 20,
    `spellid_1` = 103245,
    `spellcharges_1` = -1,
    `spellppmRate_1` = -1.0,
    `spellcooldown_1` = 1000,
    `Material` = 7,
    `BagFamily` = 16;






-- =====================================================
-- SPELL GROUP STACKING RULES
-- =====================================================
-- Prevents multiple resistance scrolls from stacking
-- Only ONE resistance scroll can be active at a time
-- (Similar to food buffs - stack_rule 8)
-- =====================================================

-- Define spell group 1119 for Resistance Scrolls
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1119;

INSERT INTO `spell_group_stack_rules` SET
    `group_id` = 1119,
    `stack_rule` = 8,
    `description` = 'Group of Resistance Scrolls - never stack';



-- Add all 48 resistance scroll spells to group 1119 (Fire, Frost, Arcane, Shadow, Nature, Holy)
DELETE FROM `spell_group` WHERE `id` = 1119;

-- Fire Resistance (103198-103205)
INSERT INTO `spell_group` VALUES (1119, 103198, 0);
INSERT INTO `spell_group` VALUES (1119, 103199, 0);
INSERT INTO `spell_group` VALUES (1119, 103200, 0);
INSERT INTO `spell_group` VALUES (1119, 103201, 0);
INSERT INTO `spell_group` VALUES (1119, 103202, 0);
INSERT INTO `spell_group` VALUES (1119, 103203, 0);
INSERT INTO `spell_group` VALUES (1119, 103204, 0);
INSERT INTO `spell_group` VALUES (1119, 103205, 0);

-- Frost Resistance (103206-103213)
INSERT INTO `spell_group` VALUES (1119, 103206, 0);
INSERT INTO `spell_group` VALUES (1119, 103207, 0);
INSERT INTO `spell_group` VALUES (1119, 103208, 0);
INSERT INTO `spell_group` VALUES (1119, 103209, 0);
INSERT INTO `spell_group` VALUES (1119, 103210, 0);
INSERT INTO `spell_group` VALUES (1119, 103211, 0);
INSERT INTO `spell_group` VALUES (1119, 103212, 0);
INSERT INTO `spell_group` VALUES (1119, 103213, 0);

-- Arcane Resistance (103214-103221)
INSERT INTO `spell_group` VALUES (1119, 103214, 0);
INSERT INTO `spell_group` VALUES (1119, 103215, 0);
INSERT INTO `spell_group` VALUES (1119, 103216, 0);
INSERT INTO `spell_group` VALUES (1119, 103217, 0);
INSERT INTO `spell_group` VALUES (1119, 103218, 0);
INSERT INTO `spell_group` VALUES (1119, 103219, 0);
INSERT INTO `spell_group` VALUES (1119, 103220, 0);
INSERT INTO `spell_group` VALUES (1119, 103221, 0);

-- Shadow Resistance (103222-103229)
INSERT INTO `spell_group` VALUES (1119, 103222, 0);
INSERT INTO `spell_group` VALUES (1119, 103223, 0);
INSERT INTO `spell_group` VALUES (1119, 103224, 0);
INSERT INTO `spell_group` VALUES (1119, 103225, 0);
INSERT INTO `spell_group` VALUES (1119, 103226, 0);
INSERT INTO `spell_group` VALUES (1119, 103227, 0);
INSERT INTO `spell_group` VALUES (1119, 103228, 0);
INSERT INTO `spell_group` VALUES (1119, 103229, 0);

-- Nature Resistance (103230-103237)
INSERT INTO `spell_group` VALUES (1119, 103230, 0);
INSERT INTO `spell_group` VALUES (1119, 103231, 0);
INSERT INTO `spell_group` VALUES (1119, 103232, 0);
INSERT INTO `spell_group` VALUES (1119, 103233, 0);
INSERT INTO `spell_group` VALUES (1119, 103234, 0);
INSERT INTO `spell_group` VALUES (1119, 103235, 0);
INSERT INTO `spell_group` VALUES (1119, 103236, 0);
INSERT INTO `spell_group` VALUES (1119, 103237, 0);

-- Holy Resistance (103238-103245)
INSERT INTO `spell_group` VALUES (1119, 103238, 0);
INSERT INTO `spell_group` VALUES (1119, 103239, 0);
INSERT INTO `spell_group` VALUES (1119, 103240, 0);
INSERT INTO `spell_group` VALUES (1119, 103241, 0);
INSERT INTO `spell_group` VALUES (1119, 103242, 0);
INSERT INTO `spell_group` VALUES (1119, 103243, 0);
INSERT INTO `spell_group` VALUES (1119, 103244, 0);
INSERT INTO `spell_group` VALUES (1119, 103245, 0);


-- =====================================================
-- VANILLA SCROLL OF PROTECTION INTEGRATION
-- =====================================================
-- Add vanilla Scroll of Protection spells to group 1119
-- to ensure they don't stack with resistance scrolls
-- =====================================================

-- Scroll of Protection (8 ranks: 8091, 8094, 8095, 12175, 33079, 43196, 58452, 58453)
INSERT INTO `spell_group` VALUES (1119, 8091, 0);   -- Rank I
INSERT INTO `spell_group` VALUES (1119, 8094, 0);   -- Rank II
INSERT INTO `spell_group` VALUES (1119, 8095, 0);   -- Rank III
INSERT INTO `spell_group` VALUES (1119, 12175, 0);  -- Rank IV
INSERT INTO `spell_group` VALUES (1119, 33079, 0);  -- Rank V
INSERT INTO `spell_group` VALUES (1119, 43196, 0);  -- Rank VI
INSERT INTO `spell_group` VALUES (1119, 58452, 0);  -- Rank VII
INSERT INTO `spell_group` VALUES (1119, 58453, 0);  -- Rank VIII
