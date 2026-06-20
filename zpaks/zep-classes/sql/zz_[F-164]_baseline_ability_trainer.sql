-- [F-164] Baseline Earthwarden abilities — shaman trainer wiring.
--
-- Rockslam (900119) and Rocksurge (900263) are the spec's core builder/spender.
-- They carry a skilllineability on the Earthwarden line (9001) with acquire_method 0
-- (trainer-learned) but had NO npc_trainer row, so a shaman couldn't actually learn
-- them. Add them to template 200018 — the shaman CLASS-spell list (272 spells,
-- ReqLevel 8-80, ReqSkillLine 0) that every shaman trainer references via a
-- (creatureEntry, -200018) row (e.g. Siln Skychaser 3030).
--
--   Rockslam   ReqLevel 15
--   Rocksurge  ReqLevel 20
-- ReqSkillLine 0 (class spell, gated by level), ReqSpell 0 (no rank prereq).
DELETE FROM `npc_trainer` WHERE `ID` = 200018 AND `SpellID` IN (900119, 900263);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(200018, 900119, 1000, 0, 0, 15, 0),  -- Rockslam
(200018, 900263, 2000, 0, 0, 20, 0);  -- Rocksurge
