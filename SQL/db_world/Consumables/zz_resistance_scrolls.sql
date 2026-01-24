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
    `displayid` = 154865,
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
    `displayid` = 154865,
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
    `displayid` = 154865,
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
    `displayid` = 154865,
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
    `displayid` = 154865,
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
    `displayid` = 154865,
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
    `displayid` = 154865,
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
    `displayid` = 154865,
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
    `displayid` = 154864,
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
    `displayid` = 154864,
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
    `displayid` = 154864,
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
    `displayid` = 154864,
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
    `displayid` = 154864,
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
    `displayid` = 154864,
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
    `displayid` = 154864,
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
    `displayid` = 154864,
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
    `displayid` = 141292,
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
    `displayid` = 141292,
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
    `displayid` = 141292,
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
    `displayid` = 141292,
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
    `displayid` = 141292,
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
    `displayid` = 141292,
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
    `displayid` = 141292,
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
    `displayid` = 141292,
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
    `displayid` = 139967,
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
    `displayid` = 139967,
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
    `displayid` = 139967,
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
    `displayid` = 139967,
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
    `displayid` = 139967,
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
    `displayid` = 139967,
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
    `displayid` = 139967,
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
    `displayid` = 139967,
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
    `displayid` = 138251,
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
    `displayid` = 138251,
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
    `displayid` = 138251,
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
    `displayid` = 138251,
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
    `displayid` = 138251,
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
    `displayid` = 138251,
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
    `displayid` = 138251,
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
    `displayid` = 138251,
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
    `displayid` = 140076,
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
    `displayid` = 140076,
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
    `displayid` = 140076,
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
    `displayid` = 140076,
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
    `displayid` = 140076,
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
    `displayid` = 140076,
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
    `displayid` = 140076,
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
    `displayid` = 140076,
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


-- =====================================================
-- PHASE 2: INSCRIPTION INTEGRATION
-- =====================================================
-- Updates item RequiredLevel/ItemLevel to new tier structure
-- Adds trainer entries for crafting spells (103300-103347)
-- =====================================================

-- Update item RequiredLevel and ItemLevel to new tier structure
-- Tier values: I=5/15, II=15/25, III=30/40, IV=45/55, V=58/65, VI=68/78, VII=72/78, VIII=78/85

-- Fire Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 902331;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 902332;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 902333;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 902334;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 902335;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 902336;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 902337;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 902338;

-- Frost Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 902339;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 902340;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 902341;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 902342;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 902343;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 902344;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 902345;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 902346;

-- Arcane Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 902347;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 902348;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 902349;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 902350;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 902351;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 902352;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 902353;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 902354;

-- Shadow Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 902355;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 902356;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 902357;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 902358;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 902359;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 902360;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 902361;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 902362;

-- Nature Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 902363;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 902364;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 902365;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 902366;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 902367;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 902368;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 902369;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 902370;

-- Holy Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 902371;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 902372;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 902373;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 902374;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 902375;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 902376;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 902377;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 902378;


-- =====================================================
-- INSCRIPTION TRAINER ENTRIES (Starter Ranks Only)
-- =====================================================
-- Only starter ranks are trainer-taught:
--   Rank I (Vanilla starter) - Trainer 201021
--   Rank V (TBC starter) - Trainer 201022
--   Rank VII (WotLK starter) - Trainer 201023
--
-- Progression ranks (II, III, IV, VI, VIII) are dungeon recipe drops
-- See Phase 3 implementation for recipe items and loot tables
-- =====================================================

-- Remove existing entries (idempotent)
DELETE FROM `npc_trainer` WHERE `SpellID` BETWEEN 103300 AND 103347;

