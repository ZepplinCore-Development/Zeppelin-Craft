-- [F-164T] Glyph of Thunderborne Leap - glyphproperties.dbc row (split from F-164).
-- glyphproperties is a managed DBC table (3.3.5 layout: id, spell_id, glyph_slot_flags,
-- spell_icon_id). glyph_slot_flags 0 = Major. The id MUST be a free stock-range id (<= 911)
-- for the client's right-click auto-inscribe to find an empty slot (907 is in the free gap).
-- The glyph ITEM (57496) casts APPLY_GLYPH spell 900283 whose misc value = 907, which slots
-- modifier spell 900282 into the player's glyph slot.
-- spell_icon_id 3126 = a standard runic glyph-slot icon.
DELETE FROM `glyphproperties` WHERE `id` = 907;
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(907, 900282, 0, 3126);  -- Glyph of Thunderborne Leap (+1s stun duration)
