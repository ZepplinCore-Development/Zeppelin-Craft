-- [F-164R] Rocksteady Family - trainer wiring (split from F-164 zz_[F-164]_shaman_tuning_trainer.sql
-- and zz_[F-164]_baseline_ability_trainer.sql).
--
-- Rockslam (900119) + Rocksurge (900263) are the spec's core builder/spender. They carry
-- a skilllineability on the Earthwarden line (9001, see [F-164R]_skilllineability.sql) with
-- acquire_method 0 (trainer-learned), so they need npc_trainer rows to be learnable.
--
-- Two wirings (both stock-equivalent paths a shaman can hit):
--   trainer_spell  TrainerId 14  — the Shaman trainer list.
--   npc_trainer    ID 200018     — the shaman CLASS-spell template every shaman trainer
--                                  references via a (creatureEntry, -200018) row.

-- Shaman trainer (TrainerId 14)
DELETE FROM `trainer_spell` WHERE `SpellId` IN (900119, 900263);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(14, 900119, 500, 0, 0, 0, 0, 0, 20),  -- Rockslam, L20
(14, 900263, 800, 0, 0, 0, 0, 0, 24);  -- Rocksurge, L24 (Rocksteady spender)

-- Shaman class-spell template (npc_trainer ID 200018), ReqSkillLine 0 (level-gated).
DELETE FROM `npc_trainer` WHERE `ID` = 200018 AND `SpellID` IN (900119, 900263);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(200018, 900119, 1000, 0, 0, 15, 0),  -- Rockslam
(200018, 900263, 2000, 0, 0, 20, 0);  -- Rocksurge
