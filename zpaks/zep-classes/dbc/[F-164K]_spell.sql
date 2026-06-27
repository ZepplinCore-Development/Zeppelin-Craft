-- [F-164K] Stoneskin - DBC spell record (sub-feature of F-164 Earthwarden).
-- Self-contained sub-feature owning the Stoneskin defensive cooldown (spell 900164).
-- Previously this id was the old Stoneskin that was merged into Rockwall (F-164R);
-- it is revived here as a standalone ability, split out of [F-164R]_spell.sql.
--
-- F-164 PARENT retains the Earthwarden talent-tree row that REFERENCES this spell id
-- (ownership != dependency). Spellbook SLA membership lives in [F-164K]_skilllineability.sql.
-- Pure-aura ability: no C++ SpellScript and no world-side support rows are needed.
--
-- ----------------------------------------------------------------------------
-- Stoneskin (900164) - Earthwarden defensive CD. Instant, 2 min CD, 12s.
--   E1 aura 87 (MOD_DAMAGE_PERCENT_TAKEN, all schools -127) -50% damage taken.
--   (Healing-received bonus moved to Bastion of Earth [F-164N]; Stoneskin is now
--    a pure Shield-Wall-tier damage cooldown.)
-- Icon 5469 (the icon Rockwall used before it moved to the yellow icewall icon).
-- Family mask_3 bit 4194304 reserved so a future Glyph of Stoneskin can target it.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900164;

INSERT INTO `spell` SET
    `id` = 900164,
    `attributes` = 16,
    `cast_time_index` = 1,
    `recovery_time` = 120000,
    `category_recovery_time` = 120000,
    `duration_index` = 29,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 127,
    `effect_base_points_1` = -51,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `spell_visual_1` = 5787,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Stoneskin',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Hardens your skin to stone, reducing all damage taken by 50% for 12 sec.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces damage taken by 50%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 4194304,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;
