-- I-396: split HD lasher displays. texture_variation_1 = stem/roots/vine arms, _2 = petals/leaves,
-- _3 = beak/jaw/teeth; any of the folder's skins in any slot: lasher_<natural|black|blue|brown|green|
-- indigo|red|turquoise|violet|white>, orchid_<black|blue|brown|green|indigo|purple|red|turquoise|white>.
-- All three slots must be filled or that part draws untextured.
-- creature_geoset_data picks the petal pattern (geoset group 1, drawn over texture_variation_2):
-- 0x1 = plain (101), 0x2 = spots (102), 0x3 = stripes (103). Never 0: that draws both patterns.
-- 900403 = the picker's template (one colour on all parts; the picker swaps in the display's own colour).
-- 900404 = mixed-colour example with spots. Copy either in the Display editor (Save as new display) for each look.

DELETE FROM creaturedisplayinfo WHERE id IN (900403, 900404);
INSERT INTO creaturedisplayinfo SET
    id = 900403,
    model_id = 900206,
    sound_id = 0,
    extended_display_info_id = 0,
    creature_model_scale = 1.0,
    creature_model_alpha = 255,
    texture_variation_1 = 'lasher_natural',
    texture_variation_2 = 'lasher_natural',
    texture_variation_3 = 'lasher_natural',
    portrait_texture_name = '',
    blood_level = -1,
    blood_id = 0,
    npc_sound_id = 0,
    praticle_color_id = 0,
    creature_geoset_data = 1,
    obj_effect_package_id = 0;
INSERT INTO creaturedisplayinfo SET
    id = 900404,
    model_id = 900206,
    sound_id = 0,
    extended_display_info_id = 0,
    creature_model_scale = 1.0,
    creature_model_alpha = 255,
    texture_variation_1 = 'lasher_green',
    texture_variation_2 = 'orchid_purple',
    texture_variation_3 = 'orchid_red',
    portrait_texture_name = '',
    blood_level = -1,
    blood_id = 0,
    npc_sound_id = 0,
    praticle_color_id = 0,
    creature_geoset_data = 2,
    obj_effect_package_id = 0;
