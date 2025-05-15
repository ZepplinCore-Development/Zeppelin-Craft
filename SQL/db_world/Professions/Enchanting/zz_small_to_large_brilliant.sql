-- Add to Expert enchanting trainers a recipe that converts 3 small brilliant shards into 1 large.
DELETE FROM `npc_trainer` WHERE (`ID` = 201009 AND `SpellID` = 91117);
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91117,
    `MoneyCost` = 10000,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 225;