-- Trainer 201021: Inscription Trainer
-- Rank I - Vanilla starter (2 schools per 5 skill, cost 50c)
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201021, 103300, 50, 773, 25, 0, 0),    -- Fire Warding I
(201021, 103301, 50, 773, 25, 0, 0),    -- Frost Warding I
(201021, 103302, 50, 773, 30, 0, 0),    -- Arcane Warding I
(201021, 103303, 50, 773, 30, 0, 0),    -- Shadow Warding I
(201021, 103304, 50, 773, 35, 0, 0),    -- Nature Warding I
(201021, 103305, 50, 773, 35, 0, 0);    -- Holy Warding I

-- Trainer 201022: Master Inscription Trainer
-- Rank V - TBC starter (2 schools per 5 skill, cost 1g 50s)
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201022, 103324, 15000, 773, 310, 0, 0), -- Fire Warding V
(201022, 103325, 15000, 773, 310, 0, 0), -- Frost Warding V
(201022, 103326, 15000, 773, 315, 0, 0), -- Arcane Warding V
(201022, 103327, 15000, 773, 315, 0, 0), -- Shadow Warding V
(201022, 103328, 15000, 773, 320, 0, 0), -- Nature Warding V
(201022, 103329, 15000, 773, 320, 0, 0); -- Holy Warding V

-- Trainer 201023: Grand Master Inscription Trainer
-- Rank VII - WotLK starter (2 schools per 5 skill, cost 5g)
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201023, 103336, 50000, 773, 380, 0, 0), -- Fire Warding VII
(201023, 103337, 50000, 773, 380, 0, 0), -- Frost Warding VII
(201023, 103338, 50000, 773, 385, 0, 0), -- Arcane Warding VII
(201023, 103339, 50000, 773, 385, 0, 0), -- Shadow Warding VII
(201023, 103340, 50000, 773, 390, 0, 0), -- Nature Warding VII
(201023, 103341, 50000, 773, 390, 0, 0); -- Holy Warding VII

-- =====================================================
-- PHASE 3: DUNGEON RECIPE DROPS
-- =====================================================
-- Recipe items for progression ranks:
--   Ranks II, III, IV - Vanilla dungeon drops
--   Rank VI - TBC dungeon drops
--   Rank VIII - WotLK dungeon drops
--
-- Recipe Item IDs: 902400-902429 (5 ranks × 6 types)
--   Fire: 902400-902404 (II, III, IV, VI, VIII)
--   Frost: 902405-902409
--   Arcane: 902410-902414
--   Shadow: 902415-902419
--   Nature: 902420-902424
--   Holy: 902425-902429
-- =====================================================

-- =====================================================
-- RANK II RECIPE ITEMS (Vanilla Low-Level Dungeons)
-- =====================================================
-- Skill Req: Fire/Frost 80, Arcane/Shadow 85, Nature/Holy 90

-- Technique: Scroll of Fire Resistance II
DELETE FROM `item_template` WHERE `entry` = 902400;

INSERT INTO `item_template` SET
    `entry` = 902400,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Fire Resistance II',
    `displayid` = 140302,
    `Quality` = 2,
    `BuyPrice` = 2000,
    `SellPrice` = 500,
    `ItemLevel` = 25,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 80,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103306,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Frost Resistance II
DELETE FROM `item_template` WHERE `entry` = 902405;

INSERT INTO `item_template` SET
    `entry` = 902405,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Frost Resistance II',
    `displayid` = 140304,
    `Quality` = 2,
    `BuyPrice` = 2000,
    `SellPrice` = 500,
    `ItemLevel` = 25,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 80,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103307,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Arcane Resistance II
DELETE FROM `item_template` WHERE `entry` = 902410;

INSERT INTO `item_template` SET
    `entry` = 902410,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Arcane Resistance II',
    `displayid` = 140305,
    `Quality` = 2,
    `BuyPrice` = 2000,
    `SellPrice` = 500,
    `ItemLevel` = 25,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 85,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103308,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Shadow Resistance II
DELETE FROM `item_template` WHERE `entry` = 902415;

