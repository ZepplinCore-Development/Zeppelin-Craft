-- F-015: Magic Resistance Scrolls - Item Templates
-- Creates 48 scroll consumable items (6 types × 8 ranks)
-- Scroll Item IDs: 57408 - 57455 (Inscription range)
-- Recipe Item IDs: 57456 - 57485 (Inscription range)
-- Links to buff spell IDs: 103198 - 103245
-- Crafting spell IDs: 103300 - 103347
--
-- Note: Scroll of Protection (vanilla item) already provides armor buff
-- Execute against acore_world database

-- ============================================================================
-- FIRE RESISTANCE SCROLLS (Spell IDs: 103198-103205)
-- ============================================================================

-- Scroll of Fire Resistance (Rank I) - Item 57408, Spell 103198
DELETE FROM `item_template` WHERE `entry` = 57408;

INSERT INTO `item_template` SET
    `entry` = 57408,
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



-- Scroll of Fire Resistance II (Rank II) - Item 57409, Spell 103199
DELETE FROM `item_template` WHERE `entry` = 57409;

INSERT INTO `item_template` SET
    `entry` = 57409,
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



-- Scroll of Fire Resistance III (Rank III) - Item 57410, Spell 103200
DELETE FROM `item_template` WHERE `entry` = 57410;

INSERT INTO `item_template` SET
    `entry` = 57410,
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



-- Scroll of Fire Resistance IV (Rank IV) - Item 57411, Spell 103201
DELETE FROM `item_template` WHERE `entry` = 57411;

INSERT INTO `item_template` SET
    `entry` = 57411,
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



-- Scroll of Fire Resistance V (Rank V) - Item 57412, Spell 103202
DELETE FROM `item_template` WHERE `entry` = 57412;

INSERT INTO `item_template` SET
    `entry` = 57412,
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



-- Scroll of Fire Resistance VI (Rank VI) - Item 57413, Spell 103203
DELETE FROM `item_template` WHERE `entry` = 57413;

INSERT INTO `item_template` SET
    `entry` = 57413,
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



-- Scroll of Fire Resistance VII (Rank VII) - Item 57414, Spell 103204
DELETE FROM `item_template` WHERE `entry` = 57414;

INSERT INTO `item_template` SET
    `entry` = 57414,
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



-- Scroll of Fire Resistance VIII (Rank VIII) - Item 57415, Spell 103205
DELETE FROM `item_template` WHERE `entry` = 57415;

INSERT INTO `item_template` SET
    `entry` = 57415,
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

-- Scroll of Frost Resistance (Rank I) - Item 57416, Spell 103206
DELETE FROM `item_template` WHERE `entry` = 57416;

INSERT INTO `item_template` SET
    `entry` = 57416,
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



-- Scroll of Frost Resistance II (Rank II) - Item 57417, Spell 103207
DELETE FROM `item_template` WHERE `entry` = 57417;

INSERT INTO `item_template` SET
    `entry` = 57417,
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



-- Scroll of Frost Resistance III (Rank III) - Item 57418, Spell 103208
DELETE FROM `item_template` WHERE `entry` = 57418;

INSERT INTO `item_template` SET
    `entry` = 57418,
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



-- Scroll of Frost Resistance IV (Rank IV) - Item 57419, Spell 103209
DELETE FROM `item_template` WHERE `entry` = 57419;

INSERT INTO `item_template` SET
    `entry` = 57419,
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



-- Scroll of Frost Resistance V (Rank V) - Item 57420, Spell 103210
DELETE FROM `item_template` WHERE `entry` = 57420;

INSERT INTO `item_template` SET
    `entry` = 57420,
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



-- Scroll of Frost Resistance VI (Rank VI) - Item 57421, Spell 103211
DELETE FROM `item_template` WHERE `entry` = 57421;

INSERT INTO `item_template` SET
    `entry` = 57421,
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



-- Scroll of Frost Resistance VII (Rank VII) - Item 57422, Spell 103212
DELETE FROM `item_template` WHERE `entry` = 57422;

INSERT INTO `item_template` SET
    `entry` = 57422,
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



-- Scroll of Frost Resistance VIII (Rank VIII) - Item 57423, Spell 103213
DELETE FROM `item_template` WHERE `entry` = 57423;

INSERT INTO `item_template` SET
    `entry` = 57423,
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

-- Scroll of Arcane Resistance (Rank I) - Item 57424, Spell 103214
DELETE FROM `item_template` WHERE `entry` = 57424;

INSERT INTO `item_template` SET
    `entry` = 57424,
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



-- Scroll of Arcane Resistance II (Rank II) - Item 57425, Spell 103215
DELETE FROM `item_template` WHERE `entry` = 57425;

INSERT INTO `item_template` SET
    `entry` = 57425,
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



-- Scroll of Arcane Resistance III (Rank III) - Item 57426, Spell 103216
DELETE FROM `item_template` WHERE `entry` = 57426;

INSERT INTO `item_template` SET
    `entry` = 57426,
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



-- Scroll of Arcane Resistance IV (Rank IV) - Item 57427, Spell 103217
DELETE FROM `item_template` WHERE `entry` = 57427;

INSERT INTO `item_template` SET
    `entry` = 57427,
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



-- Scroll of Arcane Resistance V (Rank V) - Item 57428, Spell 103218
DELETE FROM `item_template` WHERE `entry` = 57428;

INSERT INTO `item_template` SET
    `entry` = 57428,
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



-- Scroll of Arcane Resistance VI (Rank VI) - Item 57429, Spell 103219
DELETE FROM `item_template` WHERE `entry` = 57429;

INSERT INTO `item_template` SET
    `entry` = 57429,
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



-- Scroll of Arcane Resistance VII (Rank VII) - Item 57430, Spell 103220
DELETE FROM `item_template` WHERE `entry` = 57430;

