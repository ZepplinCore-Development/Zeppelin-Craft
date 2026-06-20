-- I-191: Swap Zangarmarsh eel displays to the SeaEel model (900003,
-- defined in [I-191]_creaturemodeldata.sql).
--
-- Sweep result (map 530, Zangarmarsh):
--   19286 (was ManaWurmSkinGreen  x3.0) — Umbrafen Eel 18138, 69 spawns,
--          display exclusive to this creature -> UPDATE in place.
--   18147 (was ManaWurmSkinSilver x3.5) — Shimmerscale Eel 18750, 15 spawns,
--          display exclusive to this creature -> UPDATE in place.
--   19287 (ManaWurmSkinPurple x3.0) — Lagoon Eel 20290, 43 spawns, but the
--          display is SHARED with Nether Beast 19731 (94 Netherstorm spawns)
--          -> new display 900004 below; creature_template_model repoint in
--          sql/zz_[I-191]_zangarmarsh_eels.sql.
--
-- Colour flavour per eel (monstrouseel set, _1 = type11 slot,
-- _2 = type12 slot):
--   Umbrafen green, Lagoon blue (watery), Shimmerscale white (silvery).
-- Scales: MonstrousEel is ~8u native; 0.8 / 0.8 / 1.0 gives the larger
-- in-game size the user preferred (~6.4-8u effective).
--
-- MonstrousEel has TWO texture variation slots (type 11 = variation_1 =
-- *_1.blp, type 12 = variation_2 = *_2.blp).
--
-- Out of scope (noted in I-191): Siltslither Eel 28847 (display 19600,
-- shared with Mana Wyrmling) — summoned by GO 190779 'Raised Mud' in
-- Sholazar Basin, not a Zangarmarsh spawn.

-- Umbrafen Eel (stock display, exclusive)
UPDATE creaturedisplayinfo SET
  model_id = 900003,
  creature_model_scale = 0.8,
  texture_variation_1 = 'MonstrousEel_Green_1',
  texture_variation_2 = 'MonstrousEel_Green_2'
WHERE id = 19286;

-- Shimmerscale Eel (stock display, exclusive)
UPDATE creaturedisplayinfo SET
  model_id = 900003,
  creature_model_scale = 1.0,
  texture_variation_1 = 'MonstrousEel_White_1',
  texture_variation_2 = 'MonstrousEel_White_2'
WHERE id = 18147;

-- Lagoon Eel — new display (19287 stays on ManaWurm for Nether Beast)
DELETE FROM creaturedisplayinfo WHERE id = 900004;
INSERT INTO creaturedisplayinfo SET
  id = 900004,
  model_id = 900003,
  sound_id = 0,
  extended_display_info_id = 0,
  creature_model_scale = 0.8,
  creature_model_alpha = 255,
  texture_variation_1 = 'MonstrousEel_Blue_1',
  texture_variation_2 = 'MonstrousEel_Blue_2',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
