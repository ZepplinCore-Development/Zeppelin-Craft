-- ============================================================================
-- [F-164R] Earthwarden - Rocksteady Family  (child of F-164 Shaman Tuning)
-- ----------------------------------------------------------------------------
-- Split out of F-164 (2026-06-26). F-164 (parent) retains the Earthwarden
-- skillline definition (9001) and the talent tree structure (talent rows
-- 2970/2972/2974 placing these spells). Everything that IS the Rocksteady
-- resource loop lives here: the builder (Rockslam) -> resource (Rocksteady buff,
-- via the Rocksteady talent + Improved Rockslam proc + Rockwall burst) ->
-- spender (Rocksurge), plus the three associated glyphs.
--
-- Spells owned here:
--   900119  Rockslam            builder (trainer L15/20; block-value scaled, F-188)
--   900181/900182  Improved Rockslam  talent proc: Rockslam adds +1/+2 Rocksteady
--   900223  Rockwall            defensive CD, +5 Rocksteady burst (Stoneskin merged in)
--   900256-900260  Rocksteady (talent ranks 1-5)  chance on melee to add a stack
--   900261  Rocksteady (buff)   the stacking block-chance resource
--   900263  Rocksurge           spender, scales off current Rocksteady stacks
--   900270/900271  Glyph of Rockslam  (-1.5s cooldown)
--   900272/900273  Glyph of Rocksurge (+5% dmg/stack)
--   900280/900281  Glyph of Rockwall  (+6s duration)
--   900290/900291/900295  glyph recipe (CREATE_ITEM) spells
--   900164  Stoneskin (DELETE; merged into Rockwall) ; 900120/900180 (DELETE; deprecated buffs)
--
-- NOTE: all rows currently ALSO live in [F-164]_spell.sql; this is the copy
-- phase (idempotent DELETE+INSERT). The F-164 strip happens after the sibling
-- F-191/F-192/F-193/F-194 split commits, to avoid racing shared-file edits.
-- ============================================================================

-- Stoneskin (900164) - MERGED INTO Rockwall (900223). Its -30% damage reduction
-- is now Rockwall's effect 2; Rockwall keeps the +5 Rocksteady burst and uses
-- Stoneskin's icon 5469 + Stoneform visual. Talent repointed off 900164.
DELETE FROM `spell` WHERE `id` = 900164;

-- Rockslam scaling (shared between spell and the retired desc variable 189)
SET @rs_dmg_base = 75;
SET @rs_dmg_die = 1;
SET @rs_dmg_perlevel = 6.0;
SET @rs_base_level = 20;
SET @rs_max_level = 80;
SET @rs_ap_coeff = 0;  -- No AP/SP scaling. Block value is Rockslam's sole scaling stat, applied natively via effect_misc_value_a_1/b_1 (F-188 stat-scaled SCHOOL_DAMAGE: A=ZEP_STAT_BLOCK_VALUE, B=coeff*100), which replaced the old C++ spell_sha_rockslam script.

-- ----------------------------------------------------------------------------
-- Rockslam (900119) - Shield bash dealing flat damage; builds Rocksteady via the
-- Improved Rockslam talent proc. E1 SCHOOL_DAMAGE = base + perlevel + shield
-- block value (no AP scaling).
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900119;

INSERT INTO `spell` SET
    `id` = 900119,
    `attributes` = 327680,
    `attributes_ex_1` = 512,
    `attributes_ex_3` = 67108866,
    `facing_caster_flags` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 6000,
    `proc_chance` = 101,
    `max_level` = @rs_max_level,
    `base_level` = @rs_base_level,
    `spell_level` = @rs_base_level,
    `range_index` = 2,
    `equipped_item_class` = 4,
    `equipped_item_subclass_mask` = 64,
    `effect_1` = 2,
    `effect_die_sides_1` = @rs_dmg_die,
    `effect_real_points_per_level_1` = @rs_dmg_perlevel,
    `effect_base_points_1` = @rs_dmg_base,
    `effect_misc_value_a_1` = 1,
    `effect_misc_value_b_1` = 100,
    `effect_implicit_target_a_1` = 6,
    `spell_visual_1` = 42,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Bashes the target with your shield, dealing $s1 Physical damage.$?s900182[ Adds 2 stacks of Rocksteady per cast.][]$?s900181[ Adds 1 stack of Rocksteady per cast.][]',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $<dmg> Physical damage.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 8,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 262144,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = @rs_ap_coeff,
    `spell_desc_variable_id` = 0;

