-- I-038: Empowering Scrolls Spell Group
-- Creates spell group 2031 for primary stat scrolls (Empowering Scrolls)
-- Implements two-stream scroll system: Empowering (stats) vs Warding (resistance)
-- Players can use one Empowering + one Warding scroll simultaneously
--
-- Note: Core auto-filters additional ranks with same spell name
-- Only need one spell per type in the group
--
-- Execute against acore_world database

-- =====================================================
-- SPELL GROUP 2031: EMPOWERING SCROLLS
-- Stack rule 8 = Never stack (only one empowering scroll active at a time)
-- =====================================================

-- Define spell group 2031 for Empowering Scrolls
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 2031;

INSERT INTO `spell_group_stack_rules` SET
    `group_id` = 2031,
    `stack_rule` = 1,
    `description` = 'Group of Empowering Scrolls - exclusive';



-- Remove scroll spells from ALL groups (ensures scrolls only block each other)
DELETE FROM `spell_group` WHERE `spell_id` = 8099;   -- Stamina
DELETE FROM `spell_group` WHERE `spell_id` = 8115;   -- Agility
DELETE FROM `spell_group` WHERE `spell_id` = 8096;   -- Intellect
DELETE FROM `spell_group` WHERE `spell_id` = 8118;   -- Strength
DELETE FROM `spell_group` WHERE `spell_id` = 8112;   -- Spirit

-- Clean up parent group references to now-empty child groups 1066-1070
-- 1087 (Scrolls) referenced all five; 1083/1084/1085 referenced one each
-- 1088 (Str+Agi Buffs) referenced 1066 (Agility scroll) and 1067 (Strength scroll)
DELETE FROM `spell_group` WHERE `id` = 1088 AND `spell_id` IN (-1066, -1067);
DELETE FROM `spell_group` WHERE `id` = 1083 AND `spell_id` = -1068;  -- was Intellect
DELETE FROM `spell_group` WHERE `id` = 1084 AND `spell_id` = -1069;  -- was Stamina
DELETE FROM `spell_group` WHERE `id` = 1085 AND `spell_id` = -1070;  -- was Spirit

-- I-192: Retire stock group 1087 (Scrolls, stack_rule 1) entirely.
-- Its pre-3.3 "one scroll at a time" rule is replaced by the two-stream design
-- (2031 Empowering exclusive, 2019 Warding exclusive, streams stack with each other).
-- Leftover -1071 (Scroll of Protection/armor) + re-linked empowering subgroup in 1087 made the
-- armor scroll cancel ANY empowering scroll. Armor-vs-class-buff interaction is
-- still covered by stock group 1086 (Armor Buffs, rule 4).
DELETE FROM `spell_group` WHERE `id` = 1087;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1087;

-- Re-link new group 2031 into class-buff parent groups (exclusive-highest vs class buffs)
INSERT IGNORE INTO `spell_group` VALUES (1083, -2031);  -- Single Intellect Buffs
INSERT IGNORE INTO `spell_group` VALUES (1084, -2031);  -- Single Stamina Buffs
INSERT IGNORE INTO `spell_group` VALUES (1085, -2031);  -- Single Spirit Buffs



-- Add one spell per scroll type to group 2031 (core handles rank filtering)
-- Note: special_flag column removed from spell_group (I-093)
INSERT INTO `spell_group` VALUES (2031, 8099);   -- Stamina (Scroll of Stamina)
INSERT INTO `spell_group` VALUES (2031, 8115);   -- Agility (Scroll of Agility)
INSERT INTO `spell_group` VALUES (2031, 8096);   -- Intellect (Scroll of Intellect)
INSERT INTO `spell_group` VALUES (2031, 8118);   -- Strength (Scroll of Strength)
INSERT INTO `spell_group` VALUES (2031, 8112);   -- Spirit (Scroll of Spirit)
