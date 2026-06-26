-- [F-164D] Glyph of Volcanic Shield - glyphproperties.dbc row (split from F-164).
-- glyphproperties is a managed DBC table (3.3.5 layout: id, spell_id, glyph_slot_flags,
-- spell_icon_id). glyph_slot_flags 0 = Major. The id MUST be a free stock-range id (<= 911)
-- for the client's right-click auto-inscribe to find an empty slot (905 is in the free gap).
-- The glyph ITEM (57494) casts APPLY_GLYPH spell 900279 whose misc value = 905, which slots
-- modifier spell 900278 into the player's glyph slot.
-- spell_icon_id 3123 = a standard runic glyph-slot icon (matches stock Glyph of Stormstrike).
DELETE FROM `glyphproperties` WHERE `id` = 905;
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(905, 900278, 0, 3123);  -- Glyph of Volcanic Shield (+20% eruption damage)
