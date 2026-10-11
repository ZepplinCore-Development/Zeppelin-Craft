-- F-220: mount displays for NPCs that used a fused rider+mount model.
--
-- 900401 = Zul'Gurub bat mount: the taxi bat (model 331, Creature\FelBat\BatTaxi)
-- in the Bloodseeker Bat brown skin (display 14562 = BatSkinBrown01). The shipped
-- BatTaxi.m2 (HD pack) skins body/wings/saddle through display slots 11/12/13 and
-- has seat attachment 0 + stand/run/attack/wound/death/fly anims. The ZG
-- BatSknn01/02 textures are the old FelBat UV layout and do NOT fit this mesh;
-- BatSkinBrown01/02 are the taxi atlas. Slot 3 keeps the stock saddle (Taxi3).
-- Cloned from 1566 (Forsaken taxi bat), only the skins differ.

DELETE FROM creaturedisplayinfo WHERE id = 900401;
INSERT INTO creaturedisplayinfo SET
  id = 900401,
  model_id = 331,
  sound_id = 308,
  extended_display_info_id = 0,
  creature_model_scale = 1,
  creature_model_alpha = 255,
  texture_variation_1 = 'BatSkinBrown01',
  texture_variation_2 = 'BatSkinBrown02',
  texture_variation_3 = 'Taxi3',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
