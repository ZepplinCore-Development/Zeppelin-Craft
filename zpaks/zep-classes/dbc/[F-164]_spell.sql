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


DELETE FROM `spell` WHERE `id` = 900207;

INSERT INTO `spell` SET
    `id` = 900207,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -9,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;


DELETE FROM `spell` WHERE `id` = 900208;

INSERT INTO `spell` SET
    `id` = 900208,
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
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;


-- ----------------------------------------------------------------------------
-- Molten Plating (900161-900163, 900203-900204) - 5 ranks, passive
-- E1 aura 142 (MOD_BASE_RESISTANCE_PCT, armor): +6% armor per rank (6/12/18/24/30%).
-- E2 aura 150 (MOD_SHIELD_BLOCKVALUE_PCT): +3% block value per rank (3/6/9/12/15%).
-- Block value feeds Rockslam scaling. Icon 4644.
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
    `effect_base_points_1` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = 2,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 150,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
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
    `effect_base_points_1` = 11,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = 5,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 150,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
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
    `effect_base_points_1` = 17,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = 8,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 150,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;


DELETE FROM `spell` WHERE `id` = 900203;

INSERT INTO `spell` SET
    `id` = 900203,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 23,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_misc_value_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = 11,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 150,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;


DELETE FROM `spell` WHERE `id` = 900204;

INSERT INTO `spell` SET
    `id` = 900204,
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
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = 14,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 150,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;


-- ----------------------------------------------------------------------------
-- Stoneskin (900164) - MERGED INTO Rockwall (900223) in F-164. Its -30% damage
-- reduction is now Rockwall's effect 2 (Rockwall also keeps the +5 Rocksteady burst,
-- uses Stoneskin's icon 5469 + Stoneform visual). Stoneskin removed; its SLA (200079)
-- is also dropped. The talent must be repointed off 900164 via the talent editor.
DELETE FROM `spell` WHERE `id` = 900164;

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
    -- Effect 3: MOD_RESISTANCE (armor, school 1) - base 0 so VS alone grants nothing;
    -- Improved Volcanic Shield (900123-900125) supplies the level-scaled amount via a
    -- SPELLMOD_EFFECT3 (op 23) flat modifier. Net: bonus armor ONLY while VS is active
    -- AND Imp VS is talented.
    `effect_3` = 6,
    `effect_apply_aura_name_3` = 22,
    `effect_misc_value_a_3` = 1,
    `effect_base_points_3` = 0,
    `effect_die_sides_3` = 0,
    `effect_implicit_target_a_3` = 1,
    `spell_visual_1` = 90003,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Surrounds the caster with a shield of volcanic energy. When you block an attack, the shield erupts for $?s900278[$<totalg>][$<total>] Fire damage, scaling with Spell Power, to all enemies within 8 yards. Only one eruption will fire every few seconds.$?s900124[ Each activation also restores $900124s1% of your maximum mana.][]$?s900123[ Each activation also restores $900123s1% of your maximum mana.][] Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $?s900278[$<totalg>][$<total>] Fire damage to all nearby enemies when you block. Only one eruption will fire every few seconds.$?s900124[ Each activation also restores $900124s1% of your maximum mana.][]$?s900123[ Each activation also restores $900123s1% of your maximum mana.][]',
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
SET @rs_ap_coeff = 0;  -- AP scaling removed: Rockslam already double-dips on shield block value (C++ spell_sha_rockslam adds GetShieldBlockValue 1.0x). Block value is its sole scaling stat. To re-enable AP, set this AND re-add the 900119 spell_bonus_data ap_bonus row.

-- ----------------------------------------------------------------------------
-- Rockslam (900119) - Shield bash dealing flat damage + block buff
-- E1: SCHOOL_DAMAGE (effect 2) - base + perlevel + shield block value (no AP scaling)
-- E2: (none) — block buff removed; Rocksteady now driven by Improved Rockslam proc
-- Desc uses the custom $k block-value token (F-183 exe patch). $k renders the
-- player's live shield block value; only works on the patched Wow.exe. On an
-- un-patched client it shows literally as "$k".
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900119;

INSERT INTO `spell` SET
    `id` = 900119,
    `attributes` = 327680,
    `attributes_ex_1` = 512,
    `attributes_ex_3` = 67108866,
    `facing_caster_flags` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 6000,
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
    `spell_desc_enus` = 'Bashes the target with your shield, dealing $<dmg> Physical damage. Scales with your shield block value.$?s900182[ Adds 2 stacks of Rocksteady per cast.][]$?s900181[ Adds 1 stack of Rocksteady per cast.][]',
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

-- Variable 189: Rockslam tooltip damage (base + per-level + shield block value)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 189;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (189, CONCAT(
    '$perlevel=${($pl-', @rs_base_level, ')*', @rs_dmg_perlevel, '}\n',
    '$dmg=${$m1+$<perlevel>+$bv}'));

-- ============================================================================
-- F-164 single-target DPS package: Crag Strike (filler) + Rocksurge (spender).
-- Rockslam (900119) also gains shield-block-value scaling via C++ spell_sha_rockslam.
-- Placeholder icons/visuals (5489 / 5494 / 42) — swap later.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Crag Strike (900262) - TALENT-GRANTED spammable melee filler.
-- Instant, no cooldown, low mana; fills GCDs for single-target damage/threat.
-- Gated behind a talent (it is a generic melee move Enhancement could also want)
-- rather than baseline trainer: place a talent with SpellRank -> 900262 via the
-- talent editor. SLA 200098 on the Earthwarden line (9001), acquire_method 0.
-- ----------------------------------------------------------------------------
SET @cs_dmg_base = 30;
SET @cs_dmg_die = 1;
SET @cs_dmg_perlevel = 3.0;
SET @cs_ap_coeff = 0.15;
SET @cs_base_level = 20;
SET @cs_max_level = 80;
SET @cs_armor_pct_per_stack = 4;  -- Cracked Armor (900264) armor reduction per stack
SET @cs_armor_stacks = 5;         -- max stacks -> 4/8/12/16/20% (Sunder-style ramp)
DELETE FROM `spell` WHERE `id` = 900262;
INSERT INTO `spell` SET
    `id` = 900262,
    `attributes` = 327680,
    `attributes_ex_1` = 512,
    `attributes_ex_3` = 67108866,
    `facing_caster_flags` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 4000,
    `proc_chance` = 101,
    `max_level` = @cs_max_level,
    `base_level` = @cs_base_level,
    `spell_level` = @cs_base_level,
    `range_index` = 2,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = @cs_dmg_die,
    `effect_real_points_per_level_1` = @cs_dmg_perlevel,
    `effect_base_points_1` = @cs_dmg_base,
    `effect_implicit_target_a_1` = 6,
    `effect_bonus_multiplier_1` = @cs_ap_coeff,
    -- Effect 2: TRIGGER_SPELL (64) -> Cracked Armor (900264) on the target. Refreshed
    -- every cast; a major armor debuff that does NOT stack with Sunder/Expose (shares
    -- spell_group 1015 "Major Armor Debuffs", EXCLUSIVE_SAME_EFFECT).
    `effect_2` = 64,
    `effect_trigger_spell_2` = 900264,
    `effect_implicit_target_a_2` = 6,
    `spell_visual_1` = 42,
    `spell_icon_id` = 4609,
    `spell_name_enus` = 'Crag Strike',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'A swift weapon strike dealing $<dmg> Physical damage and cracking the target''s armor, reducing it by $900264s1% per stack. Scales with Attack Power.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $<dmg> Physical damage.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 5,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 524288,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1,
    `spell_desc_variable_id` = 190;

-- Crag Strike damage tooltip ($<dmg> = $m1 + per-level + AP*coeff).
DELETE FROM `spelldescriptionvariables` WHERE `id` = 190;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (190, CONCAT(
    '$perlevel=${($pl-', @cs_base_level, ')*', @cs_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @cs_ap_coeff, '}\n',
    '$dmg=${$m1+$<perlevel>+$<apbonus>}'));

