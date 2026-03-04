UPDATE spell SET effect_2 = 0, effect_trigger_spell_2 = 0 WHERE id = 16268;

UPDATE spell SET spell_desc_enus = 'Gives a chance to parry enemy melee attacks.' WHERE id = 18848;

UPDATE spell SET spell_desc_enus = 'Gives a chance to parry enemy melee attacks.' WHERE id = 16268;

-- ============================================================================
-- Totemic Recall (36936) - Allow casting in Ghost Wolf form
-- Removes SPELL_ATTR0_NOT_SHAPESHIFTED (0x10000 = 65536)
-- ============================================================================
UPDATE `spell` SET `attributes` = `attributes` & ~65536 WHERE `id` = 36936;

-- ============================================================================
-- Earthen Reprisal (900114) - Reactive melee strike for Shaman
-- Becomes active after blocking, dodging, or parrying (AURA_STATE_DEFENSE).
-- Deals 50% weapon damage + Nature bonus (scales +4/level above 6).
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
    `max_level` = 80,
    `base_level` = 6,
    `spell_level` = 6,
    `range_index` = 2,
    `equipped_item_class` = -1,
    `effect_1` = 31,
    `effect_2` = 2,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_real_points_per_level_2` = 2.0,
    `effect_base_points_1` = 49,
    `effect_base_points_2` = 9,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 6,
    `spell_visual_1` = 1165,
    `spell_icon_id` = 5488,
    `spell_name_enus` = 'Earthen Reprisal',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'A strike that becomes active after blocking, dodging, or parrying an opponent''s attack. Deals $s1% weapon damage plus $s2 Nature damage.',
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
    `school_mask` = 8,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- ============================================================================
-- Earthwarden Talent Tree Spells (F-164 Phase 2)
-- Stone Skin, Volcanic Shield (redesigned), Rockslam, Tectonic Blast,
-- Improved Volcanic Shield (new), triggered spells
-- ============================================================================
-- ----------------------------------------------------------------------------
-- Stone Skin (900115, 900127, 900128) - 3 ranks, cloned from Thick Hide R3
-- 4% armor and 2% crit mitigation per rank.
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
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 3,
    `effect_base_points_2` = -3,
    `effect_base_points_3` = -3,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_apply_aura_name_2` = 179,
    `effect_apply_aura_name_3` = 181,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Stone Skin',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and reduces the chance you are critically hit by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and reduces crit chance against you by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;


DELETE FROM `spell` WHERE `id` = 900127;

INSERT INTO `spell` SET
    `id` = 900127,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 7,
    `effect_base_points_2` = -5,
    `effect_base_points_3` = -5,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_apply_aura_name_2` = 179,
    `effect_apply_aura_name_3` = 181,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Stone Skin',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and reduces the chance you are critically hit by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and reduces crit chance against you by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;


DELETE FROM `spell` WHERE `id` = 900128;

INSERT INTO `spell` SET
    `id` = 900128,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = 11,
    `effect_base_points_2` = -7,
    `effect_base_points_3` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 142,
    `effect_apply_aura_name_2` = 179,
    `effect_apply_aura_name_3` = 181,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Stone Skin',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and reduces the chance you are critically hit by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and reduces crit chance against you by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

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
    `max_level` = 84,
    `base_level` = 80,
    `spell_level` = 80,
    `duration_index` = 6,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900122,
    `spell_visual_1` = 7757,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Surrounds the caster with a shield of volcanic energy. When you block an attack, the shield deals $<total> Nature damage to the attacker. Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $<total> Nature damage to attackers when you block. Unlimited charges.',
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
    `school_mask` = 8,
    `effect_bonus_multiplier_1` = 0.267,
    `spell_desc_variable_id` = 187;

-- ----------------------------------------------------------------------------
-- Rockslam (900119) - Shield bash dealing flat damage + block buff
-- E1: SCHOOL_DAMAGE (effect 2) - 100 base + 4/level + 20% AP
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
    `max_level` = 80,
    `base_level` = 40,
    `spell_level` = 40,
    `range_index` = 2,
    `equipped_item_class` = 2,
    `equipped_item_subclass_mask` = 173555,
    `effect_1` = 2,
    `effect_2` = 64,
    `effect_die_sides_1` = 1,
    `effect_real_points_per_level_1` = 8.0,
    `effect_base_points_1` = 199,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 1,
    `effect_trigger_spell_2` = 900120,
    `spell_visual_1` = 42,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Bashes the target with your shield, dealing $<dmg> Physical damage, scaling with Attack Power. Grants $900120s1% increased block chance for $900120d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $<dmg> Physical damage and increases block chance by $900120s1% for $900120d.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 8,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_2` = 16777232,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 0.25,
    `spell_desc_variable_id` = 189;

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
    `spell_class_mask_1` = 4096,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
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
    `max_level` = 80,
    `base_level` = 40,
    `spell_level` = 40,
    `duration_index` = 35,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = 1,
    `effect_die_sides_3` = 1,
    `effect_real_points_per_level_1` = 4.0,
    `effect_base_points_1` = 99,
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

