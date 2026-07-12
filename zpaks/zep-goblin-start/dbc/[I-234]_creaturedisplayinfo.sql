-- [I-234] display 900103 -> modern forest-troll model 900006 (WXL). Cloned from 298;
-- texture handling may need refinement in-client (I-235) — modern model self-textures via its TXID BLP.
DELETE FROM creaturedisplayinfo WHERE id=900103;
INSERT INTO creaturedisplayinfo SET
  `id` = 900103,
  `model_id` = 900006,
  `sound_id` = 0,
  `extended_display_info_id` = 0,
  `creature_model_scale` = '1.2500000000000000',
  `creature_model_alpha` = 255,
  `texture_variation_1` = 'TrollSkinJungleForestMelee',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = -1,
  `blood_id` = 0,
  `npc_sound_id` = 0,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;