-- Variable 189: Rockslam tooltip damage — RETIRED by F-190 (desc reverted to stock
-- tokens). DELETE clears any stale row.
DELETE FROM `spelldescriptionvariables` WHERE `id` = 189;

-- ----------------------------------------------------------------------------
-- Rocksurge (900263) - single-target burst spender (baseline, trainer-learned L24).
-- Instant, 12s CD. Scales with CURRENT Rocksteady (900261) stacks WITHOUT consuming
-- them. No C++ script: the Rocksteady buff carries a SPELLMOD_DAMAGE percent effect
-- (aura 108) targeting Rocksurge's family bit (mask_3 = 1048576), and the stacking
-- aura multiplies that modifier by stack count -> +@rsg_pct_per_stack% per stack.
-- ----------------------------------------------------------------------------
SET @rsg_dmg_base = 150;
SET @rsg_dmg_die = 1;
SET @rsg_dmg_perlevel = 6.0;
SET @rsg_ap_coeff = 0.25;
SET @rsg_base_level = 20;
SET @rsg_max_level = 80;
SET @rsg_pct_per_stack = 10;  -- +10% Rocksurge damage per Rocksteady stack (x10 stacks = +100% = double)

DELETE FROM `spell` WHERE `id` = 900263;

INSERT INTO `spell` SET
    `id` = 900263,
    `attributes` = 327680,
    `attributes_ex_1` = 512,
    `attributes_ex_3` = 67108866,
    `facing_caster_flags` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 12000,
    `proc_chance` = 101,
    `max_level` = @rsg_max_level,
    `base_level` = @rsg_base_level,
    `spell_level` = @rsg_base_level,
    `range_index` = 34,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = @rsg_dmg_die,
    `effect_real_points_per_level_1` = @rsg_dmg_perlevel,
    `effect_base_points_1` = @rsg_dmg_base,
    `effect_implicit_target_a_1` = 6,
    `effect_bonus_multiplier_1` = @rsg_ap_coeff,
    `spell_visual_1` = 90020,
    `spell_icon_id` = 4975,
    `spell_name_enus` = 'Rocksurge',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = CONCAT('A stone spike erupts below the current enemy target, dealing $s1 Physical damage, increased by $?s900272[', (@rsg_pct_per_stack + 5), '][', @rsg_pct_per_stack, ']% for each stack of Rocksteady you have.'),
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals Physical damage, increased for each Rocksteady stack.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 8,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 1048576,
    `damage_class` = 1,
    `prevention_type` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1,
    `spell_desc_variable_id` = 0;

-- Variable 193: Rocksurge tooltip damage — RETIRED by F-190 (desc reverted to stock
-- tokens). DELETE clears any stale row.
DELETE FROM `spelldescriptionvariables` WHERE `id` = 193;

-- ============================================================================
-- GLYPHS. Pipeline: glyph item (item_template, on-use) -> APPLY_GLYPH spell
-- -> glyphproperties row -> modifier spell. glyphproperties rows live in
-- [F-164R]_glyphproperties.sql; the glyph items in zz_[F-164R]_glyphs.sql.
-- SPELLMOD glyphs require the target ability to have a family mask.
--   Glyph              Item   Mod     Apply   Prop   Target  Effect
--   Rockslam           57490  900270  900271  901    900119  -1.5s cooldown
--   Rocksurge          57491  900272  900273  902    900263  +5%/Rocksteady stack
--   Rockwall           57495  900280  900281  906    900223  +6s duration (12->18s)
-- ============================================================================
SET @glyph_rockwall_dur = 6000;      -- +ms Rockwall duration (12s base -> 18s)
SET @glyph_rocksurge_per_stack = 5;  -- +% Rocksurge damage per Rocksteady stack (SPELLMOD_EFFECT2 on 900261)

