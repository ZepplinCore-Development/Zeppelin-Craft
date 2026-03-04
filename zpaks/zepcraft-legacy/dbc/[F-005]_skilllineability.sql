-- F-005: Riding Overhaul - SkillLineAbility
-- Riding crop CRAFTING spells on skill_line 165 (Leatherworking).
-- Only crafting recipes need SLA entries; passive aura spells (100010-100014)
-- are inventory-triggered and do NOT belong in skilllineability.

-- Restore any Inscription entries that may have been overwritten
-- by the previous broken version of this file (IDs 100010-100024 on skill_line 773).
-- The DBC rebuild from original_dbc handles this, so no restore needed here.

-- Clean up old broken entries (if present from previous version)
DELETE FROM `skilllineability` WHERE `id` IN (200020, 200021, 200022, 200023, 200024, 200025);

-- Apprentice Riding Crop (crafting) - LW 150
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200020, 165, 100020, 0, 0, 0, 0, 150, 0, 0, 195, 165, 0, 0);

-- Journeyman Riding Crop (crafting) - LW 225
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200021, 165, 100021, 0, 0, 0, 0, 225, 0, 0, 270, 240, 0, 0);

-- Expert Riding Crop (crafting) - LW 300
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200022, 165, 100022, 0, 0, 0, 0, 300, 0, 0, 345, 315, 0, 0);

-- Artisan Riding Crop (crafting) - LW 375
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200023, 165, 100023, 0, 0, 0, 0, 375, 0, 0, 420, 390, 0, 0);

-- Master Riding Crop (crafting) - LW 375
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200024, 165, 100024, 0, 0, 0, 0, 375, 0, 0, 420, 390, 0, 0);

-- Grand Master Riding Crop (crafting) - LW 450
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200025, 165, 100025, 0, 0, 0, 0, 450, 0, 0, 475, 460, 0, 0);
