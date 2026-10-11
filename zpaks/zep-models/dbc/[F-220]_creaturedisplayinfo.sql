-- F-220: rider displays for NPCs moved off a fused rider+mount model.
-- The mount half lives in zep-mounted-npcs (disabled until shipped): there the
-- ORIGINAL fused display becomes the riderless mount, so the F-216 picker compares
-- it against stock / pack options with the Rider toggle on.
--
-- 900401 = Gurubashi Bat Rider's rider: copy of 4609 (Lau'Tiki, TrollMale, blue
-- skin, bare chest, dark leather legs; extra 2866 = shipped _HD bake). TrollMale.m2
-- carries the Mount anim (91). Its mount = 15303 (zep-mounted-npcs).
-- (900401 was briefly a bat mount display in PATCH-Z v38E; only the unspawned test
-- entry 902201 ever used it.)

DELETE FROM creaturedisplayinfo WHERE id = 900401;
INSERT INTO creaturedisplayinfo SET
  id = 900401,
  model_id = 185,
  sound_id = 0,
  extended_display_info_id = 2866,
  creature_model_scale = 1,
  creature_model_alpha = 255,
  texture_variation_1 = '',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = 1,
  blood_id = 0,
  npc_sound_id = 78,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
