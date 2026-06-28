-- [F-164A] Glyph of Tectonic Blast item (split from F-164 zz_[F-164]_glyphs.sql).
-- Inscription glyph, reservation block 57400-57499. Class 16 (Glyph); its on-use spell
-- (spelltrigger 0) is APPLY_GLYPH spell 900275 which slots modifier 900274 into the glyph UI.
-- Cloned from stock shaman glyph item 41539 (Glyph of Stormstrike) so every item_template
-- column is valid, then overridden. Idempotent via temp table.
--
-- ICON CONVENTION: the item uses the standard MAJOR glyph-rune displayid 58839 (do NOT use the
-- ability icon on the item). The per-glyph thematic icon lives on glyphproperties.spell_icon_id.
-- The item carries NO description; the apply spell (900275) desc shows on the tooltip.

-- 57492 Glyph of Tectonic Blast (MAJOR) -> apply spell 900275 (glyphproperties 903 -> 900274)
DELETE FROM `item_template` WHERE `entry` = 57492;
CREATE TEMPORARY TABLE `_glyph_tpl` AS SELECT * FROM `item_template` WHERE `entry` = 41539;
UPDATE `_glyph_tpl` SET
    `entry` = 57492,
    `name` = 'Glyph of Tectonic Blast',
    `description` = '',
    `displayid` = 58839,
    `spellid_1` = 900275,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;
DROP TEMPORARY TABLE `_glyph_tpl`;
