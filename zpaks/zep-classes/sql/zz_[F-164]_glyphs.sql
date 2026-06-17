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
