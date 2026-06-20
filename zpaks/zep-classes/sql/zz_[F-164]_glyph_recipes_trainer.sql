-- [F-164] Earthwarden glyph recipes — Inscription trainer wiring.
--
-- Adds the 7 glyph CREATE_ITEM recipes (spells 900290-900296, defined in
-- [F-164]_spell.sql) to npc_trainer template 201023 — the shared Inscription
-- glyph-trainer list that every stock Inscription trainer references via a
-- (creatureEntry, -201023) row (e.g. Mindri Dinkles 26916, Booker Kells 26959,
-- Adelene Sunlance 26977). Adding here makes ALL Inscription trainers teach them.
--
-- Mirrors stock glyph recipe gating: ReqSkillLine 773, ReqSkillRank 350,
-- MoneyCost 50000 (5g). Reagent (1x Ink of the Sea) is on the recipe spell.
-- TUNABLE: lower ReqSkillRank / MoneyCost here if these should be leveling-accessible.
--
-- Idempotent: DELETE our rows from the template, then re-INSERT.
DELETE FROM `npc_trainer` WHERE `ID` = 201023 AND `SpellID` IN (900290, 900291, 900292, 900293, 900294, 900295, 900296);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201023, 900290, 50000, 773, 350, 0, 0),  -- Glyph of Rockslam
(201023, 900291, 50000, 773, 350, 0, 0),  -- Glyph of Rocksurge
(201023, 900292, 50000, 773, 350, 0, 0),  -- Glyph of Tectonic Blast
(201023, 900293, 50000, 773, 350, 0, 0),  -- Glyph of Crag Strike
(201023, 900294, 50000, 773, 350, 0, 0),  -- Glyph of Volcanic Shield
(201023, 900295, 50000, 773, 350, 0, 0),  -- Glyph of Rockwall
(201023, 900296, 50000, 773, 350, 0, 0);  -- Glyph of Thunderborne Leap
