-- I-164: Red HD sandworm skin variants for Hellfire Peninsula bursters.
-- Clones of stock DisplayIDs 16395 / 15774 / 16573 with texture paths pointing
-- at the new Hellfire red BLPs in the hd-everything zpak. Keeps Ouro (AQ40)
-- and all non-Hellfire sandworm users on the existing blue HD textures.

DELETE FROM creaturedisplayinfo WHERE id IN (900001, 900002, 900003);

INSERT INTO creaturedisplayinfo SET
  id = 900001,
  model_id = 2218,
  sound_id = 2110,
  extended_display_info_id = 0,
  creature_model_scale = 1.7,
  creature_model_alpha = 255,
  texture_variation_1 = 'SandWorm-Hellfire',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;

INSERT INTO creaturedisplayinfo SET
  id = 900002,
  model_id = 2218,
  sound_id = 829,
  extended_display_info_id = 0,
  creature_model_scale = 3.0,
  creature_model_alpha = 255,
  texture_variation_1 = 'SandWorm-Hellfire-SpecAlpha',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;

INSERT INTO creaturedisplayinfo SET
  id = 900003,
  model_id = 2218,
  sound_id = 829,
  extended_display_info_id = 0,
  creature_model_scale = 1.85,
  creature_model_alpha = 255,
  texture_variation_1 = 'SandWorm-Hellfire-SpecAlpha',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