INSERT INTO `item_template` SET
    `entry` = 57430,
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



-- Scroll of Arcane Resistance VIII (Rank VIII) - Item 57431, Spell 103221
DELETE FROM `item_template` WHERE `entry` = 57431;

INSERT INTO `item_template` SET
    `entry` = 57431,
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

-- Scroll of Shadow Resistance (Rank I) - Item 57432, Spell 103222
DELETE FROM `item_template` WHERE `entry` = 57432;

INSERT INTO `item_template` SET
    `entry` = 57432,
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



-- Scroll of Shadow Resistance II (Rank II) - Item 57433, Spell 103223
DELETE FROM `item_template` WHERE `entry` = 57433;

INSERT INTO `item_template` SET
    `entry` = 57433,
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



-- Scroll of Shadow Resistance III (Rank III) - Item 57434, Spell 103224
DELETE FROM `item_template` WHERE `entry` = 57434;

INSERT INTO `item_template` SET
    `entry` = 57434,
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



-- Scroll of Shadow Resistance IV (Rank IV) - Item 57435, Spell 103225
DELETE FROM `item_template` WHERE `entry` = 57435;

INSERT INTO `item_template` SET
    `entry` = 57435,
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



-- Scroll of Shadow Resistance V (Rank V) - Item 57436, Spell 103226
DELETE FROM `item_template` WHERE `entry` = 57436;

INSERT INTO `item_template` SET
    `entry` = 57436,
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



-- Scroll of Shadow Resistance VI (Rank VI) - Item 57437, Spell 103227
DELETE FROM `item_template` WHERE `entry` = 57437;

INSERT INTO `item_template` SET
    `entry` = 57437,
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



-- Scroll of Shadow Resistance VII (Rank VII) - Item 57438, Spell 103228
DELETE FROM `item_template` WHERE `entry` = 57438;

INSERT INTO `item_template` SET
    `entry` = 57438,
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



-- Scroll of Shadow Resistance VIII (Rank VIII) - Item 57439, Spell 103229
DELETE FROM `item_template` WHERE `entry` = 57439;

INSERT INTO `item_template` SET
    `entry` = 57439,
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

-- Scroll of Nature Resistance (Rank I) - Item 57440, Spell 103230
DELETE FROM `item_template` WHERE `entry` = 57440;

INSERT INTO `item_template` SET
    `entry` = 57440,
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



-- Scroll of Nature Resistance II (Rank II) - Item 57441, Spell 103231
DELETE FROM `item_template` WHERE `entry` = 57441;

INSERT INTO `item_template` SET
    `entry` = 57441,
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



-- Scroll of Nature Resistance III (Rank III) - Item 57442, Spell 103232
DELETE FROM `item_template` WHERE `entry` = 57442;

INSERT INTO `item_template` SET
    `entry` = 57442,
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



-- Scroll of Nature Resistance IV (Rank IV) - Item 57443, Spell 103233
DELETE FROM `item_template` WHERE `entry` = 57443;

INSERT INTO `item_template` SET
    `entry` = 57443,
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



-- Scroll of Nature Resistance V (Rank V) - Item 57444, Spell 103234
DELETE FROM `item_template` WHERE `entry` = 57444;

INSERT INTO `item_template` SET
    `entry` = 57444,
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



-- Scroll of Nature Resistance VI (Rank VI) - Item 57445, Spell 103235
DELETE FROM `item_template` WHERE `entry` = 57445;

INSERT INTO `item_template` SET
    `entry` = 57445,
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



-- Scroll of Nature Resistance VII (Rank VII) - Item 57446, Spell 103236
DELETE FROM `item_template` WHERE `entry` = 57446;

INSERT INTO `item_template` SET
    `entry` = 57446,
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



-- Scroll of Nature Resistance VIII (Rank VIII) - Item 57447, Spell 103237
DELETE FROM `item_template` WHERE `entry` = 57447;

INSERT INTO `item_template` SET
    `entry` = 57447,
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

-- Scroll of Holy Resistance (Rank I) - Item 57448, Spell 103238
DELETE FROM `item_template` WHERE `entry` = 57448;

INSERT INTO `item_template` SET
    `entry` = 57448,
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



-- Scroll of Holy Resistance II (Rank II) - Item 57449, Spell 103239
DELETE FROM `item_template` WHERE `entry` = 57449;

INSERT INTO `item_template` SET
    `entry` = 57449,
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



-- Scroll of Holy Resistance III (Rank III) - Item 57450, Spell 103240
DELETE FROM `item_template` WHERE `entry` = 57450;

INSERT INTO `item_template` SET
    `entry` = 57450,
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



-- Scroll of Holy Resistance IV (Rank IV) - Item 57451, Spell 103241
DELETE FROM `item_template` WHERE `entry` = 57451;

INSERT INTO `item_template` SET
    `entry` = 57451,
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



-- Scroll of Holy Resistance V (Rank V) - Item 57452, Spell 103242
DELETE FROM `item_template` WHERE `entry` = 57452;

INSERT INTO `item_template` SET
    `entry` = 57452,
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



-- Scroll of Holy Resistance VI (Rank VI) - Item 57453, Spell 103243
DELETE FROM `item_template` WHERE `entry` = 57453;

INSERT INTO `item_template` SET
    `entry` = 57453,
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



-- Scroll of Holy Resistance VII (Rank VII) - Item 57454, Spell 103244
DELETE FROM `item_template` WHERE `entry` = 57454;

INSERT INTO `item_template` SET
    `entry` = 57454,
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



-- Scroll of Holy Resistance VIII (Rank VIII) - Item 57455, Spell 103245
DELETE FROM `item_template` WHERE `entry` = 57455;

INSERT INTO `item_template` SET
    `entry` = 57455,
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
-- (stack_rule 4 = EXCLUSIVE_HIGHEST)
-- =====================================================

-- Define spell group 1119 for Resistance Scrolls
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1119;

