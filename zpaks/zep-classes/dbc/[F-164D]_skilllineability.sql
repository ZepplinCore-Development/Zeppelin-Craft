-- [F-164D] Glyph of Volcanic Shield - Inscription SkillLineAbility (split from F-164).
-- The recipe (spell 900294) is learnable by any scribe (required_classes 0) from any
-- Inscription trainer (skill_line 773, acquire_method 0). Gated to the ability's actual
-- acquisition level (talent tier 5 ~= L34) via the Lion's-ink make-skill: min_skill/yellow
-- = 130, grey = 170.
--
-- NOTE: the Earthwarden skillline (9001) SLA rows for the Volcanic Shield spells themselves
-- (200065 -> 900116, 200068 -> 900123, 200069 -> 900124, 200101 -> 900125) stay in
-- [F-164]_skilllineability.sql — F-164 owns the Earthwarden-tab skillline membership.
DELETE FROM `skilllineability` WHERE `id` = 200114;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200114, 773, 900294, 0, 0, 0, 0, 130, 0, 0, 170, 130, 0, 0);  -- Volcanic Shield (L34, Lion's)
