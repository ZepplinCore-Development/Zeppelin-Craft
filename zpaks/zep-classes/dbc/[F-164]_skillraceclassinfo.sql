-- [F-164] Earthwarden skillraceclassinfo
-- Links the Earthwarden skillline (9001) to Shaman class so
-- spells appear in a dedicated spellbook tab.
-- Pattern matches Enhancement (373), Restoration (374), Elemental (375):
--   race_mask = 4294967295 (all races), class_mask = 64 (Shaman), flags = 1040

DELETE FROM `skillraceclassinfo` WHERE `id` = 1017;
INSERT INTO `skillraceclassinfo` (`id`, `skill_id`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_id`) VALUES (1017, 9001, 4294967295, 64, 1040, 0, 0, 0);