INSERT INTO `spell_group_stack_rules` SET
    `group_id` = 1119,
    `stack_rule` = 1,
    `description` = 'Group of Resistance Scrolls - exclusive';



-- Add all 48 resistance scroll spells to group 1119 (Fire, Frost, Arcane, Shadow, Nature, Holy)
DELETE FROM `spell_group` WHERE `id` = 1119;

-- Fire Resistance (103198-103205)
INSERT INTO `spell_group` VALUES (1119, 103198);
INSERT INTO `spell_group` VALUES (1119, 103199);
INSERT INTO `spell_group` VALUES (1119, 103200);
INSERT INTO `spell_group` VALUES (1119, 103201);
INSERT INTO `spell_group` VALUES (1119, 103202);
INSERT INTO `spell_group` VALUES (1119, 103203);
INSERT INTO `spell_group` VALUES (1119, 103204);
INSERT INTO `spell_group` VALUES (1119, 103205);

-- Frost Resistance (103206-103213)
INSERT INTO `spell_group` VALUES (1119, 103206);
INSERT INTO `spell_group` VALUES (1119, 103207);
INSERT INTO `spell_group` VALUES (1119, 103208);
INSERT INTO `spell_group` VALUES (1119, 103209);
INSERT INTO `spell_group` VALUES (1119, 103210);
INSERT INTO `spell_group` VALUES (1119, 103211);
INSERT INTO `spell_group` VALUES (1119, 103212);
INSERT INTO `spell_group` VALUES (1119, 103213);

-- Arcane Resistance (103214-103221)
INSERT INTO `spell_group` VALUES (1119, 103214);
INSERT INTO `spell_group` VALUES (1119, 103215);
INSERT INTO `spell_group` VALUES (1119, 103216);
INSERT INTO `spell_group` VALUES (1119, 103217);
INSERT INTO `spell_group` VALUES (1119, 103218);
INSERT INTO `spell_group` VALUES (1119, 103219);
INSERT INTO `spell_group` VALUES (1119, 103220);
INSERT INTO `spell_group` VALUES (1119, 103221);

-- Shadow Resistance (103222-103229)
INSERT INTO `spell_group` VALUES (1119, 103222);
INSERT INTO `spell_group` VALUES (1119, 103223);
INSERT INTO `spell_group` VALUES (1119, 103224);
INSERT INTO `spell_group` VALUES (1119, 103225);
INSERT INTO `spell_group` VALUES (1119, 103226);
INSERT INTO `spell_group` VALUES (1119, 103227);
INSERT INTO `spell_group` VALUES (1119, 103228);
INSERT INTO `spell_group` VALUES (1119, 103229);

-- Nature Resistance (103230-103237)
INSERT INTO `spell_group` VALUES (1119, 103230);
INSERT INTO `spell_group` VALUES (1119, 103231);
INSERT INTO `spell_group` VALUES (1119, 103232);
INSERT INTO `spell_group` VALUES (1119, 103233);
INSERT INTO `spell_group` VALUES (1119, 103234);
INSERT INTO `spell_group` VALUES (1119, 103235);
INSERT INTO `spell_group` VALUES (1119, 103236);
INSERT INTO `spell_group` VALUES (1119, 103237);

-- Holy Resistance (103238-103245)
INSERT INTO `spell_group` VALUES (1119, 103238);
INSERT INTO `spell_group` VALUES (1119, 103239);
INSERT INTO `spell_group` VALUES (1119, 103240);
INSERT INTO `spell_group` VALUES (1119, 103241);
INSERT INTO `spell_group` VALUES (1119, 103242);
INSERT INTO `spell_group` VALUES (1119, 103243);
INSERT INTO `spell_group` VALUES (1119, 103244);
INSERT INTO `spell_group` VALUES (1119, 103245);


-- =====================================================
-- VANILLA SCROLL OF PROTECTION INTEGRATION
-- =====================================================
-- Add vanilla Scroll of Protection spells to group 1119
-- to ensure they don't stack with resistance scrolls
-- =====================================================

-- Scroll of Protection - only rank 1 needed (AC auto-includes all ranks from spell_ranks chain)
INSERT INTO `spell_group` VALUES (1119, 8091);   -- Rank I (chain: 8091 -> 8094 -> 8095 -> 12175 -> 33079 -> 43196 -> 58452 -> 58453)


-- =====================================================
-- PHASE 2: INSCRIPTION INTEGRATION
-- =====================================================
-- Updates item RequiredLevel/ItemLevel to new tier structure
-- Adds trainer entries for crafting spells (103300-103347)
-- =====================================================

-- Update item RequiredLevel and ItemLevel to new tier structure
-- Tier values: I=5/15, II=15/25, III=30/40, IV=45/55, V=58/65, VI=68/78, VII=72/78, VIII=78/85

-- Fire Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 57408;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 57409;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 57410;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 57411;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 57412;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 57413;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 57414;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 57415;

-- Frost Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 57416;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 57417;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 57418;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 57419;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 57420;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 57421;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 57422;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 57423;

-- Arcane Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 57424;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 57425;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 57426;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 57427;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 57428;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 57429;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 57430;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 57431;

-- Shadow Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 57432;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 57433;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 57434;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 57435;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 57436;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 57437;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 57438;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 57439;

-- Nature Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 57440;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 57441;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 57442;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 57443;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 57444;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 57445;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 57446;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 57447;

