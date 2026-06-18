-- F-005: Riding Overhaul - DBC spell overrides
-- Home: zep-professions (riding treated as a profession; lives alongside
-- zz_[F-005]_riding_crops.sql). Relocated here from zep-legacy.
--
-- Part A: Bulk mount modifications (family, speed scaling, cast time, combat)
-- Part B: Form & Ghost Wolf corrections for riding crop support (I-049, I-050)
-- Part C: Riding crop effect targeting
-- Part D: Mount catalog (243 stock-mount UPDATEs relocated from [BASE,F-044]_spell.sql)
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
-- Improved Ghost Wolf Rank 2 (16287): moved to zep-classes [F-164]_spell.sql.
-- 16287 is a shaman talent and F-164 rebalances its cast time / speed bonus, so
-- it now owns the full row (family 14, bit 29, masks targeting Ghost Wolf bit 30)
-- to keep a single source of truth for that spell. Do not re-add it here.

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
    `reagent_1` = 2318,
    `reagent_2` = 2320,
    `reagent_count_1` = 12,
    `reagent_count_2` = 2,
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
    `reagent_1` = 2319,
    `reagent_2` = 4234,
    `reagent_3` = 57617,                            -- Apprentice Riding Crop item (I-186 renumbered from 100010)
    `reagent_count_1` = 20,
    `reagent_count_2` = 4,
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
    `reagent_1` = 4304,
    `reagent_2` = 8170,
    `reagent_3` = 57618,                            -- Journeyman Riding Crop item (I-186 renumbered from 100011)
    `reagent_count_1` = 20,
    `reagent_count_2` = 4,
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
    `reagent_1` = 8170,
    `reagent_2` = 15407,
    `reagent_3` = 57619,                            -- Expert Riding Crop item (I-186 renumbered from 100012)
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
    `reagent_1` = 23793,
    `reagent_2` = 21887,
    `reagent_3` = 57620,                            -- Artisan Riding Crop item (I-186 renumbered from 100013)
    `reagent_count_1` = 20,
    `reagent_count_2` = 8,
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
    `reagent_3` = 57621,                            -- Master Riding Crop item (I-186 renumbered from 100014)
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

