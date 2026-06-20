-- [F-164] Earthwarden glyph recipes — Inscription trainer wiring.
--
-- Adds the 7 glyph CREATE_ITEM recipes (spells 900290-900296, defined in
-- [F-164]_spell.sql) to npc_trainer template 201021 — the UNIVERSAL Inscription
-- trainer list (19 leveling/city trainers, skill range 15-315, e.g. Thoth,
-- Elise Brightletter). Northrend master trainers also reference 201021, so the
-- glyphs are learnable at every Inscription trainer once the scribe has the skill.
-- (Template 201023 is Northrend-master-only, skill 350-440 — wrong for these.)
--
-- ReqSkillRank gated to each ability's ACTUAL acquisition level (talent tier /
-- baseline, NOT spell base_level) and the recipe ink's make-skill:
--   Glyph              Ability lvl  Ink            ReqSkillRank  Cost
--   Rockslam           ~19 baseline Midnight 39774  80           10s
--   Crag Strike        19  tier 2   Midnight 39774  80           10s
--   Rocksurge          24  baseline Lion's   43116 115           25s
--   Rockwall           29  tier 4   Lion's   43116 115           25s
--   Volcanic Shield    34  tier 5   Lion's   43116 130           50s
--   Tectonic Blast     39  tier 6   Lion's   43116 145           50s
--   Thunderborne Leap  59  tier 10  Celestial 43120 215          1g
--
-- Idempotent + migrates off any earlier wiring: DELETE our recipe spells from ANY
-- template, then re-INSERT on 201021.
DELETE FROM `npc_trainer` WHERE `SpellID` IN (900290, 900291, 900292, 900293, 900294, 900295, 900296);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201021, 900290, 1000,  773,  80, 0, 0),  -- Glyph of Rockslam (~L19)
(201021, 900293, 1000,  773,  80, 0, 0),  -- Glyph of Crag Strike (L19)
(201021, 900291, 2500,  773, 115, 0, 0),  -- Glyph of Rocksurge (L24)
(201021, 900295, 2500,  773, 115, 0, 0),  -- Glyph of Rockwall (L29)
(201021, 900294, 5000,  773, 130, 0, 0),  -- Glyph of Volcanic Shield (L34)
(201021, 900292, 5000,  773, 145, 0, 0),  -- Glyph of Tectonic Blast (L39)
(201021, 900296, 10000, 773, 215, 0, 0);  -- Glyph of Thunderborne Leap (L59)
