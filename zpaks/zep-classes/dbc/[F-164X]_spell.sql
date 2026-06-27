-- [F-164X] Enhancement-tree retune - DBC spell records (split from F-164).
-- Self-contained sub-feature owning the Enhancement-tree talent retune: Shock and Awe, Wolf's Hunger, Improved Lava Lash (spell 900210-900219).
-- F-164 PARENT retains the Earthwarden talent-tree rows + 9001 skillline membership
-- that REFERENCE these spell IDs (ownership != dependency). World-side support rows
-- (spell_proc / spell_bonus_data / spell_linked_spell / spell_script_names / spell_custom_attr)
-- live in zz_[F-164X]_shaman_guardian_spells.sql; trainer/SLA membership stay in F-164.
-- C++ SpellScript SOURCE stays in core patch 0017 for now (compiled+working; the
-- binding rows are data and move with this feature) — patch-split deferred.

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
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
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
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
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
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
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
    `effect_spell_class_mask_a_3` = 4,
    `effect_spell_class_mask_b_3` = 4,
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
    `effect_spell_class_mask_a_3` = 4,
    `effect_spell_class_mask_b_3` = 4,
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
    `effect_spell_class_mask_a_3` = 4,
    `effect_spell_class_mask_b_3` = 4,
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
