-- [F-155] Paladin Class Tuning: spell
-- Chastise ability, Blessing duration increases (split from [BASE,F-044]_spell.sql)

-- Chastise scaling (shared between spell and desc variable 196)
SET @cht_dmg_base = 10;
SET @cht_dmg_die = 1;
SET @cht_dmg_perlevel = 5.0;
SET @cht_base_level = 6;
SET @cht_max_level = 80;
SET @cht_ap_coeff = 0.1;

-- Chastise (new spell 91002)
-- A strike that becomes active after parrying or dodging an opponent's attack.
-- Deals 50% weapon damage and slows melee attack speed by 10% for 10 seconds.
DELETE FROM `spell` WHERE `id` = 91002;

INSERT INTO `spell` SET
    `id` = 91002,
    `attributes` = 327696,
    `attributes_ex_1` = 131584,
    `attributes_ex_4` = 512,
    `facing_caster_flags` = 1,
    `caster_aura_state` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 6000,
    `proc_chance` = 101,
    `base_level` = @cht_base_level,
    `spell_level` = @cht_base_level,
    `duration_index` = 1,
    `range_index` = 2,
    `equipped_item_class` = -1,
    `max_level` = @cht_max_level,
    `effect_1` = 2,
    `effect_2` = 6,
    `effect_die_sides_1` = @cht_dmg_die,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_real_points_per_level_1` = @cht_dmg_perlevel,
    `effect_base_points_1` = @cht_dmg_base,
    `effect_base_points_2` = -11,
    `effect_mechanic_2` = 8,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 6,
    `effect_implicit_target_a_3` = 6,
    `effect_apply_aura_name_2` = 138,
    `spell_visual_1` = 3799,
    `spell_icon_id` = 4919,
    `spell_name_enus` = 'Chastise',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'A strike that becomes active after parrying or dodging an opponent''s attack. Deals $<dmg> damage and slows their melee attack speed by $s2% for $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Melee attack speed slowed by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 5,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1000,
    `spell_class_set` = 10,
    `spell_class_mask_2` = 256,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_2` = 1.0,
    `spell_desc_variable_id` = 196;

-- Variable 196: Chastise tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 196;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (196, CONCAT(
    '$perlevel=${($pl-', @cht_base_level, ')*', @cht_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @cht_ap_coeff, '}\n',
    '$dmg=${$m1+$<perlevel>+$<apbonus>}'));

-- Blessing durations increased to 30 minutes (duration_index 30)
-- Blessing of Might, Wisdom, Kings, Sanctuary (all ranks)
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19740;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19742;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19834;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19835;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19836;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19837;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19838;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19850;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19852;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19853;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19854;

UPDATE `spell` SET `duration_index` = 30, `spell_subtext_flags` = 16712190 WHERE `id` = 20217;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 20911;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 25290;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 25291;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 27140;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 27142;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 48931;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 48932;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 48935;

UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 48936;

-- Greater Blessing durations increased to 60 minutes (duration_index 42)
-- Greater Blessing of Might, Wisdom, Kings, Sanctuary (all ranks)
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 25894;

UPDATE `spell` SET `duration_index` = 42, `reagent_1` = 58302, `spell_subtext_flags` = 16712190, `power_cost_percentage` = 0 WHERE `id` = 25898;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 25899;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 25916;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 25918;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 27141;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 27143;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 48933;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 48934;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 48937;

UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 48938;

-- Improved Blessing of Butts (duration_index 36)
UPDATE `spell` SET `duration_index` = 36, `spell_name_enus` = 'Improved Blessing of Butts', `spell_subtext_flags` = 16712190, `spell_desc_flags` = 16712190 WHERE `id` = 23415;

