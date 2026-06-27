-- [F-164L] Living Guardian - DBC spell records (split from F-164).
-- Self-contained sub-feature owning the Living Guardian heal-triggered absorb passive + shield + cooldown debuff (spell 900167-900170, 900186).
-- F-164 PARENT retains the Earthwarden talent-tree rows + 9001 skillline membership
-- that REFERENCE these spell IDs (ownership != dependency). World-side support rows
-- (spell_proc / spell_bonus_data / spell_linked_spell / spell_script_names / spell_custom_attr)
-- live in zz_[F-164L]_shaman_guardian_spells.sql; trainer/SLA membership stay in F-164.
-- C++ SpellScript SOURCE stays in core patch 0017 for now (compiled+working; the
-- binding rows are data and move with this feature) — patch-split deferred.

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

INSERT INTO `spell` SET
    `id` = 900167,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_flags` = 32768,
    `proc_chance` = 33,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900170,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you receive a direct heal, you have a 33% chance to gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900168,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_flags` = 32768,
    `proc_chance` = 66,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900170,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you receive a direct heal, you have a 66% chance to gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900169,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_flags` = 32768,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900170,
    `spell_icon_id` = 4408,
    `spell_name_enus` = 'Living Guardian',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you receive a direct heal, you gain a shield that absorbs damage equal to 10% of your maximum health for $900170d. Cannot occur more than once every $900186d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

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
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
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
