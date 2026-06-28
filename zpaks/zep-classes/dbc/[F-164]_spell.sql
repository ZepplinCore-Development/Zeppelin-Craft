UPDATE spell SET effect_2 = 0, effect_trigger_spell_2 = 0 WHERE id = 16268;

UPDATE spell SET spell_desc_enus = 'Gives a chance to parry enemy melee attacks.' WHERE id = 18848;

UPDATE spell SET spell_desc_enus = 'Gives a chance to parry enemy melee attacks.' WHERE id = 16268;

-- ============================================================================
-- Totemic Recall (36936) - Allow casting in Ghost Wolf form
-- Removes SPELL_ATTR0_NOT_SHAPESHIFTED (0x10000 = 65536)
-- ============================================================================
UPDATE `spell` SET `attributes` = `attributes` & ~65536 WHERE `id` = 36936;

-- (Earthen Reprisal 900114 + @er_* scaling vars + var 197 retire moved to [F-164E]_spell.sql)

-- ============================================================================
-- Earthwarden Talent Tree Spells (F-164 Phase 2)
-- Stone Skin, Volcanic Shield (redesigned), Rockslam, Tectonic Blast,
-- Improved Volcanic Shield (new), triggered spells
-- ============================================================================
-- ----------------------------------------------------------------------------
-- Elemental Ward (900115, 900127, 900128, 900207, 900208) - 5 ranks, cloned from Elemental Warding (28996-28998)
-- E1 (aura 87, MOD_DAMAGE_PERCENT_TAKEN): reduces magic damage taken by 3/6/9/12/15% per rank.
-- E2 (aura 186, MOD_ATTACKER_SPELL_HIT_CHANCE): 3/6/9/12/15% chance to fully resist (miss) incoming spells.
-- Both effects use school mask 126 (all magic, excludes physical). Icon 5440.
-- die_sides=1 convention: applied = base+1, so base -(pct+1) yields -pct (e.g. base -4 = -3% = displays 3).
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
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -4,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -4,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 186,
    `effect_misc_value_a_2` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1% and gives a $s2% chance to fully resist harmful spells.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900127;

INSERT INTO `spell` SET
    `id` = 900127,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -7,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 186,
    `effect_misc_value_a_2` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1% and gives a $s2% chance to fully resist harmful spells.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900128;

INSERT INTO `spell` SET
    `id` = 900128,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -10,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -10,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 186,
    `effect_misc_value_a_2` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1% and gives a $s2% chance to fully resist harmful spells.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900207;

INSERT INTO `spell` SET
    `id` = 900207,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -13,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -13,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 186,
    `effect_misc_value_a_2` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1% and gives a $s2% chance to fully resist harmful spells.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900208;

INSERT INTO `spell` SET
    `id` = 900208,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -16,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 186,
    `effect_misc_value_a_2` = 126,
    `spell_icon_id` = 5440,
    `spell_name_enus` = 'Elemental Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces magic damage taken by $s1% and gives a $s2% chance to fully resist harmful spells.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
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
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
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
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
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
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
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
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
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
    `spell_icon_id` = 4644,
    `spell_name_enus` = 'Molten Plating',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your armor from items by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases armor from items by $s1% and block value by $s2%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

-- (Stoneskin 900164 - now a standalone sub-feature, owned by [F-164K]_spell.sql)

-- [MIGRATED -> F-164D] Volcanic Shield split into sub-feature F-164D (2026-06-26).
-- Moved to [F-164D]_spell.sql: the @vs_* scaling vars, the Volcanic Shield buff (900116),
-- the eruption (900122), Improved Volcanic Shield (900123-900125), and the Glyph of Volcanic
-- Shield (900278 modifier / 900279 apply / 900294 recipe). F-164 (parent) keeps the talent
-- placement (talents 2948/2946) and the Earthwarden SLAs (200065/200068/200069/200101).

-- (Rockslam 900119 + @rs_* scaling vars + desc-var 189 cleanup moved to [F-164R]_spell.sql)

-- ============================================================================
-- Rocksurge (900263) - single-target Rocksteady spender.
-- ============================================================================
-- (Rocksurge 900263 + @rsg_* scaling vars + desc-var 193 cleanup moved to [F-164R]_spell.sql)