-- ----------------------------------------------------------------------------
-- Cracked Armor (900264) - Crag Strike's armor debuff. Major armor reduction
-- (aura 101 MOD_RESISTANCE_PCT, misc 1 = armor), -@cs_armor_pct_per_stack% PER STACK,
-- stacking to @cs_armor_stacks (4/8/12/16/20%) - the stacking aura multiplies the
-- per-stack amount by stack count automatically. Each Crag Strike adds a stack and
-- refreshes. Mirrors Sunder Armor's ramp; shares spell_group 1015 "Major Armor
-- Debuffs" (EXCLUSIVE_SAME_EFFECT) so it does NOT stack with Sunder/Expose (strongest
-- single debuff applies). 30s duration. NOT_IN_SPELLBOOK; red-border debuff via
-- spell_custom_attr 0x1000 + spell_group membership (zz_[F-164]_shaman_guardian_spells.sql).
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900264;
INSERT INTO `spell` SET
    `id` = 900264,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 9,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `stack_amount` = @cs_armor_stacks,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 101,
    `effect_misc_value_a_1` = 1,
    -- base = -(pct+1); with die_sides=1 the applied/displayed value is base+1 = -pct
    -- (the +1 base-points convention, same as Rocksteady base 4 -> 5%). So -5 -> 4% per stack.
    `effect_base_points_1` = -(@cs_armor_pct_per_stack + 1),
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 6,
    `spell_icon_id` = 2771,
    `spell_name_enus` = 'Cracked Armor',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Armor reduced by $s1% per stack.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor reduced by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 16777216,  -- bit 24 (unique): identity so Glyph of Crag Strike (900276) can SPELLMOD_EFFECT1 the per-stack armor reduction
    `school_mask` = 1;
-- NOTE: a live total ("Armor reduced by 12%") would need the $w1 (AuraEffect::GetAmount)
-- token, which is an Ascension-client parser extension — NOT in stock 3.3.5a. Would
-- require exe-patching the token into our client first. Static per-stack wording for now.
DELETE FROM `spelldescriptionvariables` WHERE `id` = 200;

-- ----------------------------------------------------------------------------
-- Rocksurge (900263) - single-target burst (baseline, trainer-learned L24).
-- Instant, 12s CD. Scales with CURRENT Rocksteady (900261) stacks WITHOUT consuming
-- them (more block = harder hit, no mitigation loss). No C++ script: the Rocksteady
-- buff carries a SPELLMOD_DAMAGE percent effect (aura 108) targeting Rocksurge's
-- family bit (spell_class_set 11, mask_3 = 1048576), and the stacking aura multiplies
-- that modifier by stack count automatically -> +@rsg_pct_per_stack% damage per stack
-- (x10 stacks = +100% = double damage).
-- Naturally Earthwarden-only useful (Enhancement never has Rocksteady stacks).
-- ----------------------------------------------------------------------------
SET @rsg_dmg_base = 150;
SET @rsg_dmg_die = 1;
SET @rsg_dmg_perlevel = 6.0;
SET @rsg_ap_coeff = 0.25;
SET @rsg_base_level = 20;
SET @rsg_max_level = 80;
SET @rsg_pct_per_stack = 10;  -- +10% Rocksurge damage per Rocksteady stack (x10 stacks = +100% = double)
DELETE FROM `spell` WHERE `id` = 900263;
INSERT INTO `spell` SET
    `id` = 900263,
    `attributes` = 327680,
    `attributes_ex_1` = 512,
    `attributes_ex_3` = 67108866,
    `facing_caster_flags` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 12000,
    `proc_chance` = 101,
    `max_level` = @rsg_max_level,
    `base_level` = @rsg_base_level,
    `spell_level` = @rsg_base_level,
    `range_index` = 34,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = @rsg_dmg_die,
    `effect_real_points_per_level_1` = @rsg_dmg_perlevel,
    `effect_base_points_1` = @rsg_dmg_base,
    `effect_implicit_target_a_1` = 6,
    `effect_bonus_multiplier_1` = @rsg_ap_coeff,
    `spell_visual_1` = 90020,
    `spell_icon_id` = 4975,
    `spell_name_enus` = 'Rocksurge',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    -- $?s900272 = has Glyph of Rocksurge. Base @rsg_pct_per_stack (10); glyphed adds
    -- @glyph_rocksurge_per_stack (5, set later in the glyph block) -> 15 per stack.
    `spell_desc_enus` = CONCAT('A stone spike erupts below the current enemy target, dealing $<dmg> Physical damage, increased by $?s900272[', (@rsg_pct_per_stack + 5), '][', @rsg_pct_per_stack, ']% for each stack of Rocksteady you have. Scales with Attack Power.'),
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals Physical damage, increased for each Rocksteady stack.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 8,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 1048576,
    -- damage_class MAGIC (not MELEE) so it can't be parried/dodged/blocked; stays
    -- Physical (school_mask=1) so it's still armor-reduced. prevention_type 1
    -- (silenced) to match the spell classification rather than pacified.
    `damage_class` = 1,
    `prevention_type` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1,
    `spell_desc_variable_id` = 193;

