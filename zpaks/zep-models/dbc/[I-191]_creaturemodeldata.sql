-- I-191: MonstrousEel model for Zangarmarsh eels.
--
-- The three Zangarmarsh eels (Umbrafen 18138, Lagoon 20290, Shimmerscale
-- 18750) all use the ManaWurm model (creaturemodeldata 2210) whose particle
-- effects render incorrectly and whose death-orb attachment has a massive Z
-- offset (orb launched ~10yd into the air on death). Swap to the retail
-- MonstrousEel backport (WotLK MD20 v264, shipped in this zpak under
-- mpq/source-assets/Creature/MonstrousEel/, PATCH-Z).
--
-- The M2 is a fresh retroport (Legion v274 -> WotLK v264) made with the
-- Retroport toolchain (Zeppelin-Tools/Retroport, run under wine) from the
-- retail m2 + skin FDID 478235. Its hardcoded textures resolve to STOCK
-- 3.3.5 client paths (Creature\ManaWurm\ManaWurmSkinGreen.blp,
-- Item\ObjectComponents\Weapon\flare.blp, ...\Head\smoothreflect.blp) so
-- only the m2/skin/variation BLPs ship in this zpak. Skin variations come
-- from texture slots type 11 (variation_1, *_1.blp) and type 12
-- (variation_2, *_2.blp).
--
-- collision / footprint / sound_data inherited from 2210 (ManaWurm) so the
-- eels keep their existing audio and combat footprint. Geo box taken from
-- the M2 vertex bounds (model is ~11.5 units long natively — per-display
-- creature_model_scale drops from the wurm's 3.0-3.5 to ~0.4).

DELETE FROM creaturemodeldata WHERE id = 900003;
INSERT INTO creaturemodeldata SET
  id = 900003,
  flags = 1,
  model_path = 'Creature\\MonstrousEel\\MonstrousEel.mdx',
  size_class = 1,
  model_scale = 1.0,
  blood_id = 1,
  footprint_texture_id = 4294967295,
  footprint_texture_length = 0.0,
  footprint_texture_width = 0.0,
  footprint_particle_scale = 0.0,
  foley_material_id = 0,
  footstep_shake_size = 0,
  death_thud_shake_size = 0,
  sound_data = 2103,
  collision_width = 0.6111,
  collision_height = 2.031,
  mount_height = 0.0,
  geo_box_min_x = -3.5904,
  geo_box_min_y = -4.2682,
  geo_box_min_z = -1.3056,
  geo_box_max_x = 7.8812,
  geo_box_max_y = 3.9844,
  geo_box_max_z = 12.8800,
  world_effect_scale = 1.0,
  attached_effect_scale = 1.0,
  missile_collision_radius = 0.0,
  missile_collision_push = 0.0,
  missile_collision_raise = 0.0;
