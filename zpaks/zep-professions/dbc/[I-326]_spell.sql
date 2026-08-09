-- I-326: Paladin Pursuit of Justice mounted speed never applies
-- Home: zep-professions (mount-speed mechanics, alongside [F-005]_spell.sql).
--
-- Problem: PoJ (talent 1634, ranks 26022/26023) advertises "increases movement
-- AND MOUNTED movement speed", but carries only aura 31 MOD_INCREASE_SPEED.
-- Unit::UpdateSpeed() reads aura 31 exclusively in the DISMOUNTED branch of
-- MOVE_RUN; the mounted branch reads only 32 / 130 / 172. The mounted half of
-- the talent therefore contributed exactly nothing. Rows are stock (verified
-- identical to original_dbc), so this is an upstream data gap, not a regression.
--
-- Fix: build it as a SPELLMOD on the mount spell, the same way the riding crops
-- (100010-100015) are built, so it ADDS with crops and MULTIPLIES with Crusader
-- Aura. An aura-172 build would have been Blizzlike but worthless: 172 lands in
-- non_stack_bonus, which takes GetMaxPositiveAuraModifier, so Crusader Aura's
-- +20% would always dominate PoJ's +15%.
--
-- SpellFamily 14 flag allocation (spell_class_mask_1) -- see [F-005]_spell.sql:
--   Bit 31 (0x80000000 = 2147483648) = Mounts     <- what PoJ effect 2 targets
--   Bit 30 (0x40000000 = 1073741824) = Ghost Wolf
--   Bit 29 (0x20000000 =  536870912) = Ghost Wolf Modifiers
--   Bit 28 (0x10000000 =  268435456) = Druid Forms
--   Bit 27 (0x08000000 =  134217728) = Druid Form Glyphs
--   Bit 26 (0x04000000 =   67108864) = Aquatic Form
--
-- Stock rows (not defined in this file) -> ONE consolidated UPDATE per ID.
-- ============================================================================
--
-- Field notes (both ranks):
--
--   spell_class_set = 14
--       SpellInfo::IsAffectedBySpellMod -> IsAffected() requires the MODIFIER's
--       SpellFamilyName to equal the TARGET's. Mounts are family 14. PoJ is
--       stock family 0 (generic), NOT the Paladin family, so nothing is lost.
--
--   spell_class_mask_1 = 0 (unchanged, set explicitly -- load-bearing)
--       PoJ needs no family flag of its own; nothing targets it. Keeping it 0
--       also keeps it out of reach of all three riding crop modifier effects,
--       which are masked (see below), so PoJ's Disarm reduction on effect 3 is
--       never distorted by a crop.
--
--   effect_2: aura 107 ADD_FLAT_MODIFIER, misc 12 = SPELLMOD_EFFECT2
--       Mount speed lives on the mount spell's effect 2 -- aura 32 for ground
--       mounts (19+1+2/level, 20% at L20 -> 100% at L60) and aura 207 for
--       flying mounts (299 -> 300%). Effect 2 is empty on both PoJ ranks, so
--       nothing is displaced. die_sides is already 1, so base 7/14 -> +8/+15.
--
--   effect_spell_class_mask_b_1 = 2147483648  -- effect 2's mask. NOT a_2.
--       Two-axis grid (Joplin: "SpellFamilies and Masks"; confirmed in core by
--       DBCStructure.h:1714 `std::array<flag96, MAX_SPELL_EFFECTS>
--       EffectSpellClassMask` over fields 122-130, flag96 = uint32 part[3]
--       (Util.h:441), read as EffectSpellClassMask[effIndex] SpellInfo.cpp:349):
--
--                          TARGET'S FLAGS
--                       mask_1     mask_2     mask_3
--         Effect 1 (A)   a_1        a_2        a_3
--         Effect 2 (B)   b_1        b_2        b_3
--         Effect 3 (C)   c_1        c_2        c_3
--
--       LETTER = which effect on THIS spell is modifying.
--       NUMBER = which spell_class_mask_N column on the TARGET to match.
--       Mounts carry bit 31 in spell_class_mask_1, and our modifier is on
--       effect 2 -> letter B + number 1 -> b_1.
--       a_2 is explicitly zeroed: the first apply of this fix wrongly put the
--       mask there (= effect 1's mask against the target's mask_2), which left
--       effect 2's mask EMPTY. An empty mask does not match nothing -- per
--       IsAffected() it matches EVERY spell in the family.
-- ============================================================================

-- Rank 1: +8% movement (aura 31, unchanged), +8 flat to mount speed (new)
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 0,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 12,
    `effect_base_points_2` = 7,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_b_1` = 2147483648,
    `effect_spell_class_mask_a_2` = 0,
    `attributes_ex_3` = 0,
    `spell_desc_enus` = 'Reduces the duration of all Disarm effects by $s3% and increases your movement speed by $s1%.  Your mounted speed is increased by an additional $s2%.'
WHERE `id` = 26022;

-- Rank 2: +15% movement (aura 31, unchanged), +15 flat to mount speed (new)
UPDATE `spell` SET
    `spell_class_set` = 14,
    `spell_class_mask_1` = 0,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 107,
    `effect_misc_value_a_2` = 12,
    `effect_base_points_2` = 14,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_b_1` = 2147483648,
    `effect_spell_class_mask_a_2` = 0,
    `attributes_ex_3` = 0,
    `spell_desc_enus` = 'Reduces the duration of all Disarm effects by $s3% and increases your movement speed by $s1%.  Your mounted speed is increased by an additional $s2%.'
WHERE `id` = 26023;

-- ============================================================================
-- attributes_ex_3 reset to 0 (stock).
-- An earlier revision set SPELL_ATTR3_IGNORE_CASTER_MODIFIERS (536870912) to
-- shield PoJ's effect-3 Disarm reduction from the riding crops' effect-3
-- modifier. That was based on a misreading of the mask columns: the crops are
-- correctly masked and never touch PoJ.
--   crop a_1 = 3489660928  effect 1 -> target mask_1, bits 31|30|28
--   crop b_1 = 3489660928  effect 2 -> target mask_1, bits 31|30|28
--   crop c_1 = 2147483648  effect 3 -> target mask_1, bit 31 only
-- Exactly as I-050 documented. PoJ's spell_class_mask_1 is 0, so none of the
-- three match it. The attribute is unnecessary, and leaving it set would be an
-- undocumented deviation from stock that blocks any future spellmod on PoJ.
-- ============================================================================
