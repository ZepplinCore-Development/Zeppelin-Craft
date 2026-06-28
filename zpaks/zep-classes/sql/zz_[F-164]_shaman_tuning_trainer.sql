-- [F-164] Shaman Tuning: trainer
-- Ancestral Warcry on Shaman trainer (TrainerId 14), level 10

-- (Earthen Reprisal 900114 Shaman-trainer row moved to zz_[F-164E]_earthen_reprisal_trainer.sql)

DELETE FROM `trainer_spell` WHERE `SpellId` = 900153;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900153, 200, 0, 0, 0, 0, 0, 10);

-- (Rockslam 900119 + Rocksurge 900263 Shaman-trainer rows moved to zz_[F-164R]_trainer.sql)

-- (Spirit Communion 900185 Shaman-trainer row moved to zz_[F-164H]_trainer.sql)

-- [MIGRATED -> F-164C] Rockbiter Weapon ranks 5-10 trainer rows (900230-900235)
-- moved to zz_[F-164C]_rockbiter_trainer.sql.