-- ============================================================================
-- F-164 GLYPHS (PoC). Pipeline: glyph item (item_template, on-use) -> APPLY_GLYPH
-- spell (900271) -> glyphproperties row (90001) -> modifier spell (900270).
-- glyphproperties rows live in [F-164]_glyphproperties.sql; the glyph item in
-- zz_[F-164]_glyphs.sql. SPELLMOD glyphs require the target ability to have a
-- family mask (Rockslam = mask_3 bit 262144).
-- ============================================================================
-- (Glyph of Rockslam modifier 900270 moved to [F-164R]_spell.sql)

-- ============================================================================
-- F-164 APPLY-GLYPH SPELLS (900271/3/5/7/9/81/83). FULL CLONES of stock 55559
-- (Glyph of Stormstrike apply), swapping ONLY id / name / description / glyph
-- target (effect_misc_value_a_1). DO NOT hand-roll these: rolling our own omitted
-- fields the CLIENT reads - critically `targets` = 131072 = TARGET_FLAG_GLYPH_SLOT,
-- which tells the client the spell targets a glyph slot. Without it, right-click
-- auto-inscribe never engages slot-selection and dumps the glyph into slot 0
-- (socketing still "worked" because the SERVER just applies to whatever index the
-- client sends). Cloning also carries cast_time_index/interrupt_flags/proc_chance/
-- effect_spell_class_mask/spell_visual/damage_multiplier/localized-text/etc.
-- The apply spell's `spell_desc_enus` is what renders on the glyph ITEM tooltip
-- (stock convention: the glyph item_template carries NO description of its own), so
-- each apply spell holds its effect text here.
-- ============================================================================
-- (Glyph of Rockslam apply 900271 moved to [F-164R]_spell.sql)

-- ============================================================================
-- F-164 GLYPH WAVE 1 (Major glyphs, all SPELLMOD - no scripts needed).
-- Each pair = modifier spell (passive ADD_FLAT/PCT_MODIFIER aura that alters the
-- target ability, filtered by the ability's family class mask) + apply spell
-- (APPLY_GLYPH effect cast by the glyph item, misc = glyphproperties id).
-- glyphproperties rows: [F-164]_glyphproperties.sql; items: zz_[F-164]_glyphs.sql.
--
-- glyphproperties IDs (Prop) MUST be <= 65535 (uint16 glyph protocol) - see
-- [F-164]_glyphproperties.sql; renumbered from 9000x to 600x.
--   Glyph              Item   Mod     Apply   Prop   Target  Effect
--   Rockslam           57490  900270  900271  901    900119  -1.5s cooldown
--   Rocksurge          57491  900272  900273  902    900263  +5%/Rocksteady stack
--   Tectonic Blast     57492  900274  900275  903    900121  +20% damage
--   Volcanic Shield    57494  900278  900279  905    900122  +20% eruption dmg
--   Rockwall           57495  900280  900281  906    900223  +6s duration (12->18s)
--   Thunderborne Leap  57496  900282  900283  907    900174  +1s stun duration
--
-- Damage glyphs (108 ADD_PCT_MODIFIER, op 0 SPELLMOD_DAMAGE, +20). Rockwall +6s and
-- Thunderborne +1s stun are flat duration modifiers (107 ADD_FLAT_MODIFIER, op 1
-- SPELLMOD_DURATION). Rocksurge is a dummy marker read by spell_sha_rocksurge (see
-- below). Rocksurge/Tectonic/Volcanic damage glyphs unchanged.
-- ============================================================================
-- @glyph_dmg_pct removed: the Tectonic/Volcanic damage glyphs all moved to sub-features
-- (F-164A / F-164B / F-164D); its last user (Glyph of Volcanic Shield 900278) is now in F-164D.

-- (@glyph_rockwall_dur moved to [F-164R]_spell.sql)
SET @glyph_tbl_stun = 1000;          -- +ms Thunderborne Leap stun duration (2s -> 3s)

-- (@glyph_rocksurge_per_stack moved to [F-164R]_spell.sql)

-- (Glyph of Rocksurge modifier 900272 moved to [F-164R]_spell.sql)

-- (Glyph of Rocksurge apply 900273 moved to [F-164R]_spell.sql)

-- [F-164A] Glyph of Tectonic Blast effect spells (900274 modifier, 900275 apply) -> [F-164A]_spell.sql

-- [MIGRATED -> F-164D] 900278/900279 Glyph of Volcanic Shield (modifier + apply) moved to [F-164D]_spell.sql.

-- (Glyph of Rockwall modifier 900280 moved to [F-164R]_spell.sql)

-- (Glyph of Rockwall apply 900281 moved to [F-164R]_spell.sql)

-- (Glyph of Thunderborne Leap 900282 modifier + 900283 apply moved to [F-164T]_spell.sql)

-- ============================================================================
-- F-164 GLYPH RECIPES (Inscription craft spells). Clone of stock glyph recipe
-- 57248 (Glyph of Stormstrike): effect 24 (CREATE_ITEM) makes the glyph item,
-- icon 2557, named after the glyph (stock convention). Learned from Inscription
-- trainers (npc_trainer template 201021 - the universal leveling/city list - see
-- zz_[F-164]_glyph_recipes_trainer.sql); listed under Inscription via
-- skilllineability skill 773 (see [F-164]_skilllineability.sql).
--
-- REAGENT/SKILL TIERED to the glyphed ability's ACTUAL acquisition level (talent
-- tier or trainer/baseline, NOT spell base_level), with ink gated to a skill a
-- leveling scribe could actually reach (char level x5 >= ink make-skill). Ink
-- make-skills measured from stock glyph recipes: Midnight ~80, Lion's ~115,
-- Celestial ~215.
--   Recipe  Item   Glyph                      Real lvl  Source          Ink             Gate
--   900290  57490  Glyph of Rockslam          ~19       baseline        Midnight 39774   80
--   900291  57491  Glyph of Rocksurge         24        baseline        Lion's   43116  115
--   900295  57495  Glyph of Rockwall          29        talent tier 4   Lion's   43116  115
--   900294  57494  Glyph of Volcanic Shield   34        talent tier 5   Lion's   43116  130
--   900292  57492  Glyph of Tectonic Blast    39        talent tier 6   Lion's   43116  145
--   900296  57496  Glyph of Thunderborne Leap 59        talent tier 10  Celestial 43120 215
-- (Tectonic stays Lion's: a L39 char maxes ~195 Inscription, below Celestial's ~215.)
-- ============================================================================
-- (All Earthwarden glyph CREATE_ITEM recipe spells 900290-900296 migrated to their
--  sub-feature files: 900290/900291/900295 -> [F-164R]_spell.sql; 900293 -> [F-164B];
--  900294 -> [F-164D]; 900292 -> [F-164A]_spell.sql; 900296 -> [F-164T]_spell.sql.)

