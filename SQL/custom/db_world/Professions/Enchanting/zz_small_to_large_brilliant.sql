-- Add to Expert enchanting trainers
DELETE FROM `npc_trainer` WHERE (`ID` = 201009 AND `SpellID` = 91117);
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91117,
    `MoneyCost` = 10000,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 250;