-- Holy Resistance Scrolls
UPDATE `item_template` SET `RequiredLevel` = 5, `ItemLevel` = 15 WHERE `entry` = 57448;
UPDATE `item_template` SET `RequiredLevel` = 15, `ItemLevel` = 25 WHERE `entry` = 57449;
UPDATE `item_template` SET `RequiredLevel` = 30, `ItemLevel` = 40 WHERE `entry` = 57450;
UPDATE `item_template` SET `RequiredLevel` = 45, `ItemLevel` = 55 WHERE `entry` = 57451;
UPDATE `item_template` SET `RequiredLevel` = 58, `ItemLevel` = 65 WHERE `entry` = 57452;
UPDATE `item_template` SET `RequiredLevel` = 68, `ItemLevel` = 78 WHERE `entry` = 57453;
UPDATE `item_template` SET `RequiredLevel` = 72, `ItemLevel` = 78 WHERE `entry` = 57454;
UPDATE `item_template` SET `RequiredLevel` = 78, `ItemLevel` = 85 WHERE `entry` = 57455;


-- =====================================================
-- INSCRIPTION TRAINER ENTRIES (Starter Ranks Only)
-- =====================================================
-- Only starter ranks are trainer-taught:
--   Rank I (Vanilla starter) - Skill 0-315
--   Rank V (TBC starter) - Skill 316-350
--   Rank VII (WotLK starter) - Skill 351-440
--
-- Trainer IDs (existing Inscription trainers):
--   121 = Artisan Inscription (0-315)
--   120 = Master Inscription (0-350)
--   119 = Grand Master Inscription (0-440)
--
-- Trainer assignment based on ReqSkillRank:
--   Skill 0-315: Add to 121, 120, 119 (all trainers)
--   Skill 316-350: Add to 120, 119 (Master and Grand Master)
--   Skill 351-440: Add to 119 only (Grand Master)
--
-- Progression ranks (II, III, IV, VI, VIII) are dungeon recipe drops
-- See Phase 3 implementation for recipe items and loot tables
-- =====================================================

-- Remove existing entries from ALL trainers (idempotent)
DELETE FROM `trainer_spell` WHERE `SpellId` = 103300;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103301;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103302;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103303;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103304;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103305;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103324;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103325;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103326;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103327;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103328;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103329;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103336;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103337;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103338;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103339;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103340;
DELETE FROM `trainer_spell` WHERE `SpellId` = 103341;

-- Rank I - Vanilla starter (Skill 25-35, cost 50c)
-- ReqSkillRank <= 315: All trainers (121, 120, 119)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(121, 103300, 50, 773, 25, 0, 0, 0, 0),    -- Fire Warding I (Artisan)
(120, 103300, 50, 773, 25, 0, 0, 0, 0),    -- Fire Warding I (Master)
(119, 103300, 50, 773, 25, 0, 0, 0, 0),    -- Fire Warding I (Grand Master)
(121, 103301, 50, 773, 25, 0, 0, 0, 0),    -- Frost Warding I (Artisan)
(120, 103301, 50, 773, 25, 0, 0, 0, 0),    -- Frost Warding I (Master)
(119, 103301, 50, 773, 25, 0, 0, 0, 0),    -- Frost Warding I (Grand Master)
(121, 103302, 50, 773, 30, 0, 0, 0, 0),    -- Arcane Warding I (Artisan)
(120, 103302, 50, 773, 30, 0, 0, 0, 0),    -- Arcane Warding I (Master)
(119, 103302, 50, 773, 30, 0, 0, 0, 0),    -- Arcane Warding I (Grand Master)
(121, 103303, 50, 773, 30, 0, 0, 0, 0),    -- Shadow Warding I (Artisan)
(120, 103303, 50, 773, 30, 0, 0, 0, 0),    -- Shadow Warding I (Master)
(119, 103303, 50, 773, 30, 0, 0, 0, 0),    -- Shadow Warding I (Grand Master)
(121, 103304, 50, 773, 35, 0, 0, 0, 0),    -- Nature Warding I (Artisan)
(120, 103304, 50, 773, 35, 0, 0, 0, 0),    -- Nature Warding I (Master)
(119, 103304, 50, 773, 35, 0, 0, 0, 0),    -- Nature Warding I (Grand Master)
(121, 103305, 50, 773, 35, 0, 0, 0, 0),    -- Holy Warding I (Artisan)
(120, 103305, 50, 773, 35, 0, 0, 0, 0),    -- Holy Warding I (Master)
(119, 103305, 50, 773, 35, 0, 0, 0, 0);    -- Holy Warding I (Grand Master)

-- Rank V - TBC starter (Skill 310-320, cost 1g 50s)
-- ReqSkillRank 316-350: Master and Grand Master trainers (120, 119)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(120, 103324, 15000, 773, 310, 0, 0, 0, 0), -- Fire Warding V (Master)
(119, 103324, 15000, 773, 310, 0, 0, 0, 0), -- Fire Warding V (Grand Master)
(120, 103325, 15000, 773, 310, 0, 0, 0, 0), -- Frost Warding V (Master)
(119, 103325, 15000, 773, 310, 0, 0, 0, 0), -- Frost Warding V (Grand Master)
(120, 103326, 15000, 773, 315, 0, 0, 0, 0), -- Arcane Warding V (Master)
(119, 103326, 15000, 773, 315, 0, 0, 0, 0), -- Arcane Warding V (Grand Master)
(120, 103327, 15000, 773, 315, 0, 0, 0, 0), -- Shadow Warding V (Master)
(119, 103327, 15000, 773, 315, 0, 0, 0, 0), -- Shadow Warding V (Grand Master)
(120, 103328, 15000, 773, 320, 0, 0, 0, 0), -- Nature Warding V (Master)
(119, 103328, 15000, 773, 320, 0, 0, 0, 0), -- Nature Warding V (Grand Master)
(120, 103329, 15000, 773, 320, 0, 0, 0, 0), -- Holy Warding V (Master)
(119, 103329, 15000, 773, 320, 0, 0, 0, 0); -- Holy Warding V (Grand Master)

