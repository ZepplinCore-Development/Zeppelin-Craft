-- =====================================================
-- LEATHERING KIT
-- Reduces cast time for leatherworking recipes
-- 5 tiers: Journeyman, Expert, Artisan, Master, Grand Master
-- =====================================================
-- Item IDs: 57612-57616 (from Leatherworking range 57600-57699)
-- Spell IDs: 91182-91186
-- Spell Group: 1119
-- SpellFamilyFlags: 16 (Leatherworking)
-- =====================================================

-- Delete existing entries
DELETE FROM `item_template` WHERE `entry` IN (57612, 57613, 57614, 57615, 57616);
DELETE FROM `spell_group` WHERE `id` = 1119;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1119;

-- =====================================================
-- ITEM TEMPLATES
-- =====================================================

-- Journeyman Leathering Kit
INSERT INTO `item_template`
SET `entry` = 57612,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Journeyman Leathering Kit',
    `displayid` = 138191, -- AO_LeatheringDevice01
    `Quality` = 6, -- Artifact
    `ItemLevel` = 10,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91182,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- Expert Leathering Kit
INSERT INTO `item_template`
SET `entry` = 57613,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Expert Leathering Kit',
    `displayid` = 138190, -- AO_LeatheringDevice
    `Quality` = 6, -- Artifact
    `ItemLevel` = 20,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91183,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- Artisan Leathering Kit
INSERT INTO `item_template`
SET `entry` = 57614,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Artisan Leathering Kit',
    `displayid` = 138193, -- AO_LeatheringDevice201
    `Quality` = 6, -- Artifact
    `ItemLevel` = 30,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91184,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- Master Leathering Kit
INSERT INTO `item_template`
SET `entry` = 57615,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Master Leathering Kit',
    `displayid` = 138192, -- AO_LeatheringDevice03
    `Quality` = 6, -- Artifact
    `ItemLevel` = 40,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91185,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- Grand Master Leathering Kit
INSERT INTO `item_template`
SET `entry` = 57616,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Grand Master Leathering Kit',
    `displayid` = 138194, -- AO_LeatheringDevice50
    `Quality` = 6, -- Artifact
    `ItemLevel` = 50,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91186,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- =====================================================
-- ANTI-STACKING SPELL GROUP
-- Higher tier replaces lower tier (NEVER_STACK with priority)
-- =====================================================

INSERT INTO `spell_group` (`id`, `spell_id`, `special_flag`) VALUES
(1119, 91182, 4096),  -- Journeyman (PRIORITY5 - lowest)
(1119, 91183, 2048),  -- Expert (PRIORITY4)
(1119, 91184, 1024),  -- Artisan (PRIORITY3)
(1119, 91185, 512),   -- Master (PRIORITY2)
(1119, 91186, 256);   -- Grand Master (PRIORITY1 - highest)

-- Stack rule: NEVER_STACK
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES
(1119, 8);