-- (Deprecated block buffs 900120/900180 DELETE moved to [F-164R]_spell.sql)

-- [F-164A] Tectonic Blast (900121) + scaling vars + retired desc var 188 -> [F-164A]_spell.sql


-- [MIGRATED -> F-164D] Volcanic Shield eruption (900122), desc-var 187 cleanup, Improved
-- Volcanic Shield (900123/900124/900125) and the 900126 cleanup all moved to [F-164D]_spell.sql.

-- [MIGRATED -> F-164C] Rockbiter Weapon passives (900138-900141) and Improved Rockbiter Weapon (900129-900131) moved to [F-164C]_spell.sql (2026-06-26).

-- Clean up deleted Rockslam MH (consolidated into 900119)
DELETE FROM `spell` WHERE `id` = 900132;

-- ============================================================================
-- Shield Mastery (900133-900137)
-- Passive talent, 5 ranks. Increases block chance and block value %.
-- Effect 1: MOD_BLOCK_PERCENT (aura 51) - block chance %
-- Effect 2: MOD_SHIELD_BLOCKVALUE (aura 150) - block value % (ref 2565)
-- ============================================================================
-- ----------------------------------------------------------------------------
-- Shield Mastery R1 (900133): +1% block chance, +10% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900133;

INSERT INTO `spell` SET
    `id` = 900133,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 51,
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
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your block chance by $s1% and your block value by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Shield Mastery R2 (900134): +2% block chance, +20% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900134;

INSERT INTO `spell` SET
    `id` = 900134,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
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
    `effect_base_points_2` = 19,
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
-- Shield Mastery R3 (900135): +3% block chance, +30% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900135;

INSERT INTO `spell` SET
    `id` = 900135,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
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
    `effect_base_points_2` = 29,
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
-- Shield Mastery R4 (900136): +4% block chance, +40% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900136;

INSERT INTO `spell` SET
    `id` = 900136,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
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
    `effect_base_points_2` = 39,
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
-- Shield Mastery R5 (900137): +5% block chance, +50% block value
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900137;

