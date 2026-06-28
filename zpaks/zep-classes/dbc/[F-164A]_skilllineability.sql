-- [F-164A] Glyph of Tectonic Blast - Inscription SkillLineAbility (split from F-164).
-- The recipe (spell 900292) is learnable by any scribe (required_classes 0) from any
-- Inscription trainer (skill_line 773, acquire_method 0). Gated to the ability's actual
-- acquisition level (talent tier 6 ~= L39) via the Lion's-ink make-skill: min_skill/yellow
-- = 145, grey = 185.
--
-- NOTE: the Earthwarden skillline (9001) SLA rows for the Tectonic Blast spells themselves
-- stay in [F-164]_skilllineability.sql — F-164 owns the Earthwarden-tab skillline membership.
DELETE FROM `skilllineability` WHERE `id` = 200112;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200112, 773, 900292, 0, 0, 0, 0, 145, 0, 0, 185, 145, 0, 0);  -- Tectonic Blast (L39, Lion's)