-- Rank VII - WotLK starter (Skill 380-390, cost 5g)
-- ReqSkillRank 351-440: Grand Master trainer only (119)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(119, 103336, 50000, 773, 380, 0, 0, 0, 0), -- Fire Warding VII (Grand Master)
(119, 103337, 50000, 773, 380, 0, 0, 0, 0), -- Frost Warding VII (Grand Master)
(119, 103338, 50000, 773, 385, 0, 0, 0, 0), -- Arcane Warding VII (Grand Master)
(119, 103339, 50000, 773, 385, 0, 0, 0, 0), -- Shadow Warding VII (Grand Master)
(119, 103340, 50000, 773, 390, 0, 0, 0, 0), -- Nature Warding VII (Grand Master)
(119, 103341, 50000, 773, 390, 0, 0, 0, 0); -- Holy Warding VII (Grand Master)

-- =====================================================
-- PHASE 3: DUNGEON RECIPE DROPS
-- =====================================================
-- Recipe items for progression ranks:
--   Ranks II, III, IV - Vanilla dungeon drops
--   Rank VI - TBC dungeon drops
--   Rank VIII - WotLK dungeon drops
--
-- Recipe Item IDs: 57456-57485 (5 ranks × 6 types)
--   Fire: 57456-57460 (II, III, IV, VI, VIII)
--   Frost: 57461-57465
--   Arcane: 57466-57470
--   Shadow: 57471-57475
--   Nature: 57476-57480
--   Holy: 57481-57485
-- =====================================================

-- =====================================================
-- RANK II RECIPE ITEMS (Vanilla Low-Level Dungeons)
-- =====================================================
-- Skill Req: Fire/Frost 80, Arcane/Shadow 85, Nature/Holy 90

-- Technique: Scroll of Fire Resistance II
DELETE FROM `item_template` WHERE `entry` = 57456;

INSERT INTO `item_template` SET
    `entry` = 57456,
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
    `description` = 'Teaches you how to scribe Scroll of Fire Resistance II.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Frost Resistance II
DELETE FROM `item_template` WHERE `entry` = 57461;

INSERT INTO `item_template` SET
    `entry` = 57461,
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
    `description` = 'Teaches you how to scribe Scroll of Frost Resistance II.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Arcane Resistance II
DELETE FROM `item_template` WHERE `entry` = 57466;

INSERT INTO `item_template` SET
    `entry` = 57466,
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
    `description` = 'Teaches you how to scribe Scroll of Arcane Resistance II.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Shadow Resistance II
DELETE FROM `item_template` WHERE `entry` = 57471;

INSERT INTO `item_template` SET
    `entry` = 57471,
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
    `description` = 'Teaches you how to scribe Scroll of Shadow Resistance II.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Nature Resistance II
DELETE FROM `item_template` WHERE `entry` = 57476;

INSERT INTO `item_template` SET
    `entry` = 57476,
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
    `description` = 'Teaches you how to scribe Scroll of Nature Resistance II.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Holy Resistance II
DELETE FROM `item_template` WHERE `entry` = 57481;

INSERT INTO `item_template` SET
    `entry` = 57481,
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
    `description` = 'Teaches you how to scribe Scroll of Holy Resistance II.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



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
DELETE FROM `creature_loot_template` WHERE `Item` IN (57456, 57461, 57466, 57471, 57476, 57481);

-- Fire Resistance II - Ragefire Chasm
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(11520, 57456, 15, 'Taragaman the Hungerer - Technique: Scroll of Fire Resistance II'),
(11518, 57456, 15, 'Jergosh the Invoker - Technique: Scroll of Fire Resistance II');

-- Frost Resistance II - SFK/Deadmines
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(3887, 57461, 15, 'Baron Silverlaine - Technique: Scroll of Frost Resistance II'),
(645, 57461, 15, 'Cookie - Technique: Scroll of Frost Resistance II');

-- Arcane Resistance II - SFK/WC
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(4275, 57466, 15, 'Archmage Arugal - Technique: Scroll of Arcane Resistance II'),
(3671, 57466, 15, 'Lady Anacondra - Technique: Scroll of Arcane Resistance II');

-- Shadow Resistance II - SFK/Deadmines
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(4275, 57471, 15, 'Archmage Arugal - Technique: Scroll of Shadow Resistance II'),
(639, 57471, 15, 'Edwin VanCleef - Technique: Scroll of Shadow Resistance II');

-- Nature Resistance II - Wailing Caverns
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(5775, 57476, 15, 'Verdan the Everliving - Technique: Scroll of Nature Resistance II'),
(3669, 57476, 15, 'Lord Cobrahn - Technique: Scroll of Nature Resistance II');

-- Holy Resistance II - SFK/Deadmines
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(4278, 57481, 15, 'Commander Springvale - Technique: Scroll of Holy Resistance II'),
(646, 57481, 15, 'Mr. Smite - Technique: Scroll of Holy Resistance II');

-- =====================================================
-- RANK III RECIPE ITEMS (Vanilla Mid-Level Dungeons)
-- =====================================================
-- Level 30+ dungeons: SM, RFK, RFD, Gnomeregan, Uldaman
-- Skill Req: Fire/Frost 155, Arcane/Shadow 160, Nature/Holy 165

-- Technique: Scroll of Fire Resistance III
DELETE FROM `item_template` WHERE `entry` = 57457;

INSERT INTO `item_template` SET
    `entry` = 57457,
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
    `description` = 'Teaches you how to scribe Scroll of Fire Resistance III.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Frost Resistance III
DELETE FROM `item_template` WHERE `entry` = 57462;

INSERT INTO `item_template` SET
    `entry` = 57462,
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
    `description` = 'Teaches you how to scribe Scroll of Frost Resistance III.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Arcane Resistance III
DELETE FROM `item_template` WHERE `entry` = 57467;

INSERT INTO `item_template` SET
    `entry` = 57467,
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
    `description` = 'Teaches you how to scribe Scroll of Arcane Resistance III.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Shadow Resistance III
DELETE FROM `item_template` WHERE `entry` = 57472;