INSERT INTO `item_template` SET
    `entry` = 902415,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Shadow Resistance II',
    `displayid` = 140305,
    `Quality` = 2,
    `BuyPrice` = 2000,
    `SellPrice` = 500,
    `ItemLevel` = 25,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 85,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103309,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Nature Resistance II
DELETE FROM `item_template` WHERE `entry` = 902420;

INSERT INTO `item_template` SET
    `entry` = 902420,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Nature Resistance II',
    `displayid` = 140303,
    `Quality` = 2,
    `BuyPrice` = 2000,
    `SellPrice` = 500,
    `ItemLevel` = 25,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 90,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103310,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Holy Resistance II
DELETE FROM `item_template` WHERE `entry` = 902425;

INSERT INTO `item_template` SET
    `entry` = 902425,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Holy Resistance II',
    `displayid` = 140301,
    `Quality` = 2,
    `BuyPrice` = 2000,
    `SellPrice` = 500,
    `ItemLevel` = 25,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 90,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103311,
    `spelltrigger_2` = 6;



-- =====================================================
-- RANK II DUNGEON LOOT TABLE ENTRIES
-- =====================================================
-- Boss Distribution:
--   Fire: Taragaman (11520), Jergosh (11518) - RFC
--   Frost: Baron Silverlaine (3887), Cookie (645) - SFK/DM
--   Arcane: Arugal (4275), Anacondra (3671) - SFK/WC
--   Shadow: Arugal (4275), VanCleef (639) - SFK/DM
--   Nature: Verdan (5775), Cobrahn (3669) - WC
--   Holy: Springvale (4278), Smite (646) - SFK/DM
-- =====================================================

-- Clean up existing entries for Rank II recipes
DELETE FROM `creature_loot_template` WHERE `Item` IN (902400, 902405, 902410, 902415, 902420, 902425);

-- Fire Resistance II - Ragefire Chasm
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(11520, 902400, 15, 'Taragaman the Hungerer - Technique: Scroll of Fire Resistance II'),
(11518, 902400, 15, 'Jergosh the Invoker - Technique: Scroll of Fire Resistance II');

-- Frost Resistance II - SFK/Deadmines
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(3887, 902405, 15, 'Baron Silverlaine - Technique: Scroll of Frost Resistance II'),
(645, 902405, 15, 'Cookie - Technique: Scroll of Frost Resistance II');

-- Arcane Resistance II - SFK/WC
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(4275, 902410, 15, 'Archmage Arugal - Technique: Scroll of Arcane Resistance II'),
(3671, 902410, 15, 'Lady Anacondra - Technique: Scroll of Arcane Resistance II');

-- Shadow Resistance II - SFK/Deadmines
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(4275, 902415, 15, 'Archmage Arugal - Technique: Scroll of Shadow Resistance II'),
(639, 902415, 15, 'Edwin VanCleef - Technique: Scroll of Shadow Resistance II');

-- Nature Resistance II - Wailing Caverns
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(5775, 902420, 15, 'Verdan the Everliving - Technique: Scroll of Nature Resistance II'),
(3669, 902420, 15, 'Lord Cobrahn - Technique: Scroll of Nature Resistance II');

-- Holy Resistance II - SFK/Deadmines
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(4278, 902425, 15, 'Commander Springvale - Technique: Scroll of Holy Resistance II'),
(646, 902425, 15, 'Mr. Smite - Technique: Scroll of Holy Resistance II');

-- =====================================================
-- RANK III RECIPE ITEMS (Vanilla Mid-Level Dungeons)
-- =====================================================
-- Level 30+ dungeons: SM, RFK, RFD, Gnomeregan, Uldaman
-- Skill Req: Fire/Frost 155, Arcane/Shadow 160, Nature/Holy 165

-- Technique: Scroll of Fire Resistance III
DELETE FROM `item_template` WHERE `entry` = 902401;

