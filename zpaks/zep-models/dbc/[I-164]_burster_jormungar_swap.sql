-- I-164: Swap Hellfire bursters to the Jormungar model with red skin
--
-- Background: hd-everything (Maribeth) ships a custom Creature\SANDWORM\Sandworm.m2
-- whose 9 textures are all hardcoded to Creature\CarrionWorm\*.blp — so DBC
-- texture_variation_1 has no effect on bursters under that HD pack. Rather than
-- patching that M2, we swap the burster display IDs to use the stock Jormungar
-- model (model_id 2882), which keeps its native texture_variation_1 slot.
--
-- Stock Jormungar variants demonstrate how the variation slot works:
--   JormungarBlue / JormungarDark / JormungarGreen / JormungarPale / JormungarWhite
-- New variant added here: JormungarRed (BLP shipped in this zpak under
-- mpq/source-assets/Creature/Jormungar/JormungarRed.blp, PATCH-Z).
--
-- Display IDs 900001/900002/900003 are reused from the original SandWorm-based
-- attempt and remapped here; the SandWorm-Hellfire BLPs in this zpak are no
-- longer referenced and have been removed alongside this swap.

DELETE FROM creaturedisplayinfo WHERE id IN (900001, 900002, 900003);

INSERT INTO creaturedisplayinfo SET
  id = 900001,
  model_id = 2882,
  sound_id = 2110,
  extended_display_info_id = 0,
  creature_model_scale = 1.7,
  creature_model_alpha = 255,
  texture_variation_1 = 'JormungarRed',
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
  model_id = 2882,
  sound_id = 829,
  extended_display_info_id = 0,
  creature_model_scale = 3.0,
  creature_model_alpha = 255,
  texture_variation_1 = 'JormungarRed',
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
  model_id = 2882,
  sound_id = 829,
  extended_display_info_id = 0,
  creature_model_scale = 1.85,
  creature_model_alpha = 255,
  texture_variation_1 = 'JormungarRed',
  texture_variation_2 = '',
  texture_variation_3 = '',
  portrait_texture_name = '',
  blood_level = -1,
  blood_id = 0,
  npc_sound_id = 0,
  praticle_color_id = 0,
  creature_geoset_data = 0,
  obj_effect_package_id = 0;
