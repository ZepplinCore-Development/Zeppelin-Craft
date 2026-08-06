-- I-318 : Cluster Cluck (q24671) — the whole visual chain was never ported.
--
-- The F-011 generator carries Cata `spell_visual_1` verbatim, but none of the
-- four SpellVisual ids this quest uses exist in 3.3.5a, so every stage of the
-- capture played NOTHING: no rocket on the bird, no exhaust trail, no cast FX.
-- Same class as I-268 (Kaja'Cola) and I-309 (SpellIcon) — ported at the CATA
-- IDS so the already-ported spell rows resolve with zero spell-row edits and
-- future port waves reuse them.
--
-- Rows copied verbatim from 4.3.4 SpellVisual.dbc (Whitemane 15595 extract).
-- Cata has 33 fields to WotLK's 32; the extra one is appended at the end, so
-- indices 0..31 transfer straight across (see the Cata-visual-port recipe).
--
--   15092 Cluster Cluck: Wild Clucker Loot FX   (spell 66727, the spellclick)
--   15595 Remote Control Fireworks Visual       (spell 74177, THE JETPACK)
--   18167 Remote Control Fireworks              (spell 71170, the item cast)
--   20268 Rocket Trail                          (spell 96840, exhaust in flight)
--
-- Kits land in [I-318]_spellvisualkit.sql, the jetpack attachment in
-- [I-318]_spellvisualkitmodelattach.sql. Client-side only — ships via PATCH-Z,
-- no worldserver restart.

DELETE FROM spellvisual WHERE id = 15092;
INSERT INTO spellvisual SET
  id = 15092,
  precast_kit = 0,
  cast_kit = 0,
  impact_kit = 0,
  state_kit = 13947,
  state_done_kit = 0,
  channel_kit = 0,
  has_missile = 0,
  missile_model = 0,
  missile_path_type = 0,
  missile_dest_attachment = 1,
  missile_sound = 0,
  anim_event_sound_id = 0,
  flags = 0,
  caster_impact_kit = 0,
  target_impact_kid = 0,
  missile_attachment = 4294967295,
  missile_follow_ground_height = 0,
  missile_follow_drop_speed = 300,
  missile_follow_approach = 750,
  missile_follow_ground_flags = 4,
  missile_motion = 0,
  missile_targeting_kit = 0,
  instant_area_kit = 0,
  impact_area_kit = 0,
  persistent_area_kit = 0,
  missile_cast_offset_x = 0,
  missile_cast_offset_y = 0,
  missile_cast_offset_z = 0,
  missile_impact_offset_x = 0,
  missile_impact_offset_y = 0,
  missile_impact_offset_z = 0;

DELETE FROM spellvisual WHERE id = 15595;
INSERT INTO spellvisual SET
  id = 15595,
  precast_kit = 0,
  cast_kit = 0,
  impact_kit = 0,
  state_kit = 14418,
  state_done_kit = 0,
  channel_kit = 0,
  has_missile = 0,
  missile_model = 0,
  missile_path_type = 0,
  missile_dest_attachment = 1,
  missile_sound = 0,
  anim_event_sound_id = 0,
  flags = 0,
  caster_impact_kit = 0,
  target_impact_kid = 0,
  missile_attachment = 4294967295,
  missile_follow_ground_height = 0,
  missile_follow_drop_speed = 300,
  missile_follow_approach = 750,
  missile_follow_ground_flags = 4,
  missile_motion = 0,
  missile_targeting_kit = 0,
  instant_area_kit = 0,
  impact_area_kit = 0,
  persistent_area_kit = 0,
  missile_cast_offset_x = 0,
  missile_cast_offset_y = 0,
  missile_cast_offset_z = 0,
  missile_impact_offset_x = 0,
  missile_impact_offset_y = 0,
  missile_impact_offset_z = 0;

DELETE FROM spellvisual WHERE id = 18167;
INSERT INTO spellvisual SET
  id = 18167,
  precast_kit = 0,
  cast_kit = 17127,
  impact_kit = 0,
  state_kit = 0,
  state_done_kit = 0,
  channel_kit = 0,
  has_missile = 0,
  missile_model = 0,
  missile_path_type = 0,
  missile_dest_attachment = 1,
  missile_sound = 0,
  anim_event_sound_id = 0,
  flags = 0,
  caster_impact_kit = 0,
  target_impact_kid = 0,
  missile_attachment = 4294967295,
  missile_follow_ground_height = 0,
  missile_follow_drop_speed = 300,
  missile_follow_approach = 750,
  missile_follow_ground_flags = 4,
  missile_motion = 0,
  missile_targeting_kit = 0,
  instant_area_kit = 0,
  impact_area_kit = 0,
  persistent_area_kit = 0,
  missile_cast_offset_x = 0,
  missile_cast_offset_y = 0,
  missile_cast_offset_z = 0,
  missile_impact_offset_x = 0,
  missile_impact_offset_y = 0,
  missile_impact_offset_z = 0;

DELETE FROM spellvisual WHERE id = 20268;
INSERT INTO spellvisual SET
  id = 20268,
  precast_kit = 0,
  cast_kit = 0,
  impact_kit = 0,
  state_kit = 19720,
  state_done_kit = 0,
  channel_kit = 0,
  has_missile = 0,
  missile_model = 0,
  missile_path_type = 0,
  missile_dest_attachment = 2,
  missile_sound = 0,
  anim_event_sound_id = 0,
  flags = 0,
  caster_impact_kit = 0,
  target_impact_kid = 0,
  missile_attachment = 2,
  missile_follow_ground_height = 0,
  missile_follow_drop_speed = 300,
  missile_follow_approach = 750,
  missile_follow_ground_flags = 4,
  missile_motion = 0,
  missile_targeting_kit = 0,
  instant_area_kit = 0,
  impact_area_kit = 0,
  persistent_area_kit = 0,
  missile_cast_offset_x = 0,
  missile_cast_offset_y = 0,
  missile_cast_offset_z = 0,
  missile_impact_offset_x = 0,
  missile_impact_offset_y = 0,
  missile_impact_offset_z = 0;