INSERT INTO `spell` SET
    `id` = 900137,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
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
    `effect_base_points_2` = 49,
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
-- Natural Endurance (900109-900113)
-- 5-rank passive. E1: MOD_TOTAL_STAT_PERCENTAGE (aura 137), misc 2 (Stamina),
-- E2: MOD_HEALING_RECEIVED (aura 283, ref Grace 47930).
-- +2% stam and +3% healing received per rank. Threat moved to Relentless.
-- Ref: Toughness (16252) uses same aura 137/misc 2 pattern for % stamina.
-- ============================================================================
-- Natural Endurance R1 (+2% stam, +3% healing received)
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
    `effect_base_points_1` = 1,
    `effect_base_points_2` = 2,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Natural Endurance R2 (+4% stam, +6% healing received)
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
    `effect_base_points_1` = 3,
    `effect_base_points_2` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Natural Endurance R3 (+6% stam, +9% healing received)
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
    `effect_base_points_1` = 5,
    `effect_base_points_2` = 8,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Natural Endurance R4 (+8% stam, +12% healing received)
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
    `effect_base_points_1` = 7,
    `effect_base_points_2` = 11,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- Natural Endurance R5 (+10% stam, +15% healing received)
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
    `effect_base_points_1` = 9,
    `effect_base_points_2` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 283,
    `effect_misc_value_a_1` = 2,
    `spell_icon_id` = 5330,
    `spell_name_enus` = 'Natural Endurance',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your total Stamina by $s1% and healing received by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases Stamina by $s1% and healing received by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;

-- ============================================================================
-- Relentless (900142-900146)
-- 5-rank passive. Threat generation + stun/silence duration reduction.
-- E1: MOD_THREAT (aura 10), misc 127 (all schools) — moved from Bastion of Earth
-- E2: MECHANIC_DURATION_MOD (aura 232), misc 12 (STUN)
-- E3: MECHANIC_DURATION_MOD (aura 232), misc 9 (SILENCE)
-- Fear/charm reduction removed (covered by Tremor Totem).
-- Ref: Unbreakable Will (14522). Icon 5460. 3% per rank.
-- ============================================================================
-- Relentless R1 (900142): +5% threat, -5% stun/silence duration
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
    `effect_base_points_1` = 4,
    `effect_base_points_2` = -6,
    `effect_base_points_3` = -6,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 127,
    `effect_misc_value_a_2` = 12,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and reduces the duration of stun and silence effects by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and reduces stun and silence duration by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R2 (900143): +10% threat, -10% stun/silence duration
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
    `effect_base_points_1` = 9,
    `effect_base_points_2` = -11,
    `effect_base_points_3` = -11,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 127,
    `effect_misc_value_a_2` = 12,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and reduces the duration of stun and silence effects by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and reduces stun and silence duration by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless R3 (900144): +15% threat, -15% stun/silence duration
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
    `effect_base_points_1` = 14,
    `effect_base_points_2` = -16,
    `effect_base_points_3` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 10,
    `effect_apply_aura_name_2` = 232,
    `effect_apply_aura_name_3` = 232,
    `effect_misc_value_a_1` = 127,
    `effect_misc_value_a_2` = 12,
    `effect_misc_value_a_3` = 9,
    `spell_icon_id` = 5460,
    `spell_name_enus` = 'Relentless',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your threat generation by $s1% and reduces the duration of stun and silence effects by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases threat by $s1% and reduces stun and silence duration by $s2%.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

-- Relentless reduced from 5 ranks to 3 (+5/10/15% threat, -5/10/15% stun/silence).
-- Same +15% endpoint, now 5% per point. Old ranks 4-5 removed from the DB.
-- Talent must drop to 3 ranks (remove SpellRank_4/5 -> 900145/900146) via the editor.
DELETE FROM `spell` WHERE `id` IN (900145, 900146);

-- (spell/DBC records moved to [F-164N]_spell.sql)

-- [MIGRATED -> F-164C] Rockbiter R1-R4 imbue desc UPDATEs (8017/8018/8019/10399) moved to [F-164C]_spell.sql.

DELETE FROM `spell` WHERE `id` = 900153;

INSERT INTO `spell` SET
    `id` = 900153,
    `category` = 82,
    `attributes` = 327696,
    `attributes_ex_2` = 67108864,
    `attributes_ex_4` = 2048,
    `attributes_ex_6` = 8388608,
    `cast_time_index` = 1,
    `category_recovery_time` = 8000,
    `proc_chance` = 101,
    `base_level` = 10,
    `spell_level` = 10,
    `duration_index` = 27,
    `range_index` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 114,
    `effect_2` = 6,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 6,
    `effect_apply_aura_name_2` = 11,
    `spell_visual_1` = 34,
    `spell_icon_id` = 4781,
    `spell_name_enus` = 'Ancestral Warcry',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = 'Taunts the target to attack you, but has no effect if the target is already attacking you.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Taunted.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 7,
    `damage_class` = 1,
    `prevention_type` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- ============================================================================
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

