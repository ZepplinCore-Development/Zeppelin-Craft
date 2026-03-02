-- ============================================================================
-- F-025: T3 Tier Satchels (Naxxramas 40) + Quest System Modification
-- ============================================================================
-- Satchel Items: 59321-59328
-- Artifact Items: 59329-59336
-- Reference IDs: 59510-59581
-- ============================================================================
-- ============================================================================
-- SECTION 1: CREATE SATCHEL ITEMS + BOSS ARTIFACTS
-- ============================================================================
-- Class 15 = Container, Subclass 0 = Bag
-- Class 12 = Quest Item
-- DisplayID 135477 = AO_Chest18 (gold chest icon)
-- Tier Satchels (8 armor slots)
DELETE FROM `item_template` WHERE `entry` BETWEEN 59321 AND 59328;

INSERT INTO `item_template` SET
    `entry` = 59321,
    `class` = 15,
    `name` = 'Naxxramas Armor Cache - Helm',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `Flags` = 4,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59322,
    `class` = 15,
    `name` = 'Naxxramas Armor Cache - Shoulder',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `Flags` = 4,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59323,
    `class` = 15,
    `name` = 'Naxxramas Armor Cache - Chest',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `Flags` = 4,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59324,
    `class` = 15,
    `name` = 'Naxxramas Armor Cache - Legs',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `Flags` = 4,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59325,
    `class` = 15,
    `name` = 'Naxxramas Armor Cache - Boots',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `Flags` = 4,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59326,
    `class` = 15,
    `name` = 'Naxxramas Armor Cache - Bracers',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `Flags` = 4,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59327,
    `class` = 15,
    `name` = 'Naxxramas Armor Cache - Gloves',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `Flags` = 4,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59328,
    `class` = 15,
    `name` = 'Naxxramas Armor Cache - Belt',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `Flags` = 4,
    `bonding` = 1;

