UPDATE spell SET effect_2 = 0, effect_trigger_spell_2 = 0 WHERE id = 16268;

UPDATE spell SET spell_desc_enus = 'Gives a chance to parry enemy melee attacks.' WHERE id = 18848;

UPDATE spell SET spell_desc_enus = 'Gives a chance to parry enemy melee attacks.' WHERE id = 16268;

-- ============================================================================
-- Totemic Recall (36936) - Allow casting in Ghost Wolf form
-- Removes SPELL_ATTR0_NOT_SHAPESHIFTED (0x10000 = 65536)
-- ============================================================================
UPDATE `spell` SET `attributes` = `attributes` & ~65536 WHERE `id` = 36936;

-- ============================================================================
-- Earthen Reprisal scaling (shared between spell and desc variable 197)
SET @er_dmg_base = 10;
SET @er_dmg_die = 1;
SET @er_dmg_perlevel = 5.0;
SET @er_base_level = 6;
SET @er_max_level = 80;
SET @er_ap_coeff = 0.1;

-- Earthen Reprisal (900114) - Reactive melee strike for Shaman
-- Becomes active after blocking, dodging, or parrying (AURA_STATE_DEFENSE).
-- E1: Physical damage (base + perlevel + 10% AP via spell_bonus_data)
-- E2: ENERGIZE_PCT - restores 10% max mana
-- Modeled after Warrior Counter (91001, F-154).
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900114;

INSERT INTO `spell` SET
    `id` = 900114,
    `attributes` = 327696,
    `attributes_ex_1` = 131584,
    `attributes_ex_4` = 512,
    `facing_caster_flags` = 1,
    `caster_aura_state` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 6000,
    `proc_chance` = 101,
    `max_level` = @er_max_level,
    `base_level` = @er_base_level,
    `spell_level` = @er_base_level,
    `range_index` = 2,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_2` = 137,
    `effect_die_sides_1` = @er_dmg_die,
    `effect_die_sides_2` = 1,
    `effect_real_points_per_level_1` = @er_dmg_perlevel,
    `effect_base_points_1` = @er_dmg_base,
    `effect_base_points_2` = 9,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 1,
    `spell_visual_1` = 1165,
    `spell_icon_id` = 5488,
    `spell_name_enus` = 'Earthen Reprisal',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'A strike that becomes active after blocking, dodging, or parrying an opponent''s attack. Deals $<dmg> damage and restores $s2% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `spell_desc_variable_id` = 197;

-- Variable 197: Earthen Reprisal tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 197;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (197, CONCAT(
    '$perlevel=${($pl-', @er_base_level, ')*', @er_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @er_ap_coeff, '}\n',
    '$dmg=${$m1+$<perlevel>+$<apbonus>}'));

-- ============================================================================
-- Earthwarden Talent Tree Spells (F-164 Phase 2)
-- Stone Skin, Volcanic Shield (redesigned), Rockslam, Tectonic Blast,
-- Improved Volcanic Shield (new), triggered spells
-- ============================================================================
-- ----------------------------------------------------------------------------
-- Elemental Ward (900115, 900127, 900128) - 3 ranks, cloned from Elemental Warding (28996-28998)
-- Reduces magic damage taken by 3/5/7% per rank. Icon 5440.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900115;

INSERT INTO `spell` SET
    `id` = 900115,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -3,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;


DELETE FROM `spell` WHERE `id` = 900127;

INSERT INTO `spell` SET
    `id` = 900127,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -5,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;


DELETE FROM `spell` WHERE `id` = 900128;

INSERT INTO `spell` SET
    `id` = 900128,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;


-- ----------------------------------------------------------------------------
-- Molten Plating (900161, 900162, 900163) - 3 ranks, passive
-- Increases armor from items by 10/20/30%. Icon 4644.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900161;

INSERT INTO `spell` SET
    `id` = 900161,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;


DELETE FROM `spell` WHERE `id` = 900162;

INSERT INTO `spell` SET
    `id` = 900162,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;


DELETE FROM `spell` WHERE `id` = 900163;

INSERT INTO `spell` SET
    `id` = 900163,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 29,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;


-- ----------------------------------------------------------------------------
-- Stoneskin (900164) - Active defensive cooldown, 1 rank
-- -30% damage taken, +10% block chance, 10s duration, 2 min cooldown.
-- Icon 5469, Visual 5787 (Stoneform).
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900164;

INSERT INTO `spell` SET
    `id` = 900164,
    `attributes` = 16,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `recovery_time` = 120000,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = -31,
    `effect_base_points_2` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_apply_aura_name_2` = 51,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 5469,
    `spell_visual_1` = 5787,
    `spell_name_enus` = 'Stoneskin',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Encases you in stone, reducing all damage taken by $s1% and increasing block chance by $s2% for $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces damage taken by $s1% and increases block chance by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- Volcanic Shield scaling (shared between aura buff, triggered spell, and desc variable 187)
SET @vs_dmg_base = 35;
SET @vs_dmg_die = 1;
SET @vs_dmg_perlevel = 10;
SET @vs_spell_level = 30;
SET @vs_base_level = 30;
SET @vs_max_level = 80;
SET @vs_sp_coeff = 0.2;

