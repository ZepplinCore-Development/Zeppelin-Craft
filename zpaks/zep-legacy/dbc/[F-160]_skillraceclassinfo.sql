-- [F-160] .Perks skillraceclassinfo
-- Grants the .Perks skillline (792) to every race/class combo so the
-- account-wide perk spells (Hearthstone, Summon Guild Bank, Reagent Banker)
-- appear in a dedicated ".Perks" spellbook tab (category 7 = Class Skills).
-- This grant row was historically missing from source, so a DBC rebuild /
-- character migration wiped the tab. Restores it for all characters on login.
--   race_mask  = 4294967295 (all races)
--   class_mask = 1535       (all 10 playable classes incl. Death Knight)
--   flags      = 1040       (MONO_VALUE 0x400 + ALWAYS_MAX_VALUE 0x10 — 1/1 mono skill)
-- Pattern matches Earthwarden (id 1017) which works correctly.

DELETE FROM `skillraceclassinfo` WHERE `id` = 1018;
INSERT INTO `skillraceclassinfo` (`id`, `skill_id`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_id`) VALUES (1018, 792, 4294967295, 1535, 1040, 0, 0, 0);
