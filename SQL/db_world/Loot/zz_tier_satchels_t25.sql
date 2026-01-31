-- ============================================================================
-- F-025: T2.5 Tier Satchels (AQ40) + Token Consolidation
-- ============================================================================
-- Satchel Items: 59314-59318
-- Artifact Items: 59319-59320
-- Reference IDs: 59459-59503
-- ============================================================================
-- ============================================================================
-- SECTION 1: CREATE SATCHEL ITEMS
-- ============================================================================
-- Class 15 = Container, Subclass 0 = Bag
-- DisplayID 135477 = AO_Chest18 (gold chest icon)
DELETE FROM `item_template` WHERE `entry` IN (59314, 59315, 59316, 59317, 59318, 59319, 59320);

INSERT INTO `item_template` SET
    `entry` = 59314,
    `class` = 15,
    `name` = 'Qiraji Armor Cache - Helm',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 88,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59315,
    `class` = 15,
    `name` = 'Qiraji Armor Cache - Shoulder',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 88,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59316,
    `class` = 15,
    `name` = 'Qiraji Armor Cache - Chest',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 88,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59317,
    `class` = 15,
    `name` = 'Qiraji Armor Cache - Legs',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 88,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59318,
    `class` = 15,
    `name` = 'Qiraji Armor Cache - Boots',
    `displayid` = 135477,
    `Quality` = 4,
    `ItemLevel` = 88,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `ContainerSlots` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59319,
    `class` = 12,
    `name` = '"Visciduss Crystalline Heart"',
    `displayid` = 136478,
    `Quality` = 4,
    `ItemLevel` = 88,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

