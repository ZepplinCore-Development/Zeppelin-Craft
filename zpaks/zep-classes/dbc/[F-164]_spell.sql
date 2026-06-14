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
-- -30% all damage taken, 10s duration, 2 min cooldown. (Block-chance bonus
-- removed in F-164 and moved to Stonewall (900223) to keep the two panic
-- buttons distinct: Stoneskin = flat mitigation, Stonewall = block wall.)
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
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 5469,
    `spell_visual_1` = 5787,
    `spell_name_enus` = 'Stoneskin',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Encases you in stone, reducing all damage taken by $s1% for $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- Volcanic Shield scaling (shared between aura buff, triggered spell, and desc variable 187)
SET @vs_dmg_base = 30;
SET @vs_dmg_die = 1;
SET @vs_dmg_perlevel = 5;
SET @vs_spell_level = 30;
SET @vs_base_level = 30;
SET @vs_max_level = 80;
SET @vs_sp_coeff = 0.15;

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
    `spell_desc_enus` = 'Surrounds the caster with a shield of volcanic energy. When you block an attack, the shield erupts for $<total> Fire damage, scaling with Spell Power, to all enemies within 8 yards. Only one eruption will fire every few seconds.$?s900124[ Each activation also restores $900124s1% of your maximum mana.][]$?s900123[ Each activation also restores $900123s1% of your maximum mana.][] Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $<total> Fire damage to all nearby enemies when you block. Only one eruption will fire every few seconds.$?s900124[ Each activation also restores $900124s1% of your maximum mana.][]$?s900123[ Each activation also restores $900123s1% of your maximum mana.][]',
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
    `effect_bonus_multiplier_1` = 0.15;

-- Variable 187: Volcanic Shield tooltip damage (base + per-level + SP scaling)
-- Uses hardcoded base instead of $m2 to avoid double-counting per-level in buff tooltip context
DELETE FROM `spelldescriptionvariables` WHERE `id` = 187;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (187, CONCAT(
    '$base=${', (@vs_dmg_base + @vs_dmg_die), '}\n',
    '$perlevel=${($pl-', @vs_base_level, ')*', @vs_dmg_perlevel, '}\n',
    '$spbonus=${$sp*', @vs_sp_coeff, '}\n',
    '$total=${$<base>+$<perlevel>+$<spbonus>}'));

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R1 (900123) - ADD_FLAT_MODIFIER boosting 900122 E2
-- Adds +3% to Volcanic Shield's ENERGIZE_PCT effect.
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
    `effect_2` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 108,
    `effect_base_points_1` = 2,
    `effect_base_points_2` = 9,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `effect_spell_class_mask_b_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage dealt by your Volcanic Shield by $s2%, and its activation also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Volcanic Shield damage increased by $s2% and activation restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R2 (900124) - ADD_FLAT_MODIFIER boosting 900122 E2
-- Adds +6% to Volcanic Shield's ENERGIZE_PCT effect.
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
    `effect_2` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 108,
    `effect_base_points_1` = 5,
    `effect_base_points_2` = 19,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `effect_spell_class_mask_b_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage dealt by your Volcanic Shield by $s2%, and its activation also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Volcanic Shield damage increased by $s2% and activation restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
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
    `effect_base_points_1` = 13,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 10,
    `effect_base_points_2` = -1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 127,
    `effect_implicit_target_a_2` = 1,
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -6,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 87,
    `effect_misc_value_a_3` = 127,
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
    `effect_base_points_1` = 27,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 10,
    `effect_base_points_2` = -1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 127,
    `effect_implicit_target_a_2` = 1,
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -6,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 87,
    `effect_misc_value_a_3` = 127,
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
    `effect_base_points_1` = 41,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 10,
    `effect_base_points_2` = -1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 127,
    `effect_implicit_target_a_2` = 1,
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -6,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 87,
    `effect_misc_value_a_3` = 127,
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
    `effect_base_points_1` = 69,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 10,
    `effect_base_points_2` = -1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_2` = 127,
    `effect_implicit_target_a_2` = 1,
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -6,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 87,
    `effect_misc_value_a_3` = 127,
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
-- Improved Rockbiter Weapon R1 (900129): +15% AP, +8% threat (DR is on base imbue)
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900129;

INSERT INTO `spell` SET
    `id` = 900129,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_base_points_1` = 14,
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
-- Improved Rockbiter Weapon R2 (900130): +30% AP, +15% threat (DR is on base imbue)
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900130;