-- ----------------------------------------------------------------------------
-- Volcanic Shield (900116) - Active shield buff, cloned from Lightning Shield
-- Old ranks 900117/900118 deleted (was 3-rank passive, now 1-rank active)
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` IN (900117, 900118);

DELETE FROM `spell` WHERE `id` = 900116;

INSERT INTO `spell` SET
    `id` = 900116,
    `dispel` = 1,
    `attributes` = 327680,
    `attributes_ex_1` = 1024,
    `attributes_ex_3` = 196608,
    `attributes_ex_4` = 524288,
    `cast_time_index` = 1,
    `proc_flags` = 40,
    `proc_chance` = 100,
    `max_level` = @vs_max_level,
    `base_level` = @vs_base_level,
    `spell_level` = @vs_spell_level,
    `duration_index` = 6,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900122,
    `effect_2` = 3,
    `effect_die_sides_2` = @vs_dmg_die,
    `effect_base_points_2` = @vs_dmg_base,
    `effect_real_points_per_level_2` = @vs_dmg_perlevel,
    `spell_visual_1` = 7757,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Surrounds the caster with a shield of volcanic energy. When you block an attack, the shield erupts for $<total> Fire damage to all enemies within 8 yards. Only one eruption will fire every few seconds.$?s900124[ Also restores $900124s1% of your maximum mana per block.][]$?s900123[ Also restores $900123s1% of your maximum mana per block.][] Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $<total> Fire damage to all nearby enemies when you block. Only one eruption will fire every few seconds.$?s900124[ Also restores $900124s1% of your maximum mana.][]$?s900123[ Also restores $900123s1% of your maximum mana.][]',
    `spell_tooltip_flags` = 16712190,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_1` = 1024,
    `damage_class` = 1,
    `prevention_type` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 4,
    `effect_bonus_multiplier_1` = 0.267,
    `spell_desc_variable_id` = 187;

-- Rockslam scaling (shared between spell and desc variable 189)
SET @rs_dmg_base = 75;
SET @rs_dmg_die = 1;
SET @rs_dmg_perlevel = 6.0;
SET @rs_base_level = 20;
SET @rs_max_level = 80;
SET @rs_ap_coeff = 0.25;

-- ----------------------------------------------------------------------------
-- Rockslam (900119) - Shield bash dealing flat damage + block buff
-- E1: SCHOOL_DAMAGE (effect 2) - base + perlevel + 25% AP
-- E2: TRIGGER_SPELL → 900120 (block chance buff on self)
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900119;

INSERT INTO `spell` SET
    `id` = 900119,
    `attributes` = 327680,
    `attributes_ex_1` = 512,
    `attributes_ex_3` = 67108866,
    `facing_caster_flags` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 8000,
    `proc_chance` = 101,
    `max_level` = @rs_max_level,
    `base_level` = @rs_base_level,
    `spell_level` = @rs_base_level,
    `range_index` = 2,
    `equipped_item_class` = 4,
    `equipped_item_subclass_mask` = 64,
    `effect_1` = 2,
    `effect_die_sides_1` = @rs_dmg_die,
    `effect_real_points_per_level_1` = @rs_dmg_perlevel,
    `effect_base_points_1` = @rs_dmg_base,
    `effect_implicit_target_a_1` = 6,
    `spell_visual_1` = 42,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Bashes the target with your shield, dealing $<dmg> Physical damage, scaling with Attack Power.$?s900182[ Grants $900120s1% increased block chance for $900120d.][]$?s900181[ Grants $900180s1% increased block chance for $900180d.][]',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $<dmg> Physical damage.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 8,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 262144,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = @rs_ap_coeff,
    `spell_desc_variable_id` = 189;

-- Variable 189: Rockslam tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 189;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (189, CONCAT(
    '$perlevel=${($pl-', @rs_base_level, ')*', @rs_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @rs_ap_coeff, '}\n',
    '$dmg=${$m1+$<perlevel>+$<apbonus>}'));

-- ----------------------------------------------------------------------------
-- Rockslam Block Buff (900120) - cloned from Shield Block
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900120;

INSERT INTO `spell` SET
    `id` = 900120,
    `attributes` = 327696,
    `attributes_ex_1` = 1024,
    `attributes_ex_3` = 2,
    `stances` = 131072,
    `cast_time_index` = 1,
    `recovery_time` = 60000,
    `proc_chance` = 101,
    `base_level` = 16,
    `spell_level` = 16,
    `duration_index` = 1,
    `power_type` = 1,
    `range_index` = 1,
    `equipped_item_class` = 4,
    `equipped_item_subclass_mask` = 64,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 51,
    `effect_spell_class_mask_c_2` = 512,
    `spell_visual_1` = 3442,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Block chance increased by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block chance increased by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Tectonic Blast scaling (shared between spell and desc variable 188)
SET @tb_dmg_base = 99;
SET @tb_dmg_die = 1;
SET @tb_dmg_perlevel = 4.0;
SET @tb_base_level = 40;
SET @tb_max_level = 80;
SET @tb_ap_coeff = 0.2;

-- Tectonic Blast (900121) - cloned from Shockwave
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900121;

INSERT INTO `spell` SET
    `id` = 900121,
    `category` = 1201,
    `attributes` = 327696,
    `cast_time_index` = 1,
    `category_recovery_time` = 10000,
    `aura_interrupt_flags` = 4718592,
    `proc_chance` = 101,
    `max_level` = @tb_max_level,
    `base_level` = @tb_base_level,
    `spell_level` = @tb_base_level,
    `duration_index` = 35,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = @tb_dmg_die,
    `effect_die_sides_3` = 1,
    `effect_real_points_per_level_1` = @tb_dmg_perlevel,
    `effect_base_points_1` = @tb_dmg_base,
    `effect_mechanic_1` = 12,
    `effect_implicit_target_a_1` = 104,
    `effect_radius_index_1` = 17,
    `effect_radius_index_2` = 13,
    `spell_visual_1` = 10703,
    `spell_icon_id` = 5366,
    `spell_name_enus` = 'Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Sends a wave of force through the ground in front of the caster, causing $<total> Nature damage, scaling with Attack Power, to all enemies within 13 yards in a frontal cone. Causes a high amount of threat.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $<total> Nature damage in a frontal cone. Causes a high amount of threat.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 10,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_2` = 32768,
    `damage_class` = 3,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 8,
    `spell_desc_variable_id` = 188;

-- Variable 188: Tectonic Blast tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 188;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (188, CONCAT(
    '$perlevel=${($pl-', @tb_base_level, ')*', @tb_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @tb_ap_coeff, '}\n',
    '$total=${$m1+$<perlevel>+$<apbonus>}'));

