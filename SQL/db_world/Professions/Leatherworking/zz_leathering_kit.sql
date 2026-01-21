-- =====================================================
-- LEATHERING KIT
-- Reduces craft time for leatherworking recipes
-- 5 tiers: Apprentice (10%), Journeyman (15%), Expert (20%), Artisan (25%), Master (30%)
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

-- Apprentice Leathering Kit ITEM TEMPLATE
DELETE FROM `item_template` WHERE (`entry` = 57612);
INSERT INTO `item_template`
SET `entry` = 57612,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Apprentice Leathering Kit',
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

-- =====================================================
-- ANTI-STACKING SPELL GROUP (for testing - single spell only)
-- Will be expanded when all tiers are created
-- =====================================================

-- Spell group 1119 for Leathering Kit
INSERT INTO `spell_group` (`id`, `spell_id`, `special_flag`) VALUES
(1119, 91182, 4096);  -- Apprentice (PRIORITY5 - lowest for now)

-- Stack rule: NEVER_STACK
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES
(1119, 8);