-- Boss Artifacts (Quest Tokens for Light's Hope Chapel)
DELETE FROM `item_template` WHERE `entry` BETWEEN 59329 AND 59336;

INSERT INTO `item_template` SET
    `entry` = 59329,
    `class` = 12,
    `name` = 'Thaddius''s Power Core',
    `displayid` = 135999,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59330,
    `class` = 12,
    `name` = 'Grobbulus''s Injection Vial',
    `displayid` = 134437,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59331,
    `class` = 12,
    `name` = 'Kel''Thuzad''s Phylactery Fragment',
    `displayid` = 134229,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59332,
    `class` = 12,
    `name` = 'Loatheb''s Spore Essence',
    `displayid` = 134206,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59333,
    `class` = 12,
    `name` = 'Gothik''s Unholy Sigil',
    `displayid` = 133168,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59334,
    `class` = 12,
    `name` = 'Faerlina''s Webbing',
    `displayid` = 132598,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59335,
    `class` = 12,
    `name` = 'Maexxna''s Fang',
    `displayid` = 135993,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59336,
    `class` = 12,
    `name` = 'Heigan''s Plague Vial',
    `displayid` = 134799,
    `Quality` = 4,
    `ItemLevel` = 92,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

-- ============================================================================
-- SECTION 2: ITEM LOOT TEMPLATE (Satchel Contents)
-- ============================================================================
-- Each satchel references 9 class-specific loot entries
-- GroupId MUST match in reference_loot_template (critical requirement)
DELETE FROM `item_loot_template` WHERE `Entry` BETWEEN 59321 AND 59328;

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 1,
    `Reference` = 59510,
    `GroupId` = 1,
    `Comment` = 'T3 Helm - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 2,
    `Reference` = 59511,
    `GroupId` = 2,
    `Comment` = 'T3 Helm - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 3,
    `Reference` = 59512,
    `GroupId` = 3,
    `Comment` = 'T3 Helm - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 4,
    `Reference` = 59513,
    `GroupId` = 4,
    `Comment` = 'T3 Helm - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 5,
    `Reference` = 59514,
    `GroupId` = 5,
    `Comment` = 'T3 Helm - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 6,
    `Reference` = 59515,
    `GroupId` = 6,
    `Comment` = 'T3 Helm - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 7,
    `Reference` = 59516,
    `GroupId` = 7,
    `Comment` = 'T3 Helm - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 8,
    `Reference` = 59517,
    `GroupId` = 8,
    `Comment` = 'T3 Helm - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59321,
    `Item` = 9,
    `Reference` = 59518,
    `GroupId` = 9,
    `Comment` = 'T3 Helm - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 1,
    `Reference` = 59519,
    `GroupId` = 1,
    `Comment` = 'T3 Shoulder - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 2,
    `Reference` = 59520,
    `GroupId` = 2,
    `Comment` = 'T3 Shoulder - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 3,
    `Reference` = 59521,
    `GroupId` = 3,
    `Comment` = 'T3 Shoulder - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 4,
    `Reference` = 59522,
    `GroupId` = 4,
    `Comment` = 'T3 Shoulder - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 5,
    `Reference` = 59523,
    `GroupId` = 5,
    `Comment` = 'T3 Shoulder - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 6,
    `Reference` = 59524,
    `GroupId` = 6,
    `Comment` = 'T3 Shoulder - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 7,
    `Reference` = 59525,
    `GroupId` = 7,
    `Comment` = 'T3 Shoulder - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 8,
    `Reference` = 59526,
    `GroupId` = 8,
    `Comment` = 'T3 Shoulder - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59322,
    `Item` = 9,
    `Reference` = 59527,
    `GroupId` = 9,
    `Comment` = 'T3 Shoulder - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 1,
    `Reference` = 59528,
    `GroupId` = 1,
    `Comment` = 'T3 Chest - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 2,
    `Reference` = 59529,
    `GroupId` = 2,
    `Comment` = 'T3 Chest - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 3,
    `Reference` = 59530,
    `GroupId` = 3,
    `Comment` = 'T3 Chest - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 4,
    `Reference` = 59531,
    `GroupId` = 4,
    `Comment` = 'T3 Chest - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 5,
    `Reference` = 59532,
    `GroupId` = 5,
    `Comment` = 'T3 Chest - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 6,
    `Reference` = 59533,
    `GroupId` = 6,
    `Comment` = 'T3 Chest - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 7,
    `Reference` = 59534,
    `GroupId` = 7,
    `Comment` = 'T3 Chest - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 8,
    `Reference` = 59535,
    `GroupId` = 8,
    `Comment` = 'T3 Chest - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59323,
    `Item` = 9,
    `Reference` = 59536,
    `GroupId` = 9,
    `Comment` = 'T3 Chest - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 1,
    `Reference` = 59537,
    `GroupId` = 1,
    `Comment` = 'T3 Legs - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 2,
    `Reference` = 59538,
    `GroupId` = 2,
    `Comment` = 'T3 Legs - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 3,
    `Reference` = 59539,
    `GroupId` = 3,
    `Comment` = 'T3 Legs - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 4,
    `Reference` = 59540,
    `GroupId` = 4,
    `Comment` = 'T3 Legs - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 5,
    `Reference` = 59541,
    `GroupId` = 5,
    `Comment` = 'T3 Legs - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 6,
    `Reference` = 59542,
    `GroupId` = 6,
    `Comment` = 'T3 Legs - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 7,
    `Reference` = 59543,
    `GroupId` = 7,
    `Comment` = 'T3 Legs - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 8,
    `Reference` = 59544,
    `GroupId` = 8,
    `Comment` = 'T3 Legs - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59324,
    `Item` = 9,
    `Reference` = 59545,
    `GroupId` = 9,
    `Comment` = 'T3 Legs - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 1,
    `Reference` = 59546,
    `GroupId` = 1,
    `Comment` = 'T3 Boots - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 2,
    `Reference` = 59547,
    `GroupId` = 2,
    `Comment` = 'T3 Boots - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 3,
    `Reference` = 59548,
    `GroupId` = 3,
    `Comment` = 'T3 Boots - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 4,
    `Reference` = 59549,
    `GroupId` = 4,
    `Comment` = 'T3 Boots - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 5,
    `Reference` = 59550,
    `GroupId` = 5,
    `Comment` = 'T3 Boots - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 6,
    `Reference` = 59551,
    `GroupId` = 6,
    `Comment` = 'T3 Boots - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 7,
    `Reference` = 59552,
    `GroupId` = 7,
    `Comment` = 'T3 Boots - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 8,
    `Reference` = 59553,
    `GroupId` = 8,
    `Comment` = 'T3 Boots - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59325,
    `Item` = 9,
    `Reference` = 59554,
    `GroupId` = 9,
    `Comment` = 'T3 Boots - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 1,
    `Reference` = 59555,
    `GroupId` = 1,
    `Comment` = 'T3 Bracers - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 2,
    `Reference` = 59556,
    `GroupId` = 2,
    `Comment` = 'T3 Bracers - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 3,
    `Reference` = 59557,
    `GroupId` = 3,
    `Comment` = 'T3 Bracers - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 4,
    `Reference` = 59558,
    `GroupId` = 4,
    `Comment` = 'T3 Bracers - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 5,
    `Reference` = 59559,
    `GroupId` = 5,
    `Comment` = 'T3 Bracers - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 6,
    `Reference` = 59560,
    `GroupId` = 6,
    `Comment` = 'T3 Bracers - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 7,
    `Reference` = 59561,
    `GroupId` = 7,
    `Comment` = 'T3 Bracers - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 8,
    `Reference` = 59562,
    `GroupId` = 8,
    `Comment` = 'T3 Bracers - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59326,
    `Item` = 9,
    `Reference` = 59563,
    `GroupId` = 9,
    `Comment` = 'T3 Bracers - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 1,
    `Reference` = 59564,
    `GroupId` = 1,
    `Comment` = 'T3 Gloves - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 2,
    `Reference` = 59565,
    `GroupId` = 2,
    `Comment` = 'T3 Gloves - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 3,
    `Reference` = 59566,
    `GroupId` = 3,
    `Comment` = 'T3 Gloves - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 4,
    `Reference` = 59567,
    `GroupId` = 4,
    `Comment` = 'T3 Gloves - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 5,
    `Reference` = 59568,
    `GroupId` = 5,
    `Comment` = 'T3 Gloves - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 6,
    `Reference` = 59569,
    `GroupId` = 6,
    `Comment` = 'T3 Gloves - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 7,
    `Reference` = 59570,
    `GroupId` = 7,
    `Comment` = 'T3 Gloves - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 8,
    `Reference` = 59571,
    `GroupId` = 8,
    `Comment` = 'T3 Gloves - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59327,
    `Item` = 9,
    `Reference` = 59572,
    `GroupId` = 9,
    `Comment` = 'T3 Gloves - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 1,
    `Reference` = 59573,
    `GroupId` = 1,
    `Comment` = 'T3 Belt - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 2,
    `Reference` = 59574,
    `GroupId` = 2,
    `Comment` = 'T3 Belt - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 3,
    `Reference` = 59575,
    `GroupId` = 3,
    `Comment` = 'T3 Belt - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 4,
    `Reference` = 59576,
    `GroupId` = 4,
    `Comment` = 'T3 Belt - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 5,
    `Reference` = 59577,
    `GroupId` = 5,
    `Comment` = 'T3 Belt - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 6,
    `Reference` = 59578,
    `GroupId` = 6,
    `Comment` = 'T3 Belt - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 7,
    `Reference` = 59579,
    `GroupId` = 7,
    `Comment` = 'T3 Belt - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 8,
    `Reference` = 59580,
    `GroupId` = 8,
    `Comment` = 'T3 Belt - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59328,
    `Item` = 9,
    `Reference` = 59581,
    `GroupId` = 9,
    `Comment` = 'T3 Belt - Druid ref';

-- ============================================================================
-- SECTION 3: REFERENCE LOOT TEMPLATE (Class-specific items)
-- ============================================================================
-- GroupId MUST match parent GroupId in item_loot_template
DELETE FROM `reference_loot_template` WHERE `Entry` BETWEEN 59510 AND 59581;

INSERT INTO `reference_loot_template` SET
    `Entry` = 59510,
    `Item` = 22418,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T3 Helm - Warrior: Dreadnaught Helmet';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59511,
    `Item` = 22428,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T3 Helm - Paladin: Redemption Headpiece';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59512,
    `Item` = 22438,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T3 Helm - Hunter: Cryptstalker Headpiece';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59513,
    `Item` = 22478,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T3 Helm - Rogue: Bonescythe Helmet';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59514,
    `Item` = 22514,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T3 Helm - Priest: Circlet of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59515,
    `Item` = 22466,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T3 Helm - Shaman: Earthshatter Headpiece';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59516,
    `Item` = 22498,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T3 Helm - Mage: Frostfire Circlet';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59517,
    `Item` = 22506,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T3 Helm - Warlock: Plagueheart Circlet';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59518,
    `Item` = 22490,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T3 Helm - Druid: Dreamwalker Headpiece';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59519,
    `Item` = 22419,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T3 Shoulder - Warrior: Dreadnaught Pauldrons';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59520,
    `Item` = 22429,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T3 Shoulder - Paladin: Redemption Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59521,
    `Item` = 22439,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T3 Shoulder - Hunter: Cryptstalker Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59522,
    `Item` = 22479,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T3 Shoulder - Rogue: Bonescythe Pauldrons';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59523,
    `Item` = 22515,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T3 Shoulder - Priest: Shoulderpads of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59524,
    `Item` = 22467,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T3 Shoulder - Shaman: Earthshatter Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59525,
    `Item` = 22499,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T3 Shoulder - Mage: Frostfire Shoulderpads';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59526,
    `Item` = 22507,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T3 Shoulder - Warlock: Plagueheart Shoulderpads';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59527,
    `Item` = 22491,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T3 Shoulder - Druid: Dreamwalker Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59528,
    `Item` = 22416,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T3 Chest - Warrior: Dreadnaught Breastplate';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59529,
    `Item` = 22425,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T3 Chest - Paladin: Redemption Tunic';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59530,
    `Item` = 22436,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T3 Chest - Hunter: Cryptstalker Tunic';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59531,
    `Item` = 22476,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T3 Chest - Rogue: Bonescythe Breastplate';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59532,
    `Item` = 22512,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T3 Chest - Priest: Robe of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59533,
    `Item` = 22464,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T3 Chest - Shaman: Earthshatter Tunic';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59534,
    `Item` = 22496,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T3 Chest - Mage: Frostfire Robe';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59535,
    `Item` = 22504,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T3 Chest - Warlock: Plagueheart Robe';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59536,
    `Item` = 22488,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T3 Chest - Druid: Dreamwalker Tunic';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59537,
    `Item` = 22417,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T3 Legs - Warrior: Dreadnaught Legplates';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59538,
    `Item` = 22427,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T3 Legs - Paladin: Redemption Legguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59539,
    `Item` = 22437,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T3 Legs - Hunter: Cryptstalker Legguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59540,
    `Item` = 22477,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T3 Legs - Rogue: Bonescythe Legplates';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59541,
    `Item` = 22513,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T3 Legs - Priest: Leggings of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59542,
    `Item` = 22465,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T3 Legs - Shaman: Earthshatter Legguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59543,
    `Item` = 22497,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T3 Legs - Mage: Frostfire Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59544,
    `Item` = 22505,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T3 Legs - Warlock: Plagueheart Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59545,
    `Item` = 22489,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T3 Legs - Druid: Dreamwalker Legguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59546,
    `Item` = 22420,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T3 Boots - Warrior: Dreadnaught Sabatons';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59547,
    `Item` = 22430,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T3 Boots - Paladin: Redemption Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59548,
    `Item` = 22440,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T3 Boots - Hunter: Cryptstalker Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59549,
    `Item` = 22480,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T3 Boots - Rogue: Bonescythe Sabatons';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59550,
    `Item` = 22516,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T3 Boots - Priest: Sandals of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59551,
    `Item` = 22468,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T3 Boots - Shaman: Earthshatter Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59552,
    `Item` = 22500,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T3 Boots - Mage: Frostfire Sandals';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59553,
    `Item` = 22508,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T3 Boots - Warlock: Plagueheart Sandals';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59554,
    `Item` = 22492,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T3 Boots - Druid: Dreamwalker Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59555,
    `Item` = 22423,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T3 Bracers - Warrior: Dreadnaught Bracers';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59556,
    `Item` = 22424,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T3 Bracers - Paladin: Redemption Wristguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59557,
    `Item` = 22443,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T3 Bracers - Hunter: Cryptstalker Wristguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59558,
    `Item` = 22483,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T3 Bracers - Rogue: Bonescythe Bracers';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59559,
    `Item` = 22519,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T3 Bracers - Priest: Bindings of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59560,
    `Item` = 22471,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T3 Bracers - Shaman: Earthshatter Wristguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59561,
    `Item` = 22503,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T3 Bracers - Mage: Frostfire Bindings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59562,
    `Item` = 22511,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T3 Bracers - Warlock: Plagueheart Bindings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59563,
    `Item` = 22495,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T3 Bracers - Druid: Dreamwalker Wristguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59564,
    `Item` = 22421,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T3 Gloves - Warrior: Dreadnaught Gauntlets';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59565,
    `Item` = 22426,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T3 Gloves - Paladin: Redemption Handguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59566,
    `Item` = 22441,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T3 Gloves - Hunter: Cryptstalker Handguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59567,
    `Item` = 22481,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T3 Gloves - Rogue: Bonescythe Gauntlets';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59568,
    `Item` = 22517,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T3 Gloves - Priest: Gloves of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59569,
    `Item` = 22469,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T3 Gloves - Shaman: Earthshatter Handguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59570,
    `Item` = 22501,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T3 Gloves - Mage: Frostfire Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59571,
    `Item` = 22509,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T3 Gloves - Warlock: Plagueheart Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59572,
    `Item` = 22493,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T3 Gloves - Druid: Dreamwalker Handguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59573,
    `Item` = 22422,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T3 Belt - Warrior: Dreadnaught Waistguard';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59574,
    `Item` = 22431,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T3 Belt - Paladin: Redemption Girdle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59575,
    `Item` = 22442,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T3 Belt - Hunter: Cryptstalker Girdle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59576,
    `Item` = 22482,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T3 Belt - Rogue: Bonescythe Waistguard';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59577,
    `Item` = 22518,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T3 Belt - Priest: Belt of Faith';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59578,
    `Item` = 22470,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T3 Belt - Shaman: Earthshatter Girdle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59579,
    `Item` = 22502,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T3 Belt - Mage: Frostfire Belt';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59580,
    `Item` = 22510,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T3 Belt - Warlock: Plagueheart Belt';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59581,
    `Item` = 22494,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T3 Belt - Druid: Dreamwalker Girdle';

-- ============================================================================
-- SECTION 4: CONDITIONS (Class Filtering)
-- ============================================================================
-- SourceType 10 = Reference Loot
-- ConditionType 15 = Class Check
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` BETWEEN 59510 AND 59581;

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59510,
    `SourceEntry` = 22418,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T3 Helm - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59511,
    `SourceEntry` = 22428,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T3 Helm - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59512,
    `SourceEntry` = 22438,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T3 Helm - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59513,
    `SourceEntry` = 22478,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T3 Helm - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59514,
    `SourceEntry` = 22514,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T3 Helm - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59515,
    `SourceEntry` = 22466,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T3 Helm - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59516,
    `SourceEntry` = 22498,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T3 Helm - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59517,
    `SourceEntry` = 22506,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T3 Helm - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59518,
    `SourceEntry` = 22490,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T3 Helm - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59519,
    `SourceEntry` = 22419,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T3 Shoulder - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59520,
    `SourceEntry` = 22429,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T3 Shoulder - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59521,
    `SourceEntry` = 22439,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T3 Shoulder - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59522,
    `SourceEntry` = 22479,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T3 Shoulder - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59523,
    `SourceEntry` = 22515,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T3 Shoulder - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59524,
    `SourceEntry` = 22467,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T3 Shoulder - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59525,
    `SourceEntry` = 22499,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T3 Shoulder - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59526,
    `SourceEntry` = 22507,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T3 Shoulder - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59527,
    `SourceEntry` = 22491,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T3 Shoulder - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59528,
    `SourceEntry` = 22416,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T3 Chest - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59529,
    `SourceEntry` = 22425,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T3 Chest - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59530,
    `SourceEntry` = 22436,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T3 Chest - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59531,
    `SourceEntry` = 22476,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T3 Chest - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59532,
    `SourceEntry` = 22512,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T3 Chest - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59533,
    `SourceEntry` = 22464,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T3 Chest - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59534,
    `SourceEntry` = 22496,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T3 Chest - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59535,
    `SourceEntry` = 22504,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T3 Chest - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59536,
    `SourceEntry` = 22488,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T3 Chest - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59537,
    `SourceEntry` = 22417,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T3 Legs - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59538,
    `SourceEntry` = 22427,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T3 Legs - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59539,
    `SourceEntry` = 22437,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T3 Legs - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59540,
    `SourceEntry` = 22477,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T3 Legs - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59541,
    `SourceEntry` = 22513,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T3 Legs - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59542,
    `SourceEntry` = 22465,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T3 Legs - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59543,
    `SourceEntry` = 22497,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T3 Legs - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59544,
    `SourceEntry` = 22505,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T3 Legs - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59545,
    `SourceEntry` = 22489,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T3 Legs - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59546,
    `SourceEntry` = 22420,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T3 Boots - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59547,
    `SourceEntry` = 22430,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T3 Boots - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59548,
    `SourceEntry` = 22440,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T3 Boots - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59549,
    `SourceEntry` = 22480,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T3 Boots - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59550,
    `SourceEntry` = 22516,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T3 Boots - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59551,
    `SourceEntry` = 22468,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T3 Boots - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59552,
    `SourceEntry` = 22500,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T3 Boots - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59553,
    `SourceEntry` = 22508,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T3 Boots - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59554,
    `SourceEntry` = 22492,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T3 Boots - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59555,
    `SourceEntry` = 22423,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T3 Bracers - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59556,
    `SourceEntry` = 22424,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T3 Bracers - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59557,
    `SourceEntry` = 22443,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T3 Bracers - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59558,
    `SourceEntry` = 22483,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T3 Bracers - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59559,
    `SourceEntry` = 22519,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T3 Bracers - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59560,
    `SourceEntry` = 22471,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T3 Bracers - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59561,
    `SourceEntry` = 22503,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T3 Bracers - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59562,
    `SourceEntry` = 22511,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T3 Bracers - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59563,
    `SourceEntry` = 22495,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T3 Bracers - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59564,
    `SourceEntry` = 22421,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T3 Gloves - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59565,
    `SourceEntry` = 22426,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T3 Gloves - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59566,
    `SourceEntry` = 22441,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T3 Gloves - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59567,
    `SourceEntry` = 22481,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T3 Gloves - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59568,
    `SourceEntry` = 22517,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T3 Gloves - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59569,
    `SourceEntry` = 22469,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T3 Gloves - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59570,
    `SourceEntry` = 22501,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T3 Gloves - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59571,
    `SourceEntry` = 22509,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T3 Gloves - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59572,
    `SourceEntry` = 22493,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T3 Gloves - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59573,
    `SourceEntry` = 22422,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T3 Belt - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59574,
    `SourceEntry` = 22431,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T3 Belt - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59575,
    `SourceEntry` = 22442,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T3 Belt - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59576,
    `SourceEntry` = 22482,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T3 Belt - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59577,
    `SourceEntry` = 22518,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T3 Belt - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59578,
    `SourceEntry` = 22470,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T3 Belt - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59579,
    `SourceEntry` = 22502,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T3 Belt - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59580,
    `SourceEntry` = 22510,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T3 Belt - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59581,
    `SourceEntry` = 22494,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T3 Belt - Druid';

-- ============================================================================
-- SECTION 5: BOSS LOOT MODIFICATIONS
-- ============================================================================
-- Replace Desecrated token drops with satchels and boss artifacts
-- Custom Naxx40 boss entries: 351xxx

-- Cleanup: Remove all satchel/artifact items and references first for idempotency
DELETE FROM `creature_loot_template` WHERE `Item` BETWEEN 59321 AND 59336;
DELETE FROM `creature_loot_template` WHERE `Item` BETWEEN 59510 AND 59581;

-- Thaddius (351000) - Helm Cache + Power Core
DELETE FROM `creature_loot_template` WHERE `Entry` = 351000 AND `Item` IN (22360);

INSERT INTO `creature_loot_template` SET
    `Entry` = 351000,
    `Item` = 59321,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = 'Thaddius - Naxxramas Armor Cache - Helm (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351000,
    `Item` = 59329,
    `Comment` = 'Thaddius - Thaddius''s Power Core (F-025)';

-- Grobbulus (351003) + Patchwerk (351028) - Shoulder Cache + Injection Vial
DELETE FROM `creature_loot_template` WHERE `Entry` IN (351003, 351028) AND `Item` IN (22361, 59322, 59330);

INSERT INTO `creature_loot_template` SET
    `Entry` = 351003,
    `Item` = 59322,
    `Comment` = 'Grobbulus - Naxxramas Armor Cache - Shoulder (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351003,
    `Item` = 59330,
    `Comment` = 'Grobbulus - Grobbulus''s Injection Vial (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351028,
    `Item` = 59322,
    `Comment` = 'Patchwerk - Naxxramas Armor Cache - Shoulder (F-025)';

-- Kel'Thuzad (351019) - Chest Cache + Phylactery Fragment
DELETE FROM `creature_loot_template` WHERE `Entry` = 351019 AND `Item` IN (22350, 59323, 59331);

INSERT INTO `creature_loot_template` SET
    `Entry` = 351019,
    `Item` = 59323,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = '"KelThuzad - Naxxramas Armor Cache - Chest (F-025)"';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351019,
    `Item` = 59331,
    `Comment` = '"KelThuzad - KelThuzads Phylactery Fragment (F-025)"';

-- Loatheb (351020) - Legs Cache + Spore Essence
DELETE FROM `creature_loot_template` WHERE `Entry` = 351020 AND `Item` IN (22359, 59324, 59332);

INSERT INTO `creature_loot_template` SET
    `Entry` = 351020,
    `Item` = 59324,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = 'Loatheb - Naxxramas Armor Cache - Legs (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351020,
    `Item` = 59332,
    `Comment` = '"Loatheb - Loathebs Spore Essence (F-025)"';

-- Gothik (351035) + Razuvious (351036) - Boots Cache + Unholy Sigil
DELETE FROM `creature_loot_template` WHERE `Entry` IN (351035, 351036) AND `Item` IN (22365, 59325, 59333);

INSERT INTO `creature_loot_template` SET
    `Entry` = 351035,
    `Item` = 59325,
    `Comment` = 'Gothik the Harvester - Naxxramas Armor Cache - Boots (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351035,
    `Item` = 59333,
    `Comment` = '"Gothik the Harvester - Gothiks Unholy Sigil (F-025)"';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351036,
    `Item` = 59325,
    `Comment` = 'Instructor Razuvious - Naxxramas Armor Cache - Boots (F-025)';

-- Faerlina (351007) + Anub'Rekhan (351009) - Bracers Cache + Webbing
DELETE FROM `creature_loot_template` WHERE `Entry` IN (351007, 351009) AND `Item` IN (22362, 59326, 59334);

INSERT INTO `creature_loot_template` SET
    `Entry` = 351007,
    `Item` = 59326,
    `Comment` = 'Grand Widow Faerlina - Naxxramas Armor Cache - Bracers (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351007,
    `Item` = 59334,
    `Comment` = '"Grand Widow Faerlina - Faerlinas Webbing (F-025)"';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351009,
    `Item` = 59326,
    `Comment` = '"AnubRekhan - Naxxramas Armor Cache - Bracers (F-025)"';

-- Maexxna (351006) - Gloves Cache + Fang
DELETE FROM `creature_loot_template` WHERE `Entry` = 351006 AND `Item` IN (22364, 59327, 59335);

INSERT INTO `creature_loot_template` SET
    `Entry` = 351006,
    `Item` = 59327,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = '"Maexxna - Naxxramas Armor Cache - Gloves (F-025)"';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351006,
    `Item` = 59335,
    `Comment` = '"Maexxna - Maexxnas Fang (F-025)"';

-- Heigan (351005) + Noth (351008) - Belt Cache + Plague Vial
DELETE FROM `creature_loot_template` WHERE `Entry` IN (351005, 351008) AND `Item` IN (22363, 59328, 59336);

INSERT INTO `creature_loot_template` SET
    `Entry` = 351005,
    `Item` = 59328,
    `Comment` = 'Heigan the Unclean - Naxxramas Armor Cache - Belt (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351005,
    `Item` = 59336,
    `Comment` = '"Heigan the Unclean - Heigans Plague Vial (F-025)"';

INSERT INTO `creature_loot_template` SET
    `Entry` = 351008,
    `Item` = 59328,
    `Comment` = 'Noth the Plaguebringer - Naxxramas Armor Cache - Belt (F-025)';

-- ============================================================================
-- SECTION 6: QUEST MODIFICATIONS (Light's Hope Chapel)
-- ============================================================================
-- Replace Desecrated tokens with Boss Artifacts in quest requirements
-- Remove all material requirements (Wartorn Scraps, Arcanite Bars, etc.)
-- Quest rewards changed from tier gear to gold/rep (artifact-only turn-in)
-- Helm Quests (all classes) - Artifact-only: 59329 (Thaddius's Power Core)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59329, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 500000, `RewardItem1` = 0, `RewardAmount1` = 0
WHERE `ID` IN (9037, 9045, 9056, 9070, 9079, 9088, 9097, 9105, 9113);

-- Shoulder Quests (all classes) - Artifact-only: 59330 (Grobbulus's Injection Vial)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59330, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 400000, `RewardItem1` = 0, `RewardAmount1` = 0
WHERE `ID` IN (9038, 9046, 9057, 9071, 9080, 9089, 9098, 9106, 9114);

-- Quest 9071 (Earthshatter Spaulders): Clear leftover stock RewardItem2
UPDATE `quest_template` SET `RewardItem2` = 0, `RewardAmount2` = 0 WHERE `ID` = 9071;

-- Chest Quests (all classes) - Artifact-only: 59331 (Kel'Thuzad's Phylactery Fragment)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59331, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 600000, `RewardItem1` = 0, `RewardAmount1` = 0
WHERE `ID` IN (9034, 9043, 9054, 9068, 9077, 9086, 9095, 9103, 9111);

-- Legs Quests (all classes) - Artifact-only: 59332 (Loatheb's Spore Essence)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59332, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 500000, `RewardItem1` = 0, `RewardAmount1` = 0
WHERE `ID` IN (9036, 9044, 9055, 9069, 9078, 9087, 9096, 9104, 9112);

-- Boots Quests (all classes) - Artifact-only: 59333 (Gothik's Unholy Sigil)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59333, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 400000, `RewardItem1` = 0, `RewardAmount1` = 0
WHERE `ID` IN (9039, 9047, 9058, 9072, 9081, 9090, 9099, 9107, 9115);

-- Bracers Quests (all classes) - Artifact-only: 59334 (Faerlina's Webbing)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59334, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 300000, `RewardItem1` = 0, `RewardAmount1` = 0
WHERE `ID` IN (9042, 9050, 9061, 9075, 9084, 9093, 9102, 9110, 9118);

-- Gloves Quests (all classes) - Artifact-only: 59335 (Maexxna's Fang)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59335, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 400000, `RewardItem1` = 0, `RewardAmount1` = 0
WHERE `ID` IN (9040, 9048, 9059, 9073, 9082, 9091, 9100, 9108, 9116);

-- Belt Quests (all classes) - Artifact-only: 59336 (Heigan's Plague Vial)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59336, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 300000, `RewardItem1` = 0, `RewardAmount1` = 0
WHERE `ID` IN (9041, 9049, 9060, 9074, 9083, 9092, 9101, 9109, 9117);

-- ============================================================================
-- SECTION 7: WARTORN SCRAP DAILY QUESTS
-- ============================================================================
-- Create rotating daily quest pool for Wartorn Scrap turn-ins
-- Quest IDs: 100010-100013
-- Pool offers 1 random quest per day
DELETE FROM `quest_template` WHERE `ID` BETWEEN 100010 AND 100013;

INSERT INTO `quest_template` SET
    `ID` = 100010,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = 3456,
    `QuestInfoID` = 62,
    `Flags` = 4096,
    `RewardMoney` = 200000,
    `RewardFactionID1` = 529,
    `RewardFactionValue1` = 5,
    `RequiredItemId1` = 22375,
    `RequiredItemCount1` = 20,
    `LogTitle` = 'Remnants of the Scourge - Plate',
    `LogDescription` = 'Bring 20 Wartorn Plate Scraps to Korfax at Lights Hope Chapel.',
    `QuestDescription` = 'The Scourge war machine leaves behind fragments of armor from fallen knights and paladins. These scraps serve as grim reminders of the battles fought in Naxxramas.$B$BBring me any Wartorn Plate Scraps you recover',
    `QuestCompletionLog` = 'Return to Korfax at Lights Hope Chapel in Eastern Plaguelands.';

INSERT INTO `quest_template` SET
    `ID` = 100011,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = 3456,
    `QuestInfoID` = 62,
    `Flags` = 4096,
    `RewardMoney` = 200000,
    `RewardFactionID1` = 529,
    `RewardFactionValue1` = 5,
    `RequiredItemId1` = 22374,
    `RequiredItemCount1` = 20,
    `LogTitle` = 'Remnants of the Scourge - Chain',
    `LogDescription` = 'Bring 20 Wartorn Chain Scraps to Korfax at Lights Hope Chapel.',
    `QuestDescription` = 'The Scourge war machine leaves behind fragments of armor from fallen rogues and shaman. These scraps serve as grim reminders of the battles fought in Naxxramas.$B$BBring me any Wartorn Chain Scraps you recover',
    `QuestCompletionLog` = 'Return to Korfax at Lights Hope Chapel in Eastern Plaguelands.';

INSERT INTO `quest_template` SET
    `ID` = 100012,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = 3456,
    `QuestInfoID` = 62,
    `Flags` = 4096,
    `RewardMoney` = 200000,
    `RewardFactionID1` = 529,
    `RewardFactionValue1` = 5,
    `RequiredItemId1` = 22373,
    `RequiredItemCount1` = 20,
    `LogTitle` = 'Remnants of the Scourge - Leather',
    `LogDescription` = 'Bring 20 Wartorn Leather Scraps to Korfax at Lights Hope Chapel.',
    `QuestDescription` = 'The Scourge war machine leaves behind fragments of armor from fallen hunters and druids. These scraps serve as grim reminders of the battles fought in Naxxramas.$B$BBring me any Wartorn Leather Scraps you recover',
    `QuestCompletionLog` = 'Return to Korfax at Lights Hope Chapel in Eastern Plaguelands.';

INSERT INTO `quest_template` SET
    `ID` = 100013,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = 3456,
    `QuestInfoID` = 62,
    `Flags` = 4096,
    `RewardMoney` = 200000,
    `RewardFactionID1` = 529,
    `RewardFactionValue1` = 5,
    `RequiredItemId1` = 22376,
    `RequiredItemCount1` = 20,
    `LogTitle` = 'Remnants of the Scourge - Cloth',
    `LogDescription` = 'Bring 20 Wartorn Cloth Scraps to Korfax at Lights Hope Chapel.',
    `QuestDescription` = 'The Scourge war machine leaves behind fragments of armor from fallen mages',
    `QuestCompletionLog` = 'Return to Korfax at Lights Hope Chapel in Eastern Plaguelands.';

-- Mark quests as daily repeatable
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 100010 AND 100013;

INSERT INTO `quest_template_addon` SET
    `ID` = 100010,
    `ExclusiveGroup` = -100010,
    `SpecialFlags` = 1;

INSERT INTO `quest_template_addon` SET
    `ID` = 100011,
    `ExclusiveGroup` = -100010,
    `SpecialFlags` = 1;

INSERT INTO `quest_template_addon` SET
    `ID` = 100012,
    `ExclusiveGroup` = -100010,
    `SpecialFlags` = 1;

INSERT INTO `quest_template_addon` SET
    `ID` = 100013,
    `ExclusiveGroup` = -100010,
    `SpecialFlags` = 1;

-- Add quests to Korfax (16112)
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 100010 AND 100013;

DELETE FROM `creature_questender` WHERE `quest` BETWEEN 100010 AND 100013;

INSERT INTO `creature_queststarter` SET
    `id` = 16112,
    `quest` = 100010;

INSERT INTO `creature_queststarter` SET
    `id` = 16112,
    `quest` = 100011;

INSERT INTO `creature_queststarter` SET
    `id` = 16112,
    `quest` = 100012;

INSERT INTO `creature_queststarter` SET
    `id` = 16112,
    `quest` = 100013;

INSERT INTO `creature_questender` SET
    `id` = 16112,
    `quest` = 100010;

INSERT INTO `creature_questender` SET
    `id` = 16112,
    `quest` = 100011;

INSERT INTO `creature_questender` SET
    `id` = 16112,
    `quest` = 100012;

INSERT INTO `creature_questender` SET
    `id` = 16112,
    `quest` = 100013;

-- Create daily quest pool (offers 1 random quest per day)
DELETE FROM `pool_template` WHERE `entry` = 39010;

INSERT INTO `pool_template` SET
    `entry` = 39010,
    `max_limit` = 1,
    `description` = 'Lights Hope Chapel - Wartorn Scrap Daily Quest Pool (F-025)';

-- Add quests to pool
DELETE FROM `pool_quest` WHERE `pool_entry` = 39010;

INSERT INTO `pool_quest` SET
    `entry` = 100010,
    `pool_entry` = 39010,
    `description` = 'Remnants of the Scourge - Plate';

INSERT INTO `pool_quest` SET
    `entry` = 100011,
    `pool_entry` = 39010,
    `description` = 'Remnants of the Scourge - Chain';

INSERT INTO `pool_quest` SET
    `entry` = 100012,
    `pool_entry` = 39010,
    `description` = 'Remnants of the Scourge - Leather';

INSERT INTO `pool_quest` SET
    `entry` = 100013,
    `pool_entry` = 39010,
    `description` = 'Remnants of the Scourge - Cloth';