INSERT INTO `item_template` SET
    `entry` = 59320,
    `class` = 12,
    `name` = '"Huhurans Stinger"',
    `displayid` = 137882,
    `Quality` = 4,
    `ItemLevel` = 88,
    `RequiredLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1;

-- ============================================================================
-- SECTION 2: ITEM LOOT TEMPLATE (Satchel Contents)
-- ============================================================================
-- Each satchel references 9 class-specific loot entries
-- GroupId MUST match in reference_loot_template (critical requirement)
DELETE FROM `item_loot_template` WHERE `Entry` IN (59314, 59315, 59316, 59317, 59318);

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 1,
    `Reference` = 59459,
    `GroupId` = 1,
    `Comment` = 'T2.5 Helm - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 2,
    `Reference` = 59460,
    `GroupId` = 2,
    `Comment` = 'T2.5 Helm - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 3,
    `Reference` = 59461,
    `GroupId` = 3,
    `Comment` = 'T2.5 Helm - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 4,
    `Reference` = 59462,
    `GroupId` = 4,
    `Comment` = 'T2.5 Helm - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 5,
    `Reference` = 59463,
    `GroupId` = 5,
    `Comment` = 'T2.5 Helm - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 6,
    `Reference` = 59464,
    `GroupId` = 6,
    `Comment` = 'T2.5 Helm - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 7,
    `Reference` = 59465,
    `GroupId` = 7,
    `Comment` = 'T2.5 Helm - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 8,
    `Reference` = 59466,
    `GroupId` = 8,
    `Comment` = 'T2.5 Helm - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59314,
    `Item` = 9,
    `Reference` = 59467,
    `GroupId` = 9,
    `Comment` = 'T2.5 Helm - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 1,
    `Reference` = 59468,
    `GroupId` = 1,
    `Comment` = 'T2.5 Shoulder - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 2,
    `Reference` = 59469,
    `GroupId` = 2,
    `Comment` = 'T2.5 Shoulder - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 3,
    `Reference` = 59470,
    `GroupId` = 3,
    `Comment` = 'T2.5 Shoulder - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 4,
    `Reference` = 59471,
    `GroupId` = 4,
    `Comment` = 'T2.5 Shoulder - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 5,
    `Reference` = 59472,
    `GroupId` = 5,
    `Comment` = 'T2.5 Shoulder - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 6,
    `Reference` = 59473,
    `GroupId` = 6,
    `Comment` = 'T2.5 Shoulder - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 7,
    `Reference` = 59474,
    `GroupId` = 7,
    `Comment` = 'T2.5 Shoulder - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 8,
    `Reference` = 59475,
    `GroupId` = 8,
    `Comment` = 'T2.5 Shoulder - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59315,
    `Item` = 9,
    `Reference` = 59476,
    `GroupId` = 9,
    `Comment` = 'T2.5 Shoulder - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 1,
    `Reference` = 59477,
    `GroupId` = 1,
    `Comment` = 'T2.5 Chest - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 2,
    `Reference` = 59478,
    `GroupId` = 2,
    `Comment` = 'T2.5 Chest - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 3,
    `Reference` = 59479,
    `GroupId` = 3,
    `Comment` = 'T2.5 Chest - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 4,
    `Reference` = 59480,
    `GroupId` = 4,
    `Comment` = 'T2.5 Chest - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 5,
    `Reference` = 59481,
    `GroupId` = 5,
    `Comment` = 'T2.5 Chest - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 6,
    `Reference` = 59482,
    `GroupId` = 6,
    `Comment` = 'T2.5 Chest - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 7,
    `Reference` = 59483,
    `GroupId` = 7,
    `Comment` = 'T2.5 Chest - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 8,
    `Reference` = 59484,
    `GroupId` = 8,
    `Comment` = 'T2.5 Chest - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59316,
    `Item` = 9,
    `Reference` = 59485,
    `GroupId` = 9,
    `Comment` = 'T2.5 Chest - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 1,
    `Reference` = 59486,
    `GroupId` = 1,
    `Comment` = 'T2.5 Legs - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 2,
    `Reference` = 59487,
    `GroupId` = 2,
    `Comment` = 'T2.5 Legs - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 3,
    `Reference` = 59488,
    `GroupId` = 3,
    `Comment` = 'T2.5 Legs - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 4,
    `Reference` = 59489,
    `GroupId` = 4,
    `Comment` = 'T2.5 Legs - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 5,
    `Reference` = 59490,
    `GroupId` = 5,
    `Comment` = 'T2.5 Legs - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 6,
    `Reference` = 59491,
    `GroupId` = 6,
    `Comment` = 'T2.5 Legs - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 7,
    `Reference` = 59492,
    `GroupId` = 7,
    `Comment` = 'T2.5 Legs - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 8,
    `Reference` = 59493,
    `GroupId` = 8,
    `Comment` = 'T2.5 Legs - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59317,
    `Item` = 9,
    `Reference` = 59494,
    `GroupId` = 9,
    `Comment` = 'T2.5 Legs - Druid ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 1,
    `Reference` = 59495,
    `GroupId` = 1,
    `Comment` = 'T2.5 Boots - Warrior ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 2,
    `Reference` = 59496,
    `GroupId` = 2,
    `Comment` = 'T2.5 Boots - Paladin ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 3,
    `Reference` = 59497,
    `GroupId` = 3,
    `Comment` = 'T2.5 Boots - Hunter ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 4,
    `Reference` = 59498,
    `GroupId` = 4,
    `Comment` = 'T2.5 Boots - Rogue ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 5,
    `Reference` = 59499,
    `GroupId` = 5,
    `Comment` = 'T2.5 Boots - Priest ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 6,
    `Reference` = 59500,
    `GroupId` = 6,
    `Comment` = 'T2.5 Boots - Shaman ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 7,
    `Reference` = 59501,
    `GroupId` = 7,
    `Comment` = 'T2.5 Boots - Mage ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 8,
    `Reference` = 59502,
    `GroupId` = 8,
    `Comment` = 'T2.5 Boots - Warlock ref';

INSERT INTO `item_loot_template` SET
    `Entry` = 59318,
    `Item` = 9,
    `Reference` = 59503,
    `GroupId` = 9,
    `Comment` = 'T2.5 Boots - Druid ref';

-- ============================================================================
-- SECTION 3: REFERENCE LOOT TEMPLATE (Class-specific items)
-- ============================================================================
-- GroupId MUST match parent GroupId in item_loot_template
DELETE FROM `reference_loot_template` WHERE `Entry` BETWEEN 59459 AND 59503;

INSERT INTO `reference_loot_template` SET
    `Entry` = 59459,
    `Item` = 21329,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2.5 Helm - Warrior: Conquerors Crown';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59460,
    `Item` = 21387,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2.5 Helm - Paladin: Avengers Crown';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59461,
    `Item` = 21366,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2.5 Helm - Hunter: Strikers Diadem';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59462,
    `Item` = 21360,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2.5 Helm - Rogue: Deathdealers Helm';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59463,
    `Item` = 21348,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2.5 Helm - Priest: Tiara of the Oracle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59464,
    `Item` = 21372,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2.5 Helm - Shaman: Stormcallers Diadem';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59465,
    `Item` = 21347,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2.5 Helm - Mage: Enigma Circlet';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59466,
    `Item` = 21337,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2.5 Helm - Warlock: Doomcallers Circlet';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59467,
    `Item` = 21353,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2.5 Helm - Druid: Genesis Helm';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59468,
    `Item` = 21330,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2.5 Shoulder - Warrior: Conquerors Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59469,
    `Item` = 21391,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2.5 Shoulder - Paladin: Avengers Pauldrons';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59470,
    `Item` = 21367,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2.5 Shoulder - Hunter: Strikers Pauldrons';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59471,
    `Item` = 21361,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2.5 Shoulder - Rogue: Deathdealers Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59472,
    `Item` = 21350,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2.5 Shoulder - Priest: Mantle of the Oracle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59473,
    `Item` = 21376,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2.5 Shoulder - Shaman: Stormcallers Pauldrons';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59474,
    `Item` = 21345,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2.5 Shoulder - Mage: Enigma Shoulderpads';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59475,
    `Item` = 21335,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2.5 Shoulder - Warlock: Doomcallers Mantle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59476,
    `Item` = 21354,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2.5 Shoulder - Druid: Genesis Shoulderpads';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59477,
    `Item` = 21331,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2.5 Chest - Warrior: Conquerors Breastplate';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59478,
    `Item` = 21389,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2.5 Chest - Paladin: Avengers Breastplate';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59479,
    `Item` = 21370,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2.5 Chest - Hunter: Strikers Hauberk';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59480,
    `Item` = 21364,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2.5 Chest - Rogue: Deathdealers Vest';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59481,
    `Item` = 21351,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2.5 Chest - Priest: Vestments of the Oracle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59482,
    `Item` = 21374,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2.5 Chest - Shaman: Stormcallers Hauberk';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59483,
    `Item` = 21343,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2.5 Chest - Mage: Enigma Robes';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59484,
    `Item` = 21334,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2.5 Chest - Warlock: Doomcallers Robes';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59485,
    `Item` = 21357,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2.5 Chest - Druid: Genesis Vest';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59486,
    `Item` = 21332,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2.5 Legs - Warrior: Conquerors Legguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59487,
    `Item` = 21390,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2.5 Legs - Paladin: Avengers Legguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59488,
    `Item` = 21368,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2.5 Legs - Hunter: Strikers Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59489,
    `Item` = 21362,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2.5 Legs - Rogue: Deathdealers Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59490,
    `Item` = 21352,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2.5 Legs - Priest: Trousers of the Oracle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59491,
    `Item` = 21375,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2.5 Legs - Shaman: Stormcallers Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59492,
    `Item` = 21346,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2.5 Legs - Mage: Enigma Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59493,
    `Item` = 21336,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2.5 Legs - Warlock: Doomcallers Trousers';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59494,
    `Item` = 21356,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2.5 Legs - Druid: Genesis Trousers';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59495,
    `Item` = 21333,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2.5 Boots - Warrior: Conquerors Greaves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59496,
    `Item` = 21388,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2.5 Boots - Paladin: Avengers Greaves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59497,
    `Item` = 21365,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2.5 Boots - Hunter: Strikers Footguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59498,
    `Item` = 21359,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2.5 Boots - Rogue: Deathdealers Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59499,
    `Item` = 21349,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2.5 Boots - Priest: Footwraps of the Oracle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59500,
    `Item` = 21373,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2.5 Boots - Shaman: Stormcallers Footguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59501,
    `Item` = 21344,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2.5 Boots - Mage: Enigma Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59502,
    `Item` = 21338,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2.5 Boots - Warlock: Doomcallers Footwraps';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59503,
    `Item` = 21355,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2.5 Boots - Druid: Genesis Boots';

-- ============================================================================
-- SECTION 4: CONDITIONS (Class filtering)
-- ============================================================================
-- SourceTypeOrReferenceId=10 (Reference Loot), ConditionTypeOrReference=15 (Class)
-- Class masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` BETWEEN 59459 AND 59503;

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59459,
    `SourceEntry` = 21329,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2.5 Helm - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59460,
    `SourceEntry` = 21387,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2.5 Helm - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59461,
    `SourceEntry` = 21366,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2.5 Helm - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59462,
    `SourceEntry` = 21360,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2.5 Helm - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59463,
    `SourceEntry` = 21348,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2.5 Helm - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59464,
    `SourceEntry` = 21372,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2.5 Helm - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59465,
    `SourceEntry` = 21347,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2.5 Helm - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59466,
    `SourceEntry` = 21337,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2.5 Helm - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59467,
    `SourceEntry` = 21353,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2.5 Helm - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59468,
    `SourceEntry` = 21330,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2.5 Shoulder - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59469,
    `SourceEntry` = 21391,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2.5 Shoulder - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59470,
    `SourceEntry` = 21367,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2.5 Shoulder - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59471,
    `SourceEntry` = 21361,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2.5 Shoulder - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59472,
    `SourceEntry` = 21350,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2.5 Shoulder - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59473,
    `SourceEntry` = 21376,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2.5 Shoulder - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59474,
    `SourceEntry` = 21345,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2.5 Shoulder - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59475,
    `SourceEntry` = 21335,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2.5 Shoulder - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59476,
    `SourceEntry` = 21354,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2.5 Shoulder - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59477,
    `SourceEntry` = 21331,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2.5 Chest - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59478,
    `SourceEntry` = 21389,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2.5 Chest - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59479,
    `SourceEntry` = 21370,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2.5 Chest - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59480,
    `SourceEntry` = 21364,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2.5 Chest - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59481,
    `SourceEntry` = 21351,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2.5 Chest - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59482,
    `SourceEntry` = 21374,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2.5 Chest - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59483,
    `SourceEntry` = 21343,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2.5 Chest - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59484,
    `SourceEntry` = 21334,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2.5 Chest - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59485,
    `SourceEntry` = 21357,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2.5 Chest - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59486,
    `SourceEntry` = 21332,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2.5 Legs - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59487,
    `SourceEntry` = 21390,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2.5 Legs - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59488,
    `SourceEntry` = 21368,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2.5 Legs - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59489,
    `SourceEntry` = 21362,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2.5 Legs - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59490,
    `SourceEntry` = 21352,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2.5 Legs - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59491,
    `SourceEntry` = 21375,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2.5 Legs - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59492,
    `SourceEntry` = 21346,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2.5 Legs - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59493,
    `SourceEntry` = 21336,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2.5 Legs - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59494,
    `SourceEntry` = 21356,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2.5 Legs - Druid';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59495,
    `SourceEntry` = 21333,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2.5 Boots - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59496,
    `SourceEntry` = 21388,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2.5 Boots - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59497,
    `SourceEntry` = 21365,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2.5 Boots - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59498,
    `SourceEntry` = 21359,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2.5 Boots - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59499,
    `SourceEntry` = 21349,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2.5 Boots - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59500,
    `SourceEntry` = 21373,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2.5 Boots - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59501,
    `SourceEntry` = 21344,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2.5 Boots - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59502,
    `SourceEntry` = 21338,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2.5 Boots - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59503,
    `SourceEntry` = 21355,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2.5 Boots - Druid';

