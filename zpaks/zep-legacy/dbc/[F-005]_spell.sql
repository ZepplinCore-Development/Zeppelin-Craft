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
-- Stock spell has no speed effects; add them so bulk level-scaling (section 3) works.
-- Sections 1-2 already set spell_class_set/mask, spell_desc_variable_id, cast_time_index.
UPDATE `spell` SET
    `attributes_ex_3` = 0,
    `spell_level` = 20,
    `max_level` = 60,
    `base_level` = 20,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_real_points_per_level_2` = '2.0000000000000000',
    `effect_base_points_2` = 19,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 32,
    `effect_3` = 6,
    `effect_die_sides_3` = 1,
    `effect_real_points_per_level_3` = '2.0000000000000000',
    `effect_base_points_3` = 19,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 58,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Summons and dismisses a rideable turtle. Increases speed on land by $<groundspeed2>% and in the water by $<swimspeed2>%.',
    `spell_tooltip_enus` = 'Increases speed on land by $<groundspeed>% and in the water by $<swimspeed>%.'
WHERE `id` = 30174;

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
--    Variable 185 shows speed with crop + Ghost Wolf Speed set bonuses
--    Per-level scaling: 20% at L20, +2%/level, caps at L60 (100%)
--    Matches ground mount scaling exactly (base_points 19, per_level 2.0)
-- ============================================================================
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1073741824,
    `spell_desc_variable_id` = 185,
    `max_level` = 60,
    `base_level` = 20,
    `effect_base_points_2` = 19,
    `effect_real_points_per_level_2` = '2.0000000000000000',
    `spell_desc_enus` = 'Turns the Shaman into a Ghost Wolf, increasing speed by $<wolfspeed2>%$?s59289[ and regenerating $59289s1% of your maximum health every 5 sec][]. As a Ghost Wolf, the Shaman is less hindered by effects that would reduce movement speed. Only useable outdoors.',
    `spell_tooltip_enus` = 'Increases movement speed by $<wolfspeed>%$?s59289[ and regenerates $59289s1% of your maximum health every 5 sec][].Effects that reduce movement speed may not bring you below your normal movement speed.'
WHERE `id` = 2645;

-- ============================================================================
-- 8b. TRAVEL FORM (783) - Tooltip crop bonus + broken $5419s1 fix
--     Section 9 swapped speed from effect 1 -> 2 on passive 5419, breaking
--     the $5419s1 reference. Use variable 182 with $<travelspeed> which
--     references $5419m2 (cross-spell) + crop bonus.
-- ============================================================================
UPDATE `spell` SET
    `spell_desc_variable_id` = 182,
    `spell_desc_enus` = 'Shapeshift into travel form, increasing movement speed by $<travelspeed2>%.  Also protects the caster from Polymorph effects.  Only useable outdoors.The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.',
    `spell_tooltip_enus` = 'Immune to Polymorph effects.  Movement speed increased by $<travelspeed>%.'
WHERE `id` = 783;

-- ============================================================================
-- 8c. AQUATIC FORM (1066) - Tooltip with variable 199 (cross-spell ref to 5421)
--     Section 10 swapped swim speed from E1 -> E2 on passive 5421, breaking
--     the old $5421s1 reference. Use variable 199 with $<swimspeed> which
--     references $5421m2 (cross-spell) + crop + glyph bonus.
--     Cannot reuse variable 184 because 1066's own $m2 is mechanic immunity,
--     not swim speed — need cross-spell refs in a separate variable.
-- ============================================================================
UPDATE `spell` SET
    `spell_desc_variable_id` = 199,
    `spell_desc_enus` = 'Shapeshift into aquatic form, increasing swim speed by $<swimspeed2>% and allowing the druid to breathe underwater.  Also protects the caster from Polymorph effects.$?a57856[ Your Glyph of Aquatic Form increases swim speed by an additional $<glyph>%.][]The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.',
    `spell_tooltip_enus` = 'Immune to Polymorph effects.  Increases swim speed by $<swimspeed>% and allows underwater breathing.$?a57856[ (Includes $<glyph>% from Glyph of Aquatic Form.)][]'
WHERE `id` = 1066;

-- ============================================================================
-- 9. TRAVEL FORM PASSIVE (5419) - Family 14, mask to bit 28
--    Swap speed from effect 1 -> effect 2 so crop SPELLMOD_EFFECT2 works
--    Fix base_level=20 / max_level=60 to match ground mount scaling formula
-- ============================================================================
-- [BASE,F-044] layout: E1 = MOD_SPEED (+20% scaling), E2 = empty
-- New layout:           E1 = empty, E2 = MOD_SPEED (+20% scaling)
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 268435456,
    `base_level` = 20,
    `max_level` = 60,
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
    `base_level` = 20,
    `max_level` = 60,
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

-- Flight Form (33943) - Tooltip crop bonus via $<flightspeed>
UPDATE `spell` SET
    `spell_desc_variable_id` = 182,
    `spell_desc_enus` = 'Shapeshift into flight form, increasing movement speed by $<flightspeed>% and allowing you to fly.  Cannot use in combat.  Can only use this form in Outland or Northrend.The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.',
    `spell_tooltip_enus` = 'Immune to Polymorph effects.Movement speed increased by $<flightspeed>% and allows you to fly.'
WHERE `id` = 33943;

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

-- Swift Flight Form (40120) - Tooltip crop bonus via $<swiftflightspeed>
UPDATE `spell` SET
    `spell_desc_variable_id` = 182,
    `spell_desc_enus` = 'Shapeshift into swift flight form, increasing movement speed by $<swiftflightspeed>% and allowing you to fly.  Cannot use in combat.  Can only use this form in Outland or Northrend.The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.',
    `spell_tooltip_enus` = 'Immune to Polymorph effects.Movement speed increased by $<swiftflightspeed>% and allows you to fly.'
WHERE `id` = 40120;

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

INSERT INTO `spell` SET
    `id` = 100010,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `attributes_ex_4` = 4096,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 3,
    `effect_base_points_2` = -11,
    `effect_base_points_3` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 10,
    `effect_misc_value_a_3` = 23,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 2147483648,
    `effect_spell_class_mask_c_1` = 2147483648,
    `spell_icon_id` = 2241,
    `spell_name_enus` = 'Apprentice Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Journeyman Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100011;

INSERT INTO `spell` SET
    `id` = 100011,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `attributes_ex_4` = 4096,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 7,
    `effect_base_points_2` = -21,
    `effect_base_points_3` = 7,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 10,
    `effect_misc_value_a_3` = 23,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 2147483648,
    `effect_spell_class_mask_c_1` = 2147483648,
    `spell_icon_id` = 2241,
    `spell_name_enus` = 'Journeyman Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Expert Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100012;

INSERT INTO `spell` SET
    `id` = 100012,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `attributes_ex_4` = 4096,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 11,
    `effect_base_points_2` = -31,
    `effect_base_points_3` = 11,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 10,
    `effect_misc_value_a_3` = 23,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 2147483648,
    `effect_spell_class_mask_c_1` = 2147483648,
    `spell_icon_id` = 2241,
    `spell_name_enus` = 'Expert Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Artisan Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100013;

INSERT INTO `spell` SET
    `id` = 100013,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `attributes_ex_4` = 4096,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 15,
    `effect_base_points_2` = -41,
    `effect_base_points_3` = 15,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 10,
    `effect_misc_value_a_3` = 23,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 2147483648,
    `effect_spell_class_mask_c_1` = 2147483648,
    `spell_icon_id` = 2241,
    `spell_name_enus` = 'Artisan Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Master Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100014;

INSERT INTO `spell` SET
    `id` = 100014,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `attributes_ex_4` = 4096,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 19,
    `effect_base_points_2` = -51,
    `effect_base_points_3` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 10,
    `effect_misc_value_a_3` = 23,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 2147483648,
    `effect_spell_class_mask_c_1` = 2147483648,
    `spell_icon_id` = 2241,
    `spell_name_enus` = 'Master Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Apprentice Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100020;

INSERT INTO `spell` SET
    `id` = 100020,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `cast_time_index` = 5,
    `range_index` = 1,
    `reagent_1` = 2319,
    `reagent_2` = 4234,
    `reagent_count_1` = 20,
    `reagent_count_2` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57617,                   -- Apprentice Riding Crop item (I-186 renumbered from 100010)
    `spell_icon_id` = 346,
    `spell_name_enus` = 'Apprentice Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Craft a Apprentice Riding Crop.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16;

-- Journeyman Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100021;

INSERT INTO `spell` SET
    `id` = 100021,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `cast_time_index` = 5,
    `range_index` = 1,
    `reagent_1` = 4234,
    `reagent_2` = 8170,
    `reagent_3` = 100010,
    `reagent_count_1` = 30,
    `reagent_count_2` = 8,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57618,                   -- Journeyman Riding Crop item (I-186 renumbered from 100011)
    `spell_icon_id` = 346,
    `spell_name_enus` = 'Journeyman Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Craft a Journeyman Riding Crop.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16;

-- Expert Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100022;

INSERT INTO `spell` SET
    `id` = 100022,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `cast_time_index` = 5,
    `range_index` = 1,
    `reagent_1` = 8170,
    `reagent_2` = 15407,
    `reagent_3` = 100011,
    `reagent_count_1` = 40,
    `reagent_count_2` = 12,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57619,                   -- Expert Riding Crop item (I-186 renumbered from 100012)
    `spell_icon_id` = 346,
    `spell_name_enus` = 'Expert Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Craft a Expert Riding Crop.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16;

-- Artisan Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100023;

INSERT INTO `spell` SET
    `id` = 100023,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `cast_time_index` = 5,
    `range_index` = 1,
    `reagent_1` = 15407,
    `reagent_2` = 17012,
    `reagent_3` = 100012,
    `reagent_count_1` = 20,
    `reagent_count_2` = 8,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57620,                   -- Artisan Riding Crop item (I-186 renumbered from 100013)
    `spell_icon_id` = 346,
    `spell_name_enus` = 'Artisan Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Craft a Artisan Riding Crop.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16;

-- Master Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100024;

INSERT INTO `spell` SET
    `id` = 100024,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `cast_time_index` = 5,
    `range_index` = 1,
    `reagent_1` = 25699,
    `reagent_2` = 21887,
    `reagent_3` = 100013,
    `reagent_count_1` = 30,
    `reagent_count_2` = 12,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57621,                   -- Master Riding Crop item (I-186 renumbered from 100014)
    `spell_icon_id` = 346,
    `spell_name_enus` = 'Master Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Craft a Master Riding Crop.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16;

-- Grand Master Riding Crop (passive)
DELETE FROM `spell` WHERE `id` = 100015;

INSERT INTO `spell` SET
    `id` = 100015,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `attributes_ex_4` = 4096,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 23,
    `effect_base_points_2` = -61,
    `effect_base_points_3` = 23,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 10,
    `effect_misc_value_a_3` = 23,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 2147483648,
    `effect_spell_class_mask_c_1` = 2147483648,
    `spell_icon_id` = 2241,
    `spell_name_enus` = 'Grand Master Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases mount speed by $s1% and reduces mount cast time by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Grand Master Riding Crop (crafting)
DELETE FROM `spell` WHERE `id` = 100025;

INSERT INTO `spell` SET
    `id` = 100025,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `cast_time_index` = 5,
    `range_index` = 1,
    `reagent_1` = 38425,
    `reagent_2` = 44128,
    `reagent_3` = 100014,
    `reagent_count_1` = 40,
    `reagent_count_2` = 8,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57627,                   -- Grand Master Riding Crop item (I-186 renumbered from 100020)
    `spell_icon_id` = 346,
    `spell_name_enus` = 'Grand Master Riding Crop',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Craft a Grand Master Riding Crop.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16;

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

UPDATE `spell` SET
    `effect_spell_class_mask_a_1` = 3489660928,
    `effect_spell_class_mask_b_1` = 3489660928,
    `effect_spell_class_mask_c_1` = 2147483648
WHERE `id` = 100015;

UPDATE spell SET reagent_1=2318, reagent_count_1=12, reagent_2=2320, reagent_count_2=2 WHERE id=100020;

UPDATE spell SET reagent_1=2319, reagent_count_1=20, reagent_2=4234, reagent_count_2=4, reagent_3=100010, reagent_count_3=1 WHERE id=100021;

UPDATE spell SET reagent_1=4304, reagent_count_1=20, reagent_2=8170, reagent_count_2=4, reagent_3=100011, reagent_count_3=1 WHERE id=100022;

UPDATE spell SET reagent_1=8170, reagent_count_1=20, reagent_2=15407, reagent_count_2=8, reagent_3=100012, reagent_count_3=1 WHERE id=100023;

UPDATE spell SET reagent_1=23793, reagent_count_1=20, reagent_2=21887, reagent_count_2=8, reagent_3=100013, reagent_count_3=1 WHERE id=100024;
