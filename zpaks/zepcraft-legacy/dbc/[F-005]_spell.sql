-- F-005: Riding Overhaul - DBC spell overrides
-- Applied after [BASE,F-044]_spell.sql
--
-- Part A: Bulk mount modifications (family, speed scaling, cast time, combat)
-- Part B: Form & Ghost Wolf corrections for riding crop support (I-049, I-050)
-- Part C: Riding crop effect targeting
--
-- Custom spell definitions (100010-100024) included in Part C below.
-- SpellDescriptionVariables (ID 182) in [F-005]_spelldescriptionvariables.sql.
-- SkillLineAbility crop training entries in [F-005]_skilllineability.sql.
--
-- SpellFamily 14 flag allocation (spell_class_mask_1):
--   Bit 31 (0x80000000 = 2147483648) = Mounts (existing)
--   Bit 30 (0x40000000 = 1073741824) = Ghost Wolf
--   Bit 29 (0x20000000 =  536870912) = Ghost Wolf Modifiers
--   Bit 28 (0x10000000 =  268435456) = Druid Forms
--   Bit 27 (0x08000000 =  134217728) = Druid Form Glyphs
--   Bit 26 (0x04000000 =   67108864) = Aquatic Form

-- ============================================================================
-- PART A: MOUNT OVERHAUL
-- Bulk changes for all mount spells (identified by aura 78 = MOUNTED)
-- Mount description text with $<groundspeed>/$<flyingspeed> variables is
-- handled via bulk CONCAT in section 6 below.
-- ============================================================================

-- ============================================================================
-- 1. MOUNT FAMILY ASSIGNMENT
--    Assign all mounted spells to SpellFamily 14 with mount flag (bit 31)
--    and riding crop tooltip variable (ID 182)
-- ============================================================================
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 2147483648,
    `spell_desc_variable_id` = 182
WHERE (`effect_apply_aura_name_1` = 78
   OR `effect_apply_aura_name_2` = 78
   OR `effect_apply_aura_name_3` = 78);

-- ============================================================================
-- 2. MOUNT CAST TIME
--    Standardize all mount cast times to index 14 (3000ms)
-- ============================================================================
UPDATE `spell` SET `cast_time_index` = 14
WHERE (`effect_apply_aura_name_1` = 78
   OR `effect_apply_aura_name_2` = 78
   OR `effect_apply_aura_name_3` = 78);

-- ============================================================================
-- 3. GROUND MOUNT LEVEL SCALING
--    Ground mounts scale from 20% at level 20 to 100% at level 60
--    Selector: aura 32 (MOD_INCREASE_MOUNTED_SPEED) in effect 2
--    Excludes mounts with intentional non-standard speeds:
--      33631  Video Mount (-11%), 68768 Little White Stallion (-1%),
--      68769  Little Ivory Raptor (0%), 61289 Borrowed Broom (170%),
--      87090  Goblin Trike (60%), 87091 Goblin Turbo-Trike (100%),
--      103195 Mountain Horse (60%), 103196 Swift Mountain Horse (100%)
-- ============================================================================
UPDATE `spell` SET
    `max_level` = 60,
    `base_level` = 20,
    `effect_real_points_per_level_2` = '2.0000000000000000',
    `effect_base_points_2` = 19
WHERE (`effect_apply_aura_name_1` = 78
   OR `effect_apply_aura_name_2` = 78
   OR `effect_apply_aura_name_3` = 78)
  AND `effect_apply_aura_name_2` = 32
  AND `id` NOT IN (33631, 68768, 68769, 61289, 87090, 87091, 103195, 103196);

-- ============================================================================
-- 4. FLYING MOUNT SPEED
--    Flying mounts fixed at 300% flight speed
--    Selector: aura 207 (MOD_INCREASE_MOUNTED_FLIGHT_SPEED) in effect 2
-- ============================================================================
UPDATE `spell` SET
    `effect_base_points_2` = 299
WHERE (`effect_apply_aura_name_1` = 78
   OR `effect_apply_aura_name_2` = 78
   OR `effect_apply_aura_name_3` = 78)
  AND `effect_apply_aura_name_2` = 207;