-- ============================================================
-- Part D: Mount catalog (level-20 riding overhaul)
-- Relocated from zep-legacy/dbc/[BASE,F-044]_spell.sql (243 stock-mount UPDATEs).
-- Sets mount family/speed scaling (desc var 182), cast_time_index, max/base_level.
-- ============================================================
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Brown Horse. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 458;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable gray wolf. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 459;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable White Stallion. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 468;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Stallion. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 470;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Palomino. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 471;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Pinto. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 472;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable black wolf. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 578;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable red wolf. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 579;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Timber Wolf. Increases speed by $<speed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 580;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable winter wolf. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 581;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable nether drake.  Can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 3363;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons a Felsteed, which serves as a mount. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 5784;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Chestnut Mare. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 6648;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Dire Wolf. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 6653;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Brown Wolf. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 6654;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Gray Ram. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 6777;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Ram. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 6896;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable blue ram. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 6897;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable White Ram. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 6898;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Brown Ram. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 6899;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Striped Frostsaber. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 8394;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Emerald Raptor. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 8395;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable skeletal horse. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 8980;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Nightsaber. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10787;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Sabre Cat. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10788;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Spotted Frostsaber Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10789;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Bengal Tiger. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10790;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Sabre Cat. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10792;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Striped Nightsaber. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10793;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Ivory Raptor. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10795;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Turquoise Raptor. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10796;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable raptor. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10798;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Violet Raptor. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10799;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Red Mechanostrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10873;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Blue Mechanostrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 10969;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons a Warhorse, which serves as a mount. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 13819;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable White Mechanostrider Mod B.   Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 15779;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Nightsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16055;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Ancient Frostsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16056;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Primal Leopard. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16058;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Tawny Sabercat. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16059;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Golden Sabercat. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16060;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Red Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16080;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Winter Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16081;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Palomino.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16082;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a White Stallion.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16083;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Mottled Red Raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 16084;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Winterspring Frostsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17229;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Ivory Raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17450;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Green Mechanostrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17453;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Unpainted Mechanostrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17454;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Purple Mechanostrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17455;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Red and Blue Mechanostrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17456;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Fluorescent Green Mechanostrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17458;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Icy Blue Mechanostrider Mod A.   Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17459;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Frost Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17460;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17461;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Red Skeletal Horse. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17462;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Blue Skeletal Horse. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17463;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Brown Skeletal Horse. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17464;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Green Skeletal Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17465;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses Baron Rivendare\'s Deathcharger.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 17481;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable kodo. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 18363;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Gray Kodo. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 18989;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Brown Kodo. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 18990;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Green Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 18991;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Teal Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 18992;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black War Steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 22717;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black War Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 22718;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Battlestrider.   Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 22719;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black War Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 22720;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black War Raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 22721;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Red Skeletal Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 22722;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black War Tiger.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 22723;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black War Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 22724;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons a Dreadsteed, which serves as a mount.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23161;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons a Charger, which serves as a mount.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23214;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Mistsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23219;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Dawnsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23220;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Frostsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23221;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a Swift Yellow Mechanostrider.   Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23222;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a Swift White Mechanostrider.   Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23223;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a Swift Green Mechanostrider.   Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23225;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Palomino.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23227;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift White Steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23228;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Brown Steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23229;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Brown Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23238;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Gray Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23239;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift White Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23240;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Blue Raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23241;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Olive Raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23242;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Orange Raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23243;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Purple Skeletal Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23246;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great White Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23247;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Gray Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23248;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Brown Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23249;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Brown Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23250;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Timber Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23251;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Gray Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23252;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Stormsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23338;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Frostwolf Howler.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23509;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Stormpike Battle Charger.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 23510;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses Bloodlord Mandokir\'s raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 24242;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses High Priest Thekal\'s tiger.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 24252;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Summons and dismisses a rideable Blue Qiraji Battle Tank. Increases speed by $<speed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `area_group_id` = 0, `spell_desc_variable_id` = 182 WHERE `id` = 25953;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Summons and dismisses a rideable Red Qiraji Battle Tank. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `area_group_id` = 0, `spell_desc_variable_id` = 182 WHERE `id` = 26054;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Summons and dismisses a rideable Yellow Qiraji Battle Tank. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `area_group_id` = 0, `spell_desc_variable_id` = 182 WHERE `id` = 26055;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Summons and dismisses a rideable Green Qiraji Battle Tank. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `area_group_id` = 0, `spell_desc_variable_id` = 182 WHERE `id` = 26056;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Qiraji Battle Tank. Increases speed by $<speed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 26656;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Naxxramas Deathcharger.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 29059;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Golden Gryphon mount.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32235;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Ebon Gryphon.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32239;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Snowy Gryphon.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32240;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Blue Gryphon mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32242;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Tawny Wind Rider mount.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32243;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Blue Wind Rider mount.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32244;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Green Wind Rider mount.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32245;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Red Wind Rider mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32246;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Red Gryphon mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32289;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Green Gryphon mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32290;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Purple Gryphon mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32292;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Green Wind Rider mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32295;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Yellow Wind Rider mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32296;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Purple Wind Rider mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32297;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable phoenix.  Can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 32345;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Pink Hawkstrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 33660;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Brown Elekk. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34406;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Elite Elekk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34407;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons a Charger, which serves as a mount.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34767;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons a warhorse, which serves as a mount. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34769;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Dark War Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34790;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Red Hawkstrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34795;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Cobalt War Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34896;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable White War Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34897;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Silver War Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34898;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Tan War Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 34899;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Purple Hawkstrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35018;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Blue Hawkstrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35020;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Hawkstrider. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35022;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Green Hawkstrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35025;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Purple Hawkstrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35027;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Warstrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35028;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Gray Elekk. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35710;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Purple Elekk. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35711;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Green Elekk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35712;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Blue Elekk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35713;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Purple Elekk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 35714;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses Attumen the Huntsman\'s steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 36702;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Nether Drake mount.  This is an extremely fast mount.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 37015;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Cobalt Riding Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39315;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Dark Riding Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39316;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Silver Riding Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39317;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Tan Riding Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39318;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable White Riding Talbuk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39319;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Green Riding Nether Ray.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39798;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Red Riding Nether Ray.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39800;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Summons and dismisses a rideable Purple Riding Nether Ray.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39801;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Silver Riding Nether Ray.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39802;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Summons and dismisses a rideable Blue Riding Nether Ray.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 39803;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable phoenix. This is an extremely fast mount. This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 40192;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a giant raven steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 41252;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Onyx Netherwing Drake mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 41513;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Azure Netherwing Drake mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 41514;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Cobalt Netherwing Drake mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 41515;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Purple Netherwing Drake mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 41516;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Veridian Netherwing Drake mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 41517;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Violet Netherwing Drake mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 41518;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'A Swift Flying Broom!   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 42668;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Spectral Tiger. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 42776;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Spectral Tiger.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 42777;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Amani War Bear. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 43688;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Brewfest Ram. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 43899;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Brewfest Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 43900;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Cenarion War Hippogryph mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 43927;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a Turbo-Charged Flying Machine.  This is a very fast ride.  This vehicle can only be used in Outland or Northrend.  Requires 375 engineering skill to ride. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 44151;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a Flying Machine.  This vehicle can only be used in Outland or Northrend.  Requires 300 engineering skill to ride. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 44153;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Merciless Nether Drake mount.  This is an extremely fast mount.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 44744;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'A riding rocket!  This can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 46197;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'An X-TREME riding rocket!   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 46199;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses the Hawkstrider of Kael\'thas Sunstrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 46628;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black War Elekk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 48027;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses your rideable Acherus Deathcharger.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 48778;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Zhevra. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 48954;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Vengeful Nether Drake mount.  This is an extremely fast mount.  This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 49193;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Zhevra. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 49322;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Brewfest Riding Kodo. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 49378;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Brewfest Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 49379;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Big Battle Bear. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 51412;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Armored Snowy Gryphon mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 61229;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Armored Blue Wind Rider mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 61230;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a Magnificent Flying Carpet.  This is a very fast rug.  Can only be used in Outland and Northrend.  Requires 425 skill in tailoring to ride. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 61309;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a Flying Carpet.  Can only be used in Outland and Northrend.  Requires 300 skill in tailoring to ride. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 61451;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Blue Dragonhawk.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 61996;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Red Dragonhawk.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 61997;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Black Dragonhawk Mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 62048;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Stormwind Steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63232;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Darkspear Raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63635;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Ironforge Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63636;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Darnassian Nightsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63637;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Gnomeregan Mechanostrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63638;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Exodar Elekk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63639;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Orgrimmar Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63640;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Thunder Bluff Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63641;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Silvermoon Hawkstrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63642;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Forsaken Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63643;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable mechanical gnome head.  This is a very fast construction.  This construction can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63796;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Argent Hippogryph mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 63844;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Blue Skeletal Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 64656;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable White Kodo. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 64657;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Wolf. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 64658;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Venomhide Ravasaur.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 64659;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Loaned Gryphon mount.  This mount can only be summoned in the Storm Peaks, Icecrown and Sholazar Basin. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 64681;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Loaned Wind Rider mount.  This mount can only be summoned in the Storm Peaks, Icecrown and Sholazar Basin. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 64761;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Black Skeletal Horse. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 64977;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Red Elekk.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65637;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Moonsaber.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65638;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift red Hawkstrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65639;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Gray Steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65640;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Great Golden Kodo.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65641;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Turbostrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65642;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Violet Ram.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65643;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Purple Raptor.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65644;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable White Skeletal Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65645;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Burgundy Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 65646;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Silver Covenant Hippogryph mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 66087;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = 'Summons and dismisses a rideable Sunreaver Dragonhawk mount.   This mount can only be summoned in Outland or Northrend. Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 66088;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Quel\'dorei Steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 66090;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Sunreaver Hawkstrider.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 66091;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Ochre Skeletal Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 66846;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Striped Dawnsaber. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 66847;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons an Argent Charger, which serves as a mount.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 66906;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons an Argent Warhorse, which serves as a mount. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 66907;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Argent Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 67466;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Horde Wolf.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 68056;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Swift Alliance Steed.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 68057;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Crusader\'s White Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 68187;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Crusader\'s Black Warhorse.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 68188;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `spell_desc_enus` = 'Summons and dismisses a rideable Little White Stallion.  This mount\'s speed changes depending on your Riding skill. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 68768;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `spell_desc_enus` = 'Summons and dismisses a rideable Little Ivory Raptor.  This mount\'s speed changes depending on your Riding skill. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 68769;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `effect_base_points_2` = 299, `spell_desc_enus` = ' Increases flight speed by $<flyingspeed2>%.', `spell_tooltip_enus` = 'Increases flight speed by $<flyingspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 71347;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses your rideable Crimson Deathcharger.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 73313;
UPDATE `spell` SET `attributes_ex_3` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a rideable Wooly White Rhino.  Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 74918;
UPDATE `spell` SET `attributes_ex_3` = 0, `attributes_ex_4` = 0, `cast_time_index` = 14, `max_level` = 60, `base_level` = 20, `effect_real_points_per_level_2` = '2.0000000000000000', `effect_base_points_2` = 19, `spell_desc_enus` = 'Summons and dismisses a Frosty Flying Carpet.  This is a very fast rug.  Can only be used in Outland and Northrend.  Requires 425 skill in tailoring to ride. Increases speed by $<groundspeed2>%.', `spell_tooltip_enus` = 'Increases speed by $<groundspeed>%.', `spell_class_set` = 14, `spell_class_mask_1` = 2147483648, `spell_desc_variable_id` = 182 WHERE `id` = 75596;
