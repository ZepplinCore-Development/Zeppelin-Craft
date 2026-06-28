-- [F-164B] Glyph of Crag Strike - glyphproperties.dbc row (split from F-164).
-- glyphproperties is a managed DBC table (3.3.5 layout: id, spell_id, glyph_slot_flags,
-- spell_icon_id). glyph_slot_flags 0 = Major. id 904 is a free stock-range id (<= 911)
-- so the client's right-click auto-inscribe finds an empty slot. The glyph ITEM (57493)
-- casts APPLY_GLYPH spell 900277 whose misc value = 904, which slots modifier 900276.
DELETE FROM `glyphproperties` WHERE `id` = 904;
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(904, 900276, 0, 3122);  -- Glyph of Crag Strike (+20% dmg + 30% armor leech)