INSERT INTO `item_template` SET
    `entry` = 902401,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Fire Resistance III',
    `displayid` = 140302,
    `Quality` = 2,
    `BuyPrice` = 5000,
    `SellPrice` = 1250,
    `ItemLevel` = 40,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 155,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103312,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Frost Resistance III
DELETE FROM `item_template` WHERE `entry` = 902406;

INSERT INTO `item_template` SET
    `entry` = 902406,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Frost Resistance III',
    `displayid` = 140304,
    `Quality` = 2,
    `BuyPrice` = 5000,
    `SellPrice` = 1250,
    `ItemLevel` = 40,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 155,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103313,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Arcane Resistance III
DELETE FROM `item_template` WHERE `entry` = 902411;

INSERT INTO `item_template` SET
    `entry` = 902411,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Arcane Resistance III',
    `displayid` = 140305,
    `Quality` = 2,
    `BuyPrice` = 5000,
    `SellPrice` = 1250,
    `ItemLevel` = 40,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 160,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103314,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Shadow Resistance III
DELETE FROM `item_template` WHERE `entry` = 902416;

INSERT INTO `item_template` SET
    `entry` = 902416,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Shadow Resistance III',
    `displayid` = 140305,
    `Quality` = 2,
    `BuyPrice` = 5000,
    `SellPrice` = 1250,
    `ItemLevel` = 40,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 160,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103315,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Nature Resistance III
DELETE FROM `item_template` WHERE `entry` = 902421;

INSERT INTO `item_template` SET
    `entry` = 902421,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Nature Resistance III',
    `displayid` = 140303,
    `Quality` = 2,
    `BuyPrice` = 5000,
    `SellPrice` = 1250,
    `ItemLevel` = 40,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 165,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103316,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Holy Resistance III
DELETE FROM `item_template` WHERE `entry` = 902426;

INSERT INTO `item_template` SET
    `entry` = 902426,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Holy Resistance III',
    `displayid` = 140301,
    `Quality` = 2,
    `BuyPrice` = 5000,
    `SellPrice` = 1250,
    `ItemLevel` = 40,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 165,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103317,
    `spelltrigger_2` = 6;



-- =====================================================
-- RANK III DUNGEON LOOT TABLE ENTRIES
-- =====================================================
-- Boss Distribution (thematically appropriate):
--   Fire: Herod (3975 - SM Armory), Viscous Fallout (7079 - Gnomer)
--   Frost: Amnennar the Coldbringer (7358 - RFD)
--   Arcane: Archaedas (2748 - Uldaman), Arcanist Doan (6487 - SM Library)
--   Shadow: Mordresh Fire Eye (7357 - RFD), Tuten'kash (7355 - RFD)
--   Nature: Charlga Razorflank (4421 - RFK), Overlord Ramtusk (4420 - RFK)
--   Holy: High Inquisitor Whitemane (3977), Mograine (3976) - SM Cathedral
-- =====================================================

-- Clean up existing entries for Rank III recipes
DELETE FROM `creature_loot_template` WHERE `Item` IN (902401, 902406, 902411, 902416, 902421, 902426);

-- Fire Resistance III - SM Armory / Gnomeregan
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(3975, 902401, 15, 'Herod - Technique: Scroll of Fire Resistance III'),
(7079, 902401, 15, 'Viscous Fallout - Technique: Scroll of Fire Resistance III');

-- Frost Resistance III - Razorfen Downs (frost lich!)
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(7358, 902406, 20, 'Amnennar the Coldbringer - Technique: Scroll of Frost Resistance III');

-- Arcane Resistance III - Uldaman / SM Library
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(2748, 902411, 15, 'Archaedas - Technique: Scroll of Arcane Resistance III'),
(6487, 902411, 15, 'Arcanist Doan - Technique: Scroll of Arcane Resistance III');

