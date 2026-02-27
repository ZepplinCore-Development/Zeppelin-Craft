-- =====================================================
-- WRITING TABLES (Inscription Tools)
-- Reduces craft time for inscription recipes
-- 5 tiers: Apprentice (base Inking Set, no buff), Journeyman (15%), Artisan (30%), Master (45%), Grand Master (60%)
-- =====================================================

-- Delete existing entries
DELETE FROM `item_template` WHERE `entry` IN (57486, 57487, 57488, 57489);
DELETE FROM `spell_group` WHERE `id` = 1130;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1130;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91248;

-- =====================================================
-- MODIFY EXISTING VIRTUOSO INKING SET (39505)
-- Base tool, no cast speed buff - just update class and quality
-- =====================================================
UPDATE `item_template`
SET `class` = 5,         -- Reagent
    `subclass` = 1,      -- Tool
    `Quality` = 6,       -- Artifact
    `bonding` = 1,       -- Binds on pickup
    `maxcount` = 1
WHERE `entry` = 39505;

-- =====================================================
-- ITEM TEMPLATES
-- =====================================================

-- Journeyman Writing Table ITEM TEMPLATE (15% cast time reduction)
DELETE FROM `item_template` WHERE (`entry` = 57486);
INSERT INTO `item_template`
SET `entry` = 57486,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Journeyman Writing Table',
    `description` = 'Contains a complete inking set for inscription work.',
    `displayid` = 145649, -- RoM_ft_table026
    `Quality` = 6, -- Artifact
    `ItemLevel` = 20,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91248,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `TotemCategory` = 121;

-- Artisan Writing Table ITEM TEMPLATE (30% cast time reduction)
DELETE FROM `item_template` WHERE (`entry` = 57487);
INSERT INTO `item_template`
SET `entry` = 57487,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Artisan Writing Table',
    `description` = 'Contains a complete inking set for inscription work.',
    `displayid` = 145572, -- RoM_ft_pottery_table_01
    `Quality` = 6, -- Artifact
    `ItemLevel` = 60,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91249,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `TotemCategory` = 121;

-- Master Writing Table ITEM TEMPLATE (45% cast time reduction)
DELETE FROM `item_template` WHERE (`entry` = 57488);
INSERT INTO `item_template`
SET `entry` = 57488,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Master Writing Table',
    `description` = 'Contains a complete inking set for inscription work.',
    `displayid` = 145573, -- RoM_ft_pottery_table_02
    `Quality` = 6, -- Artifact
    `ItemLevel` = 70,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91250,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `TotemCategory` = 121;

-- Grand Master Writing Table ITEM TEMPLATE (60% cast time reduction)
DELETE FROM `item_template` WHERE (`entry` = 57489);
INSERT INTO `item_template`
SET `entry` = 57489,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Grand Master Writing Table',
    `description` = 'Contains a complete inking set for inscription work.',
    `displayid` = 145574, -- RoM_ft_pottery_table_03
    `Quality` = 6, -- Artifact
    `ItemLevel` = 80,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91251,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `TotemCategory` = 121;

-- =====================================================
-- Spell group + ranks: Writing Table (EXCLUSIVE + rank-aware)
-- =====================================================

-- Only first rank needed; AC auto-includes higher ranks via spell_ranks
INSERT INTO `spell_group` SET `id` = 1130, `spell_id` = 91248; -- Journeyman (first rank)

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES
(1130, 1);

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91248, 91248, 1),
(91248, 91249, 2),
(91248, 91250, 3),
(91248, 91251, 4);