-- Variable 193 (NOT 191 — 191 is Earth Shock's): Rocksurge tooltip damage.
DELETE FROM `spelldescriptionvariables` WHERE `id` = 193;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (193, CONCAT(
    '$perlevel=${($pl-', @rsg_base_level, ')*', @rsg_dmg_perlevel, '}\n',
    '$apbonus=${$AP*', @rsg_ap_coeff, '}\n',
    '$dmg=${$m1+$<perlevel>+$<apbonus>}'));

-- ============================================================================
-- F-164 GLYPHS (PoC). Pipeline: glyph item (item_template, on-use) -> APPLY_GLYPH
-- spell (900271) -> glyphproperties row (90001) -> modifier spell (900270).
-- glyphproperties rows live in [F-164]_glyphproperties.sql; the glyph item in
-- zz_[F-164]_glyphs.sql. SPELLMOD glyphs require the target ability to have a
-- family mask (Rockslam = mask_3 bit 262144).
-- ============================================================================

-- 900270 Glyph of Rockslam (modifier): passive SPELLMOD_COOLDOWN (-1.5s) on Rockslam.
DELETE FROM `spell` WHERE `id` = 900270;
INSERT INTO `spell` SET
    `id` = 900270,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 11,
    `effect_base_points_1` = -1500,
    `effect_die_sides_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 262144,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Glyph of Rockslam',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the cooldown of your Rockslam by 1.5 sec.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900271 Glyph of Rockslam (apply): cast by the glyph item; SPELL_EFFECT_APPLY_GLYPH
-- (74) with misc = glyphproperties ID 90001. attributes 0x10000000 matches stock
-- glyph-apply spells (e.g. 55559 Glyph of Stormstrike).
DELETE FROM `spell` WHERE `id` = 900271;
INSERT INTO `spell` SET
    `id` = 900271,
    `attributes` = 268435456,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 74,
    `effect_misc_value_a_1` = 6001,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Glyph of Rockslam',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

-- ============================================================================
-- F-164 GLYPH WAVE 1 (Major glyphs, all SPELLMOD - no scripts needed).
-- Each pair = modifier spell (passive ADD_FLAT/PCT_MODIFIER aura that alters the
-- target ability, filtered by the ability's family class mask) + apply spell
-- (APPLY_GLYPH effect cast by the glyph item, misc = glyphproperties id).
-- glyphproperties rows: [F-164]_glyphproperties.sql; items: zz_[F-164]_glyphs.sql.
--
-- glyphproperties IDs (Prop) MUST be <= 65535 (uint16 glyph protocol) - see
-- [F-164]_glyphproperties.sql; renumbered from 9000x to 600x.
--   Glyph              Item   Mod     Apply   Prop   Target  Effect
--   Rocksurge          57491  900272  900273  6002   900263  +5%/Rocksteady stack
--   Tectonic Blast     57492  900274  900275  6003   900121  +20% damage
--   Crag Strike        57493  900276  900277  6004   900262  +20% dmg + Cracked Armor 4->6%
--   Volcanic Shield    57494  900278  900279  6005   900122  +20% eruption dmg
--   Rockwall           57495  900280  900281  6006   900223  +6s duration (12->18s)
--   Thunderborne Leap  57496  900282  900283  6007   900174  +1s stun duration
--
-- Damage glyphs (108 ADD_PCT_MODIFIER, op 0 SPELLMOD_DAMAGE, +20). Rockwall +6s and
-- Thunderborne +1s stun are flat duration modifiers (107 ADD_FLAT_MODIFIER, op 1
-- SPELLMOD_DURATION). Rocksurge is a dummy marker read by spell_sha_rocksurge (see
-- below). Rocksurge/Tectonic/Crag/Volcanic damage glyphs unchanged.
-- ============================================================================
SET @glyph_dmg_pct = 20;             -- +% damage for the Tectonic/Crag/Volcanic glyphs
SET @glyph_rockwall_dur = 6000;      -- +ms Rockwall duration (12s base -> 18s)
SET @glyph_tbl_stun = 1000;          -- +ms Thunderborne Leap stun duration (2s -> 3s)
SET @glyph_rocksurge_per_stack = 5;  -- +% Rocksurge damage per Rocksteady stack (SPELLMOD_EFFECT2 on 900261)
SET @glyph_crag_armor_pct = 6;       -- Glyph of Crag Strike: Cracked Armor reduction per stack (base @cs_armor_pct_per_stack = 4 -> 6)

-- 900272 Glyph of Rocksurge (modifier): SPELLMOD_EFFECT2 (op 12) flat +5 on the
-- Rocksteady buff (900261, mask_3 bit 25). 900261's effect_2 is the SPELLMOD_DAMAGE
-- percent that gives Rocksurge +@rsg_pct_per_stack% per stack; this raises that
-- per-stack value by @glyph_rocksurge_per_stack (10% -> 15% per stack), and since
-- 900261 stacks the bonus scales with stacks too. Pure data, no script.
-- die_sides 0 -> flat value = base exactly. effect_misc_value 12 = SPELLMOD_EFFECT2
-- (modifies 900261's DBC effect_2, i.e. effect index 1).
DELETE FROM `spell` WHERE `id` = 900272;
INSERT INTO `spell` SET
    `id` = 900272,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 12,
    `effect_base_points_1` = @glyph_rocksurge_per_stack,
    `effect_die_sides_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 33554432,
    `spell_icon_id` = 4975,
    `spell_name_enus` = 'Glyph of Rocksurge',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage of your Rocksurge by an additional 5% for each stack of Rocksteady you have.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900273 Glyph of Rocksurge (apply): glyphproperties 90002.
DELETE FROM `spell` WHERE `id` = 900273;
INSERT INTO `spell` SET
    `id` = 900273,
    `attributes` = 268435456,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 74,
    `effect_misc_value_a_1` = 6002,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 4975,
    `spell_name_enus` = 'Glyph of Rocksurge',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

-- 900274 Glyph of Tectonic Blast (modifier): +20% Tectonic Blast (900121, now
-- mask_3 bit 23 after the Hex deconfliction) damage.
DELETE FROM `spell` WHERE `id` = 900274;
INSERT INTO `spell` SET
    `id` = 900274,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 0,
    `effect_base_points_1` = @glyph_dmg_pct,
    `effect_die_sides_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 8388608,
    `spell_icon_id` = 5366,
    `spell_name_enus` = 'Glyph of Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage of your Tectonic Blast by 20%.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900275 Glyph of Tectonic Blast (apply): glyphproperties 90003.
DELETE FROM `spell` WHERE `id` = 900275;
INSERT INTO `spell` SET
    `id` = 900275,
    `attributes` = 268435456,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 74,
    `effect_misc_value_a_1` = 6003,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 5366,
    `spell_name_enus` = 'Glyph of Tectonic Blast',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

-- 900276 Glyph of Crag Strike (modifier): TWO effects.
--   effect_1: +20% Crag Strike (900262, mask_3 bit 19) direct weapon damage.
--   effect_2: SPELLMOD_EFFECT1 (op 3) flat on Cracked Armor (900264, mask_3 bit 24),
--     lowering its effect_1 value by (@glyph_crag_armor_pct - @cs_armor_pct_per_stack)
--     so the per-stack armor reduction goes 4% -> 6%. Cracked Armor's value is
--     -(pct) (die_sides=1, base -(pct+1)); subtracting 2 makes -4 -> -6 = 6%/stack.
DELETE FROM `spell` WHERE `id` = 900276;
INSERT INTO `spell` SET
    `id` = 900276,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 0,
    `effect_base_points_1` = @glyph_dmg_pct,
    `effect_die_sides_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 524288,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 3,
    `effect_base_points_2` = -(@glyph_crag_armor_pct - @cs_armor_pct_per_stack),
    `effect_die_sides_2` = 0,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_b_3` = 16777216,
    `spell_icon_id` = 4609,
    `spell_name_enus` = 'Glyph of Crag Strike',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage of your Crag Strike by 20% and its Cracked Armor reduces armor by an additional 2% per stack.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900277 Glyph of Crag Strike (apply): glyphproperties 90004.
DELETE FROM `spell` WHERE `id` = 900277;
INSERT INTO `spell` SET
    `id` = 900277,
    `attributes` = 268435456,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 74,
    `effect_misc_value_a_1` = 6004,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 4609,
    `spell_name_enus` = 'Glyph of Crag Strike',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

-- 900278 Glyph of Volcanic Shield (modifier): +20% eruption damage. Targets the
-- triggered eruption spell 900122 (mask_3 bit 15), NOT the shield buff 900116 -
-- the eruption is where the damage lives.
DELETE FROM `spell` WHERE `id` = 900278;
INSERT INTO `spell` SET
    `id` = 900278,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 0,
    `effect_base_points_1` = @glyph_dmg_pct,
    `effect_die_sides_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Glyph of Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the eruption damage of your Volcanic Shield by 20%.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900279 Glyph of Volcanic Shield (apply): glyphproperties 90005.
DELETE FROM `spell` WHERE `id` = 900279;
INSERT INTO `spell` SET
    `id` = 900279,
    `attributes` = 268435456,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 74,
    `effect_misc_value_a_1` = 6005,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Glyph of Volcanic Shield',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

-- 900280 Glyph of Rockwall (modifier): +6 sec Rockwall (900223, mask_3 bit 21)
-- duration (12s base -> 18s). Flat duration modifier in ms.
DELETE FROM `spell` WHERE `id` = 900280;
INSERT INTO `spell` SET
    `id` = 900280,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 1,
    `effect_base_points_1` = @glyph_rockwall_dur,
    `effect_die_sides_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 2097152,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Glyph of Rockwall',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the duration of your Rockwall by 6 sec.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900281 Glyph of Rockwall (apply): glyphproperties 90006.
DELETE FROM `spell` WHERE `id` = 900281;
INSERT INTO `spell` SET
    `id` = 900281,
    `attributes` = 268435456,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 74,
    `effect_misc_value_a_1` = 6006,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Glyph of Rockwall',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

-- 900282 Glyph of Thunderborne Leap (modifier): +1 sec stun duration. Targets the
-- triggered landing stun 900174 (mask_3 bit 22), NOT the leap 900173 - the stun is
-- where the duration lives. Flat duration modifier in ms (2s -> 3s).
DELETE FROM `spell` WHERE `id` = 900282;
INSERT INTO `spell` SET
    `id` = 900282,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 1,
    `effect_base_points_1` = @glyph_tbl_stun,
    `effect_die_sides_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 4194304,
    `spell_icon_id` = 5364,
    `spell_name_enus` = 'Glyph of Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the stun duration of your Thunderborne Leap by 1 sec.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900283 Glyph of Thunderborne Leap (apply): glyphproperties 90007.
DELETE FROM `spell` WHERE `id` = 900283;
INSERT INTO `spell` SET
    `id` = 900283,
    `attributes` = 268435456,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 74,
    `effect_misc_value_a_1` = 6007,
    `effect_implicit_target_a_1` = 1,
    `spell_icon_id` = 5364,
    `spell_name_enus` = 'Glyph of Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

-- ============================================================================
-- F-164 GLYPH RECIPES (Inscription craft spells). Clone of stock glyph recipe
-- 57248 (Glyph of Stormstrike): effect 24 (CREATE_ITEM) makes the glyph item,
-- icon 2557, named after the glyph (stock convention). Learned from Inscription
-- trainers (npc_trainer template 201021 - the universal leveling/city list - see
-- zz_[F-164]_glyph_recipes_trainer.sql); listed under Inscription via
-- skilllineability skill 773 (see [F-164]_skilllineability.sql).
--
-- REAGENT/SKILL TIERED to the glyphed ability's ACTUAL acquisition level (talent
-- tier or trainer/baseline, NOT spell base_level), with ink gated to a skill a
-- leveling scribe could actually reach (char level x5 >= ink make-skill). Ink
-- make-skills measured from stock glyph recipes: Midnight ~80, Lion's ~115,
-- Celestial ~215.
--   Recipe  Item   Glyph                      Real lvl  Source          Ink             Gate
--   900290  57490  Glyph of Rockslam          ~19       baseline        Midnight 39774   80
--   900293  57493  Glyph of Crag Strike       19        talent tier 2   Midnight 39774   80
--   900291  57491  Glyph of Rocksurge         24        baseline        Lion's   43116  115
--   900295  57495  Glyph of Rockwall          29        talent tier 4   Lion's   43116  115
--   900294  57494  Glyph of Volcanic Shield   34        talent tier 5   Lion's   43116  130
--   900292  57492  Glyph of Tectonic Blast    39        talent tier 6   Lion's   43116  145
--   900296  57496  Glyph of Thunderborne Leap 59        talent tier 10  Celestial 43120 215
-- (Tectonic stays Lion's: a L39 char maxes ~195 Inscription, below Celestial's ~215.)
-- ============================================================================
DELETE FROM `spell` WHERE `id` IN (900290, 900291, 900292, 900293, 900294, 900295, 900296);