-- ============================================================================
-- 5. REMOVE MOUNT-NOT-ALLOWED-IN-COMBAT FLAG
--    Clears attribute bit 0x4000000 from all mounted spells
-- ============================================================================
UPDATE `spell`
SET `attributes_ex_4` = `attributes_ex_4` & ~67108864
WHERE (`effect_apply_aura_name_1` = 78
   OR `effect_apply_aura_name_2` = 78
   OR `effect_apply_aura_name_3` = 78)
  AND (`attributes_ex_4` & 67108864) = 67108864;


-- ============================================================================
-- 6. MOUNT DESCRIPTION TEXT
--    Append speed variable text to stock mount descriptions.
--    Guard prevents double-append if [BASE,F-044] already applied descriptions.
-- ============================================================================

-- Ground mounts: append speed text (excludes $<speed2> and turtle outliers)
UPDATE `spell` SET
    `spell_desc_enus` = CONCAT(`spell_desc_enus`, ' Increases speed by $<groundspeed2>%.'),
    `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.'
WHERE (`effect_apply_aura_name_1` = 78
   OR `effect_apply_aura_name_2` = 78
   OR `effect_apply_aura_name_3` = 78)
  AND `effect_apply_aura_name_2` = 32
  AND `spell_desc_enus` NOT LIKE '%groundspeed2%'
  AND `id` NOT IN (580, 25953, 26656, 30174);

-- Flying mounts: append flight speed text
UPDATE `spell` SET
    `spell_desc_enus` = CONCAT(`spell_desc_enus`, ' Increases flight speed by $<flyingspeed2>%.'),
    `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.'
WHERE (`effect_apply_aura_name_1` = 78
   OR `effect_apply_aura_name_2` = 78
   OR `effect_apply_aura_name_3` = 78)
  AND `effect_apply_aura_name_2` = 207
  AND `spell_desc_enus` NOT LIKE '%flyingspeed2%';

-- Special: Vanilla mounts using $<speed2> variable (580, 25953, 26656)
UPDATE `spell` SET
    `spell_desc_enus` = CONCAT(`spell_desc_enus`, ' Increases speed by $<speed2>%.'),
    `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.'
WHERE `id` IN (580, 25953, 26656)
  AND `spell_desc_enus` NOT LIKE '%speed2%';

-- Special: Riding Turtle (30174) - ground + swim speed
UPDATE `spell` SET
    `spell_desc_enus` = CONCAT(`spell_desc_enus`, ' Increases speed on land by $<groundspeed2>% and in the water by $<swimspeed2>%.'),
    `spell_tooltip_enus` = 'Increases speed on land by $<groundspeed>% and in the water by $<swimspeed>%.'
WHERE `id` = 30174
  AND `spell_desc_enus` NOT LIKE '%groundspeed2%';

-- ============================================================================
-- PART B: FORM & GHOST WOLF CORRECTIONS (I-049, I-050)
-- Move druid forms and Ghost Wolf into family 14 with dedicated flags
-- so riding crops can target them without side effects.
-- ============================================================================

-- ============================================================================
-- 7. CAST TIME FIXES
--    [BASE,F-044] accidentally set all form casts to index 6 (5 seconds)
-- ============================================================================

-- Druid forms: restore to instant (cast_time_index 1 = 0ms)
UPDATE `spell` SET `cast_time_index` = 1 WHERE `id` = 783;   -- Travel Form
UPDATE `spell` SET `cast_time_index` = 1 WHERE `id` = 1066;  -- Aquatic Form
UPDATE `spell` SET `cast_time_index` = 1 WHERE `id` = 33943; -- Flight Form
UPDATE `spell` SET `cast_time_index` = 1 WHERE `id` = 40120; -- Swift Flight Form

-- Ghost Wolf: restore to stock 2 seconds (cast_time_index 5 = 2000ms)
UPDATE `spell` SET `cast_time_index` = 5 WHERE `id` = 2645;

-- ============================================================================
-- 8. GHOST WOLF (2645) - Family 14, mask to bit 30
--    [BASE,F-044] set family 14 / mask 2147483648 (mount flag)
--    Separate flag avoids crop SPELLMOD_EFFECT3 hitting health regen
-- ============================================================================
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1073741824
WHERE `id` = 2645;

-- ============================================================================
-- 9. TRAVEL FORM PASSIVE (5419) - Family 14, mask to bit 28
--    Swap speed from effect 1 -> effect 2 so crop SPELLMOD_EFFECT2 works
-- ============================================================================
-- [BASE,F-044] layout: E1 = MOD_SPEED (+20% scaling), E2 = empty
-- New layout:           E1 = empty, E2 = MOD_SPEED (+20% scaling)
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 268435456,
    `effect_1` = 0,
    `effect_die_sides_1` = 0,
    `effect_real_points_per_level_1` = '0.0000000000000000',
    `effect_base_points_1` = 0,
    `effect_apply_aura_name_1` = 0,
    `effect_implicit_target_a_1` = 0,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_real_points_per_level_2` = '2.0000000000000000',
    `effect_base_points_2` = 19,
    `effect_apply_aura_name_2` = 31,
    `effect_implicit_target_a_2` = 1