-- 900270 Glyph of Rockslam (modifier): passive SPELLMOD_COOLDOWN (-1.5s) on Rockslam.
DELETE FROM `spell` WHERE `id` = 900270;

INSERT INTO `spell` SET
    `id` = 900270,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 11,
    `effect_base_points_1` = -1500,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 262144,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Glyph of Rockslam',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Reduces the cooldown of your Rockslam by 1.5 sec.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- APPLY-GLYPH spells (900271/273/281): FULL CLONES of stock 55559 (Glyph of
-- Stormstrike apply), swapping ONLY id / name / description / glyph target
-- (effect_misc_value_a_1). DO NOT hand-roll: cloning carries `targets` = 131072
-- (TARGET_FLAG_GLYPH_SLOT) which the client needs for right-click auto-inscribe.
-- The apply spell's spell_desc_enus is what renders on the glyph ITEM tooltip.

-- 900271 Glyph of Rockslam (apply) -> glyphproperties 901.
DELETE FROM `spell` WHERE `id` = 900271;
DROP TEMPORARY TABLE IF EXISTS `_glyph_apply`;
CREATE TEMPORARY TABLE `_glyph_apply` AS SELECT * FROM `spell` WHERE `id` = 55559;
UPDATE `_glyph_apply` SET
    `id` = 900271,
    `spell_name_enus` = 'Glyph of Rockslam',
    `spell_desc_enus` = 'Reduces the cooldown of your Rockslam by 1.5 sec.',
    `effect_misc_value_a_1` = 901;
INSERT INTO `spell` SELECT * FROM `_glyph_apply`;
DROP TEMPORARY TABLE `_glyph_apply`;

-- 900272 Glyph of Rocksurge (modifier): SPELLMOD_EFFECT2 (op 12) flat +5 on the
-- Rocksteady buff (900261, mask_3 bit 25). Raises 900261's per-stack Rocksurge
-- damage bonus (10% -> 15% per stack); scales with stacks since 900261 stacks.
DELETE FROM `spell` WHERE `id` = 900272;

INSERT INTO `spell` SET
    `id` = 900272,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 12,
    `effect_base_points_1` = @glyph_rocksurge_per_stack,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 33554432,
    `spell_icon_id` = 4975,
    `spell_name_enus` = 'Glyph of Rocksurge',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage of your Rocksurge by an additional 5% for each stack of Rocksteady you have.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900273 Glyph of Rocksurge (apply) -> glyphproperties 902. Clone of stock 55559.
DELETE FROM `spell` WHERE `id` = 900273;
DROP TEMPORARY TABLE IF EXISTS `_glyph_apply`;
CREATE TEMPORARY TABLE `_glyph_apply` AS SELECT * FROM `spell` WHERE `id` = 55559;
UPDATE `_glyph_apply` SET
    `id` = 900273,
    `spell_name_enus` = 'Glyph of Rocksurge',
    `spell_desc_enus` = 'Increases the damage of your Rocksurge by an additional 5% for each stack of Rocksteady you have.',
    `effect_misc_value_a_1` = 902;
INSERT INTO `spell` SELECT * FROM `_glyph_apply`;
DROP TEMPORARY TABLE `_glyph_apply`;

-- 900280 Glyph of Rockwall (modifier): +6 sec Rockwall (900223, mask_3 bit 21)
-- duration (12s base -> 18s). Flat duration modifier in ms.
DELETE FROM `spell` WHERE `id` = 900280;

INSERT INTO `spell` SET
    `id` = 900280,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 1,
    `effect_base_points_1` = @glyph_rockwall_dur,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 2097152,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Glyph of Rockwall',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the duration of your Rockwall by 6 sec.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900281 Glyph of Rockwall (apply) -> glyphproperties 906. Clone of stock 55559.