-- ----------------------------------------------------------------------------
-- Lightning Ward (900157, 900158, 900159) - 3 ranks
-- Reduces all magic damage taken by 3/6/10%.
-- Replaces Improved Shields in Earthwarden tree (talent 2906, tier 1 col 3).
-- Effect 1: Aura 87 (MOD_DAMAGE_PERCENT_TAKEN), misc 126 (all magic schools)
-- Icon: 5317
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900157;

INSERT INTO `spell` SET
    `id` = 900157,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -4,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5317,
    `spell_name_enus` = 'Lightning Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900158;

INSERT INTO `spell` SET
    `id` = 900158,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5317,
    `spell_name_enus` = 'Lightning Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900159;

INSERT INTO `spell` SET
    `id` = 900159,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 87,
    `effect_misc_value_a_1` = 126,
    `spell_icon_id` = 5317,
    `spell_name_enus` = 'Lightning Ward',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces all magic damage taken by $s1%.',
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- (spell/DBC records moved to [F-164L]_spell.sql)

-- ============================================================================
-- Earth Totem family mask tag — bit 17 in spell_class_mask_3 (131072)
-- Custom family flag on earth totem summon spells. Originally used by Totemic
-- Impact proc filtering (now uses Totemic Focus mask 0x200B0018 for all totems).
-- Retained for potential future use.
-- Earth totems: Earthbind, Stoneclaw, Stoneskin, Strength of Earth, Tremor,
-- Earth Elemental.
-- ============================================================================
UPDATE `spell` SET `spell_class_mask_3` = `spell_class_mask_3` | 131072
WHERE `id` IN (
    2062, 44130,                                          -- Earth Elemental Totem
    2484,                                                 -- Earthbind Totem
    5730, 6390, 6391, 6392, 10427, 10428, 25525,         -- Stoneclaw Totem
    58580, 58581, 58582,
    8071, 8154, 8155, 10406, 10407, 10408, 25508, 25509, -- Stoneskin Totem
    38115, 58751, 58753,
    8075, 8160, 8161, 10442, 25361, 25528, 31633,        -- Strength of Earth Totem
    57622, 58643,
    8143                                                  -- Tremor Totem
);

-- [F-164A] Totemic Impact (900165/266/267) + snare 900166 + Earthen Impact (900284/285/286) + Call of the Elements proc fix (66842-66844) + retired var 198 -> [F-164A]_spell.sql

-- [F-164T] Thunderborne Leap (900173 cast + 900174 impact) + scaling vars + retired desc var 194 moved to [F-164T]_spell.sql

-- ============================================================================
-- Juggernaut (900175-900179) — 5-rank passive
-- E1 (aura 137 misc 0): +3/6/9/12/15% Strength (gives AP + block value)
-- E2 (aura 232 misc 11): -6/12/18/24/30% movement slow duration
-- Strength only — the former Stamina bonus (was E1 aura 137 misc 2 + a duplicate
-- Strength E3) was removed; E1 now carries Strength, bumped 2%->3% per rank to
-- compensate for the lost Stamina, and the third effect is dropped.
-- Cloned from Toughness (16252). Icon 5452.
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900175;

INSERT INTO `spell` SET
    `id` = 900175,
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
    `effect_base_points_2` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 0,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Strength by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900176;

INSERT INTO `spell` SET
    `id` = 900176,
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
    `effect_base_points_1` = 5,
    `effect_base_points_2` = -13,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 0,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Strength by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900177;

INSERT INTO `spell` SET
    `id` = 900177,
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
    `effect_base_points_1` = 8,
    `effect_base_points_2` = -19,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 0,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Strength by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900178;

INSERT INTO `spell` SET
    `id` = 900178,
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
    `effect_base_points_1` = 11,
    `effect_base_points_2` = -25,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 0,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Strength by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900179;

INSERT INTO `spell` SET
    `id` = 900179,
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
    `effect_base_points_1` = 14,
    `effect_base_points_2` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 0,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 5452,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Strength by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

-- ============================================================================
-- (Improved Rockslam 900181/900182 + deprecated block-buff note moved to [F-164R]_spell.sql)

-- (spell/DBC records moved to [F-164H]_spell.sql)

-- ============================================================================
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