-- Midnight Ink (39774) - Rockslam (~L19), Crag Strike (L19)
INSERT INTO `spell` SET `id` = 900290, `attributes` = 65568, `cast_time_index` = 14, `equipped_item_class` = -1, `effect_1` = 24, `effect_item_type_1` = 57490, `effect_die_sides_1` = 1, `effect_base_points_1` = 0, `effect_implicit_target_a_1` = 1, `reagent_1` = 39774, `reagent_count_1` = 1, `spell_icon_id` = 2557, `spell_name_enus` = 'Glyph of Rockslam', `spell_name_flags` = 16712190, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900293, `attributes` = 65568, `cast_time_index` = 14, `equipped_item_class` = -1, `effect_1` = 24, `effect_item_type_1` = 57493, `effect_die_sides_1` = 1, `effect_base_points_1` = 0, `effect_implicit_target_a_1` = 1, `reagent_1` = 39774, `reagent_count_1` = 1, `spell_icon_id` = 2557, `spell_name_enus` = 'Glyph of Crag Strike', `spell_name_flags` = 16712190, `school_mask` = 1;
-- Lion's Ink (43116) - Rocksurge (L24), Rockwall (L29), Volcanic Shield (L34), Tectonic Blast (L39)
INSERT INTO `spell` SET `id` = 900291, `attributes` = 65568, `cast_time_index` = 14, `equipped_item_class` = -1, `effect_1` = 24, `effect_item_type_1` = 57491, `effect_die_sides_1` = 1, `effect_base_points_1` = 0, `effect_implicit_target_a_1` = 1, `reagent_1` = 43116, `reagent_count_1` = 1, `spell_icon_id` = 2557, `spell_name_enus` = 'Glyph of Rocksurge', `spell_name_flags` = 16712190, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900295, `attributes` = 65568, `cast_time_index` = 14, `equipped_item_class` = -1, `effect_1` = 24, `effect_item_type_1` = 57495, `effect_die_sides_1` = 1, `effect_base_points_1` = 0, `effect_implicit_target_a_1` = 1, `reagent_1` = 43116, `reagent_count_1` = 1, `spell_icon_id` = 2557, `spell_name_enus` = 'Glyph of Rockwall', `spell_name_flags` = 16712190, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900294, `attributes` = 65568, `cast_time_index` = 14, `equipped_item_class` = -1, `effect_1` = 24, `effect_item_type_1` = 57494, `effect_die_sides_1` = 1, `effect_base_points_1` = 0, `effect_implicit_target_a_1` = 1, `reagent_1` = 43116, `reagent_count_1` = 1, `spell_icon_id` = 2557, `spell_name_enus` = 'Glyph of Volcanic Shield', `spell_name_flags` = 16712190, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900292, `attributes` = 65568, `cast_time_index` = 14, `equipped_item_class` = -1, `effect_1` = 24, `effect_item_type_1` = 57492, `effect_die_sides_1` = 1, `effect_base_points_1` = 0, `effect_implicit_target_a_1` = 1, `reagent_1` = 43116, `reagent_count_1` = 1, `spell_icon_id` = 2557, `spell_name_enus` = 'Glyph of Tectonic Blast', `spell_name_flags` = 16712190, `school_mask` = 1;
-- Celestial Ink (43120) - Thunderborne Leap (L59, talent tier 10)
INSERT INTO `spell` SET `id` = 900296, `attributes` = 65568, `cast_time_index` = 14, `equipped_item_class` = -1, `effect_1` = 24, `effect_item_type_1` = 57496, `effect_die_sides_1` = 1, `effect_base_points_1` = 0, `effect_implicit_target_a_1` = 1, `reagent_1` = 43120, `reagent_count_1` = 1, `spell_icon_id` = 2557, `spell_name_enus` = 'Glyph of Thunderborne Leap', `spell_name_flags` = 16712190, `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Rockslam Block Buff (900120) - cloned from Shield Block
-- ----------------------------------------------------------------------------
-- Deprecated block buffs 900120 / 900180 removed (superseded by the unified
-- Rocksteady buff 900261; nothing triggers them — Improved Rockslam procs 900261).
DELETE FROM `spell` WHERE `id` IN (900120, 900180);

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
    -- Identity moved off m2 bit 15 (32768) -> m3 bit 23 (8388608) to deconflict
    -- with stock Hex (51514), which owns m2 bit 15. Sharing it wrongly exposed
    -- Tectonic Blast to Hex's modifiers (Nature's Swiftness, Maelstrom Weapon,
    -- Glyph of Hex). m3 bit 23 is unique. Imp Tectonic proc (spell_proc) and the
    -- Glyph of Tectonic Blast modifier (900274) updated to match.
    `spell_class_mask_3` = 8388608,
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
-- $total = base eruption damage; $totalg = +20% (Glyph of Volcanic Shield 900278).
-- Each glyphed component is pre-multiplied (var refs are addition-only safe, not
-- multiplication), then summed. Desc/tooltip pick via $?s900278[$<totalg>][$<total>].
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (187, CONCAT(
    '$base=${', (@vs_dmg_base + @vs_dmg_die), '}\n',
    '$perlevel=${($pl-', @vs_base_level, ')*', @vs_dmg_perlevel, '}\n',
    '$spbonus=${$sp*', @vs_sp_coeff, '}\n',
    '$total=${$<base>+$<perlevel>+$<spbonus>}\n',
    '$baseg=${', (@vs_dmg_base + @vs_dmg_die), '*1.2}\n',
    '$perlevelg=${($pl-', @vs_base_level, ')*', @vs_dmg_perlevel, '*1.2}\n',
    '$spbonusg=${$sp*', @vs_sp_coeff, '*1.2}\n',
    '$totalg=${$<baseg>+$<perlevelg>+$<spbonusg>}'));

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R1 (900123)
-- effect_1 (KEEP): ADD_FLAT_MODIFIER op 12 (SPELLMOD_EFFECT2) +1 on the eruption
--   900122's energize (mask_a_3 = 32768) -> the mana restore.
-- effect_2 (NEW): MOD_RESISTANCE (22), school 1 (armor), bonus armor scaling with
--   level (base + ppl). Gauged off Stoneskin Totem (~50 + 11/level at full rank);
--   R1 = 1/3. Replaces the old +damage boost (folded into VS base damage instead).
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
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_1` = 1,
    `effect_base_points_2` = 17,
    `effect_real_points_per_level_2` = 4,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 0,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 23,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `effect_spell_class_mask_b_1` = 1024,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, you gain bonus armor based on your level, and its activation also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Bonus armor while Volcanic Shield is active; activation restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R2 (900124) - mana restore + bonus armor (2/3)
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
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_1` = 3,
    `effect_base_points_2` = 33,
    `effect_real_points_per_level_2` = 7,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 0,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 23,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `effect_spell_class_mask_b_1` = 1024,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, you gain bonus armor based on your level, and its activation also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Bonus armor while Volcanic Shield is active; activation restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 8;

-- Improved Volcanic Shield R3 (900125) - mana restore + bonus armor (full ~= Stoneskin)
DELETE FROM `spell` WHERE `id` = 900125;
INSERT INTO `spell` SET
    `id` = 900125,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_1` = 5,
    `effect_base_points_2` = 50,
    `effect_real_points_per_level_2` = 11,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 0,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 23,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `effect_spell_class_mask_b_1` = 1024,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, you gain bonus armor based on your level, and its activation also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Bonus armor while Volcanic Shield is active; activation restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 8;

