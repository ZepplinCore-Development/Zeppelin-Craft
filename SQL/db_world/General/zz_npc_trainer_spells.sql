
-- Warrior Counter
DELETE FROM `trainer_spell` WHERE `SpellId` = 91001;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (1, 91001, 100, 0, 0, 0, 0, 0, 6);

-- Paladin Chastise
DELETE FROM `trainer_spell` WHERE `SpellId` = 91002;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (3, 91002, 100, 0, 0, 0, 0, 0, 6);

-- Mage Mind Freak (Taunt)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91057;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 91057, 100, 0, 0, 0, 0, 0, 6);
