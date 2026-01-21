-- Hunter Silencing Shot

	DELETE FROM `npc_trainer` WHERE `SpellID` IN (34490, 91119);
	INSERT INTO `npc_trainer` SET
		`ID` = 200013,
		`SpellID` = 91119,
		`MoneyCost` = 100,
		`ReqLevel` = 4;

-- Shaman Wind Shear

	DELETE FROM `npc_trainer` WHERE `SpellID` = 57994;
	INSERT INTO `npc_trainer` SET
		`ID` = 200018,
		`SpellID` = 57994,
		`MoneyCost` = 100,
		`ReqLevel` = 4;

-- Rogue Kick

	DELETE FROM `npc_trainer` WHERE `SpellID` = 1766;
	INSERT INTO `npc_trainer` SET
		`ID` = 200015,
		`SpellID` = 1766,
		`MoneyCost` = 100,
		`ReqLevel` = 4;

-- Priest Devout Silence (custom spell 103246 - replaces problematic 15487)

	DELETE FROM `npc_trainer` WHERE `SpellID` IN (15487, 103246);
	INSERT INTO `npc_trainer` SET
		`ID` = 200011,
		`SpellID` = 103246,
		`MoneyCost` = 100,
		`ReqLevel` = 4;

-- Paladin Rebuke (custom spell 103247 - melee range silence)

	DELETE FROM `npc_trainer` WHERE `SpellID` = 103247;
	INSERT INTO `npc_trainer` SET
		`ID` = 200004,
		`SpellID` = 103247,
		`MoneyCost` = 100,
		`ReqLevel` = 4;

-- Druid Solar Flare (custom spell 103248 - 20 yard range silence)

	DELETE FROM `npc_trainer` WHERE `SpellID` = 103248;
	INSERT INTO `npc_trainer` SET
		`ID` = 200006,
		`SpellID` = 103248,
		`MoneyCost` = 100,
		`ReqLevel` = 4;
