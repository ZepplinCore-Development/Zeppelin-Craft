-- [F-164B] Crag Strike SkillLineAbility rows (split from F-164 [F-164]_skilllineability.sql).
-- F-164 (parent) keeps the skillline DEFINITION (9001) and the talent tree structure
-- (talent 2978 -> Crag Strike); these are the per-spell ABILITY mappings for Crag Strike.
--   200098: Crag Strike (900262) Earthwarden-tab membership. acquire_method 0 so a talent
--           reset removes it; the talent (SpellRank -> 900262) lives in [F-164]_talent.sql.
--   200113: Glyph of Crag Strike recipe (900293) on Inscription (773), any scribe
--           (required_classes 0), trainer-learned. L19 / Midnight-ink gate: min/yellow 80, grey 120.
--   200102-200108: Crag Strike R2-R8 (900300-900306) Earthwarden-tab membership.
DELETE FROM `skilllineability` WHERE `id` IN (200098, 200102, 200103, 200104, 200105, 200106, 200107, 200108, 200113);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200098, 9001, 900262, 0, 64, 0, 0,  0, 0, 0,   0,  0, 0, 0),  -- Crag Strike R1 (talent-granted)
(200102, 9001, 900300, 0, 64, 0, 0,  0, 0, 0,   0,  0, 0, 0),  -- Crag Strike R2
(200103, 9001, 900301, 0, 64, 0, 0,  0, 0, 0,   0,  0, 0, 0),  -- Crag Strike R3
(200104, 9001, 900302, 0, 64, 0, 0,  0, 0, 0,   0,  0, 0, 0),  -- Crag Strike R4
(200105, 9001, 900303, 0, 64, 0, 0,  0, 0, 0,   0,  0, 0, 0),  -- Crag Strike R5
(200106, 9001, 900304, 0, 64, 0, 0,  0, 0, 0,   0,  0, 0, 0),  -- Crag Strike R6
(200107, 9001, 900305, 0, 64, 0, 0,  0, 0, 0,   0,  0, 0, 0),  -- Crag Strike R7
(200108, 9001, 900306, 0, 64, 0, 0,  0, 0, 0,   0,  0, 0, 0),  -- Crag Strike R8
(200113,  773, 900293, 0,  0, 0, 0, 80, 0, 0, 120, 80, 0, 0);  -- Glyph of Crag Strike recipe (L19, Midnight)
