-- [F-149] zepcraft-legacy: creaturefamily
-- Cloud Serpent hunter pet family

-- creaturefamily: 1 inserts
DELETE FROM `creaturefamily` WHERE `id` = 47;
INSERT INTO `creaturefamily` (`id`, `min_scale`, `min_scale_level`, `max_scale`, `max_scale_level`, `skill_line_1`, `skill_line_2`, `pet_food_mask`, `pet_talent_type`, `category_enum_id`, `name_enus`, `name_flags`, `icon`) VALUES (47, '0.4000000059604645', 1, '0.5000000000000000', 60, 900, 270, 1, 1, 64, 'Cloud Serpent', 16712190, 'InterfaceIconsSpell_Nature_GuardianWard');