-- ----------------------------------------------------------------------------
-- Volcanic Shield Triggered (900122) - Nature damage + % mana regen on block
-- E1: SCHOOL_DAMAGE (effect 2) - Nature damage to attacker, 30% SP coeff, 21.19 ppl (targets ~3x LS per proc for ~30% block rate)
-- E2: ENERGIZE_PCT (effect 137) - base 0% max mana, boosted by Imp VS modifier
--     Ref: Mana Leech (34650). Instant % mana restore, no duration needed.
-- spell_class_mask_3 = 256 (bit 8) for modifier targeting by Imp VS
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
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 293,
    `effect_real_points_per_level_1` = 21,
    `effect_implicit_target_a_1` = 6,
    `effect_2` = 137,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -1,
    `effect_implicit_target_a_2` = 1,
    `spell_level` = 40,
    `base_level` = 40,
    `max_level` = 84,
    `spell_visual_1` = 3444,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Deals $s1 Nature damage.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 256,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_bonus_multiplier_1` = 0.3;

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R1 (900123) - ADD_FLAT_MODIFIER boosting 900122 E2
-- Adds +2% to Volcanic Shield's OBS_MOD_MANA (aura 21) effect.
-- Targets spell_class_mask_3 = 256 (bit 8, Volcanic Shield trigger)
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
    `effect_base_points_1` = 1,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_c_1` = 256,
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
-- Adds +4% to Volcanic Shield's OBS_MOD_MANA (aura 21) effect.
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
    `effect_base_points_1` = 3,
    `effect_die_sides_1` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_c_1` = 256,
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
-- E2: SPELLMOD_EFFECT2 (misc 12) → boosts MOD_THREAT (E2) by +5%/+10%
-- Mask mapping: A/B/C = Effect 1/2/3, suffix 1/2/3 = mask_1/mask_2/mask_3
-- E1 targets Rockbiter Passive via A3 (spell_class_mask_3 = 128, bit 72)
-- E2 targets Rockbiter Passive via B3 (spell_class_mask_3 = 128, bit 72)
-- ============================================================================
-- ----------------------------------------------------------------------------
-- Improved Rockbiter Weapon R1 (900129): +25% AP, +5% threat
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
    `spell_desc_enus` = 'While Rockbiter Weapon is active, increases its attack power bonus by $s1% and threat generation by $s2%.',
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
-- Improved Rockbiter Weapon R2 (900130): +50% AP, +10% threat
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
    `spell_desc_enus` = 'While Rockbiter Weapon is active, increases its attack power bonus by $s1% and threat generation by $s2%.',
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
-- Bastion of Earth (900109-900113)
-- 5-rank passive. E1: MOD_THREAT (aura 10, all schools),
-- E2: MOD_HEALING_RECEIVED (aura 283, ref Grace 47930).
-- Stun/incapacitate reduction moved to Relentless (900142-900146).
-- ============================================================================
-- Bastion of Earth R1 (+3% threat, +3% healing received)
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
    `effect_base_points_1` = 2,
    `effect_base_points_2` = 2,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Bastion of Earth R2 (+6% threat, +6% healing received)
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
    `effect_base_points_1` = 5,
    `effect_base_points_2` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Bastion of Earth R3 (+9% threat, +9% healing received)
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
    `effect_base_points_1` = 8,
    `effect_base_points_2` = 8,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Bastion of Earth R4 (+12% threat, +12% healing received)
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
    `effect_base_points_1` = 11,
    `effect_base_points_2` = 11,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Bastion of Earth R5 (+15% threat, +15% healing received)
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
    `effect_base_points_1` = 14,
    `effect_base_points_2` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 127,
    `spell_icon_id` = 5043,
    `spell_name_enus` = 'Bastion of Earth',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- ============================================================================
-- Relentless (900142-900146)
-- 5-rank passive. Reduces duration of stun, fear, and silence effects.
-- E1: MECHANIC_DURATION_MOD (aura 232), misc 12 (STUN)
-- E2: MECHANIC_DURATION_MOD (aura 232), misc 5 (FEAR/CHARM)
-- E3: MECHANIC_DURATION_MOD (aura 232), misc 9 (SILENCE)
-- Ref: Unbreakable Will (14522). Icon 5460. 3% per rank.
-- ============================================================================
-- Relentless R1 (900142): -3% stun/fear/silence duration
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
    `effect_base_points_1` = -4,
    `effect_base_points_2` = -4,
    `effect_base_points_3` = -4,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 232,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 5,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the duration of stun, fear, and silence effects by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces stun, fear, and silence duration by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R2 (900143): -6% stun/fear/silence duration
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
    `effect_base_points_1` = -7,
    `effect_base_points_2` = -7,
    `effect_base_points_3` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 232,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 5,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the duration of stun, fear, and silence effects by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces stun, fear, and silence duration by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R3 (900144): -9% stun/fear/silence duration
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
    `effect_base_points_1` = -10,
    `effect_base_points_2` = -10,
    `effect_base_points_3` = -10,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 232,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 5,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the duration of stun, fear, and silence effects by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces stun, fear, and silence duration by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R4 (900145): -12% stun/fear/silence duration
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
    `effect_base_points_1` = -13,
    `effect_base_points_2` = -13,
    `effect_base_points_3` = -13,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 232,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 5,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the duration of stun, fear, and silence effects by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces stun, fear, and silence duration by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R5 (900146): -15% stun/fear/silence duration
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
    `effect_base_points_1` = -16,
    `effect_base_points_2` = -16,
    `effect_base_points_3` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 232,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 5,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the duration of stun, fear, and silence effects by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces stun, fear, and silence duration by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- ============================================================================
-- Elemental Bulwark (900147-900149) - Passive talent, procs on block
-- 3 ranks: triggers stacking armor buff (900150-900152).
-- Each successful block adds a stack of +3%/+4%/+5% armor for 10s (max 3 stacks).
-- Uses same proc pattern as Volcanic Shield: proc_flags=40, spell_proc HitMask=64.
-- Buff uses aura 101 (MOD_RESISTANCE_PCT) like Unbreakable Armor (51271).
-- ============================================================================

-- Elemental Bulwark R1 (900147) - Passive, triggers 900150 on block
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
    `spell_icon_id` = 3016,
    `spell_name_enus` = 'Elemental Bulwark',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Successful blocks increase your armor by $900150s1% for $900150d. Stacks up to 3 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Successful blocks increase armor by $900150s1% for $900150d, stacking up to 3 times.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Elemental Bulwark R2 (900148) - Passive, triggers 900151 on block
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
    `spell_icon_id` = 3016,
    `spell_name_enus` = 'Elemental Bulwark',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Successful blocks increase your armor by $900151s1% for $900151d. Stacks up to 3 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Successful blocks increase armor by $900151s1% for $900151d, stacking up to 3 times.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Elemental Bulwark R3 (900149) - Passive, triggers 900152 on block
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
    `spell_icon_id` = 3016,
    `spell_name_enus` = 'Elemental Bulwark',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Successful blocks increase your armor by $900152s1% for $900152d. Stacks up to 3 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Successful blocks increase armor by $900152s1% for $900152d, stacking up to 3 times.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- ============================================================================
-- Elemental Bulwark Buff (900150-900152) - Triggered stacking armor buff
-- Aura 101 (MOD_RESISTANCE_PCT), misc 1 (armor), 10s duration, 3 stacks.
-- Same aura as Unbreakable Armor (51271).
-- ============================================================================

-- Elemental Bulwark buff R1 (900150) - +3% armor, 10s, 3 stacks
DELETE FROM `spell` WHERE `id` = 900150;

INSERT INTO `spell` SET
    `id` = 900150,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `range_index` = 1,
    `stack_amount` = 3,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 2,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 101,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 3016,
    `spell_name_enus` = 'Elemental Bulwark',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Armor increased by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor increased by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Elemental Bulwark buff R2 (900151) - +4% armor, 10s, 3 stacks
DELETE FROM `spell` WHERE `id` = 900151;

INSERT INTO `spell` SET
    `id` = 900151,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `range_index` = 1,
    `stack_amount` = 3,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 101,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 3016,
    `spell_name_enus` = 'Elemental Bulwark',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Armor increased by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor increased by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Elemental Bulwark buff R3 (900152) - +5% armor, 10s, 3 stacks
DELETE FROM `spell` WHERE `id` = 900152;

INSERT INTO `spell` SET
    `id` = 900152,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `range_index` = 1,
    `stack_amount` = 3,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 4,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 101,
    `effect_misc_value_a_1` = 1,
    `spell_icon_id` = 3016,
    `spell_name_enus` = 'Elemental Bulwark',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Armor increased by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Armor increased by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0;

-- Volcanic Shield desc with conditional mana restore from Molten Core talent
UPDATE spell SET spell_desc_enus = 'Surrounds the caster with a shield of volcanic energy. When you block an attack, the shield deals $<total> Nature damage to the attacker. Damage scales with spell power.$?s900124[ Also restores $900124s1% of your maximum mana per block.][]$?s900123[ Also restores $900123s1% of your maximum mana per block.][] Lasts $d.' WHERE ID = 900116;
UPDATE spell SET spell_tooltip_enus = 'Deals $<total> Nature damage to attackers when you block.$?s900124[ Also restores $900124s1% of your maximum mana.][]$?s900123[ Also restores $900123s1% of your maximum mana.][]' WHERE ID = 900116;

-- Elemental Bulwark base_points fix
UPDATE spell SET effect_base_points_1 = 1 WHERE ID = 900150;
UPDATE spell SET effect_base_points_1 = 3 WHERE ID = 900151;
UPDATE spell SET effect_base_points_1 = 5 WHERE ID = 900152;

-- Rockbiter Weapon imbue desc - calculated AP from aura spells + conditional threat from Imp Rockbiter
UPDATE spell SET spell_desc_variable_id = 190, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $<total>.$?s900129[  Increases threat generated by $<threat>%.][]$?s900130[  Increases threat generated by $<threat>%.][]  Lasts 30 minutes.' WHERE id = 8017;
UPDATE spell SET spell_desc_variable_id = 191, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $<total>.$?s900129[  Increases threat generated by $<threat>%.][]$?s900130[  Increases threat generated by $<threat>%.][]  Lasts 30 minutes.' WHERE id = 8018;
UPDATE spell SET spell_desc_variable_id = 192, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $<total>.$?s900129[  Increases threat generated by $<threat>%.][]$?s900130[  Increases threat generated by $<threat>%.][]  Lasts 30 minutes.' WHERE id = 8019;
UPDATE spell SET spell_desc_variable_id = 193, spell_desc_enus = 'Imbue the Shaman''s weapon, increasing attack power by $<total>.$?s900129[  Increases threat generated by $<threat>%.][]$?s900130[  Increases threat generated by $<threat>%.][]  Lasts 30 minutes.' WHERE id = 10399;

-- Improved Rockbiter Weapon descriptions
UPDATE spell SET spell_desc_enus = 'Your Rockbiter Weapon increases threat generated by $s2% and increases attack power bonus of Rockbiter Weapon by $s1%.' WHERE id = 900129;
UPDATE spell SET spell_desc_enus = 'Your Rockbiter Weapon increases threat generated by $s2% and increases attack power bonus of Rockbiter Weapon by $s1%.' WHERE id = 900130;

UPDATE spell SET spell_class_mask_3 = 32768 WHERE ID = 900122;

UPDATE spell SET effect_spell_class_mask_c_1 = 32768 WHERE ID IN (900123, 900124);

UPDATE spell SET effect_spell_class_mask_c_1 = 0, effect_spell_class_mask_a_3 = 32768 WHERE ID IN (900123, 900124);

UPDATE spell SET effect_base_points_1 = 5 WHERE ID = 900123;

UPDATE spell SET effect_base_points_1 = 11 WHERE ID = 900124;

DELETE FROM `spell` WHERE `id` = 900153;

INSERT INTO `spell` SET
    `id` = 900153,
    `category` = 82,
    `attributes` = 327696,
    `attributes_ex_2` = 67108864,
    `attributes_ex_4` = 2048,
    `attributes_ex_6` = 8388608,
    `stances` = 131072,
    `cast_time_index` = 1,
    `category_recovery_time` = 8000,
    `proc_chance` = 101,
    `base_level` = 10,
    `spell_level` = 10,
    `duration_index` = 27,
    `power_type` = 1,
    `range_index` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 114,
    `effect_2` = 6,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 6,
    `effect_apply_aura_name_2` = 11,
    `spell_visual_1` = 34,
    `spell_icon_id` = 24,
    `spell_name_enus` = 'Ancestral Shout',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = 'Taunts the target to attack you, but has no effect if the target is already attacking you.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Taunted.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 4,
    `spell_class_mask_1` = 32768,
    `damage_class` = 1,
    `prevention_type` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

UPDATE spell SET spell_class_set = 7, spell_class_mask_1 = 0, spell_class_mask_2 = 0, spell_class_mask_3 = 0, stances = 0, power_type = 0, power_cost = 0, spell_icon_id = 4781, spell_desc_enus = 'Taunts the target to attack you, but has no effect if the target is already attacking you.' WHERE id = 900153;
