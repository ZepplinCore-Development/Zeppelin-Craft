-- I-191: MonstrousEel model for Zangarmarsh eels (final).
--
-- The three Zangarmarsh eels (Umbrafen 18138, Lagoon 20290, Shimmerscale
-- 18750) all used the ManaWurm model (creaturemodeldata 2210) whose particle
-- effects render incorrectly and whose death-orb attachment has a massive Z
-- offset (orb launched ~10yd into the air on death).
--
-- Model saga (full detail in I-191): MonstrousEel (Legion) absolute-frame
-- desync, SeaSnake (Cata) coil-snap rejected, SeaEel (BfA) modern keybones
-- no attack, ElectricEel (DF) heavyweight crash. Converter ruled out (Legion
-- == Shadowlands MultiConverter core).
--
-- FINAL: back to MonstrousEel (FDID 369377), freshly re-exported by user with
-- LOD skins, retroported via the wine toolchain (MD21->MD20). It loads cleanly
-- (36 bones, 35 cam / 10 light / 4 particle — modest, no crash) and has the
-- classic keybones (head=6@4, root=26@1, jaw=7@6). Its native attack baked a
-- 2.77u whole-body lunge into the head subtree (the original head-launch /
-- skin-stretch bug). Two post-conversion fixes applied (see Retroport note):
--   1. globalFlags 0x202089 -> 0x9 (strip modern bits the 3.3.5 client
--      mis-reads).
--   2. Combat-sequence translations (ready/attack/crit/wound) damped to
--      <=0.45u per bone, ROTATIONS untouched — converts the un-renderable
--      lunge into a stock-ManaWurm-style rotation-driven snap. head-subtree
--      attack translation 2.77 -> 0.45.
--
-- collision / footprint / sound_data inherited from ManaWurm 2210. Geo box
-- from M2 vertex bounds (model ~8u long — per-display scale 0.8-1.0).

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
  geo_box_min_x = -2.91,
  geo_box_min_y = -2.42,
  geo_box_min_z = -1.31,
  geo_box_max_x = 5.12,
  geo_box_max_y = 3.43,
  geo_box_max_z = 5.18,
  world_effect_scale = 1.0,
  attached_effect_scale = 1.0,
  missile_collision_radius = 0.0,
  missile_collision_push = 0.0,
  missile_collision_raise = 0.0;
