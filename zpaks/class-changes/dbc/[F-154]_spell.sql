-- [F-154] Warrior Class Tuning: spell
-- Counter ability, CD category separation, Battle Shout duration (split from [BASE,F-044]_spell.sql)

-- Counter scaling (shared between spell and desc variable 195)
SET @ctr_dmg_base = 10;
SET @ctr_dmg_die = 1;
SET @ctr_dmg_perlevel = 5.0;
SET @ctr_base_level = 6;
SET @ctr_max_level = 80;
SET @ctr_ap_coeff = 0.1;

-- Counter (new spell)
DELETE FROM `spell` WHERE `id` = 91001;

INSERT INTO `spell` SET
    `id` = 91001,
    `attributes` = 327696,
    `attributes_ex_1` = 131584,
    `attributes_ex_4` = 512,
    `facing_caster_flags` = 1,
    `caster_aura_state` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 6000,
    `proc_chance` = 101,
    `base_level` = @ctr_base_level,
    `spell_level` = @ctr_base_level,
    `duration_index` = 1,
    `power_type` = 1,
    `power_cost` = 50,
    `range_index` = 2,
    `equipped_item_class` = -1,
    `max_level` = @ctr_max_level,
    `effect_1` = 2,
    `effect_2` = 6,
    `effect_die_sides_1` = @ctr_dmg_die,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_real_points_per_level_1` = @ctr_dmg_perlevel,
    `effect_base_points_1` = @ctr_dmg_base,
    `effect_base_points_2` = -11,
    `effect_mechanic_2` = 8,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 6,
    `effect_implicit_target_a_3` = 6,
    `effect_apply_aura_name_2` = 138,
    `spell_visual_1` = 3799,
    `spell_icon_id` = 4388,
    `spell_name_enus` = 'Counter',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'A strike that becomes active after parrying or dodging an opponent''s attack. Deals $<dmg> damage and slows their melee attack speed by $s2% for $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Melee attack speed slowed by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1000,
    `spell_class_set` = 4,
    `spell_class_mask_2` = 256,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_2` = 1.0,
    `spell_desc_variable_id` = 195;

-- Variable 195: Counter tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 195;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (195, CONCAT(
    '$perlevel=${($pl-', @ctr_base_level, ')*', @ctr_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @ctr_ap_coeff, '}\n',
    '$dmg=${$m1+$<perlevel>+$<apbonus>}'));

-- Shield Bash / Pummel - no longer share CD category
UPDATE `spell` SET `recovery_time` = 12000, `category_recovery_time` = 0, `spell_tooltip_flags` = 16712190 WHERE `id` = 72;

UPDATE `spell` SET `stances` = 0, `recovery_time` = 10000, `category_recovery_time` = 0, `base_level` = 4, `spell_level` = 4, `power_cost` = 0, `spell_desc_enus` = 'Interrupts spellcasting and prevents any spell in that school from being cast for $d.', `spell_tooltip_flags` = 16712190 WHERE `id` = 6552;

-- Overpower / Revenge - no longer share CD category
UPDATE `spell` SET `recovery_time` = 5000, `category_recovery_time` = 0, `spell_tooltip_flags` = 16712190 WHERE `id` = 7384;

UPDATE `spell` SET `recovery_time` = 5000, `category_recovery_time` = 0, `spell_tooltip_flags` = 16712190 WHERE `id` = 6572;

UPDATE `spell` SET `recovery_time` = 5000, `category_recovery_time` = 0, `spell_tooltip_flags` = 16712190 WHERE `id` = 6574;

UPDATE `spell` SET `recovery_time` = 5000, `category_recovery_time` = 0, `spell_tooltip_flags` = 16712190 WHERE `id` = 7379;

UPDATE `spell` SET `recovery_time` = 5000, `category_recovery_time` = 0, `spell_tooltip_flags` = 16712190 WHERE `id` = 11600;

UPDATE `spell` SET `recovery_time` = 5000, `category_recovery_time` = 0, `spell_tooltip_flags` = 16712190 WHERE `id` = 11601;

-- Battle Shout - duration increased to 10 minutes (duration_index 6)
UPDATE `spell` SET `duration_index` = 6 WHERE `id` = 5242;

UPDATE `spell` SET `duration_index` = 6 WHERE `id` = 6192;

UPDATE `spell` SET `duration_index` = 6 WHERE `id` = 6673;

UPDATE `spell` SET `duration_index` = 6 WHERE `id` = 11549;

UPDATE `spell` SET `duration_index` = 6 WHERE `id` = 11550;

UPDATE `spell` SET `duration_index` = 6 WHERE `id` = 11551;