-- ============================================================================
-- SECTION 5: CREATURE LOOT TEMPLATE UPDATES
-- ============================================================================
-- Add satchels, remove duplicate tokens, add artifacts

-- Cleanup: Remove all satchel items first for idempotency
DELETE FROM `creature_loot_template` WHERE `Item` IN (59314, 59315, 59316, 59317, 59318, 59319, 59320);

-- Twin Emperors - Vek'nilash (15275): Keep Circlet, add Helm Cache
DELETE FROM `creature_loot_template` WHERE `Entry` = 15275 AND `Item` = 20926;

INSERT INTO `creature_loot_template` SET
    `Entry` = 15275,
    `Item` = 59314,
    `Comment` = 'Qiraji Armor Cache - Helm';

INSERT INTO `creature_loot_template` SET
    `Entry` = 15275,
    `Item` = 20926,
    `Comment` = 'Veknilashs Circlet (consolidated token)';

-- Twin Emperors - Vek'lor (15276): Keep Diadem, add Helm Cache
DELETE FROM `creature_loot_template` WHERE `Entry` = 15276 AND `Item` = 20930;

INSERT INTO `creature_loot_template` SET
    `Entry` = 15276,
    `Item` = 59314,
    `Comment` = 'Qiraji Armor Cache - Helm';

