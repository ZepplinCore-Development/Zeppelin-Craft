-- I-318 : Cluster Cluck (q24671) — this is the file that puts the rocket on
-- the chicken. SpellVisualKit only names anims/sounds/slot effects; a model
-- bolted to an attachment point comes from SpellVisualKitModelAttach.
--
-- Ported from 4.3.4 SpellVisualKitModelAttach.dbc (rows 4151/4152/8349) with
-- two changes:
--   * SpellVisualEffectName remapped Cata -> WotLK. Cata 6507/6508 are
--     spells\jetpack.mdx and spells\jetpack_flame.mdx, which 3.3.5a already
--     ships as 6127/6135 (the ICC Rocket Pack). Nothing to build or pack.
--   * ids taken from our 90xxx custom block, not the Cata ids — 4151/4152/8349
--     are live stock rows here, and nothing references an attach id.
--
-- Attachment 34 is CHEST, and BUSHCHICKEN.M2 (display 30969-30971, the Wild
-- Clucker) does define attachment 34 on bone 32 — verified against the shipped
-- model, so the jetpack rides the bird's back rather than falling to origin.
--
-- Offsets/rotations are verbatim Cata: the jetpack pair is pitched -pi (worn
-- facing aft), the trail sits 2 yards behind the base attachment yawed pi.

DELETE FROM spellvisualkitmodelattach WHERE id IN (90001, 90002, 90003);

-- Kit 14418 (SpellVisual 15595, aura 74177) — the strapped-on rocket.
INSERT INTO spellvisualkitmodelattach SET
  id = 90001,
  parent_spell_vis_kit_id = 14418,
  spell_vis_effect_name_id = 6127,
  attachment_id = 34,
  offset_x = 0,
  offset_y = 0,
  offset_z = 0,
  yaw = 0,
  pitch = -3.1415929794311523,
  roll = 0;

INSERT INTO spellvisualkitmodelattach SET
  id = 90002,
  parent_spell_vis_kit_id = 14418,
  spell_vis_effect_name_id = 6135,
  attachment_id = 34,
  offset_x = 0,
  offset_y = 0,
  offset_z = 0,
  yaw = 0,
  pitch = -3.1415929794311523,
  roll = 0;

-- Kit 19720 (SpellVisual 20268, spell 96840 Rocket Trail) — the exhaust plume,
-- Flame Breath fired backwards off the base attachment.
INSERT INTO spellvisualkitmodelattach SET
  id = 90003,
  parent_spell_vis_kit_id = 19720,
  spell_vis_effect_name_id = 1345,
  attachment_id = 19,
  offset_x = -2.0,
  offset_y = 0,
  offset_z = 0.10000000149011612,
  yaw = 3.1415927410125732,
  pitch = 0,
  roll = 0;