INSERT INTO `spell` SET
    `id` = 900130,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_base_points_1` = 29,
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
-- Shield Mastery R1 (900133): +1% block chance, +10% block value
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
    `effect_base_points_2` = 9,
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
-- Shield Mastery R2 (900134): +2% block chance, +20% block value
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
    `effect_base_points_2` = 19,
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
-- Shield Mastery R3 (900135): +3% block chance, +30% block value
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
    `effect_base_points_2` = 29,
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
-- Shield Mastery R4 (900136): +4% block chance, +40% block value
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
    `effect_base_points_2` = 39,
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
-- Shield Mastery R5 (900137): +5% block chance, +50% block value
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
    `effect_base_points_2` = 49,
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
-- 3 ranks: chance on block to trigger buff (900150-900152).
-- Each talent rank increases the proc chance (R1=10%, R2=20%, R3=30%).
-- Buff gives 15% physical damage reduction and makes the next LHW instant (all ranks).
-- Full mana cost. No stacking — buff consumed on LHW cast.
-- Choice: keep buff for 15% phys DR, or spend it on an instant LHW heal.
-- ============================================================================

-- Bastion of Earth R1 (900147) - Passive, 10% on block, triggers 900150
DELETE FROM `spell` WHERE `id` = 900147;

INSERT INTO `spell` SET
    `id` = 900147,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `proc_flags` = 40,
    `proc_chance` = 10,
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
    `spell_desc_enus` = 'Successful blocks have a 10% chance to reduce physical damage taken by 15% for $900150d and make your next Lesser Healing Wave instant. Casting Lesser Healing Wave consumes the buff.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '10% chance on block to reduce physical damage taken by 15% for $900150d and make your next Lesser Healing Wave instant. Casting Lesser Healing Wave consumes the buff.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Bastion of Earth R2 (900148) - Passive, 20% on block, triggers 900151
DELETE FROM `spell` WHERE `id` = 900148;

INSERT INTO `spell` SET
    `id` = 900148,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `proc_flags` = 40,
    `proc_chance` = 20,
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
    `spell_desc_enus` = 'Successful blocks have a 20% chance to reduce physical damage taken by 15% for $900151d and make your next Lesser Healing Wave instant. Casting Lesser Healing Wave consumes the buff.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '20% chance on block to reduce physical damage taken by 15% for $900151d and make your next Lesser Healing Wave instant. Casting Lesser Healing Wave consumes the buff.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Bastion of Earth R3 (900149) - Passive, 30% on block, triggers 900152
DELETE FROM `spell` WHERE `id` = 900149;

INSERT INTO `spell` SET
    `id` = 900149,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `proc_flags` = 40,
    `proc_chance` = 30,
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
    `spell_desc_enus` = 'Successful blocks have a 30% chance to reduce physical damage taken by 15% for $900152d and make your next Lesser Healing Wave instant. Casting Lesser Healing Wave consumes the buff.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '30% chance on block to reduce physical damage taken by 15% for $900152d and make your next Lesser Healing Wave instant. Casting Lesser Healing Wave consumes the buff.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- ============================================================================
-- Bastion of Earth Buff (900150-900152) - Triggered physical DR buff
-- E1: Aura 87 (MOD_DAMAGE_PERCENT_TAKEN), misc 1 (physical), -15%
-- E2: Aura 108 (ADD_PCT_MODIFIER), misc 10 (SPELLMOD_CASTING_TIME), -100% LHW cast time (instant)
-- No stacking. Consumed when Lesser Healing Wave is cast (proc_charges=1).
-- All ranks identical (20% DR, instant LHW); only the passive proc chance scales. Full mana cost.
-- ============================================================================

-- Bastion of Earth buff R1 (900150) - 15% phys DR, instant LHW
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
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -101,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 10,
    `effect_spell_class_mask_b_1` = 128,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by 15%. Your next Lesser Healing Wave is instant.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces physical damage taken by 15%. Your next Lesser Healing Wave is instant.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Bastion of Earth buff R2 (900151) - 15% phys DR, instant LHW
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
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -101,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 10,
    `effect_spell_class_mask_b_1` = 128,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by 15%. Your next Lesser Healing Wave is instant.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces physical damage taken by 15%. Your next Lesser Healing Wave is instant.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Bastion of Earth buff R3 (900152) - 15% phys DR, instant LHW
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
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -101,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 10,
    `effect_spell_class_mask_b_1` = 128,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Reduces physical damage taken by 15%. Your next Lesser Healing Wave is instant.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces physical damage taken by 15%. Your next Lesser Healing Wave is instant.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Rockbiter Weapon imbue desc - AP from passive aura (client auto-applies Imp Rockbiter SpellMod)
-- Threat shown conditionally when Imp Rockbiter is known
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900138m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.' WHERE id = 8017;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900139m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.' WHERE id = 8018;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900140m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.' WHERE id = 8019;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900141m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.' WHERE id = 10399;

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
    `effect_base_points_1` = 14,
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
-- Living Guardian (900167-900169, 900171, 900172) - 5 rank talent (proc trigger)
-- After receiving a direct heal, gain an absorb shield for 10s. 10s ICD (900186).
-- Passive procs Living Guardian shield (900170) on direct heal received.
-- proc_flags 32768 = TAKEN_SPELL_MAGIC_DMG_CLASS_POS (magic direct heals only,
-- intentionally narrowed to avoid HoT-tick procs).
-- Rank scales proc CHANCE only: R1 20% / R2 40% / R3 60% / R4 80% / R5 100%.
-- Shield is a flat 10% of the caster's max health (set by C++ script). Icon 4408.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` IN (900167, 900168, 900169, 900171, 900172);

INSERT INTO `spell` SET `id` = 900167, `attributes` = 464, `cast_time_index` = 1, `proc_flags` = 32768, `proc_chance` = 20, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = -1, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 42, `effect_trigger_spell_1` = 900170, `spell_icon_id` = 4408, `spell_name_enus` = 'Living Guardian', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 1', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you receive a direct heal, you have a 20% chance to gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `effect_damage_multiplier_1` = 1.0, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900168, `attributes` = 464, `cast_time_index` = 1, `proc_flags` = 32768, `proc_chance` = 40, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = -1, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 42, `effect_trigger_spell_1` = 900170, `spell_icon_id` = 4408, `spell_name_enus` = 'Living Guardian', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 2', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you receive a direct heal, you have a 40% chance to gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `effect_damage_multiplier_1` = 1.0, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900169, `attributes` = 464, `cast_time_index` = 1, `proc_flags` = 32768, `proc_chance` = 60, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = -1, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 42, `effect_trigger_spell_1` = 900170, `spell_icon_id` = 4408, `spell_name_enus` = 'Living Guardian', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 3', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you receive a direct heal, you have a 60% chance to gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `effect_damage_multiplier_1` = 1.0, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900171, `attributes` = 464, `cast_time_index` = 1, `proc_flags` = 32768, `proc_chance` = 80, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = -1, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 42, `effect_trigger_spell_1` = 900170, `spell_icon_id` = 4408, `spell_name_enus` = 'Living Guardian', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 4', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you receive a direct heal, you have an 80% chance to gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `effect_damage_multiplier_1` = 1.0, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900172, `attributes` = 464, `cast_time_index` = 1, `proc_flags` = 32768, `proc_chance` = 100, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = -1, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 42, `effect_trigger_spell_1` = 900170, `spell_icon_id` = 4408, `spell_name_enus` = 'Living Guardian', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 5', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you receive a direct heal, you gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `effect_damage_multiplier_1` = 1.0, `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Living Guardian Shield (900170) - Single buff; all 5 talent ranks trigger it.
-- Flat absorb = 10% of the caster's max health, set by the
-- spell_sha_living_guardian_aura C++ script (aura 69 SCHOOL_ABSORB does not
-- consult spell_bonus_data). Scales with the Earthwarden's large HP pool, so
-- it is a bigger effect for tanks than off-spec shamans dipping into it.
-- 10s duration; 10s ICD (900186). base_points 0 (overridden by the C++ script).
-- ----------------------------------------------------------------------------
DELETE FROM `spelldescriptionvariables` WHERE `id` = 190;
DELETE FROM `spell` WHERE `id` = 900170;

