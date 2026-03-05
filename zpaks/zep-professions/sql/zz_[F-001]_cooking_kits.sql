-- =====================================================
-- COOKING KITS: Tiered cooking tools with cast time,
-- food healing, and drink mana restoration bonuses
-- Buff spells 91271-91275 (DBC), items 57900-57904
-- =====================================================

-- Clean up
DELETE FROM `item_template` WHERE `entry` IN (57900, 57901, 57902, 57903, 57904);
DELETE FROM `spell_group` WHERE `id` = 1132;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1132;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91271;

-- =====================================================
-- COOKING KIT ITEMS (Reagent > Tool, BoP, passive buff)
-- spelltrigger=5: buff activates when item is in inventory
-- =====================================================

-- Journeyman Cooking Pot (Fire cauldron) — skill 75
INSERT INTO `item_template` SET
    `entry` = 57900, `class` = 5, `subclass` = 1,
    `name` = 'Journeyman Cooking Pot',
    `description` = 'Improves cooking speed and food/drink potency.',
    `displayid` = 46255, `Quality` = 6, `ItemLevel` = 20,
    `stackable` = 1, `bonding` = 1,
    `spellid_1` = 91271, `spelltrigger_1` = 5,
    `spellcooldown_1` = -1, `spellcategorycooldown_1` = -1;

-- Expert Cooking Pot (Nature cauldron) — skill 150
INSERT INTO `item_template` SET
    `entry` = 57901, `class` = 5, `subclass` = 1,
    `name` = 'Expert Cooking Pot',
    `description` = 'Improves cooking speed and food/drink potency.',
    `displayid` = 46257, `Quality` = 6, `ItemLevel` = 30,
    `stackable` = 1, `bonding` = 1,
    `spellid_1` = 91272, `spelltrigger_1` = 5,
    `spellcooldown_1` = -1, `spellcategorycooldown_1` = -1;

-- Artisan Cooking Pot (Arcane cauldron) — skill 225
INSERT INTO `item_template` SET
    `entry` = 57902, `class` = 5, `subclass` = 1,
    `name` = 'Artisan Cooking Pot',
    `description` = 'Improves cooking speed and food/drink potency.',
    `displayid` = 46254, `Quality` = 6, `ItemLevel` = 45,
    `stackable` = 1, `bonding` = 1,
    `spellid_1` = 91273, `spelltrigger_1` = 5,
    `spellcooldown_1` = -1, `spellcategorycooldown_1` = -1;

-- Master Cooking Pot (Frost cauldron) — skill 300
INSERT INTO `item_template` SET
    `entry` = 57903, `class` = 5, `subclass` = 1,
    `name` = 'Master Cooking Pot',
    `description` = 'Improves cooking speed and food/drink potency.',
    `displayid` = 46256, `Quality` = 6, `ItemLevel` = 60,
    `stackable` = 1, `bonding` = 1,
    `spellid_1` = 91274, `spelltrigger_1` = 5,
    `spellcooldown_1` = -1, `spellcategorycooldown_1` = -1;

-- Grand Master Cooking Pot (Shadow cauldron) — skill 375
INSERT INTO `item_template` SET
    `entry` = 57904, `class` = 5, `subclass` = 1,
    `name` = 'Grand Master Cooking Pot',
    `description` = 'Improves cooking speed and food/drink potency.',
    `displayid` = 46258, `Quality` = 6, `ItemLevel` = 75,
    `stackable` = 1, `bonding` = 1,
    `spellid_1` = 91275, `spelltrigger_1` = 5,
    `spellcooldown_1` = -1, `spellcategorycooldown_1` = -1;

-- =====================================================
-- SPELL GROUP: Exclusive — only one cooking kit active
-- =====================================================

INSERT INTO `spell_group` (`id`, `spell_id`) VALUES (1132, 91271);

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES (1132, 1);

-- =====================================================
-- SPELL RANKS: Higher tier overrides lower tier
-- =====================================================

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91271, 91271, 1),
(91271, 91272, 2),
(91271, 91273, 3),
(91271, 91274, 4),
(91271, 91275, 5);