-- ----------------------------------------------------------------------------
-- Volcanic Shield Triggered (900122) - AOE Fire damage + % mana regen on block
-- E1: SCHOOL_DAMAGE (effect 2) - 8yd AOE Fire damage around caster, 30% SP coeff, Fire Nova visual
-- E2: ENERGIZE_PCT (effect 137) - base 0% max mana, boosted by Imp VS modifier
--     Ref: Mana Leech (34650). Instant % mana restore, no duration needed.
-- spell_class_mask_3 = 32768 (bit 15) for modifier targeting by Imp VS
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900122;

INSERT INTO `spell` SET
    `id` = 900122,
    `attributes` = 327696,
    `attributes_ex_1` = 1024,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = @vs_dmg_die,
    `effect_base_points_1` = @vs_dmg_base,
    `effect_real_points_per_level_1` = @vs_dmg_perlevel,
    `effect_implicit_target_a_1` = 22,
    `effect_implicit_target_b_1` = 15,
    `effect_radius_index_1` = 14,
    `effect_2` = 137,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -1,
    `effect_implicit_target_a_2` = 1,
    `spell_level` = @vs_spell_level,
    `base_level` = @vs_base_level,
    `max_level` = @vs_max_level,
    `spell_visual_1` = 90001,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Deals $s1 Fire damage to nearby enemies.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 32768,
    `school_mask` = 4,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 0.2;