-- Clean up deleted mana return spell (consolidated into 900122 E2 + modifiers)
DELETE FROM `spell` WHERE `id` = 900126;

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
    `effect_base_points_3` = 4,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 158,
    `effect_misc_value_a_3` = 0,
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
    `effect_base_points_3` = 9,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 158,
    `effect_misc_value_a_3` = 0,
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
    `effect_base_points_3` = 14,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 158,
    `effect_misc_value_a_3` = 0,
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
    `effect_base_points_3` = 19,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 158,
    `effect_misc_value_a_3` = 0,
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
    `effect_base_points_1` = 9,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 128,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_2` = 4,
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
    `effect_base_points_1` = 19,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 128,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_2` = 9,
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

-- Improved Rockbiter Weapon R3 (900131): +30% AP, +15% threat (DR is on base imbue)
DELETE FROM `spell` WHERE `id` = 900131;
INSERT INTO `spell` SET
    `id` = 900131,
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
    `spell_subtext_enus` = 'Rank 3',
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
-- Relentless R1 (900142): +5% threat, -5% stun/silence duration
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
    `effect_base_points_1` = 4,
    `effect_base_points_2` = -6,
    `effect_base_points_3` = -6,
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

-- Relentless R2 (900143): +10% threat, -10% stun/silence duration
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
    `effect_base_points_1` = 9,
    `effect_base_points_2` = -11,
    `effect_base_points_3` = -11,
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

-- Relentless R3 (900144): +15% threat, -15% stun/silence duration
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

-- Relentless reduced from 5 ranks to 3 (+5/10/15% threat, -5/10/15% stun/silence).
-- Same +15% endpoint, now 5% per point. Old ranks 4-5 removed from the DB.
-- Talent must drop to 3 ranks (remove SpellRank_4/5 -> 900145/900146) via the editor.
DELETE FROM `spell` WHERE `id` IN (900145, 900146);

-- ============================================================================
-- Bastion of Earth (900147-900149) - Passive talent, procs on block
-- 3 ranks: chance on block to trigger buff (900150-900152).
-- Each talent rank increases ONLY the proc chance (R1=15%, R2=25%, R3=35%).
-- While held, the buff (a) grants +10% block value (boosts blocks AND Rockslam,
-- which scales off block value) and (b) makes the next Lesser Healing Wave instant
-- AND free. Casting LHW consumes the buff -- so it's a real choice: keep the held
-- block-value boost, or spend it on an emergency instant heal. The buff is
-- identical at every rank; only the proc chance scales.
-- ============================================================================

-- Bastion of Earth R1 (900147) - Passive, 10% on block, triggers 900150
DELETE FROM `spell` WHERE `id` = 900147;

INSERT INTO `spell` SET
    `id` = 900147,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `proc_flags` = 40,
    `proc_chance` = 15,
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
    `spell_desc_enus` = 'Successful blocks have a 15% chance to grant Bastion of Earth, increasing your block value by 10% and making your next Lesser Healing Wave instant and free for $900150d.  Casting Lesser Healing Wave consumes the buff.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '15% chance on block to increase block value by 10% and make your next Lesser Healing Wave instant and free for $900150d.  Casting Lesser Healing Wave consumes the buff.',
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
    `proc_chance` = 25,
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
    `spell_desc_enus` = 'Successful blocks have a 25% chance to grant Bastion of Earth, increasing your block value by 10% and making your next Lesser Healing Wave instant and free for $900151d.  Casting Lesser Healing Wave consumes the buff.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '25% chance on block to increase block value by 10% and make your next Lesser Healing Wave instant and free for $900151d.  Casting Lesser Healing Wave consumes the buff.',
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
    `proc_chance` = 35,
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
    `spell_desc_enus` = 'Successful blocks have a 35% chance to grant Bastion of Earth, increasing your block value by 10% and making your next Lesser Healing Wave instant and free for $900152d.  Casting Lesser Healing Wave consumes the buff.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '35% chance on block to increase block value by 10% and make your next Lesser Healing Wave instant and free for $900152d.  Casting Lesser Healing Wave consumes the buff.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- ============================================================================
-- Bastion of Earth Buff (900150-900152) - Held block-value buff + free instant LHW
-- E1: Aura 108 (ADD_PCT_MODIFIER), misc 10 (SPELLMOD_CASTING_TIME), -100% LHW cast time (instant)
-- E2: Aura 108 (ADD_PCT_MODIFIER), misc 14 (SPELLMOD_COST), -100% LHW cost (free)
-- E3: Aura 150 (MOD_SHIELD_BLOCKVALUE_PCT), +10% block value (held; scales blocks + Rockslam)
-- Both SPELLMODs masked to Lesser Healing Wave (family flag class_mask_a=128).
-- No stacking. Consumed when Lesser Healing Wave is cast (proc_charges=1) -- which
-- also drops the +10% block value, making the consume a genuine trade-off.
-- All ranks identical; only the passive proc chance scales.
-- ============================================================================

-- Bastion of Earth buff R1 (900150) - instant + free LHW
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
    `effect_base_points_1` = -101,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 128,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -101,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_a_2` = 128,
    -- F-164: held +10% block value (aura 150, % so it scales with gear) while
    -- Bastion is up -- boosts blocks AND Rockslam (which scales off block value).
    -- Lost when the buff is consumed by casting Lesser Healing Wave. Fixed at all
    -- ranks (only the passive proc chance scales). base 9 + die 1 = 10 so $s3 = 10.
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = 9,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 150,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Block value increased by $s3%.  Your next Lesser Healing Wave is instant and costs no mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block value increased by $s3%.  Your next Lesser Healing Wave is instant and costs no mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Bastion of Earth buff R2 (900151) - instant + free LHW
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
    `effect_base_points_1` = -101,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 128,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -101,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_a_2` = 128,
    -- F-164: held +10% block value (aura 150, % so it scales with gear) while
    -- Bastion is up -- boosts blocks AND Rockslam (which scales off block value).
    -- Lost when the buff is consumed by casting Lesser Healing Wave. Fixed at all
    -- ranks (only the passive proc chance scales). base 9 + die 1 = 10 so $s3 = 10.
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = 9,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 150,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Block value increased by $s3%.  Your next Lesser Healing Wave is instant and costs no mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block value increased by $s3%.  Your next Lesser Healing Wave is instant and costs no mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Bastion of Earth buff R3 (900152) - instant + free LHW
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
    `effect_base_points_1` = -101,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 128,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -101,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_a_2` = 128,
    -- F-164: held +10% block value (aura 150, % so it scales with gear) while
    -- Bastion is up -- boosts blocks AND Rockslam (which scales off block value).
    -- Lost when the buff is consumed by casting Lesser Healing Wave. Fixed at all
    -- ranks (only the passive proc chance scales). base 9 + die 1 = 10 so $s3 = 10.
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = 9,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 150,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Block value increased by $s3%.  Your next Lesser Healing Wave is instant and costs no mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block value increased by $s3%.  Your next Lesser Healing Wave is instant and costs no mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Rockbiter Weapon imbue desc - AP from passive aura (client auto-applies Imp Rockbiter SpellMod)
-- Threat shown conditionally when Imp Rockbiter is known
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900138m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900138m3.  Lasts 30 minutes.' WHERE id = 8017;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900139m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900139m3.  Lasts 30 minutes.' WHERE id = 8018;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900140m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900140m3.  Lasts 30 minutes.' WHERE id = 8019;
UPDATE spell SET spell_desc_variable_id = 0, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $900141m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900141m3.  Lasts 30 minutes.' WHERE id = 10399;

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

INSERT INTO `spell` SET `id` = 900167, `attributes` = 464, `cast_time_index` = 1, `proc_flags` = 32768, `proc_chance` = 33, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = -1, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 42, `effect_trigger_spell_1` = 900170, `spell_icon_id` = 4408, `spell_name_enus` = 'Living Guardian', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 1', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you receive a direct heal, you have a 33% chance to gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `effect_damage_multiplier_1` = 1.0, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900168, `attributes` = 464, `cast_time_index` = 1, `proc_flags` = 32768, `proc_chance` = 66, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = -1, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 42, `effect_trigger_spell_1` = 900170, `spell_icon_id` = 4408, `spell_name_enus` = 'Living Guardian', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 2', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you receive a direct heal, you have a 66% chance to gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `effect_damage_multiplier_1` = 1.0, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900169, `attributes` = 464, `cast_time_index` = 1, `proc_flags` = 32768, `proc_chance` = 100, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = -1, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 42, `effect_trigger_spell_1` = 900170, `spell_icon_id` = 4408, `spell_name_enus` = 'Living Guardian', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 3', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you receive a direct heal, you gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `effect_damage_multiplier_1` = 1.0, `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Living Guardian Shield (900170) - Single buff; all 5 talent ranks trigger it.
-- Flat absorb = 10% of the caster's max health, set by the
-- spell_sha_living_guardian_aura C++ script (aura 69 SCHOOL_ABSORB does not
-- consult spell_bonus_data). Scales with the Earthwarden's large HP pool, so
-- it is a bigger effect for tanks than off-spec shamans dipping into it.
-- 10s duration; 10s ICD (900186). base_points 0 (overridden by the C++ script).
-- ----------------------------------------------------------------------------
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
    `category_recovery_time` = 20000,
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
    `spell_class_mask_3` = 4194304,  -- bit 22 (unique): identity for Glyph of Thunderborne Leap (900283), targets this stun's duration
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
-- (Rockslam Block Buff R1 900180 removed — deprecated, superseded by Rocksteady 900261.)

