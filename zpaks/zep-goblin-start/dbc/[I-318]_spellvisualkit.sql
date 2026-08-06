-- I-318 : Cluster Cluck (q24671) — SpellVisualKit half of the visual port.
--
-- Ported from 4.3.4 SpellVisualKit.dbc (Whitemane 15595 extract) at the CATA
-- IDS, to match [I-318]_spellvisual.sql. Cata has 39 fields to WotLK's 38: 4.0
-- inserted AnimKitID at index 3, so every Cata field from index 3 on is
-- WotLK + 1 (head/chest/base/hands at Cata 4-8, world 15, sound 16, shake 17,
-- char_procs 18-21). char_proc_1..4 must stay -1 (4294967295).
--
-- Payload audit — every referenced id already exists in stock 3.3.5a, so this
-- port ships ZERO assets:
--   3672 "Loot FX"      particles\lootfx.mdx   — stock
--   1345 "Flame Breath" Spells\FlameBreath.mdx — stock
--   6127 "JetPack"      spells\jetpack.mdx     — stock (ICC Rocket Pack); Cata
--   6135 "JetPack Flame Only"                    renumbered these to 6507/6508,
--                                                remapped in the attach file
--   sounds 16329 (flame loop) and 17480 (rocket explosion) — stock
--
-- Kit 17127 drops Cata AnimKitID 954 (no 3.3.5a equivalent) and remaps its
-- Cata-only cast sound 22806 (SPELL_FreethePrideling_Cast, ThrowNet.ogg) to the
-- WotLK row carrying the same clip, 3228 ThrowNet.

-- 15092 state kit — the sparkle when a clucker is clicked.
DELETE FROM spellvisualkit WHERE id = 13947;
INSERT INTO spellvisualkit SET
  id = 13947,
  start_anim_id = 4294967295,
  anim_id = 4294967295,
  chest_effect = 3672,
  char_proc_1 = 4294967295,
  char_proc_2 = 4294967295,
  char_proc_3 = 4294967295,
  char_proc_4 = 4294967295;

-- 15595 state kit — the jetpack itself. The two models hang off the
-- SpellVisualKitModelAttach rows, not the effect slots.
DELETE FROM spellvisualkit WHERE id = 14418;
INSERT INTO spellvisualkit SET
  id = 14418,
  start_anim_id = 4294967295,
  anim_id = 4294967295,
  sound_id = 16329,
  char_proc_1 = 4294967295,
  char_proc_2 = 4294967295,
  char_proc_3 = 4294967295,
  char_proc_4 = 4294967295;

-- 18167 cast kit — the noise when the remote is used.
DELETE FROM spellvisualkit WHERE id = 17127;
INSERT INTO spellvisualkit SET
  id = 17127,
  start_anim_id = 4294967295,
  anim_id = 4294967295,
  sound_id = 3228,
  char_proc_1 = 4294967295,
  char_proc_2 = 4294967295,
  char_proc_3 = 4294967295,
  char_proc_4 = 4294967295;

-- 20268 state kit — exhaust trail while the bird is airborne.
DELETE FROM spellvisualkit WHERE id = 19720;
INSERT INTO spellvisualkit SET
  id = 19720,
  start_anim_id = 4294967295,
  anim_id = 4294967295,
  sound_id = 17480,
  char_proc_1 = 4294967295,
  char_proc_2 = 4294967295,
  char_proc_3 = 4294967295,
  char_proc_4 = 4294967295;
