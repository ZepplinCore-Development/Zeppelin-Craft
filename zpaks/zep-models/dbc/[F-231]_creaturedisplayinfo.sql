-- F-231: Gnomeregan Junker Slime displays on model 900240 ([F-231]_creaturemodeldata.sql).
-- The model is 12.5 yd tall at scale 1; 0.15 matches the stock slime (1.84 yd, display 358)
-- and 0.30 the double-size Corrosive Lurker (display 11137 at 2.0).
-- Texture slot 0 is the only variation slot (type 11); the skins are retail's
-- 2918539 (green) and 2492632 (black oil), shipped as JunkerSlimeSkin*.blp.
-- Blood level / sound copied from 358 and 11137.

DELETE FROM creaturedisplayinfo WHERE id IN (900600, 900601);
INSERT INTO creaturedisplayinfo SET
  id = 900600,
  model_id = 900240,
  sound_id = 0,
  extended_display_info_id = 0,
  creature_model_scale = 0.15,
  creature_model_alpha = 255,
  texture_variation_1 = 'JunkerSlimeSkinGreen',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = 1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
INSERT INTO creaturedisplayinfo SET
  id = 900601,
  model_id = 900240,
  sound_id = 0,
  extended_display_info_id = 0,
  creature_model_scale = 0.30,
  creature_model_alpha = 255,
  texture_variation_1 = 'JunkerSlimeSkinBlack',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
