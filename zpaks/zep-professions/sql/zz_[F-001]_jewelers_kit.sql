-- =====================================================
-- JEWELER'S KIT
-- Reduces craft time for jewelcrafting recipes
-- 5 tiers: Apprentice (base, no buff), Journeyman (15%), Artisan (30%), Master (45%), Grand Master (60%)
-- =====================================================

-- Delete existing entries
DELETE FROM `item_template` WHERE `entry` IN (57504, 57505, 57506, 57507);
DELETE FROM `spell_group` WHERE `id` = 1124;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1124;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91244;

-- =====================================================
-- MODIFY EXISTING APPRENTICE JEWELER'S KIT (20815)
-- Base tool, no cast speed buff - just update display and quality
-- =====================================================
UPDATE `item_template`
SET `class` = 5,         -- Reagent
    `subclass` = 1,      -- Tool
    `displayid` = 135861, -- AO_CopperCase
    `Quality` = 6,       -- Artifact
    `bonding` = 1,       -- Binds on pickup
    `maxcount` = 1
WHERE `entry` = 20815;

-- =====================================================
-- ITEM TEMPLATES
-- =====================================================

-- Journeyman Jeweler's Kit ITEM TEMPLATE (15% cast time reduction)
DELETE FROM `item_template` WHERE (`entry` = 57504);
INSERT INTO `item_template`
SET `entry` = 57504,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Journeyman Jeweler''s Kit',
    `displayid` = 33224, -- Stock Jeweler's Kit icon
    `Quality` = 6, -- Artifact
    `ItemLevel` = 20,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91244,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `TotemCategory` = 191;

-- Artisan Jeweler's Kit ITEM TEMPLATE (30% cast time reduction)
DELETE FROM `item_template` WHERE (`entry` = 57505);
INSERT INTO `item_template`
SET `entry` = 57505,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Artisan Jeweler''s Kit',
    `displayid` = 141113, -- AO_TinCase
    `Quality` = 6, -- Artifact
    `ItemLevel` = 60,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91245,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `TotemCategory` = 191;

-- Master Jeweler's Kit ITEM TEMPLATE (45% cast time reduction)
DELETE FROM `item_template` WHERE (`entry` = 57506);
INSERT INTO `item_template`
SET `entry` = 57506,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Master Jeweler''s Kit',
    `displayid` = 140493, -- AO_SilverCase
    `Quality` = 6, -- Artifact
    `ItemLevel` = 70,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91246,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `TotemCategory` = 191;

-- Grand Master Jeweler's Kit ITEM TEMPLATE (60% cast time reduction)
DELETE FROM `item_template` WHERE (`entry` = 57507);
INSERT INTO `item_template`
SET `entry` = 57507,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Grand Master Jeweler''s Kit',
    `displayid` = 137082, -- AO_GoldCase
    `Quality` = 6, -- Artifact
    `ItemLevel` = 80,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91247,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `TotemCategory` = 191;

-- =====================================================
-- Spell group + ranks: Jeweler's Kit (EXCLUSIVE + rank-aware)
-- =====================================================

INSERT INTO `spell_group` SET `id` = 1124, `spell_id` = 91247; -- Grand Master
INSERT INTO `spell_group` SET `id` = 1124, `spell_id` = 91246; -- Master
INSERT INTO `spell_group` SET `id` = 1124, `spell_id` = 91245; -- Artisan
INSERT INTO `spell_group` SET `id` = 1124, `spell_id` = 91244; -- Journeyman

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES
(1124, 1);

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91244, 91244, 1),
(91244, 91245, 2),
(91244, 91246, 3),
(91244, 91247, 4);
