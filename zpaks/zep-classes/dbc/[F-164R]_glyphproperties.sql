-- [F-164R] Rocksteady Family glyphs - glyphproperties.dbc rows (split from F-164).
-- glyphproperties is a managed DBC table (3.3.5 layout: id, spell_id, glyph_slot_flags,
-- spell_icon_id). glyph_slot_flags 0 = Major.
--
-- !!! GLYPH PROPERTY IDs MUST BE IN THE STOCK RANGE (<= 911) !!!
--  1. uint16: the glyph id is a uint16 in the WotLK protocol/storage; IDs > 65535 truncate.
--  2. Stock-range: the client's right-click AUTO-INSCRIBE only treats IDs within the stock
--     glyph range (<= 911) as valid for empty-slot selection. 901/902/906 sit in the free gap.
-- spell_icon_id = a standard glyph-rune icon (stock range 3098-3129), distinct per glyph.
--
-- The glyph ITEM (item_template) casts an APPLY_GLYPH spell whose misc value is this id;
-- applying it slots spell_id (the modifier) into the player's glyph slot.

DELETE FROM `glyphproperties` WHERE `id` IN (901, 902, 906);
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(901, 900270, 0, 3115),  -- Glyph of Rockslam (-1.5s Rockslam cooldown)
(902, 900272, 0, 3118),  -- Glyph of Rocksurge (+5% dmg per Rocksteady stack)
(906, 900280, 0, 3125);  -- Glyph of Rockwall (+6s duration, 12->18s)
