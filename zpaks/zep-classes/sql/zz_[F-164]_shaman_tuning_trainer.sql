-- [F-164] Shaman Tuning: trainer
-- Earthen Reprisal on Shaman trainer (TrainerId 14), level 6
-- Ancestral Warcry on Shaman trainer (TrainerId 14), level 10
-- Rockslam on Shaman trainer (TrainerId 14), level 20

DELETE FROM `trainer_spell` WHERE `SpellId` = 900114;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900114, 100, 0, 0, 0, 0, 0, 6);

DELETE FROM `trainer_spell` WHERE `SpellId` = 900153;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900153, 200, 0, 0, 0, 0, 0, 10);

DELETE FROM `trainer_spell` WHERE `SpellId` = 900119;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900119, 500, 0, 0, 0, 0, 0, 20);

-- Spirit Communion (active 900185) on Shaman trainer, level 12
DELETE FROM `trainer_spell` WHERE `SpellId` = 900185;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900185, 200, 0, 0, 0, 0, 0, 12);

-- Rockbiter Weapon ranks 5-10 (re-added TBC ranks + new WotLK R10) on Shaman trainer
DELETE FROM `trainer_spell` WHERE `SpellId` IN (900230, 900231, 900232, 900233, 900234, 900235);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
    (14, 900230,  1000, 0, 0, 0, 0, 0, 34),
    (14, 900231,  2500, 0, 0, 0, 0, 0, 44),
    (14, 900232,  5000, 0, 0, 0, 0, 0, 54),
    (14, 900233, 10000, 0, 0, 0, 0, 0, 62),
    (14, 900234, 20000, 0, 0, 0, 0, 0, 70),
    (14, 900235, 35000, 0, 0, 0, 0, 0, 78);
