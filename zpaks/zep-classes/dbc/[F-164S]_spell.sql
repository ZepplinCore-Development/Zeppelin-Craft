-- [F-164S] Stonebond - DBC spell records (split from F-164).
-- Self-contained sub-feature owning the Stonebond damage-soak split, talent/marker ranks, and pulse driver (spell 900222, 900225-900229, 900236, pulse 900226).
-- F-164 PARENT retains the Earthwarden talent-tree rows + 9001 skillline membership
-- that REFERENCE these spell IDs (ownership != dependency). World-side support rows
-- (spell_proc / spell_bonus_data / spell_linked_spell / spell_script_names / spell_custom_attr)
-- live in zz_[F-164S]_shaman_guardian_spells.sql; trainer/SLA membership stay in F-164.
-- C++ SpellScript SOURCE stays in core patch 0017 for now (compiled+working; the
-- binding rows are data and move with this feature) — patch-split deferred.

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
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
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

INSERT INTO `spell` SET
    `id` = 900225,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 3,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 4,
    `effect_2` = 6,
    `effect_base_points_2` = 45000,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 1,
    `effect_spell_class_mask_b_1` = 8,
    `spell_icon_id` = 4689,
    `spell_name_enus` = 'Stonebond',
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900227,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 7,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 4,
    `effect_2` = 6,
    `effect_base_points_2` = 45000,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 1,
    `effect_spell_class_mask_b_1` = 8,
    `spell_icon_id` = 4689,
    `spell_name_enus` = 'Stonebond',
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900228,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 11,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 4,
    `effect_2` = 6,
    `effect_base_points_2` = 45000,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 1,
    `effect_spell_class_mask_b_1` = 8,
    `spell_icon_id` = 4689,
    `spell_name_enus` = 'Stonebond',
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900229,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 15,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 4,
    `effect_2` = 6,
    `effect_base_points_2` = 45000,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 1,
    `effect_spell_class_mask_b_1` = 8,
    `spell_icon_id` = 4689,
    `spell_name_enus` = 'Stonebond',
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900236,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 4,
    `effect_2` = 6,
    `effect_base_points_2` = 45000,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 1,
    `effect_spell_class_mask_b_1` = 8,
    `spell_icon_id` = 4689,
    `spell_name_enus` = 'Stonebond',
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your Stoneclaw Totem and Earth Elemental Totem no longer taunt or stun. Instead, while one stands it absorbs $s1% of the damage you take, draining the totem''s health.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

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
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
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

DELETE FROM `spell` WHERE `id` = 900224;

-- RETIRED (2026-06-16): the standalone custom totem (900224, creature 900100)
-- is removed. Stonebond (900225) re-flavors the STOCK Stoneclaw / Earth Elemental
-- totems into damage soakers instead of adding a fourth earth-slot totem. The
-- split aura (900222) and the C++ logic live on; the summon spell does not.
-- The DELETE above stays so the spell is purged from the DBC.