INSERT INTO `creature_loot_template` SET
    `Entry` = 15276,
    `Item` = 20930,
    `Comment` = 'Veklors Diadem (consolidated token)';

-- Viscidus (15299): Remove Command+Dominance, add Shoulder Cache + Crystalline Heart
DELETE FROM `creature_loot_template` WHERE `Entry` = 15299 AND `Item` IN (20928, 20932);

INSERT INTO `creature_loot_template` SET
    `Entry` = 15299,
    `Item` = 59315,
    `Comment` = 'Qiraji Armor Cache - Shoulder';

INSERT INTO `creature_loot_template` SET
    `Entry` = 15299,
    `Item` = 59319,
    `Comment` = 'Visciduss Crystalline Heart (shoulder quest token)';

-- Huhuran (15509): Remove Command+Dominance, add Boots Cache + Stinger
DELETE FROM `creature_loot_template` WHERE `Entry` = 15509 AND `Item` IN (20928, 20932);

INSERT INTO `creature_loot_template` SET
    `Entry` = 15509,
    `Item` = 59318,
    `Comment` = 'Qiraji Armor Cache - Boots';

INSERT INTO `creature_loot_template` SET
    `Entry` = 15509,
    `Item` = 59320,
    `Comment` = 'Huhurans Stinger (boots quest token)';

