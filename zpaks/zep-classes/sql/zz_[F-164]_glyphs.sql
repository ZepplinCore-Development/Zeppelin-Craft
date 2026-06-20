-- [F-164] Earthwarden glyph items (Inscription, reservation block 57400-57499).
-- Each glyph item is class 16 (Glyph); its on-use spell (spelltrigger 0) is an
-- APPLY_GLYPH spell that slots the modifier into the player's glyph UI.
-- Cloned from a stock shaman glyph item (41539 Glyph of Stormstrike) so every
-- item_template column is valid, then overridden. Idempotent via temp table.
--
-- ICON CONVENTION: all shaman glyph ITEMS use the standard glyph-rune displayid -
-- MAJOR = 58839, MINOR = 58838 (set explicitly below; do not use ability icons on
-- the item). The per-glyph thematic icon lives on glyphproperties.spell_icon_id.

-- 57490 Glyph of Rockslam (MAJOR) -> apply spell 900271 (glyphproperties 90001 -> 900270)
DELETE FROM `item_template` WHERE `entry` = 57490;
CREATE TEMPORARY TABLE `_glyph_tpl` AS SELECT * FROM `item_template` WHERE `entry` = 41539;
UPDATE `_glyph_tpl` SET
    `entry` = 57490,
    `name` = 'Glyph of Rockslam',
    `description` = 'Reduces the cooldown of your Rockslam by 1.5 sec.',
    `displayid` = 58839,            -- standard MAJOR shaman glyph rune (minor = 58838)
    `spellid_1` = 900271,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;
DROP TEMPORARY TABLE `_glyph_tpl`;

-- F-164 Glyph wave 1 (all MAJOR, displayid 58839). Each item's on-use (spelltrigger 0)
-- is the APPLY_GLYPH spell defined in [F-164]_spell.sql.
DELETE FROM `item_template` WHERE `entry` IN (57491, 57492, 57493, 57494, 57495, 57496);
CREATE TEMPORARY TABLE `_glyph_tpl` AS SELECT * FROM `item_template` WHERE `entry` = 41539;

-- 57491 Glyph of Rocksurge -> apply 900273 (glyphproperties 90002 -> 900272)
UPDATE `_glyph_tpl` SET
    `entry` = 57491,
    `name` = 'Glyph of Rocksurge',
    `description` = 'Increases the damage of your Rocksurge by an additional 5% for each stack of Rocksteady you have.',
    `displayid` = 58839,
    `spellid_1` = 900273,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

-- 57492 Glyph of Tectonic Blast -> apply 900275 (glyphproperties 90003 -> 900274)
UPDATE `_glyph_tpl` SET
    `entry` = 57492,
    `name` = 'Glyph of Tectonic Blast',
    `description` = 'Increases the damage of your Tectonic Blast by 20%.',
    `displayid` = 58839,
    `spellid_1` = 900275,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

-- 57493 Glyph of Crag Strike -> apply 900277 (glyphproperties 90004 -> 900276)
UPDATE `_glyph_tpl` SET
    `entry` = 57493,
    `name` = 'Glyph of Crag Strike',
    `description` = 'Increases the damage of your Crag Strike by 20% and its Cracked Armor reduces armor by an additional 2% per stack.',
    `displayid` = 58839,
    `spellid_1` = 900277,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

-- 57494 Glyph of Volcanic Shield -> apply 900279 (glyphproperties 90005 -> 900278)
UPDATE `_glyph_tpl` SET
    `entry` = 57494,
    `name` = 'Glyph of Volcanic Shield',
    `description` = 'Increases the eruption damage of your Volcanic Shield by 20%.',
    `displayid` = 58839,
    `spellid_1` = 900279,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

-- 57495 Glyph of Rockwall -> apply 900281 (glyphproperties 90006 -> 900280)
UPDATE `_glyph_tpl` SET
    `entry` = 57495,
    `name` = 'Glyph of Rockwall',
    `description` = 'Increases the duration of your Rockwall by 6 sec.',
    `displayid` = 58839,
    `spellid_1` = 900281,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

-- 57496 Glyph of Thunderborne Leap -> apply 900283 (glyphproperties 90007 -> 900282)
UPDATE `_glyph_tpl` SET
    `entry` = 57496,
    `name` = 'Glyph of Thunderborne Leap',
    `description` = 'Increases the stun duration of your Thunderborne Leap by 1 sec.',
    `displayid` = 58839,
    `spellid_1` = 900283,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

DROP TEMPORARY TABLE `_glyph_tpl`;
