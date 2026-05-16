-- Each class has both a master trainer template (city) and an apprentice
-- template (starting zone). Add to both so players can learn at level 4
-- without leaving the starter area. Paladin has master variants 3/4/5 plus
-- apprentice 6 (all reachable depending on faction/start).

-- Hunter Silencing Shot
DELETE FROM `trainer_spell` WHERE `SpellId` IN (34490, 91119);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (7, 91119, 100, 0, 0, 0, 0, 0, 4),
  (8, 91119, 100, 0, 0, 0, 0, 0, 4);

-- Shaman Wind Shear
DELETE FROM `trainer_spell` WHERE `SpellId` = 57994;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (14, 57994, 100, 0, 0, 0, 0, 0, 4),
  (15, 57994, 100, 0, 0, 0, 0, 0, 4);

-- Rogue Kick
DELETE FROM `trainer_spell` WHERE `SpellId` = 1766;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (9, 1766, 100, 0, 0, 0, 0, 0, 4),
  (10, 1766, 100, 0, 0, 0, 0, 0, 4);

-- Priest Devout Silence (custom spell 103246 - replaces problematic 15487)
DELETE FROM `trainer_spell` WHERE `SpellId` IN (15487, 103246);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (11, 103246, 100, 0, 0, 0, 0, 0, 4),
  (12, 103246, 100, 0, 0, 0, 0, 0, 4);

-- Paladin Rebuke (custom spell 103247 - melee range silence)
DELETE FROM `trainer_spell` WHERE `SpellId` = 103247;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (3, 103247, 100, 0, 0, 0, 0, 0, 4),
  (4, 103247, 100, 0, 0, 0, 0, 0, 4),
  (5, 103247, 100, 0, 0, 0, 0, 0, 4),
  (6, 103247, 100, 0, 0, 0, 0, 0, 4);

-- Warlock Spell Lock (moved from pet to class spell in F-044 skilllineability)
DELETE FROM `trainer_spell` WHERE `SpellId` = 19244;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (31, 19244, 100, 0, 0, 0, 0, 0, 4),
  (32, 19244, 100, 0, 0, 0, 0, 0, 4);

-- Druid Solar Flare (custom spell 103248 - 20 yard range silence)
DELETE FROM `trainer_spell` WHERE `SpellId` = 103248;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (33, 103248, 100, 0, 0, 0, 0, 0, 4),
  (34, 103248, 100, 0, 0, 0, 0, 0, 4);

-- Warrior Pummel (stock spell - lower from ReqLevel 38 to 4 to match other silences)
DELETE FROM `trainer_spell` WHERE `SpellId` = 6552;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (1, 6552, 100, 0, 0, 0, 0, 0, 4),
  (2, 6552, 100, 0, 0, 0, 0, 0, 4);

-- Mage Counterspell (stock spell - lower from ReqLevel 24 to 4 to match other silences)
DELETE FROM `trainer_spell` WHERE `SpellId` = 2139;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
  (16, 2139, 100, 0, 0, 0, 0, 0, 4),
  (17, 2139, 100, 0, 0, 0, 0, 0, 4);