-- Variable 187: Volcanic Shield tooltip damage (base + per-level + SP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 187;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (187, CONCAT(
    '$perlevel=${($pl-', @vs_base_level, ')*', @vs_dmg_perlevel, '}\n',
    '$spbonus=${$sp*', @vs_sp_coeff, '}\n',
    '$total=${$m2+$<perlevel>+$<spbonus>}'));

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R1 (900123) - ADD_FLAT_MODIFIER boosting 900122 E2
-- Adds +6% to Volcanic Shield's ENERGIZE_PCT effect.
-- Targets spell_class_mask_a_3 = 32768 (bit 15, Volcanic Shield trigger)
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900123;

INSERT INTO `spell` SET
    `id` = 900123,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_base_points_1` = 5,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, each block also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Volcanic Shield block restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R2 (900124) - ADD_FLAT_MODIFIER boosting 900122 E2
-- Adds +12% to Volcanic Shield's ENERGIZE_PCT effect.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900124;

INSERT INTO `spell` SET
    `id` = 900124,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_base_points_1` = 11,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, each block also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Volcanic Shield block restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Clean up deleted mana return spells (consolidated into 900122 E2 + modifiers)
DELETE FROM `spell` WHERE `id` IN (900125, 900126);

-- ============================================================================
-- Rockbiter Weapon (Passive) - 900138, 900139, 900140, 900141
-- Per-rank passives applied by SpellItemEnchantment (EQUIP_SPELL) while
-- Rockbiter imbue is active. Replaces the enchant's flat DPS bonus with
-- spell-based attack power (14 AP = 1 DPS). Also provides MOD_THREAT at 0%
-- base for Improved Rockbiter Weapon to enhance.
-- spell_class_mask_3 = 128 (bit 7, unique) for modifier targeting.
-- Enchant DPS → AP: R1=2DPS→28AP, R2=4DPS→56AP, R3=6DPS→84AP, R4=10DPS→140AP
-- ============================================================================
-- Rockbiter Weapon R1 (Passive) - 2 DPS = 28 AP
DELETE FROM `spell` WHERE `id` = 900138;

INSERT INTO `spell` SET
    `id` = 900138,
    `attributes` = 327760,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 99,
    `effect_base_points_1` = 27,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 10,
    `effect_base_points_2` = -1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 127,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 688,
    `spell_name_enus` = 'Rockbiter Weapon',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases attack power by $s1.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 128,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `school_mask` = 8;

-- Rockbiter Weapon R2 (Passive) - 4 DPS = 56 AP
DELETE FROM `spell` WHERE `id` = 900139;

INSERT INTO `spell` SET
    `id` = 900139,
    `attributes` = 327760,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 99,
    `effect_base_points_1` = 55,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 10,
    `effect_base_points_2` = -1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 127,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 688,
    `spell_name_enus` = 'Rockbiter Weapon',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases attack power by $s1.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 128,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `school_mask` = 8;

-- Rockbiter Weapon R3 (Passive) - 6 DPS = 84 AP
DELETE FROM `spell` WHERE `id` = 900140;

INSERT INTO `spell` SET
    `id` = 900140,
    `attributes` = 327760,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 99,
    `effect_base_points_1` = 83,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 10,
    `effect_base_points_2` = -1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 127,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 688,
    `spell_name_enus` = 'Rockbiter Weapon',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases attack power by $s1.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 128,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `school_mask` = 8;

-- Rockbiter Weapon R4 (Passive) - 10 DPS = 140 AP
DELETE FROM `spell` WHERE `id` = 900141;

INSERT INTO `spell` SET
    `id` = 900141,
    `attributes` = 327760,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 99,
    `effect_base_points_1` = 139,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 10,
    `effect_base_points_2` = -1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 127,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 688,
    `spell_name_enus` = 'Rockbiter Weapon',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases attack power by $s1.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 128,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Improved Rockbiter Weapon (900129, 900130)
-- Passive talent, 2 ranks. Uses ADD_PCT_MODIFIER (aura 108) for AP boost
-- and ADD_FLAT_MODIFIER (aura 107) for threat.
-- E1: SPELLMOD_EFFECT1 (misc 3) → boosts MOD_ATTACK_POWER (E1) by 25%/50%
-- E2: SPELLMOD_EFFECT2 (misc 12) → boosts MOD_THREAT (E2) by +8%/+15%
-- Mask mapping: A/B/C = Effect 1/2/3, suffix 1/2/3 = mask_1/mask_2/mask_3
-- E1 targets Rockbiter Passive via A3 (spell_class_mask_3 = 128, bit 72)
-- E2 targets Rockbiter Passive via B3 (spell_class_mask_3 = 128, bit 72)
-- ============================================================================
-- ----------------------------------------------------------------------------
-- Improved Rockbiter Weapon R1 (900129): +25% AP, +8% threat
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900129;

INSERT INTO `spell` SET
    `id` = 900129,
    `attributes` = 327760,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_base_points_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 128,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_2` = 7,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 12,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_b_3` = 128,
    `spell_icon_id` = 688,
    `spell_name_enus` = 'Improved Rockbiter Weapon',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Your Rockbiter Weapon increases threat generated by $s2% and increases attack power bonus of Rockbiter Weapon by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Rockbiter AP increased by $s1% and threat by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Improved Rockbiter Weapon R2 (900130): +50% AP, +15% threat
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900130;

INSERT INTO `spell` SET
    `id` = 900130,
    `attributes` = 327760,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_base_points_1` = 49,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 128,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_2` = 14,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 12,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_b_3` = 128,
    `spell_icon_id` = 688,
    `spell_name_enus` = 'Improved Rockbiter Weapon',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Your Rockbiter Weapon increases threat generated by $s2% and increases attack power bonus of Rockbiter Weapon by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Rockbiter AP increased by $s1% and threat by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `school_mask` = 8;

-- Clean up deleted rank
DELETE FROM `spell` WHERE `id` = 900131;

-- Clean up deleted Rockslam MH (consolidated into 900119)
DELETE FROM `spell` WHERE `id` = 900132;

-- ============================================================================
-- Shield Mastery (900133-900137)
-- Passive talent, 5 ranks. Increases block chance and block value %.
-- Effect 1: MOD_BLOCK_PERCENT (aura 51) - block chance %
-- Effect 2: MOD_SHIELD_BLOCKVALUE (aura 150) - block value % (ref 2565)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Shield Mastery R1 (900133): +1% block chance, +5% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900133;

INSERT INTO `spell` SET
    `id` = 900133,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 51,
    `effect_base_points_1` = 0,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 150,
    `effect_base_points_2` = 4,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4775,
    `spell_name_enus` = 'Shield Mastery',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your block chance by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Shield Mastery R2 (900134): +2% block chance, +10% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900134;

INSERT INTO `spell` SET
    `id` = 900134,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 51,
    `effect_base_points_1` = 1,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 150,
    `effect_base_points_2` = 9,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4775,
    `spell_name_enus` = 'Shield Mastery',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your block chance by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Shield Mastery R3 (900135): +3% block chance, +15% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900135;

INSERT INTO `spell` SET
    `id` = 900135,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 51,
    `effect_base_points_1` = 2,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 150,
    `effect_base_points_2` = 14,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4775,
    `spell_name_enus` = 'Shield Mastery',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your block chance by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Shield Mastery R4 (900136): +4% block chance, +20% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900136;

INSERT INTO `spell` SET
    `id` = 900136,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 51,
    `effect_base_points_1` = 3,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 150,
    `effect_base_points_2` = 19,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4775,
    `spell_name_enus` = 'Shield Mastery',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your block chance by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Shield Mastery R5 (900137): +5% block chance, +25% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900137;

INSERT INTO `spell` SET
    `id` = 900137,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 51,
    `effect_base_points_1` = 4,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 150,
    `effect_base_points_2` = 24,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4775,
    `spell_name_enus` = 'Shield Mastery',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your block chance by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

-- ============================================================================
-- Natural Endurance (900109-900113)
-- 5-rank passive. E1: MOD_TOTAL_STAT_PERCENTAGE (aura 137), misc 2 (Stamina),
-- E2: MOD_HEALING_RECEIVED (aura 283, ref Grace 47930).
-- +2% stam and +3% healing received per rank. Threat moved to Relentless.
-- Ref: Toughness (16252) uses same aura 137/misc 2 pattern for % stamina.
-- ============================================================================
-- Natural Endurance R1 (+2% stam, +3% healing received)
DELETE FROM `spell` WHERE `id` = 900109;

INSERT INTO `spell` SET
    `id` = 900109,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 1,
    `effect_base_points_2` = 2,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Natural Endurance R2 (+4% stam, +6% healing received)
DELETE FROM `spell` WHERE `id` = 900110;

INSERT INTO `spell` SET
    `id` = 900110,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 3,
    `effect_base_points_2` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Natural Endurance R3 (+6% stam, +9% healing received)
DELETE FROM `spell` WHERE `id` = 900111;

INSERT INTO `spell` SET
    `id` = 900111,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 5,
    `effect_base_points_2` = 8,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Natural Endurance R4 (+8% stam, +12% healing received)
DELETE FROM `spell` WHERE `id` = 900112;

INSERT INTO `spell` SET
    `id` = 900112,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 7,
    `effect_base_points_2` = 11,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Natural Endurance R5 (+10% stam, +15% healing received)
DELETE FROM `spell` WHERE `id` = 900113;

INSERT INTO `spell` SET
    `id` = 900113,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 9,
    `effect_base_points_2` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- ============================================================================
-- Relentless (900142-900146)
-- 5-rank passive. Threat generation + stun/silence duration reduction.
-- E1: MOD_THREAT (aura 10), misc 127 (all schools) — moved from Bastion of Earth
-- E2: MECHANIC_DURATION_MOD (aura 232), misc 12 (STUN)
-- E3: MECHANIC_DURATION_MOD (aura 232), misc 9 (SILENCE)
-- Fear/charm reduction removed (covered by Tremor Totem).
-- Ref: Unbreakable Will (14522). Icon 5460. 3% per rank.
-- ============================================================================
-- Relentless R1 (900142): +3% threat, -3% stun/silence duration
DELETE FROM `spell` WHERE `id` = 900142;

INSERT INTO `spell` SET
    `id` = 900142,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 2,
    `effect_base_points_2` = -4,
    `effect_base_points_3` = -4,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 127,
    `effect_misc_value_a_2` = 12,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and reduces the duration of stun and silence effects by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and reduces stun and silence duration by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R2 (900143): +6% threat, -6% stun/silence duration
DELETE FROM `spell` WHERE `id` = 900143;

INSERT INTO `spell` SET
    `id` = 900143,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 5,
    `effect_base_points_2` = -7,
    `effect_base_points_3` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 127,
    `effect_misc_value_a_2` = 12,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and reduces the duration of stun and silence effects by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and reduces stun and silence duration by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R3 (900144): +9% threat, -9% stun/silence duration
DELETE FROM `spell` WHERE `id` = 900144;

INSERT INTO `spell` SET
    `id` = 900144,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 8,
    `effect_base_points_2` = -10,
    `effect_base_points_3` = -10,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 127,
    `effect_misc_value_a_2` = 12,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and reduces the duration of stun and silence effects by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and reduces stun and silence duration by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R4 (900145): +12% threat, -12% stun/silence duration
DELETE FROM `spell` WHERE `id` = 900145;

INSERT INTO `spell` SET
    `id` = 900145,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 11,
    `effect_base_points_2` = -13,
    `effect_base_points_3` = -13,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 127,
    `effect_misc_value_a_2` = 12,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and reduces the duration of stun and silence effects by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and reduces stun and silence duration by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R5 (900146): +15% threat, -15% stun/silence duration
DELETE FROM `spell` WHERE `id` = 900146;

INSERT INTO `spell` SET
    `id` = 900146,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 14,
    `effect_base_points_2` = -16,
    `effect_base_points_3` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 127,
    `effect_misc_value_a_2` = 12,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and reduces the duration of stun and silence effects by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and reduces stun and silence duration by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- ============================================================================
-- Bastion of Earth (900147-900149) - Passive talent, procs on block
-- 3 ranks: triggers stacking armor buff (900150-900152).
-- Each successful block adds a stack of +2%/+4%/+6% armor for 10s (max 3 stacks).
-- Uses same proc pattern as Volcanic Shield: proc_flags=40, spell_proc HitMask=64.
-- Buff uses aura 101 (MOD_RESISTANCE_PCT) like Unbreakable Armor (51271).
-- ============================================================================

-- Bastion of Earth R1 (900147) - Passive, triggers 900150 on block
DELETE FROM `spell` WHERE `id` = 900147;

INSERT INTO `spell` SET
    `id` = 900147,
    `attributes` = 327760,
    `proc_flags` = 40,
    `proc_chance` = 100,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900150,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Successful blocks increase your armor by $900150s1% for $900150d. Stacks up to 3 times. Each stack also reduces the cast time and mana cost of Healing Wave by $900150s2%. Casting Healing Wave consumes all stacks.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Successful blocks increase armor by $900150s1% for $900150d, stacking up to 3 times. Each stack reduces Healing Wave cast time and mana cost by $900150s2%. Casting Healing Wave consumes all stacks.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Bastion of Earth R2 (900148) - Passive, triggers 900151 on block
DELETE FROM `spell` WHERE `id` = 900148;

INSERT INTO `spell` SET
    `id` = 900148,
    `attributes` = 327760,
    `proc_flags` = 40,
    `proc_chance` = 100,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900151,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Successful blocks increase your armor by $900151s1% for $900151d. Stacks up to 3 times. Each stack also reduces the cast time and mana cost of Healing Wave by $900151s2%. Casting Healing Wave consumes all stacks.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Successful blocks increase armor by $900151s1% for $900151d, stacking up to 3 times. Each stack reduces Healing Wave cast time and mana cost by $900151s2%. Casting Healing Wave consumes all stacks.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Bastion of Earth R3 (900149) - Passive, triggers 900152 on block
DELETE FROM `spell` WHERE `id` = 900149;

INSERT INTO `spell` SET
    `id` = 900149,
    `attributes` = 327760,
    `proc_flags` = 40,
    `proc_chance` = 100,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900152,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Successful blocks increase your armor by $900152s1% for $900152d. Stacks up to 3 times. Each stack also reduces the cast time and mana cost of Healing Wave by $900152s2%. Casting Healing Wave consumes all stacks.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Successful blocks increase armor by $900152s1% for $900152d, stacking up to 3 times. Each stack reduces Healing Wave cast time and mana cost by $900152s2%. Casting Healing Wave consumes all stacks.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- ============================================================================
-- Bastion of Earth Buff (900150-900152) - Triggered stacking armor buff
-- Aura 101 (MOD_RESISTANCE_PCT), misc 1 (armor), 15s duration, 3 stacks.
-- Same aura as Unbreakable Armor (51271).
-- ============================================================================

-- Bastion of Earth buff R1 (900150) - +2% armor per stack, 15s, 3 stacks
-- E2: HW cast time reduction (-33%/stack), E3: HW mana cost reduction (-33%/stack)
-- Casting Healing Wave consumes all stacks (proc_charges=1, same as Maelstrom Weapon)
DELETE FROM `spell` WHERE `id` = 900150;

INSERT INTO `spell` SET
    `id` = 900150,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_flags` = 81920,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 8,
    `range_index` = 1,
    `stack_amount` = 3,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 101,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -34,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 10,
    `effect_spell_class_mask_b_1` = 64,
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -34,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_3` = 14,
    `effect_spell_class_mask_c_1` = 64,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Armor increased by $s1%. Healing Wave cast time and mana cost reduced by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor increased by $s1%. Healing Wave cast time and mana cost reduced by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Bastion of Earth buff R2 (900151) - +4% armor per stack
DELETE FROM `spell` WHERE `id` = 900151;

INSERT INTO `spell` SET
    `id` = 900151,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_flags` = 81920,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 8,
    `range_index` = 1,
    `stack_amount` = 3,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 101,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -34,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 10,
    `effect_spell_class_mask_b_1` = 64,
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -34,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_3` = 14,
    `effect_spell_class_mask_c_1` = 64,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Armor increased by $s1%. Healing Wave cast time and mana cost reduced by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor increased by $s1%. Healing Wave cast time and mana cost reduced by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Bastion of Earth buff R3 (900152) - +6% armor per stack
DELETE FROM `spell` WHERE `id` = 900152;

INSERT INTO `spell` SET
    `id` = 900152,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_flags` = 81920,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 8,
    `range_index` = 1,
    `stack_amount` = 3,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 101,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -34,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 10,
    `effect_spell_class_mask_b_1` = 64,
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -34,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_3` = 14,
    `effect_spell_class_mask_c_1` = 64,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Armor increased by $s1%. Healing Wave cast time and mana cost reduced by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor increased by $s1%. Healing Wave cast time and mana cost reduced by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Rockbiter Weapon imbue desc - AP from passive aura (client auto-applies Imp Rockbiter SpellMod)
-- Threat shown conditionally when Imp Rockbiter is known
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900138m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Lasts 30 minutes.' WHERE id = 8017;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900139m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Lasts 30 minutes.' WHERE id = 8018;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900140m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Lasts 30 minutes.' WHERE id = 8019;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900141m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Lasts 30 minutes.' WHERE id = 10399;

DELETE FROM `spell` WHERE `id` = 900153;

INSERT INTO `spell` SET
    `id` = 900153,
    `category` = 82,
    `attributes` = 327696,
    `attributes_ex_2` = 67108864,
    `attributes_ex_4` = 2048,
    `attributes_ex_6` = 8388608,
    `cast_time_index` = 1,
    `category_recovery_time` = 8000,
    `proc_chance` = 101,
    `base_level` = 10,
    `spell_level` = 10,
    `duration_index` = 27,
    `range_index` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 114,
    `effect_2` = 6,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 6,
    `effect_apply_aura_name_2` = 11,
    `spell_visual_1` = 34,
    `spell_icon_id` = 4781,
    `spell_name_enus` = 'Ancestral Warcry',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = 'Taunts the target to attack you, but has no effect if the target is already attacking you.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Taunted.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 7,
    `damage_class` = 1,
    `prevention_type` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- ============================================================================
-- Anticipation (900154-900156) - Cloned from 16254/16271/16272 with icon 5340
-- Earthwarden talent tree (tier 2, col 3)
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900154;

INSERT INTO `spell` SET
    `id` = 900154,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -17,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 49,
    `effect_apply_aura_name_2` = 234,
    `effect_misc_value_a_2` = 3,
    `spell_icon_id` = 5340,
    `spell_priority` = 50,
    `spell_name_enus` = 'Anticipation',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your chance to dodge by an additional $s1%, and reduces the duration of all Disarm effects used against you by $s2%. This does not stack with other Disarm duration reducing effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900155;

INSERT INTO `spell` SET
    `id` = 900155,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 1,
    `effect_base_points_2` = -26,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 49,
    `effect_apply_aura_name_2` = 234,
    `effect_misc_value_a_2` = 3,
    `spell_icon_id` = 5340,
    `spell_priority` = 50,
    `spell_name_enus` = 'Anticipation',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your chance to dodge by an additional $s1%, and reduces the duration of all Disarm effects used against you by $s2%. This does not stack with other Disarm duration reducing effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900156;

INSERT INTO `spell` SET
    `id` = 900156,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 2,
    `effect_base_points_2` = -51,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 49,
    `effect_apply_aura_name_2` = 234,
    `effect_misc_value_a_2` = 3,
    `spell_icon_id` = 5340,
    `spell_priority` = 50,
    `spell_name_enus` = 'Anticipation',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your chance to dodge by an additional $s1%, and reduces the duration of all Disarm effects used against you by $s2%. This does not stack with other Disarm duration reducing effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Lightning Ward (900157, 900158, 900159) - 3 ranks
-- Reduces all magic damage taken by 3/6/10%.
-- Replaces Improved Shields in Earthwarden tree (talent 2906, tier 1 col 3).
-- Effect 1: Aura 87 (MOD_DAMAGE_PERCENT_TAKEN), misc 126 (all magic schools)
-- Icon: 5317
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900157;

INSERT INTO `spell` SET
    `id` = 900157,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -4,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5317,
    `spell_name_enus` = 'Lightning Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900158;

INSERT INTO `spell` SET
    `id` = 900158,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5317,
    `spell_name_enus` = 'Lightning Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900159;

INSERT INTO `spell` SET
    `id` = 900159,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -11,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5317,
    `spell_name_enus` = 'Lightning Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Living Guardian (900167, 900168, 900169) - 3 rank talent (proc trigger)
-- After receiving a heal, reduces physical damage taken by 4/7/10% for 10s.
-- Passive aura that procs Living Guardian buff on heal received.
-- Cloned from Ancestral Healing (16176). Icon 4408.
-- proc_flags 559104 = TAKEN_SPELL_NONE_DMG_CLASS_POS | TAKEN_SPELL_MAGIC_DMG_CLASS_POS | TAKEN_PERIODIC
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900167;

INSERT INTO `spell` SET
    `id` = 900167,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_flags` = 559104,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900170,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by $900170s1% for $900170d after receiving a heal.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900168;

INSERT INTO `spell` SET
    `id` = 900168,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_flags` = 559104,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900171,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by $900171s1% for $900171d after receiving a heal.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900169;

INSERT INTO `spell` SET
    `id` = 900169,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_flags` = 559104,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900172,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by $900172s1% for $900172d after receiving a heal.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Living Guardian Buff (900170, 900171, 900172) - 3 ranks
-- Reduces physical damage taken by 4/7/10% for 10 seconds.
-- Triggered by Living Guardian talent when receiving a heal.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900170;

INSERT INTO `spell` SET
    `id` = 900170,
    `attributes` = 0,
    `attributes_ex_1` = 0,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -5,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by $s1%. Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces physical damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900171;

INSERT INTO `spell` SET
    `id` = 900171,
    `attributes` = 0,
    `attributes_ex_1` = 0,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -8,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by $s1%. Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces physical damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900172;

INSERT INTO `spell` SET
    `id` = 900172,
    `attributes` = 0,
    `attributes_ex_1` = 0,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -11,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by $s1%. Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces physical damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ============================================================================
-- Earth Totem family mask tag — bit 17 in spell_class_mask_3 (131072)
-- Custom family flag on earth totem summon spells. Originally used by Totemic
-- Impact proc filtering (now uses Totemic Focus mask 0x200B0018 for all totems).
-- Retained for potential future use.
-- Earth totems: Earthbind, Stoneclaw, Stoneskin, Strength of Earth, Tremor,
-- Earth Elemental.
-- ============================================================================
UPDATE `spell` SET `spell_class_mask_3` = `spell_class_mask_3` | 131072
WHERE `id` IN (
    2062, 44130,                                          -- Earth Elemental Totem
    2484,                                                 -- Earthbind Totem
    5730, 6390, 6391, 6392, 10427, 10428, 25525,         -- Stoneclaw Totem
    58580, 58581, 58582,
    8071, 8154, 8155, 10406, 10407, 10408, 25508, 25509, -- Stoneskin Totem
    38115, 58751, 58753,
    8075, 8160, 8161, 10442, 25361, 25528, 31633,        -- Strength of Earth Totem
    57622, 58643,
    8143                                                  -- Tremor Totem
);

-- ============================================================================
-- Call of the Elements / Ancestors / Spirits (66842-66844) — Totemic Impact fix
-- These stock spells have spell_class_set=0, spell_class_mask_1=0, damage_class=0.
-- Totemic Impact proc requires SpellFamilyName=11 + totem family bits + CAST phase
-- with PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_POS (16384).
-- Tag them as Shaman family with a totem summon bit (536870912) so the
-- spell_proc filter (SpellFamilyName=11, SpellFamilyMask0=537399320) matches.
-- Individual totem summon spells are triggered (skip CAST phase procs),
-- so the proc must fire from the Call spell itself.
-- ============================================================================
UPDATE `spell` SET
    `spell_class_set` = 11,
    `spell_class_mask_1` = 536870912
    WHERE `id` IN (66842, 66843, 66844);

-- Totemic Impact damage scaling (shared between triggered spell 900166 and desc variable 198)
SET @ti_dmg_base = 9;
SET @ti_dmg_die = 1;
SET @ti_dmg_perlevel = 0.5;
SET @ti_base_level = 10;
SET @ti_max_level = 80;
SET @ti_ap_coeff = 0.10;

-- ============================================================================
-- Totemic Impact (900165) + Triggered AOE Damage (900166)
-- 1-rank passive talent. Aura on Shaman that procs when ANY totem is summoned,
-- triggering AOE Nature damage around the caster with 3x threat multiplier.
-- E1: PROC_TRIGGER_SPELL (aura 42) → 900166
-- proc_flags = 16384 (DONE_SPELL_MAGIC_DMG_CLASS_POS — totem summons are positive magic spells).
-- Proc filter: SpellFamilyMask0=537399320 (all totem bits, same as Totemic Focus 16173).
-- 4 sec ICD via spell_proc Cooldown.
-- Triggered spell (900166): AOE Nature damage around caster, 0.10 AP coeff
-- via spell_bonus_data, 3.0x threat via spell_threat.
-- ============================================================================
-- Totemic Impact (900165) — passive talent aura, procs on any totem summon
-- PROC_TRIGGER_SPELL (aura 42) → 900166.
-- proc_flags = 278528 (DONE_SPELL_MAGIC_DMG_CLASS_POS | DONE_SPELL_NONE_DMG_CLASS_POS)
-- Both flags needed: most totem summons are damage_class=1 (MAGIC) but Searing Totem
-- and Call of the Elements/Ancestors/Spirits are damage_class=0 (NONE).
-- 4 sec ICD via spell_proc Cooldown. SpellFamilyMask0=537399320 filters to
-- totem summon spells only (same mask as Totemic Focus 16173).
-- Shaman is the caster so visual plays at shaman and threat goes to shaman.
DELETE FROM `spell` WHERE `id` = 900165;

INSERT INTO `spell` SET
    `id` = 900165,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900166,
    `proc_flags` = 278528,
    `proc_chance` = 100,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Totemic Impact',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Summoning a totem sends a shockwave through the ground, dealing $<dmg> Nature damage to all nearby enemies and generating 3 times normal threat. Cannot occur more than once every 4 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your totem summons deal $<dmg> Nature damage and generate 3x threat. 4 sec cooldown.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `spell_desc_variable_id` = 198;

-- Totemic Impact (900166) — triggered AOE Nature damage + threat
-- SCHOOL_DAMAGE (2), Nature, AOE around caster (target_a=22, target_b=15, 10yd).
-- Low damage (9 base + 0.5/level = 10 at lvl 10, 45 at 80) with 0.10 AP coeff.
-- 3.0x threat multiplier via spell_threat. Target: ~735 threat at lvl 80 with 2000 AP.
-- Matches Volcanic Shield (900122) structure for triggered AOE damage.
DELETE FROM `spell` WHERE `id` = 900166;

INSERT INTO `spell` SET
    `id` = 900166,
    `attributes` = 327696,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = @ti_dmg_die,
    `effect_base_points_1` = @ti_dmg_base,
    `effect_real_points_per_level_1` = @ti_dmg_perlevel,
    `effect_implicit_target_a_1` = 22,
    `effect_implicit_target_b_1` = 15,
    `effect_radius_index_1` = 13,
    `spell_level` = @ti_base_level,
    `base_level` = @ti_base_level,
    `max_level` = @ti_max_level,
    `spell_visual_1` = 145,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Totemic Impact',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'The earth trembles, dealing Nature damage and generating high threat.',
    `spell_desc_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8,
    `effect_bonus_multiplier_1` = 1.0,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 65536;

-- Variable 198: Totemic Impact tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 198;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (198, CONCAT(
    '$perlevel=${($pl-', @ti_base_level, ')*', @ti_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @ti_ap_coeff, '}\n',
    '$dmg=${$900166m1+$<perlevel>+$<apbonus>}'));

-- Thunderborne Leap damage scaling (shared between triggered spell, cast dummy, and desc variable 194)
SET @tbl_dmg_base = 99;
SET @tbl_dmg_die = 1;
SET @tbl_dmg_perlevel = 3;
SET @tbl_spell_level = 40;
SET @tbl_base_level = 40;
SET @tbl_max_level = 80;
SET @tbl_ap_coeff = 0.2;

-- ============================================================================
-- Thunderborne Leap (900173) — cast spell
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900173;

INSERT INTO `spell` SET
    `id` = 900173,
    `category` = 1211,
    `attributes` = 327696,
    `attributes_ex_1` = 32768,
    `attributes_ex_2` = 4,
    `attributes_ex_6` = 1088,
    `cast_time_index` = 1,
    `category_recovery_time` = 5000,
    `proc_chance` = 101,
    `base_level` = @tbl_base_level,
    `spell_level` = @tbl_spell_level,
    `max_level` = @tbl_max_level,
    `duration_index` = 39,
    `power_cost_percentage` = 10,
    `range_index` = 95,
    `equipped_item_class` = -1,
    `effect_1` = 42,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_b_1` = 75,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_b_1` = 75,
    `effect_multiple_value_1` = 4.0,
    `spell_visual_1` = 7660,
    `spell_icon_id` = 5364,
    `active_icon_id` = 5364,
    `spell_priority` = 50,
    `spell_name_enus` = 'Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Leap to an enemy target, slamming down on all enemies within $900174a1 yards, causing $<total> Nature damage and stunning them for $900174d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_desc_variable_id` = 194,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Thunderborne Leap Impact (900174) — hidden triggered AoE
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900174;

INSERT INTO `spell` SET
    `id` = 900174,
    `attributes` = 327696,
    `attributes_ex_1` = 1024,
    `attributes_ex_2` = 4,
    `attributes_ex_3` = 268436224,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `base_level` = @tbl_base_level,
    `spell_level` = @tbl_spell_level,
    `max_level` = @tbl_max_level,
    `duration_index` = 39,
    `power_type` = 1,
    `range_index` = 13,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 2,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = @tbl_dmg_die,
    `effect_base_points_1` = -1,
    `effect_base_points_2` = @tbl_dmg_base,
    `effect_real_points_per_level_2` = @tbl_dmg_perlevel,
    `effect_mechanic_1` = 11,
    `effect_implicit_target_a_1` = 15,
    `effect_implicit_target_a_2` = 15,
    `effect_radius_index_1` = 14,
    `effect_radius_index_2` = 14,
    `effect_apply_aura_name_1` = 12,
    `spell_visual_1` = 145,
    `spell_icon_id` = 5364,
    `active_icon_id` = 5364,
    `spell_priority` = 50,
    `spell_name_enus` = 'Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712172,
    `spell_desc_enus` = 'Leap to an enemy target, slamming down on all enemies within $900174a1 yards, dealing $900174s2 Nature damage and stunning them for $900174d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Stunned.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 8;

-- Variable 194: Thunderborne Leap tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 194;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (194, CONCAT(
    '$perlevel=${($pl-', @tbl_base_level, ')*', @tbl_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @tbl_ap_coeff, '}\n',
    '$total=${$900174m2+$<perlevel>+$<apbonus>}'));

-- ============================================================================
-- Juggernaut (900175-900179) — 5-rank passive
-- +2/4/6/8/10% Stamina, -6/12/18/24/30% movement slow duration
-- Cloned from Toughness (16252). Icon 5452.
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900175;

INSERT INTO `spell` SET
    `id` = 900175,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 1,
    `effect_base_points_2` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900176;

INSERT INTO `spell` SET
    `id` = 900176,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 3,
    `effect_base_points_2` = -13,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900177;

INSERT INTO `spell` SET
    `id` = 900177,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 5,
    `effect_base_points_2` = -19,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900178;

INSERT INTO `spell` SET
    `id` = 900178,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 7,
    `effect_base_points_2` = -25,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900179;

INSERT INTO `spell` SET
    `id` = 900179,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 9,
    `effect_base_points_2` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

-- ============================================================================
-- Rockslam Block Buff R1 (900180) — triggered +5% block, 10s
-- Cloned from 900120 with reduced block value.
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900180;

INSERT INTO `spell` SET
    `id` = 900180,
    `attributes` = 327696,
    `attributes_ex_1` = 1024,
    `attributes_ex_3` = 2,
    `stances` = 131072,
    `cast_time_index` = 1,
    `recovery_time` = 60000,
    `proc_chance` = 101,
    `base_level` = 16,
    `spell_level` = 16,
    `duration_index` = 1,
    `power_type` = 1,
    `range_index` = 1,
    `equipped_item_class` = 4,
    `equipped_item_subclass_mask` = 64,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 4,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 51,
    `effect_spell_class_mask_c_2` = 512,
    `spell_visual_1` = 3442,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Block chance increased by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block chance increased by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

-- ============================================================================
-- Improved Rockslam R1 (900181) — +15% damage, procs block buff R1 (900180)
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900181;

INSERT INTO `spell` SET
    `id` = 900181,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_flags` = 16,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 3,
    `effect_trigger_spell_2` = 900180,
    `effect_spell_class_mask_a_3` = 262144,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Improved Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage dealt by Rockslam by $s1% and causes it to grant 5% increased block chance for 10 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases the damage dealt by Rockslam by $s1% and causes it to grant 5% increased block chance for 10 sec.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Improved Rockslam R2 (900182) — +25% damage, procs block buff R2 (900120)
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900182;

INSERT INTO `spell` SET
    `id` = 900182,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_flags` = 16,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 24,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 3,
    `effect_trigger_spell_2` = 900120,
    `effect_spell_class_mask_a_3` = 262144,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Improved Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage dealt by Rockslam by $s1% and causes it to grant 10% increased block chance for 10 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases the damage dealt by Rockslam by $s1% and causes it to grant 10% increased block chance for 10 sec.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;