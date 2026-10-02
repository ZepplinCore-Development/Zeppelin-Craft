-- [F-211] Retired wardrobe displays: ids no manifest builds any more.
-- The generated [AUTO,F-211] files only own the ids they still emit, so retirements live here.
--
-- NEVER DELETE a retired display, and never leave one pointing at a bake that no longer ships.
-- A creature keeps the display it rolled when it SPAWNED, so a deleted row leaves every live
-- spawn holding it as a blue cube (Orgrimmar Grunts on 900341, 2026-10-02) and a missing bake
-- leaves it untextured. Alias the id to a current appearance instead: the spawns correct
-- themselves on their next respawn or the next worldserver restart, and the row costs nothing.
--
-- Keep each alias on an extra of the SAME SEX as the retired id's model_id (51 male / 52 female):
-- the variant order inside a manifest decides which id is which sex, so re-check these whenever
-- a manifest's variant counts change.

-- 900303: Orgrimmar-set male, trimmed variant. Aliases extra 900301.
DELETE FROM `creaturedisplayinfo` WHERE `id` = 900303;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900303,
  `model_id` = 51,
  `sound_id` = 0,
  `extended_display_info_id` = 900301,
  `creature_model_scale` = 1,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = 0,
  `blood_id` = 0,
  `npc_sound_id` = 60,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;

-- 900304: Orgrimmar-set male (no tabard), trimmed variant. Aliases extra 900302.
DELETE FROM `creaturedisplayinfo` WHERE `id` = 900304;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900304,
  `model_id` = 51,
  `sound_id` = 0,
  `extended_display_info_id` = 900302,
  `creature_model_scale` = 1,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = 0,
  `blood_id` = 0,
  `npc_sound_id` = 60,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;

-- 900307: Orgrimmar-set female, trimmed variant. Aliases extra 900305.
DELETE FROM `creaturedisplayinfo` WHERE `id` = 900307;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900307,
  `model_id` = 52,
  `sound_id` = 0,
  `extended_display_info_id` = 900305,
  `creature_model_scale` = 1,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = 0,
  `blood_id` = 0,
  `npc_sound_id` = 60,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;

-- 900308: Orgrimmar-set female (no tabard), trimmed variant. Aliases extra 900306.
DELETE FROM `creaturedisplayinfo` WHERE `id` = 900308;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900308,
  `model_id` = 52,
  `sound_id` = 0,
  `extended_display_info_id` = 900306,
  `creature_model_scale` = 1,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = 0,
  `blood_id` = 0,
  `npc_sound_id` = 60,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;

-- 900313: heritage female with helm, trimmed when the helm was dropped. Aliases extra 900331.
DELETE FROM `creaturedisplayinfo` WHERE `id` = 900313;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900313,
  `model_id` = 52,
  `sound_id` = 0,
  `extended_display_info_id` = 900331,
  `creature_model_scale` = 1,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = 0,
  `blood_id` = 0,
  `npc_sound_id` = 60,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;

-- 900314: heritage female with helm, trimmed when the helm was dropped. Aliases extra 900332.
DELETE FROM `creaturedisplayinfo` WHERE `id` = 900314;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900314,
  `model_id` = 52,
  `sound_id` = 0,
  `extended_display_info_id` = 900332,
  `creature_model_scale` = 1,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = 0,
  `blood_id` = 0,
  `npc_sound_id` = 60,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;

-- 900341: heritage + Orgrimmar belt trial; that belt is now the heritage belt. Aliases extra 900311.
DELETE FROM `creaturedisplayinfo` WHERE `id` = 900341;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900341,
  `model_id` = 51,
  `sound_id` = 0,
  `extended_display_info_id` = 900311,
  `creature_model_scale` = 1,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = 0,
  `blood_id` = 0,
  `npc_sound_id` = 60,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;

-- 900342: heritage + Orgrimmar belt trial; that belt is now the heritage belt. Aliases extra 900331.
DELETE FROM `creaturedisplayinfo` WHERE `id` = 900342;
INSERT INTO `creaturedisplayinfo` SET
  `id` = 900342,
  `model_id` = 52,
  `sound_id` = 0,
  `extended_display_info_id` = 900331,
  `creature_model_scale` = 1,
  `creature_model_alpha` = 255,
  `texture_variation_1` = '',
  `texture_variation_2` = '',
  `texture_variation_3` = '',
  `portrait_texture_name` = '',
  `blood_level` = 0,
  `blood_id` = 0,
  `npc_sound_id` = 60,
  `praticle_color_id` = 0,
  `creature_geoset_data` = 0,
  `obj_effect_package_id` = 0;
