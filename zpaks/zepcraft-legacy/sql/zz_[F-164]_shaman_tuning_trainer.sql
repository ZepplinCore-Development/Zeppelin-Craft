-- [F-164] Shaman Tuning: trainer
-- Earthen Reprisal on Shaman trainer (TrainerId 14), level 6
-- Ancestral Shout on Shaman trainer (TrainerId 14), level 10

DELETE FROM `trainer_spell` WHERE `SpellId` = 900114;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900114, 100, 0, 0, 0, 0, 0, 6);

DELETE FROM `trainer_spell` WHERE `SpellId` = 900153;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900153, 200, 0, 0, 0, 0, 0, 10);