-- Shadow Resistance III - Razorfen Downs
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(7357, 902416, 15, 'Mordresh Fire Eye - Technique: Scroll of Shadow Resistance III'),
(7355, 902416, 15, 'Tuten''kash - Technique: Scroll of Shadow Resistance III');

-- Nature Resistance III - Razorfen Kraul
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(4421, 902421, 15, 'Charlga Razorflank - Technique: Scroll of Nature Resistance III'),
(4420, 902421, 15, 'Overlord Ramtusk - Technique: Scroll of Nature Resistance III');

-- Holy Resistance III - SM Cathedral
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(3977, 902426, 15, 'High Inquisitor Whitemane - Technique: Scroll of Holy Resistance III'),
(3976, 902426, 15, 'Scarlet Commander Mograine - Technique: Scroll of Holy Resistance III');

-- =====================================================
-- RANK IV RECIPE ITEMS (Vanilla High-Level Dungeons)
-- =====================================================
-- Level 45+ dungeons: BRD, ZF, Sunken Temple, Maraudon, Scholo, Strat
-- Skill Req: Fire/Frost 225, Arcane/Shadow 230, Nature/Holy 235
-- Premium Rank (requires Essence reagent for crafting)

-- Technique: Scroll of Fire Resistance IV
DELETE FROM `item_template` WHERE `entry` = 902402;

INSERT INTO `item_template` SET
    `entry` = 902402,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Fire Resistance IV',
    `displayid` = 140302,
    `Quality` = 2,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `ItemLevel` = 55,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 225,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103318,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Frost Resistance IV
DELETE FROM `item_template` WHERE `entry` = 902407;

INSERT INTO `item_template` SET
    `entry` = 902407,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Frost Resistance IV',
    `displayid` = 140304,
    `Quality` = 2,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `ItemLevel` = 55,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 225,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103319,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Arcane Resistance IV
DELETE FROM `item_template` WHERE `entry` = 902412;

INSERT INTO `item_template` SET
    `entry` = 902412,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Arcane Resistance IV',
    `displayid` = 140305,
    `Quality` = 2,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `ItemLevel` = 55,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 230,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103320,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Shadow Resistance IV
DELETE FROM `item_template` WHERE `entry` = 902417;

INSERT INTO `item_template` SET
    `entry` = 902417,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Shadow Resistance IV',
    `displayid` = 140305,
    `Quality` = 2,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `ItemLevel` = 55,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 230,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103321,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Nature Resistance IV
DELETE FROM `item_template` WHERE `entry` = 902422;

INSERT INTO `item_template` SET
    `entry` = 902422,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Nature Resistance IV',
    `displayid` = 140303,
    `Quality` = 2,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `ItemLevel` = 55,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 235,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103322,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Holy Resistance IV
DELETE FROM `item_template` WHERE `entry` = 902427;

INSERT INTO `item_template` SET
    `entry` = 902427,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Holy Resistance IV',
    `displayid` = 140301,
    `Quality` = 2,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `ItemLevel` = 55,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 235,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103323,
    `spelltrigger_2` = 6;



-- =====================================================
-- RANK IV DUNGEON LOOT TABLE ENTRIES
-- =====================================================
-- Boss Distribution (thematically appropriate):
--   Fire: Ambassador Flamelash (9156 - BRD), Lord Incendius (9017 - BRD)
--   Frost: Hydromancer Velratha (7795 - ZF), Theka the Martyr (7272 - ZF)
--   Arcane: Shade of Eranikus (5709 - ST), Jammal'an the Prophet (5710 - ST)
--   Shadow: Darkmaster Gandling (1853 - Scholo), Rattlegore (11622 - Scholo)
--   Nature: Princess Theradras (12201 - Maraudon), Celebras the Cursed (12225 - Maraudon)
--   Holy: Magistrate Barthilas (10435 - Strat), Balnazzar (10813 - Strat)
-- =====================================================