INSERT INTO `spell` SET
    `id` = 900170,
    `attributes` = 0,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 0,
    `effect_base_points_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 69,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Absorbs damage equal to 10% of your maximum health. Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Absorbs damage equal to 10% of your maximum health.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Living Guardian Cooldown (900186) - Debuff, 10s duration
-- Visual feedback debuff applied when Living Guardian shield triggers.
-- Aura 4 = DUMMY, purely cosmetic. ICD on talent passive does actual gating.
-- Forced negative via spell_custom_attr so it shows as a debuff (red border).
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900186;

INSERT INTO `spell` SET
    `id` = 900186,
    `attributes` = 0x04000000,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 4,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Recently protected by Living Guardian. Cannot gain another shield for $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Cannot gain Living Guardian shield.',
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
-- proc_flags / family mask / phase / ICD all configured in spell_proc table
-- (single source of truth — see zz_[F-164]_shaman_guardian_spells.sql).
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
    `proc_chance` = 100,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Totemic Impact',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Summoning a totem sends a shockwave through the ground, dealing $<dmg> Nature damage, scaling with Attack Power, to all nearby enemies and generating 3 times normal threat. Cannot occur more than once every 4 sec.',
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
    `effect_implicit_target_a_1` = 53,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_b_1` = 75,
    `effect_multiple_value_1` = 4.0,
    `spell_visual_1` = 8251,
    `spell_icon_id` = 5364,
    `active_icon_id` = 5364,
    `spell_priority` = 50,
    `spell_name_enus` = 'Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Leap to a targeted location, slamming down on all enemies within $900174a1 yards, causing $<total> Nature damage, scaling with Attack Power, and stunning them for $900174d.',
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
    `attributes_ex_3` = 268435968,
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
    `spell_desc_enus` = 'Leap to a targeted location, slamming down on all enemies within $900174a1 yards, dealing $900174s2 Nature damage and stunning them for $900174d.',
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
-- Improved Rockslam R2 (900182) — +30% damage, procs block buff R2 (900120)
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
    `effect_base_points_1` = 29,
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

-- ============================================================================
-- Spirit Communion (900183, 900184, 900185) - Victory Rush clone for Shaman
-- On killing an enemy that yields exp/honor, gain "Spirited" buff (20 sec).
-- While Spirited, can activate Spirit Communion to restore 10% max HP and mana.
-- ============================================================================

-- 900183 - Spirit Communion (Passive)
-- Hidden passive aura, procs on kill (PROC_FLAG_KILL = 0x2), triggers Spirited buff
DELETE FROM `spell` WHERE `id` = 900183;
INSERT INTO `spell` SET
    `id` = 900183,
    `attributes` = 0x00000440,
    `attributes_ex_1` = 0x00000400,
    `attributes_ex_3` = 0x10000000,
    `attributes_ex_4` = 0x00008000,
    `cast_time_index` = 1,
    `proc_flags` = 2,
    `proc_chance` = 100,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900184,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 5302,
    `spell_name_enus` = 'Spirit Communion',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = '',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11;

-- 900184 - Spirited (Buff)
-- Applied on kill by passive (900183). 20 sec duration, enables active (900185).
-- Similar to "Victorious" (32216) for warriors.
DELETE FROM `spell` WHERE `id` = 900184;
INSERT INTO `spell` SET
    `id` = 900184,
    `cast_time_index` = 1,
    `duration_index` = 18,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 4,
    `effect_base_points_1` = -1,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 5302,
    `spell_name_enus` = 'Spirited',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Can use Spirit Communion.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Can use Spirit Communion.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11;