WHERE `id` = 5419;

-- ============================================================================
-- 10. AQUATIC FORM PASSIVE (5421) - Family 14, mask to bits 28+26
--    Swap swim speed (effect 1) <-> resistance (effect 2)
--    Clear old spell_class_mask_2 from original DBC
-- ============================================================================
-- [BASE,F-044] layout: E1 = MOD_SWIM_SPEED (aura 58), E2 = MOD_RESISTANCE (aura 82)
-- New layout:           E1 = MOD_RESISTANCE (aura 82), E2 = MOD_SWIM_SPEED (aura 58)
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 335544320,
    `spell_class_mask_2` = 0,
    `effect_1` = 6,
    `effect_die_sides_1` = 0,
    `effect_real_points_per_level_1` = '0.0000000000000000',
    `effect_base_points_1` = 0,
    `effect_apply_aura_name_1` = 82,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_real_points_per_level_2` = '2.0000000000000000',
    `effect_base_points_2` = 19,
    `effect_apply_aura_name_2` = 58,
    `effect_implicit_target_a_2` = 1
WHERE `id` = 5421;

-- Aquatic form: description + tooltip with crop and glyph conditional variables
-- Variable 184 defined in [F-005]_spelldescriptionvariables.sql
UPDATE `spell` SET
    `spell_desc_variable_id` = 184,
    `spell_desc_enus` = 'Increases swimming speed by $<swimspeed2>% and allows the druid to breathe underwater.$?a57856[ Your Glyph of Aquatic Form increases this by an additional $<glyph>%.][]',
    `spell_tooltip_enus` = 'Increases swimming speed by $<swimspeed>%.$?a57856[ (Includes $<glyph>% from Glyph of Aquatic Form.)][]'
WHERE `id` = 5421;

-- ============================================================================
-- 11. FLIGHT FORM PASSIVE (33948) - Family 14, mask to bit 28
--     Speed already in effect 2 (aura 206 = MOD_FLIGHT_SPEED), no swap needed
-- ============================================================================
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 268435456
WHERE `id` = 33948;

-- ============================================================================
-- 12. SWIFT FLIGHT FORM PASSIVE (40121) - Family 14, mask to bit 28
--     Speed already in effect 2 (aura 206 = MOD_FLIGHT_SPEED), no swap needed
--     Clear old spell_class_mask_3 from original DBC
-- ============================================================================
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 268435456,
    `spell_class_mask_3` = 0
WHERE `id` = 40121;

-- ============================================================================
-- 13. GHOST WOLF MODIFIERS - Move to family 14, own mask = bit 29
--     Retarget effect masks from shaman bit 2048 -> Ghost Wolf bit 30
-- ============================================================================

-- Improved Ghost Wolf Rank 2 (16287)
-- E1 (aura 107 = ADD_FLAT, cast time), E2 (aura 108 = ADD_PCT, cast time)
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 536870912,
    `effect_spell_class_mask_a_1` = 1073741824,
    `effect_spell_class_mask_b_1` = 1073741824
WHERE `id` = 16287;

-- Ghost Wolf Speed (22801) - PvP set bonus speed increase
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 536870912,
    `effect_spell_class_mask_a_1` = 1073741824
WHERE `id` = 22801;

-- Ghost Wolf Speed (47017) - Speed buff trigger
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 536870912,
    `effect_spell_class_mask_a_1` = 1073741824
WHERE `id` = 47017;

-- Glyph of Ghost Wolf (59289)
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 536870912,
    `effect_spell_class_mask_a_1` = 1073741824
WHERE `id` = 59289;

-- ============================================================================
-- 14. GLYPH OF AQUATIC FORM (57856) - Move to family 14, own mask = bit 27
--     Retarget from spell_class_mask_2 bit 31 to spell_class_mask_1 bit 26
--     Fix misc_value_a: 3 (SPELLMOD_EFFECT1) -> 12 (SPELLMOD_EFFECT2)
--     because section 10 swapped swim speed from effect 1 to effect 2
-- ============================================================================
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 134217728,
    `effect_misc_value_a_1` = 12,
    `effect_spell_class_mask_a_1` = 67108864,
    `effect_spell_class_mask_a_2` = 0
WHERE `id` = 57856;

-- ============================================================================
-- 15. RIDING CROP SPELL DEFINITIONS (100010-100024)
--     Passive auras (100010-100014) and crafting spells (100020-100024)
-- ============================================================================

-- Apprentice Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100010;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100010, 0, 0, 0, 128, 268435456, 0, 0, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 101, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 1, '0E-16', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 6, 6, 1, 1, 1, '0E-16', '0E-16', '0E-16', 4, -21, 4, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 107, 108, 108, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 12, 10, 23, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 2147483648, 0, 0, 2147483648, 0, 0, 2147483648, 0, 0, 0, 0, 2241, 0, 0, 'Apprentice Riding Crop', 16712190, '', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0);

-- Journeyman Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100011;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100011, 0, 0, 0, 128, 268435456, 0, 0, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 101, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 1, '0E-16', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 6, 6, 1, 1, 1, '0E-16', '0E-16', '0E-16', 9, -41, 9, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 107, 108, 108, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 12, 10, 23, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 2147483648, 0, 0, 2147483648, 0, 0, 2147483648, 0, 0, 0, 0, 2241, 0, 0, 'Journeyman Riding Crop', 16712190, '', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0);

-- Expert Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100012;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100012, 0, 0, 0, 128, 268435456, 0, 0, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 101, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 1, '0E-16', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 6, 6, 1, 1, 1, '0E-16', '0E-16', '0E-16', 14, -61, 14, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 107, 108, 108, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 12, 10, 23, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 2147483648, 0, 0, 2147483648, 0, 0, 2147483648, 0, 0, 0, 0, 2241, 0, 0, 'Expert Riding Crop', 16712190, '', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0);

-- Artisan Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100013;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100013, 0, 0, 0, 128, 268435456, 0, 0, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 101, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 1, '0E-16', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 6, 6, 1, 1, 1, '0E-16', '0E-16', '0E-16', 19, -81, 19, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 107, 108, 108, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 12, 10, 23, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 2147483648, 0, 0, 2147483648, 0, 0, 2147483648, 0, 0, 0, 0, 2241, 0, 0, 'Artisan Riding Crop', 16712190, '', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0);

-- Master Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100014;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100014, 0, 0, 0, 128, 268435456, 0, 0, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 101, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 1, '0E-16', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 6, 6, 1, 1, 1, '0E-16', '0E-16', '0E-16', 24, -91, 199, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 107, 108, 108, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 12, 10, 23, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 2147483648, 0, 0, 2147483648, 0, 0, 2147483648, 0, 0, 0, 0, 2241, 0, 0, 'Master Riding Crop', 16712190, '', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 'Increases mount speed by $s1% and reduces mount cast time by $s2%.', 16712190, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0);

-- Apprentice Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100020;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100020, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0E-16', 0, 0, 0, 0, 2319, 4234, 0, 0, 0, 0, 0, 0, 20, 4, 0, 0, 0, 0, 0, 0, 0, 1, 0, 24, 0, 0, 1, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 100010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 346, 0, 0, 'Apprentice Riding Crop', 16712190, '', 16712190, 'Craft a Apprentice Riding Crop.', 16712190, '', 16712190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0);

-- Journeyman Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100021;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0E-16', 0, 0, 0, 0, 4234, 8170, 0, 0, 0, 0, 0, 0, 30, 8, 0, 0, 0, 0, 0, 0, 0, 1, 0, 24, 0, 0, 1, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 100011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 346, 0, 0, 'Journeyman Riding Crop', 16712190, '', 16712190, 'Craft a Journeyman Riding Crop.', 16712190, '', 16712190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0);

-- Expert Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100022;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0E-16', 0, 0, 0, 0, 8170, 15407, 0, 0, 0, 0, 0, 0, 40, 12, 0, 0, 0, 0, 0, 0, 0, 1, 0, 24, 0, 0, 1, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 100012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 346, 0, 0, 'Expert Riding Crop', 16712190, '', 16712190, 'Craft a Expert Riding Crop.', 16712190, '', 16712190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0);

-- Artisan Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100023;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0E-16', 0, 0, 0, 0, 15407, 17012, 0, 0, 0, 0, 0, 0, 20, 8, 0, 0, 0, 0, 0, 0, 0, 1, 0, 24, 0, 0, 1, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 100013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 346, 0, 0, 'Artisan Riding Crop', 16712190, '', 16712190, 'Craft a Artisan Riding Crop.', 16712190, '', 16712190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0);

-- Master Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100024;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (100024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0E-16', 0, 0, 0, 0, 25699, 21887, 0, 0, 0, 0, 0, 0, 30, 12, 0, 0, 0, 0, 0, 0, 0, 1, 0, 24, 0, 0, 1, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 100014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 346, 0, 0, 'Master Riding Crop', 16712190, '', 16712190, 'Craft a Master Riding Crop.', 16712190, '', 16712190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0);

-- ============================================================================
-- PART C: RIDING CROP TARGETING (I-049, I-050)
-- Update crop effect masks to include druid forms and Ghost Wolf.
-- Crop definitions (100010-100014 passives, 100020-100024 crafting)
-- are in section 15 above. Targeting overrides in section 16 below.
-- ============================================================================

-- ============================================================================
-- 16. RIDING CROP SPELLS (100010-100014) - Update targeting
--     Effect 1 (SPELLMOD_EFFECT2 = speed): mounts + GW + druid forms
--     Effect 2 (SPELLMOD_CASTING_TIME): mounts + GW + druid forms
--     Effect 3 (SPELLMOD_EFFECT3): mounts ONLY (avoid GW health regen)
-- ============================================================================
-- Bit 31|30|28 = 2147483648 + 1073741824 + 268435456 = 3489660928
-- Bit 31 only  = 2147483648

UPDATE `spell` SET
    `effect_spell_class_mask_a_1` = 3489660928,
    `effect_spell_class_mask_b_1` = 3489660928,
    `effect_spell_class_mask_c_1` = 2147483648
WHERE `id` = 100010;

UPDATE `spell` SET
    `effect_spell_class_mask_a_1` = 3489660928,
    `effect_spell_class_mask_b_1` = 3489660928,
    `effect_spell_class_mask_c_1` = 2147483648
WHERE `id` = 100011;

UPDATE `spell` SET
    `effect_spell_class_mask_a_1` = 3489660928,
    `effect_spell_class_mask_b_1` = 3489660928,
    `effect_spell_class_mask_c_1` = 2147483648
WHERE `id` = 100012;

UPDATE `spell` SET
    `effect_spell_class_mask_a_1` = 3489660928,
    `effect_spell_class_mask_b_1` = 3489660928,
    `effect_spell_class_mask_c_1` = 2147483648
WHERE `id` = 100013;

UPDATE `spell` SET
    `effect_spell_class_mask_a_1` = 3489660928,
    `effect_spell_class_mask_b_1` = 3489660928,
    `effect_spell_class_mask_c_1` = 2147483648
WHERE `id` = 100014;

UPDATE spell SET spell_desc_variable_id = 184 WHERE id = 5421
