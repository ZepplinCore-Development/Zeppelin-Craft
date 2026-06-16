-- I-164 (Auchindoun worms): shared Jormungar-white display for the Bone Wastes
-- worms — Bone Crawler (21849), Bone Sifter (22466), Mature Bone Sifter (22482).
-- They all used the dated Creature\BoneWorm\Boneworm.mdx (model_id 2528, display
-- 20617); this defines the replacement display on the Jormungar model (2882),
-- matching the approach used for the Hellfire bursters in this same issue.
--
-- Texture: JormungarWhite is STOCK client content (Creature\Jormungar\
-- JormungarWhite.blp is present in the 3.3.5a file listing), so no BLP needs to
-- be shipped — only this new display row reaches the client via PATCH-Z. The
-- pale/white skin suits the bone/ossuary palette of the Bone Wastes.
--
-- Scale 1.7 mirrors the effective scale the old BoneWorm display (20617) used
-- (creature_model_scale 1.7). Verify in-game — the Jormungar mesh runs slightly
-- larger than BoneWorm, so tune down if it looks oversized.
--
-- Display 900007 is the next free ID in the custom 9000xx range (900001-900006
-- already in use by the bursters / I-191 / I-193).

DELETE FROM creaturedisplayinfo WHERE id = 900007;

INSERT INTO creaturedisplayinfo SET
  id = 900007,
  model_id = 2882,
  sound_id = 2110,
  extended_display_info_id = 0,
  creature_model_scale = 1.7,
  creature_model_alpha = 255,
  texture_variation_1 = 'JormungarWhite',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
