-- [F-164R] Rocksteady Family glyph items (split from F-164 zz_[F-164]_glyphs.sql).
-- Inscription glyphs, reservation block 57400-57499. Each item is class 16 (Glyph);
-- its on-use spell (spelltrigger 0) is an APPLY_GLYPH spell that slots the modifier
-- into the player's glyph UI. Cloned from stock shaman glyph item 41539 (Glyph of
-- Stormstrike) so every item_template column is valid, then overridden. Idempotent
-- via temp table.
--
-- ICON CONVENTION: all use the standard MAJOR glyph-rune displayid 58839 (do NOT use the
-- ability icon on the item). The per-glyph thematic icon lives on glyphproperties.spell_icon_id.
--
--   57490 Glyph of Rockslam  -> apply 900271 (glyphproperties 901)
--   57491 Glyph of Rocksurge -> apply 900273 (glyphproperties 902)
--   57495 Glyph of Rockwall  -> apply 900281 (glyphproperties 906)

DELETE FROM `item_template` WHERE `entry` IN (57490, 57491, 57495);
CREATE TEMPORARY TABLE `_glyph_tpl` AS SELECT * FROM `item_template` WHERE `entry` = 41539;

-- 57490 Glyph of Rockslam
UPDATE `_glyph_tpl` SET
    `entry` = 57490,
    `name` = 'Glyph of Rockslam',
    `description` = '',             -- stock glyph items carry NO item description; the apply spell desc shows on the tooltip
    `displayid` = 58839,            -- standard MAJOR shaman glyph rune
    `spellid_1` = 900271,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

-- 57491 Glyph of Rocksurge
UPDATE `_glyph_tpl` SET
    `entry` = 57491,
    `name` = 'Glyph of Rocksurge',
    `description` = '',
    `displayid` = 58839,
    `spellid_1` = 900273,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

-- 57495 Glyph of Rockwall
UPDATE `_glyph_tpl` SET
    `entry` = 57495,
    `name` = 'Glyph of Rockwall',
    `description` = '',
    `displayid` = 58839,
    `spellid_1` = 900281,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;

DROP TEMPORARY TABLE `_glyph_tpl`;
