-- [F-164] Earthwarden glyph recipes — Inscription trainer wiring.
--
-- Adds the 7 glyph CREATE_ITEM recipes (spells 900290-900296, defined in
-- [F-164]_spell.sql) to npc_trainer template 201021 — the UNIVERSAL Inscription
-- trainer list (19 leveling/city trainers, skill range 15-315, e.g. Thoth,
-- Elise Brightletter). Northrend master trainers also reference 201021, so the
-- glyphs are learnable at every Inscription trainer once the scribe has the skill.
-- (Template 201023 is Northrend-master-only, skill 350-440 — wrong for these.)
--
-- TIERED to the glyphed ability's level (matches the recipe ink + SLA min_skill):
--   T1 (L20):  ReqSkillRank 55,  MoneyCost 2000  (20s) -> Rockslam/Rocksurge/Crag Strike
--   T2 (L30):  ReqSkillRank 100, MoneyCost 5000  (50s) -> Volcanic Shield/Rockwall
--   T3 (L40):  ReqSkillRank 150, MoneyCost 10000 (1g)  -> Tectonic Blast/Thunderborne Leap
--
-- Idempotent + migrates off the earlier (uniform 201023/350) wiring: DELETE our
-- recipe spells from ANY template, then re-INSERT on 201021.
DELETE FROM `npc_trainer` WHERE `SpellID` IN (900290, 900291, 900292, 900293, 900294, 900295, 900296);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201021, 900290, 2000,  773,  55, 0, 0),  -- Glyph of Rockslam (T1)
(201021, 900291, 2000,  773,  55, 0, 0),  -- Glyph of Rocksurge (T1)
(201021, 900293, 2000,  773,  55, 0, 0),  -- Glyph of Crag Strike (T1)
(201021, 900294, 5000,  773, 100, 0, 0),  -- Glyph of Volcanic Shield (T2)
(201021, 900295, 5000,  773, 100, 0, 0),  -- Glyph of Rockwall (T2)
(201021, 900292, 10000, 773, 150, 0, 0),  -- Glyph of Tectonic Blast (T3)
(201021, 900296, 10000, 773, 150, 0, 0);  -- Glyph of Thunderborne Leap (T3)