INSERT INTO `item_template` SET
    `entry` = 57472,
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
    `description` = 'Teaches you how to scribe Scroll of Shadow Resistance III.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Nature Resistance III
DELETE FROM `item_template` WHERE `entry` = 57477;

INSERT INTO `item_template` SET
    `entry` = 57477,
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
    `description` = 'Teaches you how to scribe Scroll of Nature Resistance III.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Holy Resistance III
DELETE FROM `item_template` WHERE `entry` = 57482;

INSERT INTO `item_template` SET
    `entry` = 57482,
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
    `description` = 'Teaches you how to scribe Scroll of Holy Resistance III.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



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
DELETE FROM `creature_loot_template` WHERE `Item` IN (57457, 57462, 57467, 57472, 57477, 57482);

-- Fire Resistance III - SM Armory / Gnomeregan
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(3975, 57457, 15, 'Herod - Technique: Scroll of Fire Resistance III'),
(7079, 57457, 15, 'Viscous Fallout - Technique: Scroll of Fire Resistance III');

-- Frost Resistance III - Razorfen Downs (frost lich!)
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(7358, 57462, 20, 'Amnennar the Coldbringer - Technique: Scroll of Frost Resistance III');

-- Arcane Resistance III - Uldaman / SM Library
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(2748, 57467, 15, 'Archaedas - Technique: Scroll of Arcane Resistance III'),
(6487, 57467, 15, 'Arcanist Doan - Technique: Scroll of Arcane Resistance III');

-- Shadow Resistance III - Razorfen Downs
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(7357, 57472, 15, 'Mordresh Fire Eye - Technique: Scroll of Shadow Resistance III'),
(7355, 57472, 15, 'Tuten''kash - Technique: Scroll of Shadow Resistance III');

-- Nature Resistance III - Razorfen Kraul
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(4421, 57477, 15, 'Charlga Razorflank - Technique: Scroll of Nature Resistance III'),
(4420, 57477, 15, 'Overlord Ramtusk - Technique: Scroll of Nature Resistance III');

-- Holy Resistance III - SM Cathedral
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(3977, 57482, 15, 'High Inquisitor Whitemane - Technique: Scroll of Holy Resistance III'),
(3976, 57482, 15, 'Scarlet Commander Mograine - Technique: Scroll of Holy Resistance III');

-- =====================================================
-- RANK IV RECIPE ITEMS (Vanilla High-Level Dungeons)
-- =====================================================
-- Level 45+ dungeons: BRD, ZF, Sunken Temple, Maraudon, Scholo, Strat
-- Skill Req: Fire/Frost 225, Arcane/Shadow 230, Nature/Holy 235
-- Premium Rank (requires Essence reagent for crafting)

-- Technique: Scroll of Fire Resistance IV
DELETE FROM `item_template` WHERE `entry` = 57458;

INSERT INTO `item_template` SET
    `entry` = 57458,
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
    `description` = 'Teaches you how to scribe Scroll of Fire Resistance IV.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Frost Resistance IV
DELETE FROM `item_template` WHERE `entry` = 57463;

INSERT INTO `item_template` SET
    `entry` = 57463,
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
    `description` = 'Teaches you how to scribe Scroll of Frost Resistance IV.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Arcane Resistance IV
DELETE FROM `item_template` WHERE `entry` = 57468;

INSERT INTO `item_template` SET
    `entry` = 57468,
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
    `description` = 'Teaches you how to scribe Scroll of Arcane Resistance IV.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Shadow Resistance IV
DELETE FROM `item_template` WHERE `entry` = 57473;

INSERT INTO `item_template` SET
    `entry` = 57473,
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
    `description` = 'Teaches you how to scribe Scroll of Shadow Resistance IV.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Nature Resistance IV
DELETE FROM `item_template` WHERE `entry` = 57478;

INSERT INTO `item_template` SET
    `entry` = 57478,
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
    `description` = 'Teaches you how to scribe Scroll of Nature Resistance IV.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Holy Resistance IV
DELETE FROM `item_template` WHERE `entry` = 57483;

INSERT INTO `item_template` SET
    `entry` = 57483,
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
    `description` = 'Teaches you how to scribe Scroll of Holy Resistance IV.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



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
DELETE FROM `creature_loot_template` WHERE `Item` IN (57458, 57463, 57468, 57473, 57478, 57483);

-- Fire Resistance IV - Blackrock Depths
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(9156, 57458, 15, 'Ambassador Flamelash - Technique: Scroll of Fire Resistance IV'),
(9017, 57458, 15, 'Lord Incendius - Technique: Scroll of Fire Resistance IV');

-- Frost Resistance IV - Zul'Farrak
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(7795, 57463, 15, 'Hydromancer Velratha - Technique: Scroll of Frost Resistance IV'),
(7272, 57463, 15, 'Theka the Martyr - Technique: Scroll of Frost Resistance IV');

-- Arcane Resistance IV - Sunken Temple
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(5709, 57468, 15, 'Shade of Eranikus - Technique: Scroll of Arcane Resistance IV'),
(5710, 57468, 15, 'Jammal''an the Prophet - Technique: Scroll of Arcane Resistance IV');

-- Shadow Resistance IV - Scholomance
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(1853, 57473, 15, 'Darkmaster Gandling - Technique: Scroll of Shadow Resistance IV'),
(11622, 57473, 15, 'Rattlegore - Technique: Scroll of Shadow Resistance IV');

-- Nature Resistance IV - Maraudon
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(12201, 57478, 15, 'Princess Theradras - Technique: Scroll of Nature Resistance IV'),
(12225, 57478, 15, 'Celebras the Cursed - Technique: Scroll of Nature Resistance IV');

-- Holy Resistance IV - Stratholme
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(10435, 57483, 15, 'Magistrate Barthilas - Technique: Scroll of Holy Resistance IV'),
(10813, 57483, 15, 'Balnazzar - Technique: Scroll of Holy Resistance IV');

