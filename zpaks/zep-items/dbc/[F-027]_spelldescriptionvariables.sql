-- F-027: Dynamic Potion Spell Descriptions - SpellDescriptionVariables (RETIRED, I-414)
--
-- Variable 183 rebuilt mortar / Alchemist's Stone potency with $?a aura checks, because the
-- stock client never applied family-13 spell modifiers to potion tooltips. Potion descriptions
-- went back to stock tokens under F-190, and the x64 client now applies the mortar and stone
-- modifiers to $s itself (F-226, SMSG_ZEP_FAMILY_SPELL_MODIFIER). The row is unreferenced;
-- DELETE-only retires it idempotently.
DELETE FROM `spelldescriptionvariables` WHERE `id` = 183;