-- ============================================================================
-- Improved Rockslam R1 (900181) — +25% damage, procs Rocksteady (900261)
-- die_sides_1 = 1 so displayed/applied value = base+1 -> base 24 = +25%.
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
    `effect_base_points_1` = 24,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 3,
    `effect_trigger_spell_2` = 900261,
    `effect_spell_class_mask_a_3` = 262144,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Improved Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage dealt by Rockslam by $s1%, and causes Rockslam to add 1 stack of Rocksteady.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases the damage dealt by Rockslam by $s1%, and causes Rockslam to add 1 stack of Rocksteady.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Improved Rockslam R2 (900182) — +50% damage, procs Rocksteady (900261)
-- die_sides_1 = 1 so displayed/applied value = base+1 -> base 49 = +50%.
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
    `effect_base_points_1` = 49,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 3,
    `effect_trigger_spell_2` = 900261,
    `effect_spell_class_mask_a_3` = 262144,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Improved Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage dealt by Rockslam by $s1%, and causes Rockslam to add 2 stacks of Rocksteady.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases the damage dealt by Rockslam by $s1%, and causes Rockslam to add 2 stacks of Rocksteady.',
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
-- Bulwark (900187, 900188, 900202) - Passive, 3 ranks
-- Straight clone of Critical Block (47294-47296) for Shaman.
-- Crit block chance 20/40/60% (E1 base 19/39/59), Rockslam crit +5/10/15%
-- (E2 base 4/9/14). Icon 5121.
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
    `effect_base_points_1` = 19,
    `effect_base_points_2` = 4,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 253,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 7,
    `effect_spell_class_mask_b_3` = 262144,
    `spell_icon_id` = 5121,
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
    `effect_base_points_1` = 39,
    `effect_base_points_2` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 253,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 7,
    `effect_spell_class_mask_b_3` = 262144,
    `spell_icon_id` = 5121,
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

-- Bulwark Rank 3 (900202) - 60% critical block, +15% Rockslam crit
DELETE FROM `spell` WHERE `id` = 900202;
INSERT INTO `spell` SET
    `id` = 900202,
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
    `effect_base_points_1` = 59,
    `effect_base_points_2` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 253,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 7,
    `effect_spell_class_mask_b_3` = 262144,
    `spell_icon_id` = 5121,
    `spell_priority` = 50,
    `spell_name_enus` = 'Bulwark',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
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
-- Improved Tectonic Blast (900198, 900199, 900205) - Passive talent, 3 ranks
-- After casting Tectonic Blast, gain Tectonic Resonance buff (900200/900201/900206)
-- for 8 sec: next Earth Shock deals +10/20/30% damage and costs 10/20/30% less mana.
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
    `spell_desc_enus` = 'After casting Tectonic Blast, you gain Tectonic Resonance, increasing the damage of your next Earth Shock by 15% and reducing its mana cost by 15%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Tectonic Blast empowers your next Earth Shock by 10%.',
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
    `spell_desc_enus` = 'After casting Tectonic Blast, you gain Tectonic Resonance, increasing the damage of your next Earth Shock by 30% and reducing its mana cost by 30%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Tectonic Blast empowers your next Earth Shock by 20%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Improved Tectonic Blast R3 (900205) - triggers Tectonic Resonance R3 (900206)
DELETE FROM `spell` WHERE `id` = 900205;

INSERT INTO `spell` SET
    `id` = 900205,
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
    `effect_trigger_spell_1` = 900206,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Improved Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'After casting Tectonic Blast, you gain Tectonic Resonance, increasing the damage of your next Earth Shock by 45% and reducing its mana cost by 45%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Tectonic Blast empowers your next Earth Shock by 30%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Tectonic Resonance (900200, 900201, 900206) - Buff applied by Improved Tectonic Blast
-- E1 aura 108 misc 0 (SPELLMOD_DAMAGE): +10/20/30% Earth Shock damage.
-- E2 aura 108 misc 14 (SPELLMOD_COST): -10/20/30% Earth Shock mana cost.
-- Both filtered to Earth Shock via class mask (word 1 bit 1048576): E1 a_1, E2 b_1.
-- Consumed when Earth Shock is cast (proc_charges=1, AttributesMask=8 in spell_proc).
-- ============================================================================

-- Tectonic Resonance R1 (900200) - +15% Earth Shock damage / -15% mana, 8 sec
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
    `effect_base_points_1` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 0,
    `effect_spell_class_mask_a_1` = 1048576,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -16,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_b_1` = 1048576,
    `effect_damage_multiplier_2` = 1.0,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Tectonic Resonance',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Tectonic Resonance R2 (900201) - +30% Earth Shock damage / -30% mana, 8 sec
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
    `effect_base_points_1` = 29,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 0,
    `effect_spell_class_mask_a_1` = 1048576,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -31,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_b_1` = 1048576,
    `effect_damage_multiplier_2` = 1.0,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Tectonic Resonance',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Tectonic Resonance R3 (900206) - +45% Earth Shock damage / -45% mana, 8 sec
DELETE FROM `spell` WHERE `id` = 900206;

