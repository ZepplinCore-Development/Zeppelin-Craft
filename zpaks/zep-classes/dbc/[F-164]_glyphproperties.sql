-- [F-164] Earthwarden glyphs - glyphproperties.dbc rows
-- glyphproperties is a newly-managed DBC table (imported into original/live/expected
-- via DBCTool with meta/glyphproperties.meta.json; 3.3.5 layout = id, spell_id,
-- glyph_slot_flags, spell_icon_id). Stock IDs run 1-911.
-- glyph_slot_flags: 0 = Major, 1 = Minor.
--
-- !!! GLYPH PROPERTY IDs MUST BE <= 65535 !!!
-- The glyph id is a uint16 in the WotLK protocol/storage (Player::m_Glyphs is sent to
-- the client as uint16 and saved to character_glyphs as uint16). IDs above 65535 get
-- truncated to (id & 0xFFFF) on apply, so the stored glyph no longer matches any
-- glyphproperties row -> "learnt" but the slot renders empty. The original 90001-90007
-- (90000+) convention was WRONG here; renumbered into the free 6001-6007 range
-- (above stock max 911, well under 65535).
--
-- Each row maps a glyph property ID -> the passive modifier spell that alters an
-- Earthwarden ability. The glyph ITEM (item_template) casts an APPLY_GLYPH spell whose
-- misc value is this ID; applying it slots spell_id into the player's glyph slot.

-- Clean up the old out-of-range IDs (90001-90007) as well as the new ones (idempotent).
DELETE FROM `glyphproperties` WHERE `id` IN (90001, 90002, 90003, 90004, 90005, 90006, 90007, 6001, 6002, 6003, 6004, 6005, 6006, 6007);
-- spell_icon_id = a STANDARD glyph-rune icon (stock glyph range 3098-3129), not the
-- ability's icon - this is the icon shown in the socketed glyph slot, and stock
-- glyphs use these runic symbols (e.g. Glyph of Stormstrike = 3123). Distinct per
-- glyph for visual differentiation in the glyph book.
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(6001, 900270, 0, 3115),  -- Glyph of Rockslam (-1.5s Rockslam cooldown)
(6002, 900272, 0, 3118),  -- Glyph of Rocksurge (+5% dmg per Rocksteady stack)
(6003, 900274, 0, 3119),  -- Glyph of Tectonic Blast (+20% damage)
(6004, 900276, 0, 3122),  -- Glyph of Crag Strike (+20% dmg + Cracked Armor 4->6%/stack)
(6005, 900278, 0, 3123),  -- Glyph of Volcanic Shield (+20% eruption damage)
(6006, 900280, 0, 3125),  -- Glyph of Rockwall (+6s duration, 12->18s)
(6007, 900282, 0, 3126);  -- Glyph of Thunderborne Leap (+1s stun duration)
