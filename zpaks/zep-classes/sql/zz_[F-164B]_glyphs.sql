-- [F-164B] Glyph of Crag Strike item (split from F-164 zz_[F-164]_glyphs.sql).
-- Inscription glyph, reservation block 57400-57499. Class 16 (Glyph); its on-use spell
-- (spelltrigger 0) is APPLY_GLYPH spell 900277, which slots modifier 900276 into the glyph UI.
-- Cloned from stock shaman glyph item 41539 (Glyph of Stormstrike) so every item_template
-- column is valid, then overridden. MAJOR rune displayid 58839. Idempotent via temp table.
DELETE FROM `item_template` WHERE `entry` = 57493;
CREATE TEMPORARY TABLE `_glyph_tpl` AS SELECT * FROM `item_template` WHERE `entry` = 41539;
UPDATE `_glyph_tpl` SET
    `entry` = 57493,
    `name` = 'Glyph of Crag Strike',
    `description` = '',             -- stock glyph items carry NO item description; the apply spell desc shows on the tooltip
    `displayid` = 58839,            -- standard MAJOR shaman glyph rune (minor = 58838)
    `spellid_1` = 900277,
    `spelltrigger_1` = 0;
INSERT INTO `item_template` SELECT * FROM `_glyph_tpl`;
DROP TEMPORARY TABLE `_glyph_tpl`;
