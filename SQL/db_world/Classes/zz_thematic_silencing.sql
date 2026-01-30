-- Hunter Silencing Shot
DELETE FROM `trainer_spell` WHERE `SpellId` IN (34490, 91119);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (200013, 91119, 100, 0, 0, 0, 0, 0, 4);

-- Shaman Wind Shear
-- 200017 = basic trainers (inherited by advanced trainers)
DELETE FROM `trainer_spell` WHERE `SpellId` = 57994;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (200017, 57994, 100, 0, 0, 0, 0, 0, 4);

-- Rogue Kick
DELETE FROM `trainer_spell` WHERE `SpellId` = 1766;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (200015, 1766, 100, 0, 0, 0, 0, 0, 4);

-- Priest Devout Silence (custom spell 103246 - replaces problematic 15487)
DELETE FROM `trainer_spell` WHERE `SpellId` IN (15487, 103246);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (200011, 103246, 100, 0, 0, 0, 0, 0, 4);

-- Paladin Rebuke (custom spell 103247 - melee range silence)
-- 200003 = basic trainers (inherited by advanced trainers)
DELETE FROM `trainer_spell` WHERE `SpellId` = 103247;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (200003, 103247, 100, 0, 0, 0, 0, 0, 4);

-- Druid Solar Flare (custom spell 103248 - 20 yard range silence)
-- 200005 = basic trainers (inherited by advanced trainers)
DELETE FROM `trainer_spell` WHERE `SpellId` = 103248;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (200005, 103248, 100, 0, 0, 0, 0, 0, 4);
