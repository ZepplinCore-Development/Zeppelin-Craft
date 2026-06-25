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
