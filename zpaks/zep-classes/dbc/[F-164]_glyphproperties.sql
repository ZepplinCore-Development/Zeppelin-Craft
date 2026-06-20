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

-- F-164 Glyph wave 1 (all MAJOR). spell_id = the passive modifier; spell_icon_id =
-- the modified ability's own icon. Modifier/apply/item IDs in [F-164]_spell.sql.
DELETE FROM `glyphproperties` WHERE `id` IN (90002, 90003, 90004, 90005, 90006, 90007);
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(90002, 900272, 0, 4975),  -- Glyph of Rocksurge (+20% damage)
(90003, 900274, 0, 5366),  -- Glyph of Tectonic Blast (+20% damage)
(90004, 900276, 0, 4609),  -- Glyph of Crag Strike (+20% damage)
(90005, 900278, 0, 4610),  -- Glyph of Volcanic Shield (+20% eruption damage)
(90006, 900280, 0, 5469),  -- Glyph of Rockwall (+4s duration)
(90007, 900282, 0, 5364);  -- Glyph of Thunderborne Leap (-5s cooldown)