-- C'Thun (15727): Remove Husk, keep Carapace, add Chest Cache
DELETE FROM `creature_loot_template` WHERE `Entry` = 15727 AND `Item` = 20933;

INSERT INTO `creature_loot_template` SET
    `Entry` = 15727,
    `Item` = 59316,
    `Comment` = 'Qiraji Armor Cache - Chest';

-- Ouro (15517): Remove Skin, keep Intact Hide, add Legs Cache
DELETE FROM `creature_loot_template` WHERE `Entry` = 15517 AND `Item` = 20931;

INSERT INTO `creature_loot_template` SET
    `Entry` = 15517,
    `Item` = 59317,
    `Comment` = 'Qiraji Armor Cache - Legs';

-- ============================================================================
-- SECTION 6: CONSOLIDATED QUESTS
-- ============================================================================
-- Replace 45 class-specific quests with 6 consolidated quests (class-agnostic)
-- Quests give gold + Brood of Nozdormu rep only (satchels provide tier)
-- Delete old class-specific T2.5 quests from all tables
DELETE FROM `creature_queststarter` WHERE `quest` IN (
    8544, 8559, 8560, 8561, 8562, 8592, 8593, 8594, 8596, 8602, 8603, 8621, 8622, 8623, 8624, 8625,
    8626, 8627, 8628, 8629, 8630, 8631, 8632, 8633, 8634, 8637, 8638, 8639, 8640, 8641, 8655, 8656,
    8657, 8658, 8659, 8660, 8661, 8662, 8663, 8664, 8665, 8666, 8667, 8668, 8669
);

DELETE FROM `creature_questender` WHERE `quest` IN (
    8544, 8559, 8560, 8561, 8562, 8592, 8593, 8594, 8596, 8602, 8603, 8621, 8622, 8623, 8624, 8625,
    8626, 8627, 8628, 8629, 8630, 8631, 8632, 8633, 8634, 8637, 8638, 8639, 8640, 8641, 8655, 8656,
    8657, 8658, 8659, 8660, 8661, 8662, 8663, 8664, 8665, 8666, 8667, 8668, 8669
);

