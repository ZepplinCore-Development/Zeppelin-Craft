-- F-168: Food and Drink Overhaul - SpellDescriptionVariables (RETIRED, I-414)
--
-- Variable 186 rebuilt cooking-pot food/drink bonuses with $?a91271..5 aura checks, because the
-- stock client ignored the pots' family-14 spell modifiers. No spell references it any more, and
-- the x64 client applies the pot modifiers to food/drink tooltips itself (F-226). DELETE-only
-- retires it idempotently.
DELETE FROM `spelldescriptionvariables` WHERE `id` = 186;
