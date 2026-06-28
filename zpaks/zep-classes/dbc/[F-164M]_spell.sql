-- [F-164M] Earthwarden - Defensive passives: spell.dbc rows (split from F-164 [F-164]_spell.sql, 2026-06-28).
-- Talent-granted mitigation passives that previously lived in the F-164 monolith. Their talent rows
-- (2915 Ironhide, 2934 Molten Plating, 2957 Wild Protector, 2975 Anticipation, 2976 Tempered Ward,
-- 2979 Bulwark) stay in [F-164]_talent.sql and reference these spell ids (parent owns the talent
-- tree; ownership != dependency).
--   Tempered Ward   900115/900127/900128 (talent, proc-only) + buffs 900328/900329/900330; old EW ranks 4/5 retired
--   Molten Plating  900161/900162/900163/900203/900204
--   Bulwark         900187/900188/900202
--   Ironhide        900192/900193/900194
--   Anticipation    900154/900155/900156
--   Wild Protector  900195/900196/900197

-- Tempered Ward (talent: 900115/900127/900128; buffs: 900328/900329/900330) - 3 ranks.
-- Renamed from Elemental Ward and reworked: the talent has NO flat mitigation - its only
-- effect (aura 42, PROC_TRIGGER_SPELL) is to apply the Tempered Ward buff on taking magic
-- damage (2s ICD, see zz_[F-164M]_tempered_ward_proc.sql). Each talent rank triggers its OWN
-- buff rank so the per-stack value scales with points spent:
--   R1 900115 -> 900328  (-1%/stack, max 5%)
--   R2 900127 -> 900329  (-2%/stack, max 10%)
--   R3 900128 -> 900330  (-3%/stack, max 15%)
-- Buff: aura 87 MOD_DAMAGE_PERCENT_TAKEN, school mask 126 (all magic), stack_amount 5, 30s
-- (duration_index 9), refreshed on each proc; shares the talent icon (5440). die_sides=1
-- convention: applied = base+1 (base -2 = 1%). Buff tooltip multiplies $s1 by stack count
-- (live total); spellbook desc is per-stack (x1). Old ranks 4/5 (900207/900208) retired below.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900115;

INSERT INTO `spell` SET
    `id` = 900115,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 100,
    `proc_flags` = 655360,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900328,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Tempered Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you take magic damage, you gain Tempered Ward, reducing magic damage taken by 1% per stack. Stacks up to 5 times and lasts 30 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900127;

INSERT INTO `spell` SET
    `id` = 900127,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 100,
    `proc_flags` = 655360,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900329,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Tempered Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you take magic damage, you gain Tempered Ward, reducing magic damage taken by 2% per stack. Stacks up to 5 times and lasts 30 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900128;

INSERT INTO `spell` SET
    `id` = 900128,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 100,
    `proc_flags` = 655360,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900330,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Tempered Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you take magic damage, you gain Tempered Ward, reducing magic damage taken by 3% per stack. Stacks up to 5 times and lasts 30 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `school_mask` = 1;

-- ---- Tempered Ward buff ranks (triggered by the talent above) ----
DELETE FROM `spell` WHERE `id` = 900328;

INSERT INTO `spell` SET
    `id` = 900328,
    `attributes` = 0,
    `cast_time_index` = 1,
    `duration_index` = 9,
    `stack_amount` = 5,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -2,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Tempered Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Magic damage taken reduced by $s1% per stack.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Magic damage taken reduced by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900329;

INSERT INTO `spell` SET
    `id` = 900329,
    `attributes` = 0,
    `cast_time_index` = 1,
    `duration_index` = 9,
    `stack_amount` = 5,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -3,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Tempered Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Magic damage taken reduced by $s1% per stack.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Magic damage taken reduced by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900330;

INSERT INTO `spell` SET
    `id` = 900330,
    `attributes` = 0,
    `cast_time_index` = 1,
    `duration_index` = 9,
    `stack_amount` = 5,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -4,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Tempered Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Magic damage taken reduced by $s1% per stack.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Magic damage taken reduced by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- Retired (2026-06-28): Elemental Ward ranks 4-5 (900207/900208) removed when the talent was
-- reworked to 3 ranks. DELETE-only so `dbc db apply --changed` clears the live rows.
DELETE FROM `spell` WHERE `id` IN (900207, 900208);

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
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -3,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 187,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%, and reduces your chance to be critically hit by melee attacks by $s3%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%; reduces your chance to be critically hit by $s3%.',
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
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -4,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 187,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%, and reduces your chance to be critically hit by melee attacks by $s3%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%; reduces your chance to be critically hit by $s3%.',
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
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -5,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 187,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%, and reduces your chance to be critically hit by melee attacks by $s3%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%; reduces your chance to be critically hit by $s3%.',
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
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -6,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 187,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%, and reduces your chance to be critically hit by melee attacks by $s3%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%; reduces your chance to be critically hit by $s3%.',
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
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -7,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 187,
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%, and reduces your chance to be critically hit by melee attacks by $s3%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%; reduces your chance to be critically hit by $s3%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

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
    `effect_base_points_1` = 9,
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
    `effect_base_points_1` = 19,
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
    `effect_base_points_1` = 29,
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
    `effect_base_points_1` = 149,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 317,
    `effect_misc_value_a_1` = 0,
    `spell_icon_id` = 4614,
    `spell_priority` = 50,
    `spell_name_enus` = 'Stoneforged',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Strength by 1 for every $s1 armor value you have.',
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
    `effect_base_points_1` = 99,
    `effect_base_points_2` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 317,
    `effect_misc_value_a_1` = 0,
    `spell_icon_id` = 4614,
    `spell_priority` = 50,
    `spell_name_enus` = 'Stoneforged',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Strength by 1 for every $s1 armor value you have.',
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
    `effect_base_points_1` = 49,
    `effect_base_points_2` = 2,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 317,
    `effect_misc_value_a_1` = 0,
    `spell_icon_id` = 4614,
    `spell_priority` = 50,
    `spell_name_enus` = 'Stoneforged',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Strength by 1 for every $s1 armor value you have.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

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
