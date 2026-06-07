-- I-193: Red WoD fungal giant display for the Withered Giant (18124) so the
-- Dead Mire bog lords get visual variation (Withered Bog Lord 19402 stays
-- yellow classic).
--
-- Model 900004 = retroported WoD fungal giant ([I-193]_creaturemodeldata.sql).
-- Texture variation slots on that M2: 1 = skin, 2 = glow, 3 = moss overlay.
-- Skin is retail's red colorway (wago FDID 1041867, fungalgiant_draenorred.blp).
-- sound_id / blood / particle color inherited from stock display 19687.

DELETE FROM creaturedisplayinfo WHERE id = 900005;
INSERT INTO creaturedisplayinfo SET
  id = 900005,
  model_id = 900004,
  sound_id = 2260,
  extended_display_info_id = 0,
  creature_model_scale = 1.25,
  creature_model_alpha = 255,
  texture_variation_1 = 'FungalGiant_DraenorRed',
  texture_variation_2 = 'DraenorFungalGiantGlowRed',
  texture_variation_3 = 'DraenorFungalGiantMoss',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 323,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;

-- Scale standardisation: bring Withered Bog Lord's stock display (18823, only
-- used by creature 19402) down from 1.75 to match the Withered Giant at 1.25.
UPDATE creaturedisplayinfo SET creature_model_scale = 1.25 WHERE id = 18823;