DELETE FROM `spell` WHERE `id` = 900281;
DROP TEMPORARY TABLE IF EXISTS `_glyph_apply`;
CREATE TEMPORARY TABLE `_glyph_apply` AS SELECT * FROM `spell` WHERE `id` = 55559;
UPDATE `_glyph_apply` SET
    `id` = 900281,
    `spell_name_enus` = 'Glyph of Rockwall',
    `spell_desc_enus` = 'Increases the duration of your Rockwall by 6 sec.',
    `effect_misc_value_a_1` = 906;
INSERT INTO `spell` SELECT * FROM `_glyph_apply`;
DROP TEMPORARY TABLE `_glyph_apply`;

-- ============================================================================
-- GLYPH RECIPES (Inscription CREATE_ITEM spells). Clone of stock glyph recipe
-- 57248 pattern: effect 24 (CREATE_ITEM) makes the glyph item, icon 2557, named
-- after the glyph. Trainer wiring in zz_[F-164R]_glyph_recipes_trainer.sql; the
-- Inscription SLA rows in [F-164R]_skilllineability.sql.
--   900290  57490  Glyph of Rockslam   ~L19  Midnight Ink 39774
--   900291  57491  Glyph of Rocksurge   L24  Lion's Ink   43116
--   900295  57495  Glyph of Rockwall    L29  Lion's Ink   43116
-- ============================================================================
DELETE FROM `spell` WHERE `id` IN (900290, 900291, 900295);

INSERT INTO `spell` SET
    `id` = 900290,
    `attributes` = 65568,
    `cast_time_index` = 14,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_item_type_1` = 57490,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `reagent_1` = 39774,
    `reagent_count_1` = 1,
    `spell_icon_id` = 2557,
    `spell_name_enus` = 'Glyph of Rockslam',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900291,
    `attributes` = 65568,
    `cast_time_index` = 14,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_item_type_1` = 57491,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `reagent_1` = 43116,
    `reagent_count_1` = 1,
    `spell_icon_id` = 2557,
    `spell_name_enus` = 'Glyph of Rocksurge',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

INSERT INTO `spell` SET
    `id` = 900295,
    `attributes` = 65568,
    `cast_time_index` = 14,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_item_type_1` = 57495,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `reagent_1` = 43116,
    `reagent_count_1` = 1,
    `spell_icon_id` = 2557,
    `spell_name_enus` = 'Glyph of Rockwall',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;

-- Deprecated block buffs 900120 / 900180 removed (superseded by the unified
-- Rocksteady buff 900261; Improved Rockslam now procs 900261 directly).
DELETE FROM `spell` WHERE `id` IN (900120, 900180);

-- ============================================================================
-- Improved Rockslam (talent, R1 900181 / R2 900182): +25% / +50% Rockslam damage,
-- and causes Rockslam to add 1 / 2 stacks of Rocksteady (900261) on landing.
-- die_sides_1 = 1 so displayed/applied value = base+1 (base 24 = +25%, base 49 = +50%).
-- Effect 2 PROC_TRIGGER_SPELL -> 900261; the +1/+2 stack is applied by
-- spell_sha_rocksteady_stack_proc (proc filter in zz_[F-164R]_rocksteady_world.sql).
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900181;

INSERT INTO `spell` SET
    `id` = 900181,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_flags` = 16,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 24,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 3,
    `effect_trigger_spell_2` = 900261,
    `effect_spell_class_mask_a_3` = 262144,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Improved Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage dealt by Rockslam by $s1%, and causes Rockslam to add 1 stack of Rocksteady.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases the damage dealt by Rockslam by $s1%, and causes Rockslam to add 1 stack of Rocksteady.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

DELETE FROM `spell` WHERE `id` = 900182;