DELETE FROM `quest_template_addon` WHERE `ID` IN (
    8544, 8559, 8560, 8561, 8562, 8592, 8593, 8594, 8596, 8602, 8603, 8621, 8622, 8623, 8624, 8625,
    8626, 8627, 8628, 8629, 8630, 8631, 8632, 8633, 8634, 8637, 8638, 8639, 8640, 8641, 8655, 8656,
    8657, 8658, 8659, 8660, 8661, 8662, 8663, 8664, 8665, 8666, 8667, 8668, 8669
);

DELETE FROM `quest_template` WHERE `ID` IN (
    8544, 8559, 8560, 8561, 8562, 8592, 8593, 8594, 8596, 8602, 8603, 8621, 8622, 8623, 8624, 8625,
    8626, 8627, 8628, 8629, 8630, 8631, 8632, 8633, 8634, 8637, 8638, 8639, 8640, 8641, 8655, 8656,
    8657, 8658, 8659, 8660, 8661, 8662, 8663, 8664, 8665, 8666, 8667, 8668, 8669
);

-- Create 6 new consolidated quests (100000-100005)
-- Quest flags: 128 = QUEST_FLAGS_REPEATABLE (optional, remove if one-time)
DELETE FROM `quest_template` WHERE `ID` BETWEEN 100000 AND 100005;

INSERT INTO `quest_template` SET
    `ID` = 100000,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = -22,
    `RequiredFactionId1` = 910,
    `RewardMoney` = 50000,
    `RewardBonusMoney` = '0',
    `RewardChoiceItemId1` = '0',
    `RewardFactionId1` = '910',
    `RewardFactionValue1` = 500,
    `RequiredItemId1` = 20926,
    `RequiredItemCount1` = 1,
    `LogTitle` = 'Veknilashs Tribute',
    `LogDescription` = 'Andorgos seeks proof of Veknilashs defeat. Bring him the Twin Emperors circlet.',
    `QuestDescription` = 'The Twin Emperors Veknilash and Veklor rule over the qiraji forces',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return to Andorgos in the Temple of AhnQiraj.';

INSERT INTO `quest_template` SET
    `ID` = 100001,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = -22,
    `RequiredFactionId1` = 910,
    `RewardMoney` = 50000,
    `RewardBonusMoney` = '0',
    `RewardChoiceItemId1` = '0',
    `RewardFactionId1` = '910',
    `RewardFactionValue1` = 500,
    `RequiredItemId1` = 20930,
    `RequiredItemCount1` = 1,
    `LogTitle` = 'Veklors Tribute',
    `LogDescription` = 'Andorgos seeks proof of Veklors defeat. Bring him the Twin Emperors diadem.',
    `QuestDescription` = 'Emperor Veklor is a master of arcane devastation. Together with his brother',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return to Andorgos in the Temple of AhnQiraj.';

INSERT INTO `quest_template` SET
    `ID` = 100002,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = -22,
    `RequiredFactionId1` = 910,
    `RewardMoney` = 50000,
    `RewardBonusMoney` = '0',
    `RewardChoiceItemId1` = '0',
    `RewardFactionId1` = '910',
    `RewardFactionValue1` = 500,
    `RequiredItemId1` = 59319,
    `RequiredItemCount1` = 1,
    `LogTitle` = 'Visciduss Tribute',
    `LogDescription` = 'Andorgos awaits the crystalline heart of the aberration Viscidus as proof of its destruction.',
    `QuestDescription` = 'Viscidus is an abomination born of the Old Gods corruption - a mass of sentient ooze that reforms endlessly unless shattered while frozen. The Brood of Nozdormu seeks proof of its destruction. Bring me the creatures crystalline heart.',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return to Andorgos in the Temple of AhnQiraj.';

