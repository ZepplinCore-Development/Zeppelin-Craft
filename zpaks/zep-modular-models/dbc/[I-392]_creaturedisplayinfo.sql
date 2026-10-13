-- I-392: template display for the split-armour dragonspawn: red body, red armour, full heavy set.
-- Copy it in the Display editor (Save as new display) for each look.
-- creature_geoset_data: nibble k = group k+1. Groups: 1 chest, 2 waist, 3 horns, 4 ears/jaw,
-- 5 helmet, 6 left shoulder, 7 right shoulder, 8 bracers/gauntlets/boots.
-- Skin 3 colours the boss pieces 508 / 608 / 708 (dragonspawn2boss_armor_<black (retail gold)|red|blue|bronze|green|purple|nexus|dark>).
-- 2004291879 (0x77771127) = chest 107, waist 202, horns 301, ears 401, helmet 507, shoulders 607 / 707, limbs 807.

DELETE FROM creaturedisplayinfo WHERE id = 900402;
INSERT INTO creaturedisplayinfo SET
    id = 900402,
    model_id = 900205,
    sound_id = 0,
    extended_display_info_id = 0,
    creature_model_scale = 1.0,
    creature_model_alpha = 255,
    texture_variation_1 = 'dragonspawn2_body_red',
    texture_variation_2 = 'dragonspawn2_armor_red',
    texture_variation_3 = 'dragonspawn2boss_armor_red',
    portrait_texture_name = '',
    blood_level = -1,
    blood_id = 0,
    npc_sound_id = 0,
    praticle_color_id = 0,
    creature_geoset_data = 2004291879,
    obj_effect_package_id = 0;

-- I-392: template display for the Infinite modular dragonspawn (model 900207): retail darkshade body + armour, dark boss armour.
DELETE FROM creaturedisplayinfo WHERE id = 900534;
INSERT INTO creaturedisplayinfo SET
    id = 900534,
    model_id = 900207,
    sound_id = 0,
    extended_display_info_id = 0,
    creature_model_scale = 1.0,
    creature_model_alpha = 255,
    texture_variation_1 = 'dragonspawn2darkshade_body',
    texture_variation_2 = 'dragonspawn2darkshade_armor',
    texture_variation_3 = 'dragonspawn2boss_armor_dark',
    portrait_texture_name = '',
    blood_level = -1,
    blood_id = 0,
    npc_sound_id = 0,
    praticle_color_id = 0,
    creature_geoset_data = 2004291879,
    obj_effect_package_id = 0;
