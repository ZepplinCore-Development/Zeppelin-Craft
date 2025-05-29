-- Hunter Silencing Shot

DELETE FROM `npc_trainer` WHERE `SpellID` = 34490;
INSERT INTO `npc_trainer` SET
    `ID` = 200013,
    `SpellID` = 34490,
    `MoneyCost` = 100,
    `ReqLevel` = 4;

-- Shaman Wind Shear

	DELETE FROM `npc_trainer` WHERE `SpellID` = 57994;
	INSERT INTO `npc_trainer` SET
		`ID` = 200018,
		`SpellID` = 57994,
		`MoneyCost` = 100,
		`ReqLevel` = 4;