INSERT INTO `spell` SET
    `id` = 900182,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_flags` = 16,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 49,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 42,
    `effect_misc_value_a_1` = 3,
    `effect_trigger_spell_2` = 900261,
    `effect_spell_class_mask_a_3` = 262144,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Improved Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage dealt by Rockslam by $s1%, and causes Rockslam to add 2 stacks of Rocksteady.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Increases the damage dealt by Rockslam by $s1%, and causes Rockslam to add 2 stacks of Rocksteady.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Rockwall (900223) - Earthwarden defensive CD (Stoneskin + Rockwall merged).
-- Instant, shield required, 1.5 min CD.
--   E1 DUMMY -> spell_sha_rockwall C++ adds 5 stacks of Rocksteady (900261).
--   E2 aura 87 (MOD_DAMAGE_PERCENT_TAKEN, all schools) -30% damage taken.
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900223;

INSERT INTO `spell` SET
    `id` = 900223,
    `attributes` = 16,
    `cast_time_index` = 1,
    `recovery_time` = 90000,
    `category_recovery_time` = 90000,
    `duration_index` = 29,
    `range_index` = 1,
    `equipped_item_class` = 4,
    `equipped_item_subclass_mask` = 64,
    `effect_1` = 3,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 87,
    `effect_misc_value_a_2` = 127,
    `effect_base_points_2` = -31,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `spell_visual_1` = 5787,
    `spell_icon_id` = 5469,
    `spell_name_enus` = 'Rockwall',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Encases you in stone, reducing all damage taken by 30% for $?s900280[18][12] sec and instantly granting 5 stacks of Rocksteady.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces damage taken by 30% and grants 5 stacks of Rocksteady.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 2097152,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1;

-- ============================================================================
-- Rocksteady (buff 900261): the single stacking block buff. +5% block chance per
-- stack (spell_sha_rocksteady_block C++; CalcAmount = 5 x stacks), capped at 12
-- stacks. 30s decay window, refreshed on each stack gain; each block consumes a
-- stack (spell_proc HitMask 64). Fed by the Rocksteady talent (chance on melee),
-- Improved Rockslam (+1/+2 per Rockslam) and Rockwall (+5 burst). Effect 2 is the
-- SPELLMOD_DAMAGE percent that gives Rocksurge +@rsg_pct_per_stack% per stack.
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900261;

INSERT INTO `spell` SET
    `id` = 900261,
    `cast_time_index` = 1,
    `duration_index` = 9,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `stack_amount` = 12,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 4,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 51,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 108,
    `effect_base_points_2` = @rsg_pct_per_stack,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_b_3` = 1048576,
    `spell_icon_id` = 4242,
    `spell_name_enus` = 'Rocksteady',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases block chance by $s1% per stack, up to 12 stacks. Each block you make consumes a stack.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block chance increased by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 33554432,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1;

-- ----------------------------------------------------------------------------
-- Rocksteady talent (900256-900260, ranks 1-5): passive Earthwarden talent.
-- Effect 2 (aura 42 PROC_TRIGGER_SPELL -> 900261): chance on melee hit to gain a
-- Rocksteady stack. Proc chance (2/4/6/8/10%) + ProcFlags set in spell_proc; the
-- +1 stack is applied by spell_sha_rocksteady_stack_proc. Passive (NOT_IN_SPELLBOOK);
-- placed in the talent tree (F-164) via the talent editor.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` IN (900256, 900257, 900258, 900259, 900260);

INSERT INTO `spell` SET
    `id` = 900256,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 42,
    `effect_trigger_spell_2` = 900261,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4242,
    `spell_name_enus` = 'Rocksteady',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 2% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

INSERT INTO `spell` SET
    `id` = 900257,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 42,
    `effect_trigger_spell_2` = 900261,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4242,
    `spell_name_enus` = 'Rocksteady',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 4% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

INSERT INTO `spell` SET
    `id` = 900258,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 42,
    `effect_trigger_spell_2` = 900261,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4242,
    `spell_name_enus` = 'Rocksteady',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 6% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

INSERT INTO `spell` SET
    `id` = 900259,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 42,
    `effect_trigger_spell_2` = 900261,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4242,
    `spell_name_enus` = 'Rocksteady',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 8% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;

INSERT INTO `spell` SET
    `id` = 900260,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 42,
    `effect_trigger_spell_2` = 900261,
    `effect_implicit_target_a_2` = 1,
    `spell_icon_id` = 4242,
    `spell_name_enus` = 'Rocksteady',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'When you deal damage with a melee weapon, you have a 10% chance to gain a stack of Rocksteady, increasing your block chance by $900261s1%. Stacks up to 10 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 8;
