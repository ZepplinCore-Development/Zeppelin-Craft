-- [F-164A] Glyph of Tectonic Blast - glyphproperties.dbc row (split from F-164).
-- glyphproperties is a managed DBC table (3.3.5 layout: id, spell_id, glyph_slot_flags,
-- spell_icon_id). glyph_slot_flags 0 = Major. The id MUST be a free stock-range id (<= 911)
-- for the client's right-click auto-inscribe to find an empty slot (903 is in the free gap).
-- The glyph ITEM (57492) casts APPLY_GLYPH spell 900275 whose misc value = 903, which slots
-- modifier spell 900274 into the player's glyph slot.
-- spell_icon_id 3119 = a standard runic glyph-slot icon.
DELETE FROM `glyphproperties` WHERE `id` = 903;
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(903, 900274, 0, 3119);  -- Glyph of Tectonic Blast (+20% damage)