-- =====================================================
-- RANK VI RECIPE ITEMS (TBC Dungeons)
-- =====================================================
-- TBC Dungeons: Mechanar, Botanica, Arcatraz, Shadow Lab, Underbog, Auchenai
-- Skill Req: Fire/Frost 360, Arcane/Shadow 365, Nature/Holy 370
-- Premium Rank (requires Primal reagent for crafting)

-- Technique: Scroll of Fire Resistance VI
DELETE FROM `item_template` WHERE `entry` = 57459;

INSERT INTO `item_template` SET
    `entry` = 57459,
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
    `description` = 'Teaches you how to scribe Scroll of Fire Resistance VI.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Frost Resistance VI
DELETE FROM `item_template` WHERE `entry` = 57464;

INSERT INTO `item_template` SET
    `entry` = 57464,
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
    `description` = 'Teaches you how to scribe Scroll of Frost Resistance VI.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Arcane Resistance VI
DELETE FROM `item_template` WHERE `entry` = 57469;

INSERT INTO `item_template` SET
    `entry` = 57469,
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
    `description` = 'Teaches you how to scribe Scroll of Arcane Resistance VI.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Shadow Resistance VI
DELETE FROM `item_template` WHERE `entry` = 57474;

INSERT INTO `item_template` SET
    `entry` = 57474,
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
    `description` = 'Teaches you how to scribe Scroll of Shadow Resistance VI.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Nature Resistance VI
DELETE FROM `item_template` WHERE `entry` = 57479;

INSERT INTO `item_template` SET
    `entry` = 57479,
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
    `description` = 'Teaches you how to scribe Scroll of Nature Resistance VI.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Holy Resistance VI
DELETE FROM `item_template` WHERE `entry` = 57484;

INSERT INTO `item_template` SET
    `entry` = 57484,
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
    `description` = 'Teaches you how to scribe Scroll of Holy Resistance VI.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



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

-- Clean up existing entries for Rank VI recipes (normal + heroic)
DELETE FROM `creature_loot_template` WHERE `Item` IN (57459, 57464, 57469, 57474, 57479, 57484);

-- Fire Resistance VI - Magister's Terrace / Mechanar
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(24664, 57459, 15, 'Kael''thas Sunstrider - Technique: Scroll of Fire Resistance VI'),
(19220, 57459, 15, 'Pathaleon the Calculator - Technique: Scroll of Fire Resistance VI');

-- Frost Resistance VI - Botanica
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(17975, 57464, 15, 'High Botanist Freywinn - Technique: Scroll of Frost Resistance VI'),
(17977, 57464, 15, 'Warp Splinter - Technique: Scroll of Frost Resistance VI');

-- Arcane Resistance VI - Arcatraz
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(20912, 57469, 15, 'Harbinger Skyriss - Technique: Scroll of Arcane Resistance VI'),
(20885, 57469, 15, 'Dalliah the Doomsayer - Technique: Scroll of Arcane Resistance VI');

-- Shadow Resistance VI - Shadow Labyrinth
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(18708, 57474, 15, 'Murmur - Technique: Scroll of Shadow Resistance VI'),
(18732, 57474, 15, 'Grandmaster Vorpil - Technique: Scroll of Shadow Resistance VI');

-- Nature Resistance VI - Underbog
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(17770, 57479, 15, 'Hungarfen - Technique: Scroll of Nature Resistance VI'),
(17826, 57479, 15, 'Swamplord Musel''ek - Technique: Scroll of Nature Resistance VI');

-- Holy Resistance VI - Auchenai Crypts
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(18373, 57484, 15, 'Exarch Maladaar - Technique: Scroll of Holy Resistance VI'),
(18478, 57484, 15, 'Avatar of the Martyred - Technique: Scroll of Holy Resistance VI');

-- =====================================================
-- RANK VI HEROIC MODE DROPS (25% drop rate)
-- =====================================================
-- TBC Heroic dungeons use difficulty_entry_1 creatures with separate loot tables

-- Fire Resistance VI - Heroic Magister's Terrace / Mechanar
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(24857, 57459, 25, 'Kael''thas Sunstrider (Heroic) - Technique: Scroll of Fire Resistance VI'),
(21537, 57459, 25, 'Pathaleon the Calculator (Heroic) - Technique: Scroll of Fire Resistance VI');

-- Frost Resistance VI - Heroic Botanica
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(21558, 57464, 25, 'High Botanist Freywinn (Heroic) - Technique: Scroll of Frost Resistance VI'),
(21582, 57464, 25, 'Warp Splinter (Heroic) - Technique: Scroll of Frost Resistance VI');

-- Arcane Resistance VI - Heroic Arcatraz
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(21601, 57469, 25, 'Harbinger Skyriss (Heroic) - Technique: Scroll of Arcane Resistance VI'),
(21590, 57469, 25, 'Dalliah the Doomsayer (Heroic) - Technique: Scroll of Arcane Resistance VI');

-- Shadow Resistance VI - Heroic Shadow Labyrinth
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(20657, 57474, 25, 'Murmur (Heroic) - Technique: Scroll of Shadow Resistance VI'),
(20653, 57474, 25, 'Grandmaster Vorpil (Heroic) - Technique: Scroll of Shadow Resistance VI');

-- Nature Resistance VI - Heroic Underbog
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(20169, 57479, 25, 'Hungarfen (Heroic) - Technique: Scroll of Nature Resistance VI'),
(20183, 57479, 25, 'Swamplord Musel''ek (Heroic) - Technique: Scroll of Nature Resistance VI');

-- Holy Resistance VI - Heroic Auchenai Crypts
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(20306, 57484, 25, 'Exarch Maladaar (Heroic) - Technique: Scroll of Holy Resistance VI'),
(20303, 57484, 25, 'Avatar of the Martyred (Heroic) - Technique: Scroll of Holy Resistance VI');

