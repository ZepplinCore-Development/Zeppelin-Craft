-- I-205: Terokkarantula model swap -> retroported Nightmare Spider.
-- New model entry for Creature\NightmareSpider\NightmareSpider.mdx (M2 + skins
-- shipped in this zpak's source-assets, packed into PATCH-Z).
--
-- Collision / bounding / sound_data inherited from model 892
-- (MineSpider\MineSpiderBoss) which Terokkarantula used previously, so combat
-- reach and footstep audio stay consistent with the old display.

DELETE FROM creaturemodeldata WHERE id = 900005;
INSERT INTO creaturemodeldata SET
    id = 900005,
    flags = 0,
    model_path = 'Creature\\NightmareSpider\\NightmareSpider.mdx',
    size_class = 3,
    model_scale = 1.0,
    blood_id = 2,
    footprint_texture_id = 1,
    footprint_texture_length = 18.0,
    footprint_texture_width = 12.0,
    footprint_particle_scale = 1.0,
    foley_material_id = 0,
    footstep_shake_size = 0,
    death_thud_shake_size = 11,
    sound_data = 789,
    collision_width = 0.6111,
    collision_height = 2.031,
    mount_height = 0.0,
    geo_box_min_x = -2.2025671,
    geo_box_min_y = -2.1987741,
    geo_box_min_z = -0.0185290,
    geo_box_max_x = 3.882278,
    geo_box_max_y = 2.196033,
    geo_box_max_z = 2.0395961,
    world_effect_scale = 1.0,
    attached_effect_scale = 1.0,
    missile_collision_radius = 0.0,
    missile_collision_push = 0.0,
    missile_collision_raise = 0.0;
