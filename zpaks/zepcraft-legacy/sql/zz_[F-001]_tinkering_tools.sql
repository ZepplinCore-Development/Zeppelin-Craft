-- =====================================================
-- TINKERING TOOLS
-- Reduces craft time for engineering recipes
-- 4 tiers: Journeyman (15%), Artisan (30%), Master (45%), Grand Master (60%)
-- Carries TotemCategory 220 (type 24, mask 7) to replace
-- Arclight Spanner, Gyromatic Micro-Adjustor, and Smithing Hammer
-- Master/GM tiers also carry Zapthrottle Mote Extractor functionality
-- =====================================================
-- Delete existing entries
DELETE FROM `item_template` WHERE `entry` IN (57200, 57201, 57202, 57203);

DELETE FROM `spell_group` WHERE `id` = 1120;

DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1120;

DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91214;

DELETE FROM `trainer_spell` WHERE `SpellId` IN (91218, 91219, 91220, 91221);

-- =====================================================
-- ITEM TEMPLATES
-- =====================================================
-- Journeyman Tinkering Tools ITEM TEMPLATE
DELETE FROM `item_template` WHERE (`entry` = 57200);

INSERT INTO `item_template` SET
    `entry` = 57200,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Journeyman Tinkering Tools',
    `description` = 'Works as a Blacksmith Hammer and Arclight Spanner.',
    `displayid` = 134962,
    `Quality` = 6,
    `ItemLevel` = 20,
    `maxcount` = 1,
    `bonding` = 1,
    `TotemCategory` = 220,
    `spellid_1` = 91214,
    `spelltrigger_1` = 5;

-- Artisan Tinkering Tools ITEM TEMPLATE
DELETE FROM `item_template` WHERE (`entry` = 57201);

INSERT INTO `item_template` SET
    `entry` = 57201,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Artisan Tinkering Tools',
    `description` = 'Works as a Blacksmith Hammer, Arclight Spanner and Gyromatic Micro-Adjustor.',
    `displayid` = 134961,
    `Quality` = 6,
    `ItemLevel` = 60,
    `maxcount` = 1,
    `bonding` = 1,
    `TotemCategory` = 220,
    `spellid_1` = 91215,
    `spelltrigger_1` = 5;

-- Master Tinkering Tools ITEM TEMPLATE
-- Gains Zapthrottle Mote Extractor functionality (Extract Gas + Gas Cloud Tracking)
DELETE FROM `item_template` WHERE (`entry` = 57202);

INSERT INTO `item_template` SET
    `entry` = 57202,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Master Tinkering Tools',
    `description` = 'Works as a Blacksmith Hammer, Arclight Spanner, Gyromatic Micro-Adjustor and Zapthrottle Mote Extractor.',
    `displayid` = 134963,
    `Quality` = 6,
    `ItemLevel` = 70,
    `maxcount` = 1,
    `bonding` = 1,
    `TotemCategory` = 220,
    `spellid_1` = 91216,
    `spelltrigger_1` = 5,
    `spellid_2` = 30427,
    `spellid_3` = 30645,
    `spelltrigger_3` = 5;

-- Grand Master Tinkering Tools ITEM TEMPLATE
-- Carries Zapthrottle Mote Extractor functionality (Extract Gas + Gas Cloud Tracking)
DELETE FROM `item_template` WHERE (`entry` = 57203);

INSERT INTO `item_template` SET
    `entry` = 57203,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Grand Master Tinkering Tools',
    `description` = 'Works as a Blacksmith Hammer, Arclight Spanner, Gyromatic Micro-Adjustor and Zapthrottle Mote Extractor.',
    `displayid` = 134964,
    `Quality` = 6,
    `ItemLevel` = 80,
    `maxcount` = 1,
    `bonding` = 1,
    `TotemCategory` = 220,
    `spellid_1` = 91217,
    `spelltrigger_1` = 5,
    `spellid_2` = 30427,
    `spellid_3` = 30645,
    `spelltrigger_3` = 5;

-- =====================================================
-- Spell group + ranks: Tinkering Tools (EXCLUSIVE + rank-aware patch)
-- =====================================================
INSERT INTO `spell_group` SET
    `id` = 1120,
    `spell_id` = '91217';

INSERT INTO `spell_group` SET
    `id` = 1120,
    `spell_id` = '91216';

INSERT INTO `spell_group` SET
    `id` = 1120,
    `spell_id` = '91215';

INSERT INTO `spell_group` SET
    `id` = 1120,
    `spell_id` = '91214';

INSERT INTO `spell_group_stack_rules` SET
    `group_id` = 1120,
    `stack_rule` = 1;

INSERT INTO `spell_ranks` SET
    `first_spell_id` = 91214,
    `spell_id` = 91214,
    `rank` = 1;

INSERT INTO `spell_ranks` SET
    `first_spell_id` = 91214,
    `spell_id` = 91215,
    `rank` = 2;

INSERT INTO `spell_ranks` SET
    `first_spell_id` = 91214,
    `spell_id` = 91216,
    `rank` = 3;

INSERT INTO `spell_ranks` SET
    `first_spell_id` = 91214,
    `spell_id` = 91217,
    `rank` = 4;

-- =====================================================
-- TRAINER SPELLS
-- Recipes learned from engineering trainers
-- =====================================================
-- Journeyman Tinkering Tools (skill 75) - all trainers
INSERT INTO `trainer_spell` SET
    `TrainerId` = 626,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 628,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 92,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 84,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 85,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 86,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 87,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 88,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 90,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 91,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 89,
    `SpellId` = 91218,
    `MoneyCost` = 500,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 75;

-- Artisan Tinkering Tools (skill 225) - artisan+ trainers
INSERT INTO `trainer_spell` SET
    `TrainerId` = 92,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 84,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 85,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 86,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 87,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 88,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 90,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 91,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 89,
    `SpellId` = 91219,
    `MoneyCost` = 5000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 225;

-- Master Tinkering Tools (skill 300) - master+ trainers
INSERT INTO `trainer_spell` SET
    `TrainerId` = 84,
    `SpellId` = 91220,
    `MoneyCost` = 50000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 300;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 85,
    `SpellId` = 91220,
    `MoneyCost` = 50000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 300;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 86,
    `SpellId` = 91220,
    `MoneyCost` = 50000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 300;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 87,
    `SpellId` = 91220,
    `MoneyCost` = 50000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 300;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 88,
    `SpellId` = 91220,
    `MoneyCost` = 50000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 300;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 90,
    `SpellId` = 91220,
    `MoneyCost` = 50000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 300;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 91,
    `SpellId` = 91220,
    `MoneyCost` = 50000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 300;

INSERT INTO `trainer_spell` SET
    `TrainerId` = 89,
    `SpellId` = 91220,
    `MoneyCost` = 50000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 300;

-- Grand Master Tinkering Tools (skill 375) - grand master trainer only
INSERT INTO `trainer_spell` SET
    `TrainerId` = 89,
    `SpellId` = 91221,
    `MoneyCost` = 100000,
    `ReqSkillLine` = 202,
    `ReqSkillRank` = 375;