-- 900185 - Spirit Communion (Active)
-- Requires Spirited buff (caster_aura_spell = 900184).
-- E1: HEAL_PCT (136) — restores 10% max HP to self
-- E2: ENERGIZE_PCT (137) — restores 10% max mana to self
-- 5 sec cooldown, 1.5 sec GCD, bow + spirit visual.
DELETE FROM `spell` WHERE `id` = 900185;
INSERT INTO `spell` SET
    `id` = 900185,
    `attributes` = 0x00040010,
    `attributes_ex_1` = 0x00000400,
    `caster_aura_spell` = 900184,
    `cast_time_index` = 1,
    `recovery_time` = 5000,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 136,
    `effect_2` = 137,
    `effect_base_points_1` = 9,
    `effect_die_sides_1` = 1,
    `effect_base_points_2` = 9,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_misc_value_a_2` = 0,
    `spell_visual_1` = 90002,
    `spell_icon_id` = 5302,
    `spell_name_enus` = 'Spirit Communion',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Commune with the spirits, restoring $s1% of your maximum health and $s2% of your maximum mana. Can only be used within 20 sec after you kill an enemy that yields experience or honor.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Restores $s1% of your maximum health and $s2% of your maximum mana.',
    `spell_tooltip_flags` = 16712190,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `damage_class` = 0,
    `prevention_type` = 0,
    `school_mask` = 1;

-- ============================================================================
-- Bulwark (900187, 900188) - Passive, 2 ranks
-- Mirrors Critical Block (47294) pattern for Shaman.
-- E1: aura 253 (MOD_CRITICAL_BLOCK_CHANCE) - chance for blocks to block double.
-- E2: aura 107 (ADD_FLAT_MODIFIER), misc 7 (SPELLMOD_CRITICAL_CHANCE),
--     mask_b_3 = 262144 -> targets Rockslam (spell_class_mask_3 bit 18) only.
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900187;

INSERT INTO `spell` SET
    `id` = 900187,
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
    `effect_base_points_2` = 2,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 253,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 7,
    `effect_spell_class_mask_b_3` = 262144,
    `spell_icon_id` = 5432,
    `spell_priority` = 50,
    `spell_name_enus` = 'Bulwark',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Your successful blocks have a $s1% chance to block double the normal amount, and increases your chance to critically hit with your Rockslam ability by an additional $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900188;

INSERT INTO `spell` SET
    `id` = 900188,
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
    `effect_base_points_1` = 19,
    `effect_base_points_2` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 253,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 7,
    `effect_spell_class_mask_b_3` = 262144,
    `spell_icon_id` = 5432,
    `spell_priority` = 50,
    `spell_name_enus` = 'Bulwark',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Your successful blocks have a $s1% chance to block double the normal amount, and increases your chance to critically hit with your Rockslam ability by an additional $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- ============================================================================
-- Ancestral Insight (900189, 900190, 900191) - Passive, 3 ranks
-- Clone of Mental Quickness (30812/30813/30814) for Earthwarden tree.
-- Replaces stock Mental Quickness at T4 C2 (talent 2914).
-- E1: aura 108 ADD_PCT_MODIFIER, misc 14 (SPELLMOD_COST) - instant-cast cost -%
-- E2: aura 237 MOD_SPELL_DAMAGE_OF_ATTACK_POWER, misc 126 (all magic schools)
-- E3: aura 238 MOD_SPELL_HEALING_OF_ATTACK_POWER, misc 127 (all schools)
-- ============================================================================
DELETE FROM `spell` WHERE `id` IN (900189, 900190, 900191);

INSERT INTO `spell` SET
    `id` = 900189,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -3,
    `effect_base_points_2` = 9,
    `effect_base_points_3` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 237,
    `effect_apply_aura_name_3` = 238,
    `effect_misc_value_a_1` = 14,
    `effect_misc_value_a_2` = 126,
    `effect_misc_value_a_3` = 127,
    `spell_icon_id` = 5455,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ancestral Insight',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the mana cost of your instant cast Shaman spells by $s1% and increases your spell power by an amount equal to $s2% of your attack power.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900190,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -5,
    `effect_base_points_2` = 19,
    `effect_base_points_3` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 237,
    `effect_apply_aura_name_3` = 238,
    `effect_misc_value_a_1` = 14,
    `effect_misc_value_a_2` = 126,
    `effect_misc_value_a_3` = 127,
    `spell_icon_id` = 5455,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ancestral Insight',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the mana cost of your instant cast Shaman spells by $s1% and increases your spell power by an amount equal to $s2% of your attack power.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900191,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -7,
    `effect_base_points_2` = 29,
    `effect_base_points_3` = 29,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 237,
    `effect_apply_aura_name_3` = 238,
    `effect_misc_value_a_1` = 14,
    `effect_misc_value_a_2` = 126,
    `effect_misc_value_a_3` = 127,
    `spell_icon_id` = 5455,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ancestral Insight',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the mana cost of your instant cast Shaman spells by $s1% and increases your spell power by an amount equal to $s2% of your attack power.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- ============================================================================
-- Ironhide (900192, 900193, 900194) - Passive, 3 ranks
-- Clone of Armored to the Teeth (61216/61221/61222) for Shaman.
-- E1: aura 285 MOD_ATTACK_POWER_OF_ARMOR - base_points is the armor divisor.
-- E2: DUMMY - carries rank multiplier for tooltip ($m2).
-- Tooltip: "$s2 AP per $m1*$m2 armor"  ($m1*$m2 always = 108)
--   Rank 1: bp1=107 ($m1=108), bp2=0 ($m2=1, $s2=1)
--   Rank 2: bp1=53  ($m1=54),  bp2=1 ($m2=2, $s2=2)
--   Rank 3: bp1=35  ($m1=36),  bp2=2 ($m2=3, $s2=3)
-- ============================================================================
DELETE FROM `spell` WHERE `id` IN (900192, 900193, 900194);

INSERT INTO `spell` SET
    `id` = 900192,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 3,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 107,
    `effect_base_points_2` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 285,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4614,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ironhide',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your attack power by $s2 for every ${$m1*$m2} armor value you have.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900193,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 3,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 53,
    `effect_base_points_2` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 285,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4614,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ironhide',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your attack power by $s2 for every ${$m1*$m2} armor value you have.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900194,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 3,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 35,
    `effect_base_points_2` = 2,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 285,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 4614,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ironhide',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your attack power by $s2 for every ${$m1*$m2} armor value you have.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- ============================================================================
-- Wild Protector (900195, 900196, 900197) - Passive, 3 ranks
-- Mirrors Unleashed Rage (30802) pattern but swaps party AP% for party DR.
-- E1: aura 240 MOD_EXPERTISE (self) - same expertise values as Unleashed Rage
-- E2: APPLY_AREA_AURA_PARTY (65), aura 87 MOD_DAMAGE_PERCENT_TAKEN,
--     misc 127 (all schools), radius 30yd - party DR (negative = reduces)
-- ============================================================================
DELETE FROM `spell` WHERE `id` IN (900195, 900196, 900197);

INSERT INTO `spell` SET
    `id` = 900195,
    `attributes` = 80,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 65,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 2,
    `effect_base_points_2` = -3,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_radius_index_2` = 12,
    `effect_apply_aura_name_1` = 240,
    `effect_apply_aura_name_2` = 87,
    `effect_misc_value_a_1` = 1,
    `effect_misc_value_a_2` = 127,
    `spell_icon_id` = 5490,
    `spell_priority` = 50,
    `spell_name_enus` = 'Wild Protector',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your expertise by $s1, and reduces all damage taken by party and raid members within $a2 yards of the Shaman by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases expertise by $s1. Reduces damage taken by allies within $a2 yards by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900196,
    `attributes` = 80,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 65,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 5,
    `effect_base_points_2` = -4,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_radius_index_2` = 12,
    `effect_apply_aura_name_1` = 240,
    `effect_apply_aura_name_2` = 87,
    `effect_misc_value_a_1` = 1,
    `effect_misc_value_a_2` = 127,
    `spell_icon_id` = 5490,
    `spell_priority` = 50,
    `spell_name_enus` = 'Wild Protector',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your expertise by $s1, and reduces all damage taken by party and raid members within $a2 yards of the Shaman by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases expertise by $s1. Reduces damage taken by allies within $a2 yards by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900197,
    `attributes` = 80,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 65,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 9,
    `effect_base_points_2` = -6,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_radius_index_2` = 12,
    `effect_apply_aura_name_1` = 240,
    `effect_apply_aura_name_2` = 87,
    `effect_misc_value_a_1` = 1,
    `effect_misc_value_a_2` = 127,
    `spell_icon_id` = 5490,
    `spell_priority` = 50,
    `spell_name_enus` = 'Wild Protector',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your expertise by $s1, and reduces all damage taken by party and raid members within $a2 yards of the Shaman by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases expertise by $s1. Reduces damage taken by allies within $a2 yards by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- ============================================================================
-- Improved Tectonic Blast (900198, 900199) - Passive talent, 2 ranks
-- After casting Tectonic Blast, gain Tectonic Resonance buff (900200/900201)
-- for 8 sec, increasing the damage of your next Earth Shock by 10%/20%.
-- proc filter: Tectonic Blast cast (SpellFamilyMask2=32768, SpellPhaseMask=1)
-- ProcFlags lives in spell_proc (zz_[F-164]_shaman_guardian_spells.sql)
-- ============================================================================

-- Improved Tectonic Blast R1 (900198) - triggers Tectonic Resonance R1 (900200)
DELETE FROM `spell` WHERE `id` = 900198;

INSERT INTO `spell` SET
    `id` = 900198,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900200,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Improved Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'After casting Tectonic Blast, you gain Tectonic Resonance, increasing the damage of your next Earth Shock by 10% within 8 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Tectonic Blast empowers your next Earth Shock by 10% for 8 sec.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Improved Tectonic Blast R2 (900199) - triggers Tectonic Resonance R2 (900201)
DELETE FROM `spell` WHERE `id` = 900199;

INSERT INTO `spell` SET
    `id` = 900199,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900201,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Improved Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'After casting Tectonic Blast, you gain Tectonic Resonance, increasing the damage of your next Earth Shock by 20% within 8 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Tectonic Blast empowers your next Earth Shock by 20% for 8 sec.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Tectonic Resonance (900200, 900201) - Buff applied by Improved Tectonic Blast