-- Clean up existing entries for Rank IV recipes
DELETE FROM `creature_loot_template` WHERE `Item` IN (902402, 902407, 902412, 902417, 902422, 902427);

-- Fire Resistance IV - Blackrock Depths
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(9156, 902402, 15, 'Ambassador Flamelash - Technique: Scroll of Fire Resistance IV'),
(9017, 902402, 15, 'Lord Incendius - Technique: Scroll of Fire Resistance IV');

-- Frost Resistance IV - Zul'Farrak
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(7795, 902407, 15, 'Hydromancer Velratha - Technique: Scroll of Frost Resistance IV'),
(7272, 902407, 15, 'Theka the Martyr - Technique: Scroll of Frost Resistance IV');

-- Arcane Resistance IV - Sunken Temple
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(5709, 902412, 15, 'Shade of Eranikus - Technique: Scroll of Arcane Resistance IV'),
(5710, 902412, 15, 'Jammal''an the Prophet - Technique: Scroll of Arcane Resistance IV');

-- Shadow Resistance IV - Scholomance
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(1853, 902417, 15, 'Darkmaster Gandling - Technique: Scroll of Shadow Resistance IV'),
(11622, 902417, 15, 'Rattlegore - Technique: Scroll of Shadow Resistance IV');

-- Nature Resistance IV - Maraudon
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(12201, 902422, 15, 'Princess Theradras - Technique: Scroll of Nature Resistance IV'),
(12225, 902422, 15, 'Celebras the Cursed - Technique: Scroll of Nature Resistance IV');

-- Holy Resistance IV - Stratholme
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(10435, 902427, 15, 'Magistrate Barthilas - Technique: Scroll of Holy Resistance IV'),
(10813, 902427, 15, 'Balnazzar - Technique: Scroll of Holy Resistance IV');

-- =====================================================
-- RANK VI RECIPE ITEMS (TBC Dungeons)
-- =====================================================
-- TBC Dungeons: Mechanar, Botanica, Arcatraz, Shadow Lab, Underbog, Auchenai
-- Skill Req: Fire/Frost 360, Arcane/Shadow 365, Nature/Holy 370
-- Premium Rank (requires Primal reagent for crafting)

-- Technique: Scroll of Fire Resistance VI
DELETE FROM `item_template` WHERE `entry` = 902403;

INSERT INTO `item_template` SET
    `entry` = 902403,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Fire Resistance VI',
    `displayid` = 140302,
    `Quality` = 3,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `ItemLevel` = 78,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 360,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103330,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Frost Resistance VI
DELETE FROM `item_template` WHERE `entry` = 902408;

INSERT INTO `item_template` SET
    `entry` = 902408,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Frost Resistance VI',
    `displayid` = 140304,
    `Quality` = 3,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `ItemLevel` = 78,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 360,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103331,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Arcane Resistance VI
DELETE FROM `item_template` WHERE `entry` = 902413;

INSERT INTO `item_template` SET
    `entry` = 902413,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Arcane Resistance VI',
    `displayid` = 140305,
    `Quality` = 3,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `ItemLevel` = 78,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 365,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103332,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Shadow Resistance VI
DELETE FROM `item_template` WHERE `entry` = 902418;

INSERT INTO `item_template` SET
    `entry` = 902418,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Shadow Resistance VI',
    `displayid` = 140305,
    `Quality` = 3,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `ItemLevel` = 78,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 365,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103333,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Nature Resistance VI
DELETE FROM `item_template` WHERE `entry` = 902423;

INSERT INTO `item_template` SET
    `entry` = 902423,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Nature Resistance VI',
    `displayid` = 140303,
    `Quality` = 3,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `ItemLevel` = 78,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 370,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103334,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Holy Resistance VI
DELETE FROM `item_template` WHERE `entry` = 902428;

INSERT INTO `item_template` SET
    `entry` = 902428,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Holy Resistance VI',
    `displayid` = 140301,
    `Quality` = 3,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `ItemLevel` = 78,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 370,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103335,
    `spelltrigger_2` = 6;



