-- F-027: Dynamic Potion Spell Descriptions - DBC spell overrides
-- Home: zep-items (potions are items; "tweaks to existing items").
-- Relocated here from zep-legacy. The C++ proc-handler patch stays in
-- core-azerothcore (0003-F-027-Remove-Alchemist-Stone-hardcoded-proc-handlers).
-- SpellDescriptionVariables (ID 183) in [F-027]_spelldescriptionvariables.sql.

UPDATE spell SET spell_desc_enus = 'Reduces craft time for Alchemy recipes by $s1%. Increases potion potency by $s2%. Does not stack with other Alchemy Mortar effects.' WHERE id IN (91200, 91201, 91202, 91203);

-- Revert debug flags: restore hidden aura bar attributes
UPDATE spell SET attributes = 128, attributes_ex_1 = 268437504 WHERE id IN (91200, 91201, 91202, 91203);

-- [F-190] retire potion desc-var 183 (descs reverted to stock; addon owns the layer)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 183;

-- Rejuvenation potions: stock class mask is 0, so no potion-potency mod (mask 14
-- = healing/mana/combined bits) ever matched them. Give them their own free
-- family-13 bit 0x10; the mortars (effect 3, F-001) and Alchemist's Stone
-- (effect 2, below) target it with ALL_EFFECTS so both mana AND health scale.
UPDATE spell SET spell_class_mask_1 = 16 WHERE id IN (2370, 2599, 2600, 22729, 28517, 53761, 61371);

-- Alchemist's Stone: +40% ALL_EFFECTS on the rejuvenation-potion bit (effect 2 mask = b_1)
UPDATE spell SET
  effect_2 = 6,
  effect_die_sides_2 = 1,
  effect_base_points_2 = 39,
  effect_implicit_target_a_2 = 1,
  effect_apply_aura_name_2 = 108,
  effect_misc_value_a_2 = 8,
  effect_spell_class_mask_b_1 = 16
WHERE id = 17619;