-- Aura 108 (ADD_PCT_MODIFIER) misc 0 (SPELLMOD_DAMAGE), filtered to Earth Shock
-- via effect_spell_class_mask_a_1=1048576 (Earth Shock bit 20).
-- Consumed when Earth Shock is cast (proc_charges=1, AttributesMask=8 in spell_proc).
-- ============================================================================

-- Tectonic Resonance R1 (900200) - +10% Earth Shock damage, 8 sec
DELETE FROM `spell` WHERE `id` = 900200;

INSERT INTO `spell` SET
    `id` = 900200,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 31,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 0,
    `effect_spell_class_mask_a_1` = 1048576,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Tectonic Resonance',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Earth Shock will deal $s1% additional damage.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Earth Shock will deal $s1% additional damage.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Tectonic Resonance R2 (900201) - +20% Earth Shock damage, 8 sec
DELETE FROM `spell` WHERE `id` = 900201;

INSERT INTO `spell` SET
    `id` = 900201,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 31,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 0,
    `effect_spell_class_mask_a_1` = 1048576,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Tectonic Resonance',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Earth Shock will deal $s1% additional damage.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Earth Shock will deal $s1% additional damage.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Earth Shock tooltip — show damage including SP scaling
--
-- Stock Earth Shock displays only base damage via $s2. SpellDescriptionVariable
-- 191 adds spell power scaling to the displayed value; all 10 player ranks
-- reference it (variable resolves $m2 per-rank).
--
-- Coefficient 0.386 matches AC's spell_bonus_data.direct_bonus for ranks 4-10
-- (R1-R3 use lower coefficients due to level penalty, but those ranks are
-- only seen at low level — discrepancy is cosmetic).
-- ============================================================================

-- Variable 191: SP-scaled damage + Earthen Power talent-aware slow display
-- $total = base damage + SP scaling (for spell_desc_enus)
-- $ep_r1/$ep_r2 = per-rank conditional addends — must be defined as separate
-- sub-variables (F-005 riding crop pattern, var 182). $?a inside a ${}
-- arithmetic block doesn't resolve; only ${$<var>+$<var>} arithmetic works.
-- $ep_total = base 10% + (5% if EP R1) + (10% if EP R2)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 191;
INSERT INTO `spelldescriptionvariables` SET
    `id` = 191,
    `var` = '$spbonus=${$sp*0.386}\n$total=${$m2+$<spbonus>}\n$ep_r1=$?s51523[${5}][${0}]\n$ep_r2=$?s51524[${10}][${0}]\n$ep_total=${10+$<ep_r1>+$<ep_r2>}';

UPDATE `spell` SET
    `spell_desc_variable_id` = 191,
    `spell_desc_enus` = 'Instantly shocks the target with concussive force, causing $<total> Nature damage and reducing melee attack speed by $<ep_total>% for $d.  Damage scales with spell power.',
    `spell_tooltip_enus` = 'Time between attacks increased by $<ep_total>%.'
WHERE `id` IN (8042, 8044, 8045, 8046, 10412, 10413, 10414, 25454, 49230, 49231);

-- ============================================================================
-- Enhancement Talent Tree Additions (F-164)
-- ============================================================================
-- R1 (T0): Shock and Awe (900210-900212) replaces Earth's Grasp 16043
-- R2 (T1): Wolf's Hunger (900216) replaces Guardian Totems 16258
-- Deep (T8 C1): Improved Lava Lash (900217-900219) replaces Shamanistic Rage slot
--   - Shamanistic Rage (talent 1693) moves T8 C1 -> T8 C2
--   - Earthen Power (talent 2056) removed from Enhancement
--
-- Shock and Awe debuff spells (900213-900215) are triggered by the talent passive.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Shock and Awe (900210-900212) - Talent passive
-- 3 ranks. E1: ADD_PCT_MODIFIER SPELLMOD_DAMAGE on Shaman shock spells (bits
-- 20/28/31 in mask_1 = Earth/Flame/Frost Shock, combined 2416967680).
-- E2: PROC_TRIGGER_SPELL → debuff (900213/214/215). spell_proc filters to
-- shock casts only (SpellPhaseMask=1 CAST, excludes Flame Shock periodic ticks).
-- Pattern: Concussion (16035-16108) for shock damage boost.
-- ----------------------------------------------------------------------------

-- Shock and Awe R1 (+2% shock damage, triggers -2% armor debuff)
DELETE FROM `spell` WHERE `id` = 900210;

INSERT INTO `spell` SET
    `id` = 900210,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 1,
    `effect_base_points_2` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 0,
    `effect_trigger_spell_2` = 900213,
    `effect_spell_class_mask_a_1` = 2416967680,
    `spell_icon_id` = 5445,
    `spell_name_enus` = 'Shock and Awe',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage of your shock spells by $s1%. Your shock spells also reduce the target''s armor by 2% for $900213d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

-- Shock and Awe R2 (+4% shock damage, triggers -4% armor debuff)
DELETE FROM `spell` WHERE `id` = 900211;

INSERT INTO `spell` SET
    `id` = 900211,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 3,
    `effect_base_points_2` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 0,
    `effect_trigger_spell_2` = 900214,
    `effect_spell_class_mask_a_1` = 2416967680,
    `spell_icon_id` = 5445,
    `spell_name_enus` = 'Shock and Awe',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage of your shock spells by $s1%. Your shock spells also reduce the target''s armor by 4% for $900214d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

-- Shock and Awe R3 (+6% shock damage, triggers -6% armor debuff)
DELETE FROM `spell` WHERE `id` = 900212;

INSERT INTO `spell` SET
    `id` = 900212,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 5,
    `effect_base_points_2` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 0,
    `effect_trigger_spell_2` = 900215,
    `effect_spell_class_mask_a_1` = 2416967680,
    `spell_icon_id` = 5445,
    `spell_name_enus` = 'Shock and Awe',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage of your shock spells by $s1%. Your shock spells also reduce the target''s armor by 6% for $900215d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Shock and Awe Debuffs (900213-900215) - Applied on target by shock casts
-- Reduces target armor via aura 142 (MOD_BASE_RESISTANCE_PCT) misc 1.
-- Duration 10s (matches Earth Shock CD).
-- NOT_IN_SPELLBOOK (attributes_ex_4 = 32768) so it doesn't appear in player UI.
-- ----------------------------------------------------------------------------

-- Shock and Awe Debuff R1 (-2% armor, 10s)
DELETE FROM `spell` WHERE `id` = 900213;