INSERT INTO `quest_template` SET
    `ID` = 100003,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = -22,
    `RequiredFactionId1` = 910,
    `RewardMoney` = 50000,
    `RewardBonusMoney` = '0',
    `RewardChoiceItemId1` = '0',
    `RewardFactionId1` = '910',
    `RewardFactionValue1` = 500,
    `RequiredItemId1` = 20929,
    `RequiredItemCount1` = 1,
    `LogTitle` = 'CThuns Tribute',
    `LogDescription` = 'Vethsera must witness the carapace of the defeated Old God CThun.',
    `QuestDescription` = 'The Old God CThun has slumbered beneath these sands since before the Sundering',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return to Vethsera in the Temple of AhnQiraj.';

INSERT INTO `quest_template` SET
    `ID` = 100004,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = -22,
    `RequiredFactionId1` = 910,
    `RewardMoney` = 50000,
    `RewardBonusMoney` = '0',
    `RewardChoiceItemId1` = '0',
    `RewardFactionId1` = '910',
    `RewardFactionValue1` = 500,
    `RequiredItemId1` = 20927,
    `RequiredItemCount1` = 1,
    `LogTitle` = 'Ouros Tribute',
    `LogDescription` = 'Kandrostrasz seeks the intact hide of Ouro',
    `QuestDescription` = 'Ouro',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return to Kandrostrasz in the Temple of AhnQiraj.';

INSERT INTO `quest_template` SET
    `ID` = 100005,
    `QuestLevel` = 60,
    `MinLevel` = 60,
    `QuestSortID` = -22,
    `RequiredFactionId1` = 910,
    `RewardMoney` = 50000,
    `RewardBonusMoney` = '0',
    `RewardChoiceItemId1` = '0',
    `RewardFactionId1` = '910',
    `RewardFactionValue1` = 500,
    `RequiredItemId1` = 59320,
    `RequiredItemCount1` = 1,
    `LogTitle` = 'Huhurans Tribute',
    `LogDescription` = 'Kandrostrasz wishes to see the stinger of Princess Huhuran',
    `QuestDescription` = 'Princess Huhuran is the matriarch of the silithid swarm',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return to Kandrostrasz in the Temple of AhnQiraj.';

-- Quest addon (AllowableClasses = 0 means all classes)
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 100000 AND 100005;

INSERT INTO `quest_template_addon` SET
    `ID` = 100000,
    `RequiredMinRepFaction` = 910;

INSERT INTO `quest_template_addon` SET
    `ID` = 100001,
    `RequiredMinRepFaction` = 910;

INSERT INTO `quest_template_addon` SET
    `ID` = 100002,
    `RequiredMinRepFaction` = 910;

INSERT INTO `quest_template_addon` SET
    `ID` = 100003,
    `RequiredMinRepFaction` = 910;

INSERT INTO `quest_template_addon` SET
    `ID` = 100004,
    `RequiredMinRepFaction` = 910;

INSERT INTO `quest_template_addon` SET
    `ID` = 100005,
    `RequiredMinRepFaction` = 910;

-- Quest starters (which NPC offers the quest)
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 100000 AND 100005;

INSERT INTO `creature_queststarter` SET
    `id` = 15502,
    `quest` = 100000;

INSERT INTO `creature_queststarter` SET
    `id` = 15502,
    `quest` = 100001;

INSERT INTO `creature_queststarter` SET
    `id` = 15502,
    `quest` = 100002;

INSERT INTO `creature_queststarter` SET
    `id` = 15504,
    `quest` = 100003;

INSERT INTO `creature_queststarter` SET
    `id` = 15503,
    `quest` = 100004;

INSERT INTO `creature_queststarter` SET
    `id` = 15503,
    `quest` = 100005;

-- Quest enders (which NPC completes the quest)
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 100000 AND 100005;

INSERT INTO `creature_questender` SET
    `id` = 15502,
    `quest` = 100000;

INSERT INTO `creature_questender` SET
    `id` = 15502,
    `quest` = 100001;

INSERT INTO `creature_questender` SET
    `id` = 15502,
    `quest` = 100002;

INSERT INTO `creature_questender` SET
    `id` = 15504,
    `quest` = 100003;

INSERT INTO `creature_questender` SET
    `id` = 15503,
    `quest` = 100004;

INSERT INTO `creature_questender` SET
    `id` = 15503,
    `quest` = 100005;
