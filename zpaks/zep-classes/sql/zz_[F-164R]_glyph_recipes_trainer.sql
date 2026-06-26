-- [F-164R] Rocksteady Family glyph recipes - Inscription trainer wiring (split from
-- F-164 zz_[F-164]_glyph_recipes_trainer.sql).
--
-- Adds the 3 glyph CREATE_ITEM recipes (spells 900290/900291/900295, defined in
-- [F-164R]_spell.sql) to npc_trainer template 201021 — the UNIVERSAL Inscription
-- trainer list (leveling/city trainers, skill 15-315; Northrend masters also
-- reference it), so the glyphs are learnable at every Inscription trainer once the
-- scribe has the skill.
--
-- ReqSkillRank gated to each ability's ACTUAL acquisition level and the recipe ink's
-- make-skill (Midnight ~80, Lion's ~115).
-- Idempotent + migrates off any earlier wiring: DELETE our recipe spells from ANY
-- template, then re-INSERT on 201021.
DELETE FROM `npc_trainer` WHERE `SpellID` IN (900290, 900291, 900295);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201021, 900290, 1000, 773,  80, 0, 0),  -- Glyph of Rockslam (~L19)
(201021, 900291, 2500, 773, 115, 0, 0),  -- Glyph of Rocksurge (L24)
(201021, 900295, 2500, 773, 115, 0, 0);  -- Glyph of Rockwall (L29)