INSERT INTO `spell` SET
    `id` = 900213,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -3,
    `effect_implicit_target_a_1` = 6,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 5445,
    `spell_name_enus` = 'Shock and Awe',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Armor reduced by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor reduced by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `damage_class` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- Shock and Awe Debuff R2 (-4% armor, 10s)
DELETE FROM `spell` WHERE `id` = 900214;

INSERT INTO `spell` SET
    `id` = 900214,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -5,
    `effect_implicit_target_a_1` = 6,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 5445,
    `spell_name_enus` = 'Shock and Awe',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Armor reduced by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor reduced by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `damage_class` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- Shock and Awe Debuff R3 (-6% armor, 10s)
DELETE FROM `spell` WHERE `id` = 900215;

INSERT INTO `spell` SET
    `id` = 900215,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -7,
    `effect_implicit_target_a_1` = 6,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 5445,
    `spell_name_enus` = 'Shock and Awe',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Armor reduced by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor reduced by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `damage_class` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Wolf's Hunger (900216) - 1-min CD melee damage CD
-- 12 sec duration. Aura 79 (MOD_DAMAGE_PERCENT_DONE), school mask 1 (physical).
-- Boosts auto-attacks, Stormstrike physical hit, Lava Lash — not shocks/LB/CL.
-- ----------------------------------------------------------------------------

DELETE FROM `spell` WHERE `id` = 900216;

INSERT INTO `spell` SET
    `id` = 900216,
    `attributes` = 16,
    `cast_time_index` = 1,
    `duration_index` = 29,
    `recovery_time` = 60000,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 29,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 79,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 5318,
    `spell_name_enus` = 'Wolf''s Hunger',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Embrace the spirit of the wolf, increasing your physical damage done by $s1% for $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Physical damage increased by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Improved Lava Lash (900217-900219) - Talent passive
-- 3 ranks. Boosts Lava Lash crit damage (aura 108 misc 15) and crit chance
-- (aura 108 misc 7), masked to Lava Lash family (spell_class_mask_3 = 4).
-- ----------------------------------------------------------------------------

-- Improved Lava Lash R1 (+10% crit damage, +2% crit chance)
DELETE FROM `spell` WHERE `id` = 900217;

INSERT INTO `spell` SET
    `id` = 900217,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 9,
    `effect_base_points_2` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_1` = 15,
    `effect_misc_value_a_2` = 7,
    `effect_spell_class_mask_c_1` = 4,
    `effect_spell_class_mask_c_2` = 4,
    `spell_icon_id` = 5289,
    `spell_name_enus` = 'Improved Lava Lash',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the critical strike damage of your Lava Lash by $s1% and its critical strike chance by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

-- Improved Lava Lash R2 (+20% crit damage, +4% crit chance)
DELETE FROM `spell` WHERE `id` = 900218;

INSERT INTO `spell` SET
    `id` = 900218,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 19,
    `effect_base_points_2` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_1` = 15,
    `effect_misc_value_a_2` = 7,
    `effect_spell_class_mask_c_1` = 4,
    `effect_spell_class_mask_c_2` = 4,
    `spell_icon_id` = 5289,
    `spell_name_enus` = 'Improved Lava Lash',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the critical strike damage of your Lava Lash by $s1% and its critical strike chance by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Earthwarden-tree clones of shared talents (F-164)
-- Stock Spirit Weapons (16268) and Shamanistic Focus (43338) live in BOTH the
-- Enhancement and Earthwarden trees. Because both talent rows reference the
-- same spell ID, the client incorrectly displays the talent as allocated in
-- both trees when the player only spends a point in one.
--
-- Fix: clone the spells with new IDs (900220, 900221) and point the
-- Earthwarden talent rows at the clones. Identical mechanics, decoupled
-- identity — UI shows each tree's allocation independently.
-- ----------------------------------------------------------------------------

-- Spirit Weapons clone (900220) — Earthwarden tree. Learns 18848 (parry passive),
-- same as stock 16268. Icon and description match.
DELETE FROM `spell` WHERE `id` = 900220;

INSERT INTO `spell` SET
    `id` = 900220,
    `attributes` = 159646096,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 36,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_trigger_spell_1` = 18848,
    `spell_icon_id` = 558,
    `spell_name_enus` = 'Spirit Weapons',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Gives a chance to parry enemy melee attacks.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- Shamanistic Focus clone (900221) — Earthwarden tree. -45% shock mana cost,
-- same as stock 43338.
DELETE FROM `spell` WHERE `id` = 900221;

INSERT INTO `spell` SET
    `id` = 900221,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -46,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 14,
    `effect_spell_class_mask_a_1` = 2416967680,
    `spell_icon_id` = 2016,
    `spell_name_enus` = 'Shamanistic Focus',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the mana cost of your Shock spells by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Shields - remove charge counters (F-164)
-- Lightning Shield, Water Shield, and Earth Shield are made charge-less so
-- the buff is just a persistent 10-min aura. No charge consumption on damage
-- taken / heal-on-hit. Includes WotLK ranks 10 (49280) and 11 (49281) of LS
-- which were missed in the earlier pass, and all Earth Shield player ranks.
-- ----------------------------------------------------------------------------
UPDATE `spell` SET `proc_charges` = 0 WHERE `id` IN (49280, 49281, 974, 32593, 32594, 49283, 49284);

-- ----------------------------------------------------------------------------
-- Static Shock (51525/51526/51527) - remove +charges to Lightning Shield
-- Stock effect 2 = aura 107 (ADD_FLAT_MODIFIER) misc 4 (SPELLMOD_CHARGES) adds
-- +2/+4/+6 max charges to LS, re-introducing the charge mechanic on top of our
-- DBC chargeless LS (proc_charges=0). Zero out effect 2 so Static Shock keeps
-- the on-melee-strike LS proc (handled by spell_sha_static_shock SpellScript
-- via effect 1 dummy) but does NOT add max charges back.
-- ----------------------------------------------------------------------------
UPDATE `spell` SET
    `effect_2` = 0,
    `effect_apply_aura_name_2` = 0,
    `effect_misc_value_a_2` = 0,
    `effect_base_points_2` = 0,
    `spell_desc_enus` = 'You have a $s1% chance to hit your target with a Lightning Shield orb when you deal damage with melee attacks and abilities.'
WHERE `id` IN (51525, 51526, 51527);

-- ----------------------------------------------------------------------------
-- Lightning Bolt tooltip — show SP-scaled damage range (F-164)
-- Mirrors the Earth Shock tooltip rewrite. Variable 192 adds spell power
-- scaling to both min and max damage via the canonical 0.714 (5/7) coefficient
-- used by ranks 4-14. R1-R3 use lower coefficients due to level penalty —
-- displayed value is mildly optimistic at those low ranks (cosmetic only).
-- Shows range "X to Y" using $m1 (min) and $M1 (max).
-- ----------------------------------------------------------------------------
DELETE FROM `spelldescriptionvariables` WHERE `id` = 192;
INSERT INTO `spelldescriptionvariables` SET
    `id` = 192,
    `var` = '$spbonus=${$sp*0.714}\n$dmgmin=${$m1+$<spbonus>}\n$dmgmax=${$M1+$<spbonus>}';

UPDATE `spell` SET
    `spell_desc_variable_id` = 192,
    `spell_desc_enus` = 'Casts a bolt of lightning at the target for $<dmgmin> to $<dmgmax> Nature damage. Damage scales with spell power.'
WHERE `id` IN (403, 529, 548, 915, 943, 6041, 10391, 10392, 15207, 15208, 25448, 25449, 49237, 49238);

-- ----------------------------------------------------------------------------
-- Restore Enhancement Spirit Weapons (16268) threat reduction (F-164)
-- Earlier F-164 work removed effect 2 to disable the -30% threat passive
-- (36591) to support Enhancement tanking. User decision: Enhancement keeps
-- the threat reduction (DPS spec context); Earthwarden version (900220 clone)
-- has NO threat reduction (parry only). Restore effect 2 on stock 16268.
-- ----------------------------------------------------------------------------
UPDATE `spell` SET
    `effect_2` = 36,
    `effect_trigger_spell_2` = 36591,
    `effect_implicit_target_a_2` = 1,
    `effect_die_sides_2` = 1,
    `spell_desc_enus` = 'Gives a chance to parry enemy melee attacks and reduces threat generated by 30%.'
WHERE `id` = 16268;

-- Improved Lava Lash R3 (+30% crit damage, +5% crit chance)
DELETE FROM `spell` WHERE `id` = 900219;

INSERT INTO `spell` SET
    `id` = 900219,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 29,
    `effect_base_points_2` = 4,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_1` = 15,
    `effect_misc_value_a_2` = 7,
    `effect_spell_class_mask_c_1` = 4,
    `effect_spell_class_mask_c_2` = 4,
    `spell_icon_id` = 5289,
    `spell_name_enus` = 'Improved Lava Lash',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the critical strike damage of your Lava Lash by $s1% and its critical strike chance by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;
