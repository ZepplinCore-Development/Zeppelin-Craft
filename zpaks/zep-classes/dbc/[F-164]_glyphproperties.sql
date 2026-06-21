-- [F-164] Earthwarden glyphs - glyphproperties.dbc rows
-- glyphproperties is a newly-managed DBC table (imported into original/live/expected
-- via DBCTool with meta/glyphproperties.meta.json; 3.3.5 layout = id, spell_id,
-- glyph_slot_flags, spell_icon_id). Stock IDs run 1-911.
-- glyph_slot_flags: 0 = Major, 1 = Minor.
--
-- !!! GLYPH PROPERTY IDs MUST BE IN THE STOCK RANGE (<= 911) !!!
-- Two hard constraints, learned the hard way:
--  1. uint16: the glyph id is a uint16 in the WotLK protocol/storage (Player::m_Glyphs
--     sent to client + saved to character_glyphs as uint16); IDs > 65535 truncate.
--  2. Stock-range: the client's glyph AUTO-INSCRIBE (right-click) only treats IDs within
--     the stock glyph range (<= 911) as valid for empty-slot selection. With IDs above
--     911 the by-id lookup still works (socketing + icon render fine) but right-click
--     auto-inscribe always forces slot 0 instead of finding the next empty slot.
-- So custom glyphs must use FREE IDs inside 1-911 (stock is sparse - only 362 of 911
-- used). 90001-90007 (uint16 fail) -> 6001-6007 (auto-inscribe fail) -> 901-907 (free
-- gap 892-910, just under stock max 911). Confirmed range, not sequential - gaps are fine.
--
-- Each row maps a glyph property ID -> the passive modifier spell that alters an
-- Earthwarden ability. The glyph ITEM (item_template) casts an APPLY_GLYPH spell whose
-- misc value is this ID; applying it slots spell_id into the player's glyph slot.

-- Clean up all prior out-of-range IDs (90001-90007, 6001-6007) + the new ones (idempotent).
DELETE FROM `glyphproperties` WHERE `id` IN (90001, 90002, 90003, 90004, 90005, 90006, 90007, 6001, 6002, 6003, 6004, 6005, 6006, 6007, 901, 902, 903, 904, 905, 906, 907);
-- spell_icon_id = a STANDARD glyph-rune icon (stock glyph range 3098-3129), not the
-- ability's icon - this is the icon shown in the socketed glyph slot, and stock
-- glyphs use these runic symbols (e.g. Glyph of Stormstrike = 3123). Distinct per
-- glyph for visual differentiation in the glyph book.
INSERT INTO `glyphproperties` (`id`, `spell_id`, `glyph_slot_flags`, `spell_icon_id`) VALUES
(901, 900270, 0, 3115),  -- Glyph of Rockslam (-1.5s Rockslam cooldown)
(902, 900272, 0, 3118),  -- Glyph of Rocksurge (+5% dmg per Rocksteady stack)
(903, 900274, 0, 3119),  -- Glyph of Tectonic Blast (+20% damage)
(904, 900276, 0, 3122),  -- Glyph of Crag Strike (+20% dmg + Cracked Armor 4->6%/stack)
(905, 900278, 0, 3123),  -- Glyph of Volcanic Shield (+20% eruption damage)
(906, 900280, 0, 3125),  -- Glyph of Rockwall (+6s duration, 12->18s)
(907, 900282, 0, 3126);  -- Glyph of Thunderborne Leap (+1s stun duration)
