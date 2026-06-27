-- [F-164H] Spirit Communion - DBC spell records (split from F-164).
-- Self-contained sub-feature owning the Spirit Communion on-kill passive, Spirited buff, and active restore (spell 900183-900185).
-- F-164 PARENT retains the Earthwarden talent-tree rows + 9001 skillline membership
-- that REFERENCE these spell IDs (ownership != dependency). World-side support rows
-- (spell_proc / spell_bonus_data / spell_linked_spell / spell_script_names / spell_custom_attr)
-- live in zz_[F-164H]_shaman_guardian_spells.sql; trainer/SLA membership stay in F-164.
-- C++ SpellScript SOURCE stays in core patch 0017 for now (compiled+working; the
-- binding rows are data and move with this feature) — patch-split deferred.

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
    `school_mask` = 1;