-- ----------------------------------------------------------------------------
-- Fix Improved Ghost Wolf talent (2961) ranks after F-164 re-add
-- R1 (16262) was never migrated to spell family 14 in I-050 (Ghost Wolf moved
-- from family 11 mask 2048 to family 14 bit 30), so its cast time modifier
-- targeted nothing. Migrate it to match R2 (16287): family 14, bit 29
-- (Ghost Wolf Modifiers), effects target bit 30 (Ghost Wolf).
-- Rebalance: GW base cast is 2.0s (not 3.0s as the re-add assumed), so the
-- stock -1s/-2s values made R2 instant. New design per user:
--   R1: -0.5s cast, +5% movement speed (SPELLMOD_EFFECT2 flat on GW speed)
--   R2: -1.0s cast, +10% movement speed
-- ----------------------------------------------------------------------------
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 536870912,
    `effect_base_points_1` = -501,
    `effect_spell_class_mask_a_1` = 1073741824,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 12,
    `effect_base_points_2` = 4,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_b_1` = 1073741824,
    -- 0.5 hardcoded: client $/1000;s1 integer-divides, so 500/1000 displays as 0
    `spell_desc_enus` = 'Reduces the cast time of your Ghost Wolf spell by 0.5 sec and increases its movement speed bonus by an additional $s2%.'
WHERE `id` = 16262;

UPDATE `spell` SET
    `effect_base_points_1` = -1001,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 12,
    `effect_base_points_2` = 9,
    `effect_spell_class_mask_b_1` = 1073741824,
    `spell_desc_enus` = 'Reduces the cast time of your Ghost Wolf spell by $/1000;s1 sec and increases its movement speed bonus by an additional $s2%.'
WHERE `id` = 16287;

-- ============================================================================
-- Rockbiter Weapon ranks 5-10 (F-164) — re-added TBC ranks + new WotLK rank 10
-- Tank/threat imbue. Per rank: imbue spell (9002xx) -> C++ damage-switch ->
-- enchant-spell (9002xx, applies enchant 900x) -> AP passive (9002xx).
-- AP = 7 x DPS (half stock 14:1, since flat AP > weapon damage).
-- DPS: R5 15 / R6 28 / R7 40 / R8 49 / R9 62 / R10 80
-- Levels: R5 34 / R6 44 / R7 54 / R8 62 / R9 70 / R10 78
-- C++ switch cases added in SpellEffects.cpp (forge patch): damage -> enchant-spell.
-- ============================================================================

-- ---- Imbue spells (cast by player; C++ EffectEnchantItemTmp maps damage->enchant-spell) ----
-- effect_base_points_2 = DPS-1 so calculated `damage` = DPS (die 1).
DELETE FROM `spell` WHERE `id` IN (900230,900231,900232,900233,900234,900235);

INSERT INTO `spell` SET `id` = 900230, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 34, `spell_level` = 34, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 14, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 5', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900250m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900231, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 44, `spell_level` = 44, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 27, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 6', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900251m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900232, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 54, `spell_level` = 54, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 39, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 7', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900252m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900233, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 62, `spell_level` = 62, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 48, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 8', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900253m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900234, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 70, `spell_level` = 70, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 61, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 9', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900254m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900235, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 78, `spell_level` = 78, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 79, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 10', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900255m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Reduces damage taken by 5%.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;

-- ---- Enchant-spells (cast on weapon by C++; effect_misc_value_a_1 = enchant id) ----
DELETE FROM `spell` WHERE `id` IN (900240,900241,900242,900243,900244,900245);

INSERT INTO `spell` SET `id` = 900240, `attributes` = 328192, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `range_index` = 1, `equipped_item_class` = 2, `equipped_item_subclass_mask` = 173555, `effect_1` = 54, `effect_2` = 3, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 1799, `effect_base_points_2` = 14, `effect_implicit_target_a_2` = 1, `effect_radius_index_2` = 16, `effect_misc_value_a_1` = 9000, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 5', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing its damage per second by $s2.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `start_recovery_category` = 133, `start_recovery_time` = 1500, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900241, `attributes` = 328192, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `range_index` = 1, `equipped_item_class` = 2, `equipped_item_subclass_mask` = 173555, `effect_1` = 54, `effect_2` = 3, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 1799, `effect_base_points_2` = 27, `effect_implicit_target_a_2` = 1, `effect_radius_index_2` = 16, `effect_misc_value_a_1` = 9001, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 6', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing its damage per second by $s2.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `start_recovery_category` = 133, `start_recovery_time` = 1500, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900242, `attributes` = 328192, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `range_index` = 1, `equipped_item_class` = 2, `equipped_item_subclass_mask` = 173555, `effect_1` = 54, `effect_2` = 3, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 1799, `effect_base_points_2` = 39, `effect_implicit_target_a_2` = 1, `effect_radius_index_2` = 16, `effect_misc_value_a_1` = 9002, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 7', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing its damage per second by $s2.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `start_recovery_category` = 133, `start_recovery_time` = 1500, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900243, `attributes` = 328192, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `range_index` = 1, `equipped_item_class` = 2, `equipped_item_subclass_mask` = 173555, `effect_1` = 54, `effect_2` = 3, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 1799, `effect_base_points_2` = 48, `effect_implicit_target_a_2` = 1, `effect_radius_index_2` = 16, `effect_misc_value_a_1` = 9003, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 8', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing its damage per second by $s2.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `start_recovery_category` = 133, `start_recovery_time` = 1500, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900244, `attributes` = 328192, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `range_index` = 1, `equipped_item_class` = 2, `equipped_item_subclass_mask` = 173555, `effect_1` = 54, `effect_2` = 3, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 1799, `effect_base_points_2` = 61, `effect_implicit_target_a_2` = 1, `effect_radius_index_2` = 16, `effect_misc_value_a_1` = 9004, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 9', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing its damage per second by $s2.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `start_recovery_category` = 133, `start_recovery_time` = 1500, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900245, `attributes` = 328192, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `range_index` = 1, `equipped_item_class` = 2, `equipped_item_subclass_mask` = 173555, `effect_1` = 54, `effect_2` = 3, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 1799, `effect_base_points_2` = 79, `effect_implicit_target_a_2` = 1, `effect_radius_index_2` = 16, `effect_misc_value_a_1` = 9005, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 10', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing its damage per second by $s2.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `start_recovery_category` = 133, `start_recovery_time` = 1500, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;

-- ---- AP passives (granted by enchant; aura 99 flat AP + aura 10 threat; mask_3=128 for Imp Rockbiter) ----
-- effect_base_points_1 = AP-1 (7 x DPS, die 1).
DELETE FROM `spell` WHERE `id` IN (900250,900251,900252,900253,900254,900255);

INSERT INTO `spell` SET `id` = 900250, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 104, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = -6, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 87, `effect_misc_value_a_3` = 127, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 5', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900251, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 195, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = -6, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 87, `effect_misc_value_a_3` = 127, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 6', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900252, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 279, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = -6, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 87, `effect_misc_value_a_3` = 127, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 7', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900253, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 342, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = -6, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 87, `effect_misc_value_a_3` = 127, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 8', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900254, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 433, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = -6, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 87, `effect_misc_value_a_3` = 127, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 9', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900255, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 559, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = -6, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 87, `effect_misc_value_a_3` = 127, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 10', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;

-- ============================================================================
-- Stoneguard Totem Damage Split (900222) - F-164 damage-mitigation totem aura
-- Cast by the Stoneguard Totem (earth slot) ON its owner via the
-- spell_sha_stoneguard_totem C++ script. Aura 81 (SPLIT_DAMAGE_PCT) redirects
-- 20% of the shaman's incoming damage to the totem (the aura's caster). Ends
-- when the totem dies/expires (handler skips dead casters). 10s = totem life.
-- The totem's VISIBLE health bar (5% of shaman max HP, set in the script) is
-- the trackable buffer; ~33% max uptime (30s CD / 10s duration).
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900222;
INSERT INTO `spell` SET
    `id` = 900222,
    `attributes` = 0,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 81,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 5313,
    `spell_name_enus` = 'Stoneguard Totem',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your Stoneguard Totem is absorbing 20% of the damage you take.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Absorbing 20% of damage taken.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- Glyph of Stoneclaw Totem (63298) reverted to stock (self-shield) — Stoneclaw is unchanged again.

-- ============================================================================
-- Stonewall (900223) - F-164 Earthwarden block panic button (active talent 2958)
-- Instant, shield required, 2 min CD, 60s. Applies a MOD_BLOCK_PERCENT buff at
-- 10 stacks (+50% block). Each block consumes a stack (-5%) until 0 or expiry.
-- Stack/amount driven by the spell_sha_stonewall_aura C++ script (block% =
-- 5 x stacks; SetStackAmount(10) on apply; ModStackAmount(-1) on block proc).
-- proc_flags 40 + spell_proc HitMask 64 (block) like Bastion of Earth.
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900223;
INSERT INTO `spell` SET
    `id` = 900223,
    `attributes` = 16,
    `cast_time_index` = 1,
    `duration_index` = 3,
    `recovery_time` = 120000,
    `category_recovery_time` = 120000,
    `proc_chance` = 100,
    `proc_flags` = 40,
    `range_index` = 1,
    `equipped_item_class` = 4,
    `equipped_item_subclass_mask` = 64,
    `stack_amount` = 10,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 4,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 51,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Stonewall',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Raise a stone wall, increasing your block chance by 50%. Each time you block, the bonus is reduced by 5%. Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block chance increased, reduced by 5% per block.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900224;

-- Stoneguard Totem (900224) - F-164 damage-mitigation totem (baseline, trainer)
-- Earth slot, 10s duration, 30s independent CD. Summons creature 900100; a C++
-- SpellScript (spell_sha_stoneguard_totem) sets the totem HP = 5% of shaman max
-- HP and has the totem cast the 20% damage split (900222) on the owner.
INSERT INTO `spell` SET
    `id` = 900224,
    `attributes` = 65536,
    `attributes_ex_7` = 32,
    `cast_time_index` = 1,
    `recovery_time` = 30000,
    `proc_chance` = 101,
    `base_level` = 20,
    `spell_level` = 20,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 28,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 0,
    `effect_implicit_target_a_1` = 41,
    `effect_misc_value_a_1` = 900100,
    `effect_misc_value_b_1` = 81,
    `spell_visual_1` = 362,
    `spell_icon_id` = 5313,
    `spell_name_enus` = 'Stoneguard Totem',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Summons a Stoneguard Totem with health equal to 5% of your maximum health at your feet for $d. While it stands, 20% of the damage you take is redirected to the totem.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Redirects 20% of your damage to the totem.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 6,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1000,
    `spell_class_set` = 11,
    `damage_class` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `totem_category_1` = 2,
    `school_mask` = 1;
