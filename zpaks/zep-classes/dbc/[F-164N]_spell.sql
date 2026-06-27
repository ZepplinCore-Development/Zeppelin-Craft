-- [F-164N] Bastion of Earth - DBC spell records (split from F-164).
-- Self-contained sub-feature owning the Bastion-of-Earth block-proc passive + held buff (spell 900147-900152).
-- F-164 PARENT retains the Earthwarden talent-tree rows + 9001 skillline membership
-- that REFERENCE these spell IDs (ownership != dependency). World-side support rows
-- (spell_proc / spell_bonus_data / spell_linked_spell / spell_script_names / spell_custom_attr)
-- live in zz_[F-164N]_shaman_guardian_spells.sql; trainer/SLA membership stay in F-164.
-- C++ SpellScript SOURCE stays in core patch 0017 for now (compiled+working; the
-- binding rows are data and move with this feature) — patch-split deferred.

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
    `effect_spell_class_mask_b_1` = 128,
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
    `effect_spell_class_mask_b_1` = 128,
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
    `effect_spell_class_mask_b_1` = 128,
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