-- =====================================================
-- RANK VIII RECIPE ITEMS (WotLK Dungeons)
-- =====================================================
-- WotLK Dungeons: Halls of Lightning, Pit of Saron, Oculus, Forge of Souls, Gundrak, Drak'Tharon
-- Skill Req: Fire/Frost 420, Arcane/Shadow 425, Nature/Holy 430
-- Premium Rank (requires Eternal reagent for crafting)

-- Technique: Scroll of Fire Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 57460;

INSERT INTO `item_template` SET
    `entry` = 57460,
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
    `description` = 'Teaches you how to scribe Scroll of Fire Resistance VIII.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Frost Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 57465;

INSERT INTO `item_template` SET
    `entry` = 57465,
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
    `description` = 'Teaches you how to scribe Scroll of Frost Resistance VIII.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Arcane Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 57470;

INSERT INTO `item_template` SET
    `entry` = 57470,
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
    `description` = 'Teaches you how to scribe Scroll of Arcane Resistance VIII.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Shadow Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 57475;

INSERT INTO `item_template` SET
    `entry` = 57475,
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
    `description` = 'Teaches you how to scribe Scroll of Shadow Resistance VIII.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Nature Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 57480;

INSERT INTO `item_template` SET
    `entry` = 57480,
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
    `description` = 'Teaches you how to scribe Scroll of Nature Resistance VIII.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



-- Technique: Scroll of Holy Resistance VIII
DELETE FROM `item_template` WHERE `entry` = 57485;

INSERT INTO `item_template` SET
    `entry` = 57485,
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
    `description` = 'Teaches you how to scribe Scroll of Holy Resistance VIII.',
    `spelltrigger_2` = 6,
    `spellcharges_1` = -1,
    `Flags` = 64;



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

-- Clean up existing entries for Rank VIII recipes (normal + heroic)
DELETE FROM `creature_loot_template` WHERE `Item` IN (57460, 57465, 57470, 57475, 57480, 57485);

-- Fire Resistance VIII - Halls of Lightning
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(28923, 57460, 15, 'Loken - Technique: Scroll of Fire Resistance VIII'),
(28586, 57460, 15, 'General Bjarngrim - Technique: Scroll of Fire Resistance VIII');

-- Frost Resistance VIII - Pit of Saron
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(36658, 57465, 15, 'Scourgelord Tyrannus - Technique: Scroll of Frost Resistance VIII'),
(36494, 57465, 15, 'Forgemaster Garfrost - Technique: Scroll of Frost Resistance VIII');

-- Arcane Resistance VIII - Oculus
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(27656, 57470, 15, 'Ley-Guardian Eregos - Technique: Scroll of Arcane Resistance VIII'),
(27655, 57470, 15, 'Mage-Lord Urom - Technique: Scroll of Arcane Resistance VIII');

-- Shadow Resistance VIII - Forge of Souls
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(36502, 57475, 15, 'Devourer of Souls - Technique: Scroll of Shadow Resistance VIII'),
(36497, 57475, 15, 'Bronjahm - Technique: Scroll of Shadow Resistance VIII');

-- Nature Resistance VIII - Gundrak
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(29306, 57480, 15, 'Gal''darah - Technique: Scroll of Nature Resistance VIII'),
(29304, 57480, 15, 'Slad''ran - Technique: Scroll of Nature Resistance VIII');

-- Holy Resistance VIII - Drak'Tharon / Halls of Stone
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(26632, 57485, 15, 'The Prophet Tharon''ja - Technique: Scroll of Holy Resistance VIII'),
(27978, 57485, 15, 'Sjonnir the Ironshaper - Technique: Scroll of Holy Resistance VIII');

-- =====================================================
-- RANK VIII HEROIC MODE DROPS (25% drop rate)
-- =====================================================
-- WotLK Heroic dungeons use difficulty_entry_1 creatures with separate loot tables

-- Fire Resistance VIII - Heroic Halls of Lightning
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(31538, 57460, 25, 'Loken (Heroic) - Technique: Scroll of Fire Resistance VIII'),
(31533, 57460, 25, 'General Bjarngrim (Heroic) - Technique: Scroll of Fire Resistance VIII');

-- Frost Resistance VIII - Heroic Pit of Saron
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(36938, 57465, 25, 'Scourgelord Tyrannus (Heroic) - Technique: Scroll of Frost Resistance VIII'),
(37613, 57465, 25, 'Forgemaster Garfrost (Heroic) - Technique: Scroll of Frost Resistance VIII');

-- Arcane Resistance VIII - Heroic Oculus
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(31561, 57470, 25, 'Ley-Guardian Eregos (Heroic) - Technique: Scroll of Arcane Resistance VIII'),
(31560, 57470, 25, 'Mage-Lord Urom (Heroic) - Technique: Scroll of Arcane Resistance VIII');

-- Shadow Resistance VIII - Heroic Forge of Souls
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(37677, 57475, 25, 'Devourer of Souls (Heroic) - Technique: Scroll of Shadow Resistance VIII'),
(36498, 57475, 25, 'Bronjahm (Heroic) - Technique: Scroll of Shadow Resistance VIII');

-- Nature Resistance VIII - Heroic Gundrak
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(31368, 57480, 25, 'Gal''darah (Heroic) - Technique: Scroll of Nature Resistance VIII'),
(31370, 57480, 25, 'Slad''ran (Heroic) - Technique: Scroll of Nature Resistance VIII');

-- Holy Resistance VIII - Heroic Drak'Tharon / Halls of Stone
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(31360, 57485, 25, 'The Prophet Tharon''ja (Heroic) - Technique: Scroll of Holy Resistance VIII'),
(31386, 57485, 25, 'Sjonnir the Ironshaper (Heroic) - Technique: Scroll of Holy Resistance VIII');
