-- Hunter Silencing Shot
DELETE FROM `trainer_spell` WHERE `SpellId` IN (34490, 91119);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (7, 91119, 100, 0, 0, 0, 0, 0, 4);

-- Shaman Wind Shear
DELETE FROM `trainer_spell` WHERE `SpellId` = 57994;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 57994, 100, 0, 0, 0, 0, 0, 4);

-- Rogue Kick
DELETE FROM `trainer_spell` WHERE `SpellId` = 1766;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (9, 1766, 100, 0, 0, 0, 0, 0, 4);

-- Priest Devout Silence (custom spell 103246 - replaces problematic 15487)
DELETE FROM `trainer_spell` WHERE `SpellId` IN (15487, 103246);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (11, 103246, 100, 0, 0, 0, 0, 0, 4);

-- Paladin Rebuke (custom spell 103247 - melee range silence)
DELETE FROM `trainer_spell` WHERE `SpellId` = 103247;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (3, 103247, 100, 0, 0, 0, 0, 0, 4);

-- Warlock Spell Lock (moved from pet to class spell in F-044 skilllineability)
DELETE FROM `trainer_spell` WHERE `SpellId` = 19244;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (31, 19244, 100, 0, 0, 0, 0, 0, 4);

-- Druid Solar Flare (custom spell 103248 - 20 yard range silence)
DELETE FROM `trainer_spell` WHERE `SpellId` = 103248;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (33, 103248, 100, 0, 0, 0, 0, 0, 4);
