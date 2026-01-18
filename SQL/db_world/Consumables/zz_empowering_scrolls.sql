-- I-038: Empowering Scrolls Spell Group
-- Creates spell group 1120 for primary stat scrolls (Empowering Scrolls)
-- Implements two-stream scroll system: Empowering (stats) vs Warding (resistance)
-- Players can use one Empowering + one Warding scroll simultaneously
--
-- Note: Core auto-filters additional ranks with same spell name
-- Only need one spell per type in the group
--
-- Execute against acore_world database

-- =====================================================
-- SPELL GROUP 1120: EMPOWERING SCROLLS
-- Stack rule 8 = Never stack (only one empowering scroll active at a time)
-- =====================================================

-- Define spell group 1120 for Empowering Scrolls
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1120;

INSERT INTO `spell_group_stack_rules` SET
    `group_id` = 1120,
    `stack_rule` = 8,
    `description` = 'Group of Empowering Scrolls - never stack';



-- Remove scroll spells from ALL groups (ensures scrolls only block each other)
DELETE FROM `spell_group` WHERE `spell_id` = 8099;   -- Stamina
DELETE FROM `spell_group` WHERE `spell_id` = 8115;   -- Agility
DELETE FROM `spell_group` WHERE `spell_id` = 8096;   -- Intellect
DELETE FROM `spell_group` WHERE `spell_id` = 8118;   -- Strength
DELETE FROM `spell_group` WHERE `spell_id` = 8112;   -- Spirit



-- Add one spell per scroll type to group 1120 (core handles rank filtering)
INSERT INTO `spell_group` VALUES (1120, 8099, 0);   -- Stamina (Scroll of Stamina)
INSERT INTO `spell_group` VALUES (1120, 8115, 0);   -- Agility (Scroll of Agility)
INSERT INTO `spell_group` VALUES (1120, 8096, 0);   -- Intellect (Scroll of Intellect)
INSERT INTO `spell_group` VALUES (1120, 8118, 0);   -- Strength (Scroll of Strength)
INSERT INTO `spell_group` VALUES (1120, 8112, 0);   -- Spirit (Scroll of Spirit)