-- =====================================================
-- RANK VI DUNGEON LOOT TABLE ENTRIES
-- =====================================================
-- Boss Distribution (thematically appropriate):
--   Fire: Kael'thas Sunstrider (24664 - MGT), Pathaleon (19220 - Mechanar)
--   Frost: High Botanist Freywinn (17975 - Botanica), Warp Splinter (17977 - Botanica)
--   Arcane: Harbinger Skyriss (20912 - Arcatraz), Dalliah (20885 - Arcatraz)
--   Shadow: Murmur (18708 - Shadow Lab), Grandmaster Vorpil (18732 - Shadow Lab)
--   Nature: Hungarfen (17770 - Underbog), Swamplord Musel'ek (17826 - Underbog)
--   Holy: Exarch Maladaar (18373 - Auchenai), Avatar of the Martyred (18478 - Auchenai)
-- =====================================================

-- Clean up existing entries for Rank VI recipes
DELETE FROM `creature_loot_template` WHERE `Item` IN (902403, 902408, 902413, 902418, 902423, 902428);

-- Fire Resistance VI - Magister's Terrace / Mechanar
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(24664, 902403, 15, 'Kael''thas Sunstrider - Technique: Scroll of Fire Resistance VI'),
(19220, 902403, 15, 'Pathaleon the Calculator - Technique: Scroll of Fire Resistance VI');

-- Frost Resistance VI - Botanica
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(17975, 902408, 15, 'High Botanist Freywinn - Technique: Scroll of Frost Resistance VI'),
(17977, 902408, 15, 'Warp Splinter - Technique: Scroll of Frost Resistance VI');

-- Arcane Resistance VI - Arcatraz
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(20912, 902413, 15, 'Harbinger Skyriss - Technique: Scroll of Arcane Resistance VI'),
(20885, 902413, 15, 'Dalliah the Doomsayer - Technique: Scroll of Arcane Resistance VI');

-- Shadow Resistance VI - Shadow Labyrinth
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(18708, 902418, 15, 'Murmur - Technique: Scroll of Shadow Resistance VI'),
(18732, 902418, 15, 'Grandmaster Vorpil - Technique: Scroll of Shadow Resistance VI');

-- Nature Resistance VI - Underbog
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(17770, 902423, 15, 'Hungarfen - Technique: Scroll of Nature Resistance VI'),
(17826, 902423, 15, 'Swamplord Musel''ek - Technique: Scroll of Nature Resistance VI');

-- Holy Resistance VI - Auchenai Crypts
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(18373, 902428, 15, 'Exarch Maladaar - Technique: Scroll of Holy Resistance VI'),
(18478, 902428, 15, 'Avatar of the Martyred - Technique: Scroll of Holy Resistance VI');

-- =====================================================
-- RANK VIII RECIPE ITEMS (WotLK Dungeons)
-- =====================================================
-- WotLK Dungeons: Halls of Lightning, Pit of Saron, Oculus, Forge of Souls, Gundrak, Drak'Tharon
-- Skill Req: Fire/Frost 420, Arcane/Shadow 425, Nature/Holy 430
-- Premium Rank (requires Eternal reagent for crafting)

-- Technique: Scroll of Fire Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 902404;

INSERT INTO `item_template` SET
    `entry` = 902404,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Fire Resistance VIII',
    `displayid` = 140302,
    `Quality` = 3,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `ItemLevel` = 85,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 420,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103342,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Frost Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 902409;

INSERT INTO `item_template` SET
    `entry` = 902409,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Frost Resistance VIII',
    `displayid` = 140304,
    `Quality` = 3,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `ItemLevel` = 85,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 420,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103343,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Arcane Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 902414;