INSERT INTO `spell` SET
    `id` = 900206,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 31,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 44,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 0,
    `effect_spell_class_mask_a_1` = 1048576,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -46,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_b_1` = 1048576,
    `effect_damage_multiplier_2` = 1.0,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Tectonic Resonance',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
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
-- Wolf's Hunger (900216) - 1-min CD armor-shred CD
-- 12 sec duration. Aura 280 (MOD_ARMOR_PENETRATION_PCT), misc 1 (physical/armor).
-- Caster self-buff: your attacks ignore 50% of the target's armor while active.
-- Covers ALL physical damage — white swings + Windfury (null spellInfo path in
-- Unit::CalcArmorReducedDamage) AND physical abilities (Stormstrike/Lava Lash)
-- via misc_value & SchoolMask. NOTE: subject to the WotLK armor-pen cap, so the
-- effective reduction vs very-high-armor targets (raid bosses) is < 50%, and it
-- shares the cap with the player's gear armor-pen rating. die_sides=1 -> $s1 = 50.
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
    `effect_base_points_1` = 49,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 280,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 5318,
    `spell_name_enus` = 'Wolf''s Hunger',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Embrace the spirit of the wolf, causing your attacks to ignore $s1% of your target''s armor for $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your attacks ignore $s1% of your target''s armor.',
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
    -- Effect 2 is the SPELLMOD_EFFECT2 speed mod; its class mask must target
    -- Ghost Wolf (bit 30) on effect 2's slot a, NOT effect 1's slot b — the
    -- latter (word 2 of effect 1) matches nothing, so the +5% never applied.
    `effect_spell_class_mask_a_2` = 1073741824,
    `effect_spell_class_mask_b_1` = 0,
    -- 0.5 hardcoded: client $/1000;s1 integer-divides, so 500/1000 displays as 0
    `spell_desc_enus` = 'Reduces the cast time of your Ghost Wolf spell by 0.5 sec and increases its movement speed bonus by an additional $s2%.'
WHERE `id` = 16262;

-- Self-contained: family 14 / bit 29 (Ghost Wolf Modifiers) + effect masks
-- targeting Ghost Wolf (bit 30) were previously set by [F-005]_spell.sql in
-- zep-legacy. Moved here so 16287 has a single owner (it's a shaman talent and
-- F-164 rebalances its cast time / speed). See zep-legacy [F-005]_spell.sql §13.
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 536870912,
    `effect_base_points_1` = -1001,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 12,
    `effect_base_points_2` = 9,
    `effect_spell_class_mask_a_1` = 1073741824,
    -- Effect 2 (SPELLMOD_EFFECT2 speed mod) must mask Ghost Wolf on slot a_2;
    -- the previous b_1 mask was word 2 of effect 1 and matched nothing.
    `effect_spell_class_mask_a_2` = 1073741824,
    `effect_spell_class_mask_b_1` = 0,
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

INSERT INTO `spell` SET `id` = 900230, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 34, `spell_level` = 34, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 14, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 5', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900250m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900250m3.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900231, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 44, `spell_level` = 44, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 27, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 6', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900251m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900251m3.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900232, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 54, `spell_level` = 54, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 39, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 7', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900252m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900252m3.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900233, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 62, `spell_level` = 62, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 48, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 8', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900253m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900253m3.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900234, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 70, `spell_level` = 70, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 61, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 9', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900254m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900254m3.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900235, `attributes` = 328192, `attributes_ex_1` = 131088, `attributes_ex_2` = 8, `targets` = 16, `cast_time_index` = 1, `proc_chance` = 101, `base_level` = 78, `spell_level` = 78, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 54, `effect_die_sides_2` = 1, `effect_base_points_2` = 79, `spell_visual_1` = 8693, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 10', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Imbue the Shaman''s weapon, increasing attack power by $900255m1.$?s900129[  Increases threat generated by $900129m2%.][]$?s900130[  Increases threat generated by $900130m2%.][]  Increases block value by $900255m3.  Lasts 30 minutes.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712188, `power_cost_percentage` = 8, `start_recovery_category` = 133, `start_recovery_time` = 1500, `spell_class_set` = 11, `spell_class_mask_1` = 4194304, `damage_class` = 1, `prevention_type` = 1, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `effect_damage_multiplier_3` = 1.0, `school_mask` = 8;

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

INSERT INTO `spell` SET `id` = 900250, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 104, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = 29, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 158, `effect_misc_value_a_3` = 0, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 5', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900251, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 195, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = 54, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 158, `effect_misc_value_a_3` = 0, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 6', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900252, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 279, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = 79, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 158, `effect_misc_value_a_3` = 0, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 7', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900253, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 342, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = 99, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 158, `effect_misc_value_a_3` = 0, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 8', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900254, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 433, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = 129, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 158, `effect_misc_value_a_3` = 0, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 9', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;
INSERT INTO `spell` SET `id` = 900255, `attributes` = 327760, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_2` = 6, `effect_die_sides_1` = 1, `effect_die_sides_2` = 1, `effect_base_points_1` = 559, `effect_base_points_2` = -1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_1` = 99, `effect_apply_aura_name_2` = 10, `effect_misc_value_a_2` = 127, `effect_3` = 6, `effect_die_sides_3` = 1, `effect_base_points_3` = 164, `effect_implicit_target_a_3` = 1, `effect_apply_aura_name_3` = 158, `effect_misc_value_a_3` = 0, `spell_icon_id` = 688, `spell_name_enus` = 'Rockbiter Weapon', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 10', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Increases attack power by $s1.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `spell_class_mask_3` = 128, `effect_damage_multiplier_1` = 1.0, `effect_damage_multiplier_2` = 1.0, `school_mask` = 8, `effect_bonus_multiplier_1` = 1.0, `effect_bonus_multiplier_2` = 1.0;

-- ============================================================================
-- Stonebond Damage Split (900222) - F-164 Earthwarden damage-soak aura
-- Pulsed onto the shaman by their earth totem (Stoneclaw, later Earth Elemental)
-- while the Stonebond talent (900225) is specced. The spell_sha_stonebond C++
-- script casts this on the owner once at summon, then the pulse driver (900226)
-- re-casts it every 15s; with this 10s duration that gives a locked ~67% uptime
-- (10s on / 5s gap) independent of totem HP and summon CD.
-- effect_implicit_target_a_1 = 21 (TARGET_UNIT_TARGET_ALLY) so the aura lands on
-- the explicit target (the shaman) the totem passes to CastSpell -- NOT target 1
-- (TARGET_UNIT_CASTER), which would apply it to the totem and leave the shaman
-- unmitigated. Aura 81 (SPLIT_DAMAGE_PCT) redirects 20% of the shaman's incoming
-- damage to the totem (the aura's caster, which must be alive). The redirected
-- damage drains the totem's HP, so totem longevity = how long before a resummon
-- (Earth's Grasp + stock Glyph of Stoneclaw scale HP; they do NOT change mit).
-- The split handler skips dead casters, so a dead/expired totem ends the soak.
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
    `effect_die_sides_1` = 0,
    `effect_base_points_1` = 20,
    `effect_implicit_target_a_1` = 21,
    `effect_apply_aura_name_1` = 81,
    `effect_misc_value_a_1` = 127,
    `spell_visual_1` = 8244,
    `spell_icon_id` = 4689,
    `spell_name_enus` = 'Stonebond',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your earth totem is absorbing a portion of the damage you take.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Absorbing damage.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ============================================================================
-- Stonebond talent / marker (900225, 900227-900229, 900236) - F-164 Earthwarden
-- 5-rank passive: 4 / 8 / 12 / 16 / 20% absorb. Each rank is a hidden DUMMY
-- marker aura whose effect-1 amount = its absorb % ($s1 in the desc). The
-- spell_sha_stonebond C++ reads that % from whichever rank the owner has and
-- applies the Stonebond split (900222) at that value (via SPELLVALUE_BASE_POINT0),
-- while stripping the totem's taunt/stun (25513). No SLA (passive talent).
-- NOT_IN_SPELLBOOK; placed in the talent tree via the editor (5-rank).
-- ============================================================================
DELETE FROM `spell` WHERE `id` IN (900225, 900227, 900228, 900229, 900236);
INSERT INTO `spell` SET `id` = 900225, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = 3, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 4, `effect_2` = 6, `effect_die_sides_2` = 0, `effect_base_points_2` = 45000, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_2` = 107, `effect_misc_value_a_2` = 1, `effect_spell_class_mask_b_1` = 8, `spell_icon_id` = 4689, `spell_name_enus` = 'Stonebond', `spell_subtext_enus` = 'Rank 1', `spell_subtext_flags` = 16712190, `spell_name_flags` = 16712190, `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900227, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = 7, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 4, `effect_2` = 6, `effect_die_sides_2` = 0, `effect_base_points_2` = 45000, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_2` = 107, `effect_misc_value_a_2` = 1, `effect_spell_class_mask_b_1` = 8, `spell_icon_id` = 4689, `spell_name_enus` = 'Stonebond', `spell_subtext_enus` = 'Rank 2', `spell_subtext_flags` = 16712190, `spell_name_flags` = 16712190, `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900228, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = 11, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 4, `effect_2` = 6, `effect_die_sides_2` = 0, `effect_base_points_2` = 45000, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_2` = 107, `effect_misc_value_a_2` = 1, `effect_spell_class_mask_b_1` = 8, `spell_icon_id` = 4689, `spell_name_enus` = 'Stonebond', `spell_subtext_enus` = 'Rank 3', `spell_subtext_flags` = 16712190, `spell_name_flags` = 16712190, `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900229, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = 15, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 4, `effect_2` = 6, `effect_die_sides_2` = 0, `effect_base_points_2` = 45000, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_2` = 107, `effect_misc_value_a_2` = 1, `effect_spell_class_mask_b_1` = 8, `spell_icon_id` = 4689, `spell_name_enus` = 'Stonebond', `spell_subtext_enus` = 'Rank 4', `spell_subtext_flags` = 16712190, `spell_name_flags` = 16712190, `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 1;
INSERT INTO `spell` SET `id` = 900236, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_1` = 6, `effect_die_sides_1` = 1, `effect_base_points_1` = 19, `effect_implicit_target_a_1` = 1, `effect_apply_aura_name_1` = 4, `effect_2` = 6, `effect_die_sides_2` = 0, `effect_base_points_2` = 45000, `effect_implicit_target_a_2` = 1, `effect_apply_aura_name_2` = 107, `effect_misc_value_a_2` = 1, `effect_spell_class_mask_b_1` = 8, `spell_icon_id` = 4689, `spell_name_enus` = 'Stonebond', `spell_subtext_enus` = 'Rank 5', `spell_subtext_flags` = 16712190, `spell_name_flags` = 16712190, `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 1;

-- ============================================================================
-- Stonebond Pulse driver (900226) - F-164, applied on the soak host (Stoneclaw
-- totem OR Earth Elemental) by C++. Aura 226 (PERIODIC_DUMMY), 15s amplitude,
-- INFINITE duration (index 21) so it lives as long as the host and ends when the
-- host despawns -- covers both the 60s Stonebond Stoneclaw and the ~2min Earth
-- Elemental with one spell. The spell_sha_stonebond_pulse AuraScript re-casts the
-- Stonebond split (900222) on the host's owner each tick; 15s pulse vs 900222's
-- 10s = the locked ~67% uptime rhythm.
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900226;
INSERT INTO `spell` SET
    `id` = 900226,
    `attributes` = 0,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 0,
    `effect_base_points_1` = 0,
    `effect_amplitude_1` = 15000,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 226,
    `spell_icon_id` = 4689,
    `spell_name_enus` = 'Stonebond Pulse',
    `spell_name_flags` = 16712190,
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- ============================================================================
-- Glyph of Stoneclaw Totem (63298) - restore to STOCK self-shield.
-- A dev-dead-end edit (custom "+10% of max health" totem-HP effect) was left
-- orphaned in the live DB with no source backing it. Stonebond does not use a
-- custom glyph, so restore the full stock row from original_dbc (the on-cast
-- self-shield). Idempotent; avoids a full rebuild.
-- ============================================================================
REPLACE INTO `spell` SELECT * FROM `original_dbc`.`spell` WHERE `id` = 63298;

-- ============================================================================
-- Rockwall (900223) - F-164 Earthwarden defensive CD (Stoneskin + Rockwall merged).
-- Instant, shield required, 1.5 min CD. Two effects:
--   E1 DUMMY -> spell_sha_rockwall C++ adds 5 stacks of Rocksteady (900261).
--   E2 aura 87 (MOD_DAMAGE_PERCENT_TAKEN, all schools) -30% damage taken for 10s.
-- Uses Stoneskin's icon (5469) + Stoneform visual (5787). Stoneskin (900164) merged
-- in and deleted. ("Encase in stone" panic button + Rocksteady burst in one.)
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900223;
INSERT INTO `spell` SET
    `id` = 900223,
    `attributes` = 16,
    `cast_time_index` = 1,
    `recovery_time` = 90000,
    `category_recovery_time` = 90000,
    `duration_index` = 29,          -- 12000ms (12s base; Glyph of Rockwall extends to 18s)
    `range_index` = 1,
    `equipped_item_class` = 4,
    `equipped_item_subclass_mask` = 64,
    `effect_1` = 3,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 0,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 87,
    `effect_misc_value_a_2` = 127,
    `effect_base_points_2` = -31,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `spell_visual_1` = 5787,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Rockwall',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Encases you in stone, reducing all damage taken by 30% for $?s900280[18][12] sec and instantly granting 5 stacks of Rocksteady.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces damage taken by 30% and grants 5 stacks of Rocksteady.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 2097152,  -- bit 21 (unique): identity for Glyph of Rockwall (900281)
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

-- ============================================================================
-- Rocksteady (F-164) - shared Earthwarden block-stack system
-- ----------------------------------------------------------------------------
-- Rocksteady buff (900261): the single stacking block buff. +5% block chance
-- per stack (spell_sha_rocksteady_block C++; CalcAmount = 5 x stacks), capped
-- at 20 stacks (+100%). 30s decay window (duration_index 9), refreshed on each
-- stack gain; each block consumes a stack (spell_proc HitMask 64). Fed by three
-- sources: the Rocksteady talent (chance on melee hit), Improved Rockslam
-- (+1/+2 per Rockslam cast) and Rockwall (+5 burst).
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900261;
INSERT INTO `spell` SET
    `id` = 900261,
    `attributes` = 0,
    `cast_time_index` = 1,
    `duration_index` = 9,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `stack_amount` = 10,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 4,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 51,
    -- Effect 2: SPELLMOD_DAMAGE percent (aura 108, misc 0) targeting Rocksurge's family
    -- bit (mask_3 = 1048576). As a stacking aura, the core multiplies this by the stack
    -- count, so Rocksurge gains +@rsg_pct_per_stack% damage PER current stack with no
    -- script and no consumption (x10 stacks = +100% = double). die_sides_2 = 0 -> value
    -- = base exactly.
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 0,
    `effect_base_points_2` = @rsg_pct_per_stack,
    `effect_die_sides_2` = 0,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_b_3` = 1048576,
    `spell_icon_id` = 4242,
    `spell_name_enus` = 'Rocksteady',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases block chance by $s1% per stack, up to 10 stacks. Each block you make consumes a stack.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block chance increased by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 33554432,  -- bit 25 (unique): identity so Glyph of Rocksurge (900272) can SPELLMOD_EFFECT2 the per-stack Rocksurge damage
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Rocksteady talent (900256-900260, ranks 1-5): passive Earthwarden talent.
-- Effect 1 (aura 150 MOD_SHIELD_BLOCKVALUE_PCT): +5/10/15/20/25% block value.
-- Effect 2 (aura 42 PROC_TRIGGER_SPELL -> 900261): chance on melee hit to gain
-- a Rocksteady stack. Proc chance (1/2/3/4/5%) + ProcFlags (done melee auto) are
-- set in spell_proc; the +1 stack is applied by spell_sha_rocksteady_stack_proc.
-- Passive (NOT_IN_SPELLBOOK); placed in the talent tree via the talent editor.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` IN (900256, 900257, 900258, 900259, 900260);
INSERT INTO `spell` SET `id` = 900256, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 6, `effect_apply_aura_name_2` = 42, `effect_trigger_spell_2` = 900261, `effect_implicit_target_a_2` = 1, `spell_icon_id` = 4242, `spell_name_enus` = 'Rocksteady', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 1', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 2% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900257, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 6, `effect_apply_aura_name_2` = 42, `effect_trigger_spell_2` = 900261, `effect_implicit_target_a_2` = 1, `spell_icon_id` = 4242, `spell_name_enus` = 'Rocksteady', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 2', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 4% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900258, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 6, `effect_apply_aura_name_2` = 42, `effect_trigger_spell_2` = 900261, `effect_implicit_target_a_2` = 1, `spell_icon_id` = 4242, `spell_name_enus` = 'Rocksteady', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 3', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 6% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900259, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 6, `effect_apply_aura_name_2` = 42, `effect_trigger_spell_2` = 900261, `effect_implicit_target_a_2` = 1, `spell_icon_id` = 4242, `spell_name_enus` = 'Rocksteady', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 4', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 8% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 8;
INSERT INTO `spell` SET `id` = 900260, `attributes` = 327760, `attributes_ex_4` = 32768, `cast_time_index` = 1, `range_index` = 1, `equipped_item_class` = -1, `effect_2` = 6, `effect_apply_aura_name_2` = 42, `effect_trigger_spell_2` = 900261, `effect_implicit_target_a_2` = 1, `spell_icon_id` = 4242, `spell_name_enus` = 'Rocksteady', `spell_name_flags` = 16712190, `spell_subtext_enus` = 'Rank 5', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 10% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.', `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `spell_class_set` = 11, `school_mask` = 8;

DELETE FROM `spell` WHERE `id` = 900224;

-- RETIRED (2026-06-16): the standalone custom totem (900224, creature 900100)
-- is removed. Stonebond (900225) re-flavors the STOCK Stoneclaw / Earth Elemental
-- totems into damage soakers instead of adding a fourth earth-slot totem. The
-- split aura (900222) and the C++ logic live on; the summon spell does not.
-- The DELETE above stays so the spell is purged from the DBC.
