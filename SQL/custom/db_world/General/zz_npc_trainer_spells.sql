
-- Warrior Counter
DELETE FROM `npc_trainer` Where `SpellID` = 91001;
INSERT INTO `npc_trainer` SET
    `ID` = 200001,
    `SpellID` = 91001,
    `MoneyCost` = 100,
    `ReqLevel` = 6;

-- Paladin Chastise
DELETE FROM `npc_trainer` Where `SpellID` = 91002;
INSERT INTO `npc_trainer` SET
    `ID` = 200003,
    `SpellID` = 91002,
    `MoneyCost` = 100,
    `ReqLevel` = 6;
