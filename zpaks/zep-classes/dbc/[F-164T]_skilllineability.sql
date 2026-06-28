-- [F-164T] Glyph of Thunderborne Leap - Inscription SkillLineAbility (split from F-164).
-- The recipe (spell 900296) is learnable by any scribe (required_classes 0) from any
-- Inscription trainer (skill_line 773, acquire_method 0). Gated to the ability's actual
-- acquisition level (talent tier 10 ~= L59) via the Celestial-ink make-skill: min_skill/yellow
-- = 215, grey = 255.
--
-- NOTE: the Earthwarden skillline (9001) SLA rows for the Thunderborne Leap spells themselves
-- stay in [F-164]_skilllineability.sql — F-164 owns the Earthwarden-tab skillline membership.
DELETE FROM `skilllineability` WHERE `id` = 200116;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200116, 773, 900296, 0, 0, 0, 0, 215, 0, 0, 255, 215, 0, 0);  -- Thunderborne Leap (L59, Celestial)