-- ============================================================================
-- Ancestral Insight (900189, 900190, 900191) - Passive, 3 ranks
-- Clone of Mental Quickness (30812/30813/30814) for Earthwarden tree.
-- Replaces stock Mental Quickness at T4 C2 (talent 2914).
-- E1: aura 108 ADD_PCT_MODIFIER, misc 14 (SPELLMOD_COST) - instant-cast cost -%
-- E2: aura 237 MOD_SPELL_DAMAGE_OF_ATTACK_POWER, misc 126 (all magic schools)
-- E3: aura 238 MOD_SPELL_HEALING_OF_ATTACK_POWER, misc 127 (all schools)
-- ============================================================================
DELETE FROM `spell` WHERE `id` IN (900189, 900190, 900191);

INSERT INTO `spell` SET
    `id` = 900189,
    `attributes` = 464,
    `effect_spell_class_mask_a_1` = 3092780056,
    `effect_spell_class_mask_a_2` = 68728,
    `effect_spell_class_mask_a_3` = 10223644,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -3,
    `effect_base_points_2` = 9,
    `effect_base_points_3` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 237,
    `effect_apply_aura_name_3` = 238,
    `effect_misc_value_a_1` = 14,
    `effect_misc_value_a_2` = 126,
    `effect_misc_value_a_3` = 127,
    `spell_icon_id` = 5455,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ancestral Insight',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the mana cost of your instant cast Shaman spells by $s1% and increases your spell power by an amount equal to $s2% of your attack power.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900190,
    `attributes` = 464,
    `effect_spell_class_mask_a_1` = 3092780056,
    `effect_spell_class_mask_a_2` = 68728,
    `effect_spell_class_mask_a_3` = 10223644,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -5,
    `effect_base_points_2` = 19,
    `effect_base_points_3` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 237,
    `effect_apply_aura_name_3` = 238,
    `effect_misc_value_a_1` = 14,
    `effect_misc_value_a_2` = 126,
    `effect_misc_value_a_3` = 127,
    `spell_icon_id` = 5455,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ancestral Insight',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the mana cost of your instant cast Shaman spells by $s1% and increases your spell power by an amount equal to $s2% of your attack power.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900191,
    `attributes` = 464,
    `effect_spell_class_mask_a_1` = 3092780056,
    `effect_spell_class_mask_a_2` = 68728,
    `effect_spell_class_mask_a_3` = 10223644,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -7,
    `effect_base_points_2` = 29,
    `effect_base_points_3` = 29,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 237,
    `effect_apply_aura_name_3` = 238,
    `effect_misc_value_a_1` = 14,
    `effect_misc_value_a_2` = 126,
    `effect_misc_value_a_3` = 127,
    `spell_icon_id` = 5455,
    `spell_priority` = 50,
    `spell_name_enus` = 'Ancestral Insight',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the mana cost of your instant cast Shaman spells by $s1% and increases your spell power by an amount equal to $s2% of your attack power.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- ============================================================================
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
    `spell_name_enus` = 'Ironhide',
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
    `spell_name_enus` = 'Ironhide',
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
    `spell_name_enus` = 'Ironhide',
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

-- ============================================================================
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

-- [F-164A] Improved Tectonic Blast (900198/199/205) + Tectonic Resonance (900200/201/206) -> [F-164A]_spell.sql

-- ============================================================================
-- Earth Shock tooltip — show damage including SP scaling
--
-- Stock Earth Shock displays only base damage via $s2. SpellDescriptionVariable
-- 191 adds spell power scaling to the displayed value; all 10 player ranks
-- reference it (variable resolves $m2 per-rank).
--
-- Coefficient 0.386 matches AC's spell_bonus_data.direct_bonus for ranks 4-10
-- (R1-R3 use lower coefficients due to level penalty, but those ranks are
-- only seen at low level — discrepancy is cosmetic).
-- ============================================================================
-- Variable 191: SP-scaled damage + Earthen Power talent-aware slow display
-- $total = base damage + SP scaling (for spell_desc_enus)
-- $ep_r1/$ep_r2 = per-rank conditional addends — must be defined as separate
-- sub-variables (F-005 riding crop pattern, var 182). $?a inside a ${}
-- arithmetic block doesn't resolve; only ${$<var>+$<var>} arithmetic works.
-- $ep_total = base 10% + (5% if EP R1) + (10% if EP R2)
-- [F-190] Earth Shock reverted to STOCK desc: var 191 + the custom desc/tooltip removed.
-- The addon now computes the SP scaling + the "Scales with Spell Power" line, so the custom
-- var is redundant. DELETE clears var 191; the 10 ES rows revert to stock on `dbc db rebuild
-- -t spell` (their desc/var were only ever set by the UPDATE removed here).
DELETE FROM `spelldescriptionvariables` WHERE `id` = 191;