INSERT INTO `item_template` SET
    `entry` = 902414,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Arcane Resistance VIII',
    `displayid` = 140305,
    `Quality` = 3,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `ItemLevel` = 85,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 425,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103344,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Shadow Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 902419;

INSERT INTO `item_template` SET
    `entry` = 902419,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Shadow Resistance VIII',
    `displayid` = 140305,
    `Quality` = 3,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `ItemLevel` = 85,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 425,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103345,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Nature Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 902424;

INSERT INTO `item_template` SET
    `entry` = 902424,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Nature Resistance VIII',
    `displayid` = 140303,
    `Quality` = 3,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `ItemLevel` = 85,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 430,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103346,
    `spelltrigger_2` = 6;



-- Technique: Scroll of Holy Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 902429;

INSERT INTO `item_template` SET
    `entry` = 902429,
    `class` = 9,
    `subclass` = 0,
    `name` = 'Technique: Scroll of Holy Resistance VIII',
    `displayid` = 140301,
    `Quality` = 3,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `ItemLevel` = 85,
    `RequiredLevel` = 0,
    `RequiredSkill` = 773,
    `RequiredSkillRank` = 430,
    `stackable` = 1,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 103347,
    `spelltrigger_2` = 6;



-- =====================================================
-- RANK VIII DUNGEON LOOT TABLE ENTRIES
-- =====================================================
-- Boss Distribution (thematically appropriate):
--   Fire: Loken (28923 - HoL), General Bjarngrim (28586 - HoL)
--   Frost: Scourgelord Tyrannus (36658 - PoS), Forgemaster Garfrost (36494 - PoS)
--   Arcane: Ley-Guardian Eregos (27656 - Oculus), Mage-Lord Urom (27655 - Oculus)
--   Shadow: Devourer of Souls (36502 - FoS), Bronjahm (36497 - FoS)
--   Nature: Gal'darah (29306 - Gundrak), Slad'ran (29304 - Gundrak)
--   Holy: The Prophet Tharon'ja (26632 - Drak'Tharon), Sjonnir (27978 - HoS)
-- =====================================================

-- Clean up existing entries for Rank VIII recipes
DELETE FROM `creature_loot_template` WHERE `Item` IN (902404, 902409, 902414, 902419, 902424, 902429);

-- Fire Resistance VIII - Halls of Lightning
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(28923, 902404, 15, 'Loken - Technique: Scroll of Fire Resistance VIII'),
(28586, 902404, 15, 'General Bjarngrim - Technique: Scroll of Fire Resistance VIII');

-- Frost Resistance VIII - Pit of Saron
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(36658, 902409, 15, 'Scourgelord Tyrannus - Technique: Scroll of Frost Resistance VIII'),
(36494, 902409, 15, 'Forgemaster Garfrost - Technique: Scroll of Frost Resistance VIII');

-- Arcane Resistance VIII - Oculus
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(27656, 902414, 15, 'Ley-Guardian Eregos - Technique: Scroll of Arcane Resistance VIII'),
(27655, 902414, 15, 'Mage-Lord Urom - Technique: Scroll of Arcane Resistance VIII');

-- Shadow Resistance VIII - Forge of Souls
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(36502, 902419, 15, 'Devourer of Souls - Technique: Scroll of Shadow Resistance VIII'),
(36497, 902419, 15, 'Bronjahm - Technique: Scroll of Shadow Resistance VIII');

-- Nature Resistance VIII - Gundrak
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(29306, 902424, 15, 'Gal''darah - Technique: Scroll of Nature Resistance VIII'),
(29304, 902424, 15, 'Slad''ran - Technique: Scroll of Nature Resistance VIII');

-- Holy Resistance VIII - Drak'Tharon / Halls of Stone
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(26632, 902429, 15, 'The Prophet Tharon''ja - Technique: Scroll of Holy Resistance VIII'),
(27978, 902429, 15, 'Sjonnir the Ironshaper - Technique: Scroll of Holy Resistance VIII');
