-- [F-164] Earthwarden glyphs - glyphproperties.dbc rows
-- glyphproperties is a newly-managed DBC table (imported into original/live/expected
-- via DBCTool with meta/glyphproperties.meta.json; 3.3.5 layout = id, spell_id,
-- glyph_slot_flags, spell_icon_id). Stock IDs run 1-911; custom EW glyphs use 90000+.
-- glyph_slot_flags: 0 = Major, 1 = Minor.
--
-- Each row maps a glyph property ID -> the passive modifier spell that alters an
-- Earthwarden ability. The glyph ITEM (item_template) casts an APPLY_GLYPH spell whose
-- misc value is this ID; applying it slots spell_id into the player's glyph slot.

-- 90001 Glyph of Rockslam (MAJOR) -> 900270 (-1.5s Rockslam cooldown). Placeholder icon 5489.
DELETE FROM `glyphproperties` WHERE `id` = 90001;
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(90001, 900270, 0, 5489);
