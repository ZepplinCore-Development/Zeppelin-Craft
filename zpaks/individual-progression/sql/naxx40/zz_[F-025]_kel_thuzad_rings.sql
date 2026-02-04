-- ============================================================================
-- F-025: Kel'Thuzad Ring Box (Naxxramas 40)
-- ============================================================================
-- Creates a class-conditional ring box using the satchel architecture.
-- When opened, contains only the ring appropriate for the opener's class.
-- ============================================================================
-- Ring Box Item: 59339
-- Reference IDs: 59602-59610 (9 classes)
-- DisplayID: 139758 (AO_Present01)
-- ============================================================================
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024
-- ============================================================================

-- ============================================================================
-- SECTION 1: CREATE RING BOX ITEM
-- ============================================================================
-- Class 15 = Container, Subclass 0 = Bag
DELETE FROM `item_template` WHERE `entry` = 59339;

INSERT INTO `item_template` SET
    `entry` = 59339,
    `class` = 15,
    `name` = 'Kel''Thuzad''s Ring Box',
    `displayid` = 139758,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `bonding` = 1;

-- ============================================================================
-- SECTION 2: ITEM LOOT TEMPLATE (Ring Box Contents)
-- ============================================================================
-- Each entry references a class-specific ring
-- GroupId MUST match in reference_loot_template (critical requirement)
DELETE FROM `item_loot_template` WHERE `Entry` = 59339;

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 1,
    `Reference` = 59602,
    `GroupId` = 1,
    `Comment` = 'KT Ring - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 2,
    `Reference` = 59603,
    `GroupId` = 2,
    `Comment` = 'KT Ring - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 3,
    `Reference` = 59604,
    `GroupId` = 3,
    `Comment` = 'KT Ring - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 4,
    `Reference` = 59605,
    `GroupId` = 4,
    `Comment` = 'KT Ring - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 5,
    `Reference` = 59606,
    `GroupId` = 5,
    `Comment` = 'KT Ring - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 6,
    `Reference` = 59607,
    `GroupId` = 6,
    `Comment` = 'KT Ring - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 7,
    `Reference` = 59608,
    `GroupId` = 7,
    `Comment` = 'KT Ring - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 8,
    `Reference` = 59609,
    `GroupId` = 8,
    `Comment` = 'KT Ring - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59339,
    `Item` = 9,
    `Reference` = 59610,
    `GroupId` = 9,
    `Comment` = 'KT Ring - Druid ref';

-- ============================================================================
-- SECTION 3: REFERENCE LOOT TEMPLATE (Class-specific rings)
-- ============================================================================
-- GroupId MUST match parent GroupId in item_loot_template
DELETE FROM `reference_loot_template` WHERE `Entry` BETWEEN 59602 AND 59610;

INSERT INTO `reference_loot_template` SET
    `Entry` = 59602,
    `Item` = 23059,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'KT Ring - Warrior: Ring of the Dreadnaught';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59603,
    `Item` = 23066,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'KT Ring - Paladin: Ring of Redemption';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59604,
    `Item` = 23067,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'KT Ring - Hunter: Ring of the Cryptstalker';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59605,
    `Item` = 23060,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'KT Ring - Rogue: Bonescythe Ring';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59606,
    `Item` = 23061,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'KT Ring - Priest: Ring of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59607,
    `Item` = 23065,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'KT Ring - Shaman: Ring of the Earthshatterer';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59608,
    `Item` = 23062,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'KT Ring - Mage: Frostfire Ring';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59609,
    `Item` = 23063,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'KT Ring - Warlock: Plagueheart Ring';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59610,
    `Item` = 23064,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'KT Ring - Druid: Ring of the Dreamwalker';

-- ============================================================================
-- SECTION 4: CONDITIONS (Class Filtering)
-- ============================================================================
-- SourceType 10 = Reference Loot
-- ConditionType 15 = Class Check
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` BETWEEN 59602 AND 59610;

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59602,
    `SourceEntry` = 23059,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'KT Ring - Warrior: Ring of the Dreadnaught';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59603,
    `SourceEntry` = 23066,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'KT Ring - Paladin: Ring of Redemption';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59604,
    `SourceEntry` = 23067,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'KT Ring - Hunter: Ring of the Cryptstalker';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59605,
    `SourceEntry` = 23060,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'KT Ring - Rogue: Bonescythe Ring';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59606,
    `SourceEntry` = 23061,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'KT Ring - Priest: Ring of Faith';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59607,
    `SourceEntry` = 23065,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'KT Ring - Shaman: Ring of the Earthshatterer';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59608,
    `SourceEntry` = 23062,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'KT Ring - Mage: Frostfire Ring';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59609,
    `SourceEntry` = 23063,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'KT Ring - Warlock: Plagueheart Ring';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59610,
    `SourceEntry` = 23064,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'KT Ring - Druid: Ring of the Dreamwalker';

-- ============================================================================
-- SECTION 5: ADD RING BOX TO KEL'THUZAD LOOT
-- ============================================================================
-- Remove old direct ring drops from reference 304710 (if any)
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304710) AND (`Item` IN (23059, 23060, 23061, 23062, 23063, 23064, 23065, 23066, 23067));

-- Add Ring Box to Kel'Thuzad's loot reference
-- Using GroupId 10 to avoid conflicts with existing loot groups
DELETE FROM `reference_loot_template` WHERE `Entry` = 304710 AND `Item` = 59339;
INSERT INTO `reference_loot_template` SET
    `Entry` = 304710,
    `Item` = 59339,
    `Chance` = 100,
    `GroupId` = 10,
    `MinCount` = 1,
    `MaxCount` = 1,
    `Comment` = 'Kel''Thuzad''s Ring Box (class-conditional)';
