-- =====================================================
-- TAILORING SCISSORS
-- Reduces craft time for tailoring recipes
-- 4 tiers: Journeyman (15%), Artisan (25%), Master (35%), Grand Master (45%)
-- =====================================================

-- Delete existing entries
DELETE FROM `item_template` WHERE `entry` IN (57404, 57405, 57406, 57407);
DELETE FROM `spell_group` WHERE `id` = 1118;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1118;

-- =====================================================
-- ITEM TEMPLATES
-- =====================================================

-- Journeyman Tailoring Scissors ITEM TEMPLATE
DELETE FROM `item_template` WHERE (`entry` = 57404);
INSERT INTO `item_template`
SET `entry` = 57404,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Journeyman Tailoring Scissors',
    `displayid` = 140276, -- AO_Scissors10Cheap
    `Quality` = 6, -- Artifact
    `ItemLevel` = 20,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91164,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- Artisan Tailoring Scissors ITEM TEMPLATE
DELETE FROM `item_template` WHERE (`entry` = 57405);
INSERT INTO `item_template`
SET `entry` = 57405,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Artisan Tailoring Scissors',
    `displayid` = 140277, -- AO_Scissors20Cheap
    `Quality` = 6, -- Artifact
    `ItemLevel` = 60,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91165,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- Master Tailoring Scissors ITEM TEMPLATE
DELETE FROM `item_template` WHERE (`entry` = 57406);
INSERT INTO `item_template`
SET `entry` = 57406,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Master Tailoring Scissors',
    `displayid` = 140278, -- AO_Scissors30Cheap
    `Quality` = 6, -- Artifact
    `ItemLevel` = 70,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91166,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- Grand Master Tailoring Scissors ITEM TEMPLATE
DELETE FROM `item_template` WHERE (`entry` = 57407);
INSERT INTO `item_template`
SET `entry` = 57407,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Grand Master Tailoring Scissors',
    `displayid` = 140279, -- AO_Scissors30Expensive
    `Quality` = 6, -- Artifact
    `ItemLevel` = 80,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 1, -- Binds on pickup
    `spellid_1` = 91167,
    `spelltrigger_1` = 5, -- ON_NO_DELAY_USE (triggers when in inventory)
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1;

-- =====================================================
-- Spell group + ranks: Tailoring Scissors (EXCLUSIVE + rank-aware patch)
-- =====================================================
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91164;

INSERT INTO `spell_group` SET `id` = 1118, `spell_id` = 91167; -- Grand Master
INSERT INTO `spell_group` SET `id` = 1118, `spell_id` = 91166; -- Master
INSERT INTO `spell_group` SET `id` = 1118, `spell_id` = 91165; -- Artisan
INSERT INTO `spell_group` SET `id` = 1118, `spell_id` = 91164; -- Journeyman

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES
(1118, 1);

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91164, 91164, 1),
(91164, 91165, 2),
(91164, 91166, 3),
(91164, 91167, 4);
