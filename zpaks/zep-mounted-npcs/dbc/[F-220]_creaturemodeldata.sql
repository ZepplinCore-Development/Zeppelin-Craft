-- F-220: riderless mounts cut out of fused rider models (cli/lib/strip_rider.py); the model
-- files ship in this zpak's mpq. 9002xx creaturemodeldata: 900220+ = F-220.

-- 900220 = TeronGorefiend_Horse: TeronGorefiend_Mounted (model 2568) without Teron.
DELETE FROM creaturemodeldata WHERE id = 900220;
INSERT INTO creaturemodeldata SET
  id = 900220,
  flags = 0,
  model_path = 'Creature\\TeronGorefiend_Mounted\\TeronGorefiend_Horse.mdx',
  size_class = 1,
  model_scale = 1,
  blood_id = 3,
  footprint_texture_id = 4294967295,
  footprint_texture_length = 0,
  footprint_texture_width = 0,
  footprint_particle_scale = 0,
  foley_material_id = 0,
  footstep_shake_size = 0,
  death_thud_shake_size = 0,
  sound_data = 2427,
  collision_width = 0.6111000180244446,
  collision_height = 2.0309998989105225,
  mount_height = 0.9738699793815613,
  geo_box_min_x = -1.8885120153427124,
  geo_box_min_y = -0.9346820116043091,
  geo_box_min_z = -0.0027950000949204,
  geo_box_max_x = 1.9566539525985718,
  geo_box_max_y = 0.9359130263328552,
  geo_box_max_z = 3.4444620609283447,
  world_effect_scale = 0.1000000014901161,
  attached_effect_scale = 1,
  missile_collision_radius = 0,
  missile_collision_push = 0,
  missile_collision_raise = 0;