-- (spell/DBC records moved to [F-164X]_spell.sql)

-- ----------------------------------------------------------------------------
-- Earthwarden-tree clones of shared talents (F-164)
-- Stock Spirit Weapons (16268) and Shamanistic Focus (43338) live in BOTH the
-- Enhancement and Earthwarden trees. Because both talent rows reference the
-- same spell ID, the client incorrectly displays the talent as allocated in
-- both trees when the player only spends a point in one.
--
-- Fix: clone the spells with new IDs (900220, 900221) and point the
-- Earthwarden talent rows at the clones. Identical mechanics, decoupled
-- identity — UI shows each tree's allocation independently.
-- ----------------------------------------------------------------------------
-- Spirit Weapons clone (900220) — Earthwarden tree. Learns 18848 (parry passive),
-- same as stock 16268. Icon and description match.
DELETE FROM `spell` WHERE `id` = 900220;

INSERT INTO `spell` SET
    `id` = 900220,
    `attributes` = 159646096,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 36,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_trigger_spell_1` = 18848,
    `spell_icon_id` = 558,
    `spell_name_enus` = 'Spirit Weapons',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Gives a chance to parry enemy melee attacks.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- Shamanistic Focus clone (900221) — REMOVED (vestigial). Was cloned for the Earthwarden
-- tree but never wired to a talent (no talent row, no character ever had it). Deleted; the
-- DELETE stays so it's stripped from any DBC that still carries the stale clone.
DELETE FROM `spell` WHERE `id` = 900221;

-- ----------------------------------------------------------------------------
-- Shields - remove charge counters (F-164)
-- Lightning Shield, Water Shield, and Earth Shield are made charge-less so
-- the buff is just a persistent 10-min aura. No charge consumption on damage
-- taken / heal-on-hit. Includes WotLK ranks 10 (49280) and 11 (49281) of LS
-- which were missed in the earlier pass, and all Earth Shield player ranks.
-- ----------------------------------------------------------------------------
UPDATE `spell` SET `proc_charges` = 0 WHERE `id` IN (49280, 49281);

-- Earth Shield player ranks: chargeless AND drop the now-meaningless "$n charges."
-- sentence from the stock desc -- with proc_charges=0 the $n token renders as 0
-- (literal "$n" in the talent browser, "0 charges" in-game). Heal stays $<heal>
-- (spelldescriptionvariables 170). One consolidated UPDATE per Earth Shield ID.
UPDATE `spell` SET
    `proc_charges` = 0,
    `spell_desc_enus` = 'Protects the target with an earthen shield, reducing casting or channeling time lost when damaged by $s2%  and causing attacks to heal the shielded target for $<heal>.  This effect can only occur once every few seconds.  Lasts $d.  Earth Shield can only be placed on one target at a time and only one Elemental Shield can be active on a target at a time.'
WHERE `id` IN (974, 32593, 32594, 49283, 49284);

-- ----------------------------------------------------------------------------
-- Static Shock (51525/51526/51527) - remove +charges to Lightning Shield
-- Stock effect 2 = aura 107 (ADD_FLAT_MODIFIER) misc 4 (SPELLMOD_CHARGES) adds
-- +2/+4/+6 max charges to LS, re-introducing the charge mechanic on top of our
-- DBC chargeless LS (proc_charges=0). Zero out effect 2 so Static Shock keeps
-- the on-melee-strike LS proc (handled by spell_sha_static_shock SpellScript
-- via effect 1 dummy) but does NOT add max charges back.
-- ----------------------------------------------------------------------------
UPDATE `spell` SET
    `effect_2` = 0,
    `effect_apply_aura_name_2` = 0,
    `effect_misc_value_a_2` = 0,
    `effect_base_points_2` = 0,
    `spell_desc_enus` = 'You have a $s1% chance to hit your target with a Lightning Shield orb when you deal damage with melee attacks and abilities.'
WHERE `id` IN (51525, 51526, 51527);

-- ----------------------------------------------------------------------------
-- Lightning Bolt tooltip — show SP-scaled damage range (F-164)
-- Mirrors the Earth Shock tooltip rewrite. Variable 192 adds spell power
-- scaling to both min and max damage via the canonical 0.714 (5/7) coefficient
-- used by ranks 4-14. R1-R3 use lower coefficients due to level penalty —
-- displayed value is mildly optimistic at those low ranks (cosmetic only).
-- Shows range "X to Y" using $m1 (min) and $M1 (max).
-- ----------------------------------------------------------------------------
-- [F-190] Lightning Bolt reverted to STOCK desc: var 192 + the custom desc removed (the addon
-- now computes SP scaling + the "Scales with Spell Power" line). DELETE clears var 192; the 14
-- LB rows revert to stock on `dbc db rebuild -t spell`.
DELETE FROM `spelldescriptionvariables` WHERE `id` = 192;

-- ----------------------------------------------------------------------------
-- Restore Enhancement Spirit Weapons (16268) threat reduction (F-164)
-- Earlier F-164 work removed effect 2 to disable the -30% threat passive
-- (36591) to support Enhancement tanking. User decision: Enhancement keeps
-- the threat reduction (DPS spec context); Earthwarden version (900220 clone)
-- has NO threat reduction (parry only). Restore effect 2 on stock 16268.
-- ----------------------------------------------------------------------------
UPDATE `spell` SET
    `effect_2` = 36,
    `effect_trigger_spell_2` = 36591,
    `effect_implicit_target_a_2` = 1,
    `effect_die_sides_2` = 1,
    `spell_desc_enus` = 'Gives a chance to parry enemy melee attacks and reduces threat generated by 30%.'
WHERE `id` = 16268;

-- (spell/DBC records moved to [F-164X]_spell.sql)

-- ----------------------------------------------------------------------------
-- Fix Improved Ghost Wolf talent (2961) ranks after F-164 re-add
-- R1 (16262) was never migrated to spell family 14 in I-050 (Ghost Wolf moved
-- from family 11 mask 2048 to family 14 bit 30), so its cast time modifier
-- targeted nothing. Migrate it to match R2 (16287): family 14, bit 29
-- (Ghost Wolf Modifiers), effects target bit 30 (Ghost Wolf).
-- Rebalance: GW base cast is 2.0s (not 3.0s as the re-add assumed), so the
-- stock -1s/-2s values made R2 instant. New design per user:
--   R1: -0.5s cast, +5% movement speed (SPELLMOD_EFFECT2 flat on GW speed)
--   R2: -1.0s cast, +10% movement speed
-- ----------------------------------------------------------------------------
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 536870912,
    `effect_base_points_1` = -501,
    `effect_spell_class_mask_a_1` = 1073741824,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 12,
    `effect_base_points_2` = 4,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    -- Effect 2 is the SPELLMOD_EFFECT2 speed mod; its class mask must target
    -- Ghost Wolf (bit 30) on effect 2's slot a, NOT effect 1's slot b — the
    -- latter (word 2 of effect 1) matches nothing, so the +5% never applied.
    `effect_spell_class_mask_a_2` = 1073741824,
    `effect_spell_class_mask_b_1` = 0,
    -- 0.5 hardcoded: client $/1000;s1 integer-divides, so 500/1000 displays as 0
    `spell_desc_enus` = 'Reduces the cast time of your Ghost Wolf spell by 0.5 sec and increases its movement speed bonus by an additional $s2%.'
WHERE `id` = 16262;

-- Self-contained: family 14 / bit 29 (Ghost Wolf Modifiers) + effect masks
-- targeting Ghost Wolf (bit 30) were previously set by [F-005]_spell.sql in
-- zep-legacy. Moved here so 16287 has a single owner (it's a shaman talent and
-- F-164 rebalances its cast time / speed). See zep-legacy [F-005]_spell.sql §13.
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 536870912,
    `effect_base_points_1` = -1001,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 12,
    `effect_base_points_2` = 9,
    `effect_spell_class_mask_a_1` = 1073741824,
    -- Effect 2 (SPELLMOD_EFFECT2 speed mod) must mask Ghost Wolf on slot a_2;
    -- the previous b_1 mask was word 2 of effect 1 and matched nothing.
    `effect_spell_class_mask_a_2` = 1073741824,
    `effect_spell_class_mask_b_1` = 0,
    `spell_desc_enus` = 'Reduces the cast time of your Ghost Wolf spell by $/1000;s1 sec and increases its movement speed bonus by an additional $s2%.'
WHERE `id` = 16287;

-- [MIGRATED -> F-164C] Rockbiter R5-R10 imbue spells (900230-900235), enchant-spells (900240-900245), and Strength passives (900250-900255) moved to [F-164C]_spell.sql.

-- (spell/DBC records moved to [F-164S]_spell.sql)

-- (Rockwall 900223 + Rocksteady buff 900261 + Rocksteady talent 900256-900260 moved to [F-164R]_spell.sql)

-- (spell/DBC records moved to [F-164S]_spell.sql)
