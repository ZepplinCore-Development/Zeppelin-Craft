-- I-205: Boss-sized Nightmare Spider display for Terokkarantula (20682).
--
-- Model 900005 = retroported Nightmare Spider ([I-205]_creaturemodeldata.sql).
-- The M2's three textures are all type 0 (hardcoded/baked): Spider_Nightmare,
-- ArmorReflect4, Spider_Nightmare_Glow. texture_variation slots therefore have
-- NO effect on this model and are left empty.
-- sound_id carried over from the previous Terokkarantula display (19716).
-- creature_model_scale kept NEUTRAL (1.0); final size is driven server-side via
-- creature_template_model.DisplayScale (see zz_[I-205]_*.sql) so size can be
-- tuned with a world SQL + .reload, with no client patch rebuild. DisplayScale
-- also scales combat reach/bounding radius (Creature.cpp), unlike DBC scale.

DELETE FROM creaturedisplayinfo WHERE id = 900006;
INSERT INTO creaturedisplayinfo SET
  id = 900006,
  model_id = 900005,
  sound_id = 227,
  extended_display_info_id = 0,
  creature_model_scale = 1.0,
  creature_model_alpha = 255,
  texture_variation_1 = '',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = 0,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
