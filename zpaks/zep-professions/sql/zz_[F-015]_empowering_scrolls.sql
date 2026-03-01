-- I-038: Empowering Scrolls Spell Group
-- Creates spell group 1131 for primary stat scrolls (Empowering Scrolls)
-- Implements two-stream scroll system: Empowering (stats) vs Warding (resistance)
-- Players can use one Empowering + one Warding scroll simultaneously
--
-- Note: Core auto-filters additional ranks with same spell name
-- Only need one spell per type in the group
--
-- Execute against acore_world database

-- =====================================================
-- SPELL GROUP 1131: EMPOWERING SCROLLS
-- Stack rule 8 = Never stack (only one empowering scroll active at a time)
-- =====================================================

-- Define spell group 1131 for Empowering Scrolls
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1131;

INSERT INTO `spell_group_stack_rules` SET
    `group_id` = 1131,
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
DELETE FROM `spell_group` WHERE `id` = 1087 AND `spell_id` IN (-1066, -1067, -1068, -1069, -1070);
DELETE FROM `spell_group` WHERE `id` = 1083 AND `spell_id` = -1068;  -- was Intellect
DELETE FROM `spell_group` WHERE `id` = 1084 AND `spell_id` = -1069;  -- was Stamina
DELETE FROM `spell_group` WHERE `id` = 1085 AND `spell_id` = -1070;  -- was Spirit

-- Re-link new group 1131 into parent groups so scrolls still interact with class buffs
INSERT IGNORE INTO `spell_group` VALUES (1087, -1131);  -- Scrolls meta-group
INSERT IGNORE INTO `spell_group` VALUES (1083, -1131);  -- Single Intellect Buffs
INSERT IGNORE INTO `spell_group` VALUES (1084, -1131);  -- Single Stamina Buffs
INSERT IGNORE INTO `spell_group` VALUES (1085, -1131);  -- Single Spirit Buffs



-- Add one spell per scroll type to group 1131 (core handles rank filtering)
-- Note: special_flag column removed from spell_group (I-093)
INSERT INTO `spell_group` VALUES (1131, 8099);   -- Stamina (Scroll of Stamina)
INSERT INTO `spell_group` VALUES (1131, 8115);   -- Agility (Scroll of Agility)
INSERT INTO `spell_group` VALUES (1131, 8096);   -- Intellect (Scroll of Intellect)
INSERT INTO `spell_group` VALUES (1131, 8118);   -- Strength (Scroll of Strength)
INSERT INTO `spell_group` VALUES (1131, 8112);   -- Spirit (Scroll of Spirit)
