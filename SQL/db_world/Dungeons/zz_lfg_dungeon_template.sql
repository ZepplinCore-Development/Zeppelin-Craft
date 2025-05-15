-- Table controls the teleport locations for dungeons when using LFG
-- DungionId is a Unique id from LFGDungeons.dbc
-- IDs from 295 - 323 are Heroics
-- IDs from 350 - 378 are Mythics

-- Blackrock Depths - Prison

	-- Blackrock Depths - Prison (Mythic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 308;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 308,
			`name` = 'Blackrock Depths - Prison (Mythic)',
			`position_x` = 458.32,
			`position_y` = 26.52,
			`position_z` = -70.67,
			`orientation` = 4.95;

	-- Blackrock Depths - Prison (Heroic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 364;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 364,
			`name` = 'Blackrock Depths - Prison (Heroic)',
			`position_x` = 458.32,
			`position_y` = 26.52,
			`position_z` = -70.67,
			`orientation` = 4.95;

	-- Blackrock Depths - Prison (Normal)

		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 30;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 30,
			`name` = 'Blackrock Depths - Prison (Normal)',
			`position_x` = 458.32,
			`position_y` = 26.52,
			`position_z` = -70.67,
			`orientation` = 4.95;

-- Blackrock Depths - Upper City

	-- Blackrock Depths - Upper City (Mythic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 377;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 377,
			`name` = 'Blackrock Depths - Upper City (Mythic)',
			`position_x` = 881.5,
			`position_y` = -237.3,
			`position_z` = -49.9,
			`orientation` = 5.8;

	-- Blackrock Depths - Upper City (Heroic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 276;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 276,
			`name` = 'Blackrock Depths - Upper City (Heroic)',
			`position_x` = 881.5,
			`position_y` = -237.3,
			`position_z` = -49.9,
			`orientation` = 5.8;

	-- Blackrock Depths - Upper City (Normal)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 321;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 321,
			`name` = 'Blackrock Depths - Upper City (Normal)',
			`position_x` = 881.5,
			`position_y` = -237.3,
			`position_z` = -49.9,
			`orientation` = 5.8;

-- Coren Direbrew
	DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 287;
	INSERT INTO `lfg_dungeon_template` SET
		`dungeonId` = 287,
		`name` = 'Coren Direbrew',
		`position_x` = 897.495,
		`position_y` = -141.976,
		`position_z` = -49.7563,
		`orientation` = 2.1255;

-- Dire Maul

	-- Dire Maul - East

		-- Dire Maul - East (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 366;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 366,
				`name` = 'Dire Maul - East (Mythic)',
				`position_x` = 44.4499,
				`position_y` = -154.822,
				`position_z` = -2.71201;

		-- Dire Maul - East (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 34;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 34,
				`name` = 'Dire Maul - East (Heroic)',
				`position_x` = 44.4499,
				`position_y` = -154.822,
				`position_z` = -2.71201;

		-- Dire Maul - East (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 310;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 310,
				`name` = 'Dire Maul - East (Normal)',
				`position_x` = 44.4499,
				`position_y` = -154.822,
				`position_z` = -2.71201;

	-- Dire Maul - North

		-- Dire Maul - North (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 38;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 38,
				`name` = 'Dire Maul - North (Normal)',
				`position_x` = 255.249,
				`position_y` = -16.0561,
				`position_z` = -2.58737,
				`orientation` = 4.7;

		-- Dire Maul - North (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 312;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 312,
				`name` = 'Dire Maul - North (Heroic)',
				`position_x` = 255.249,
				`position_y` = -16.0561,
				`position_z` = -2.58737,
				`orientation` = 4.7;

		-- Dire Maul - North (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 368;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 368,
				`name` = 'Dire Maul - North (Mythic)',
				`position_x` = 255.249,
				`position_y` = -16.0561,
				`position_z` = -2.58737,
				`orientation` = 4.7;

	-- Dire Maul - West

		-- Dire Maul - West (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 36;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 36,
				`name` = 'Dire Maul - West (Normal)',
				`position_x` = -62.9658,
				`position_y` = 159.867,
				`position_z` = -3.46206,
				`orientation` = 3.14788;

		-- Dire Maul - West (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 367;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 367,
				`name` = 'Dire Maul - West (Mythic)',
				`position_x` = -62.9658,
				`position_y` = 159.867,
				`position_z` = -3.46206,
				`orientation` = 3.14788;

		-- Dire Maul - West (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 311;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 311,
				`name` = 'Dire Maul - West (Heroic)',
				`position_x` = -62.9658,
				`position_y` = 159.867,
				`position_z` = -3.46206,
				`orientation` = 3.14788;

-- Gnomeregan

	-- Gnomeregan (Mythic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 350;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 350,
			`name` = 'Gnomeregan (Mythic)',
			`position_x` = -332.22,
			`position_y` = -2.28,
			`position_z` = -150.86,
			`orientation` = 2.77;

	-- Gnomeregan (Heroic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 301;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 301,
			`name` = 'Gnomeregan (Heroic)',
			`position_x` = -332.22,
			`position_y` = -2.28,
			`position_z` = -150.86,
			`orientation` = 2.77;

	-- Gnomeregan (Normal)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 14;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 14,
			`name` = 'Gnomeregan (Normal)',
			`position_x` = -332.22,
			`position_y` = -2.28,
			`position_z` = -150.86,
			`orientation` = 2.77;

-- Lower Blackrock Spire

	-- Lower Blackrock Spire (Heroic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 309;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 309,
			`name` = 'Lower Blackrock Spire (Heroic)',
			`position_x` = 78.5083,
			`position_y` = -225.044,
			`position_z` = 49.839,
			`orientation` = 5.1;

	-- Lower Blackrock Spire (Mythic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 365;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 365,
			`name` = 'Lower Blackrock Spire (Mythic)',
			`position_x` = 78.5083,
			`position_y` = -225.044,
			`position_z` = 49.839,
			`orientation` = 5.1;

	-- Lower Blackrock Spire (Normal)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 32;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 32,
			`name` = 'Lower Blackrock Spire (Normal)',
			`position_x` = 78.5083,
			`position_y` = -225.044,
			`position_z` = 49.839,
			`orientation` = 5.1;

-- Maraudon

	-- Maraudon - Orange Crystals

		-- Maraudon - Orange Crystals (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 306;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 306,
				`name` = 'Maraudon - Orange Crystals (Heroic)',
				`position_x` = 1019.69,
				`position_y` = -458.31,
				`position_z` = -43.43,
				`orientation` = 0.31;

		-- Maraudon - Orange Crystals (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 26;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 26,
				`name` = 'Maraudon - Orange Crystals (Normal)',
				`position_x` = 1019.69,
				`position_y` = -458.31,
				`position_z` = -43.43,
				`orientation` = 0.31;

		-- Maraudon - Orange Crystals (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 362;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 362,
				`name` = 'Maraudon - Orange Crystals (Mythic)',
				`position_x` = 1019.69,
				`position_y` = -458.31,
				`position_z` = -43.43,
				`orientation` = 0.31;

	-- Maraudon - Pristine Waters

		-- Maraudon - Pristine Waters (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 375;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 375,
				`name` = 'Maraudon - Pristine Waters (Mythic)',
				`position_x` = 495.702,
				`position_y` = 17.3372,
				`position_z` = -96.3128,
				`orientation` = 3.11854;

		-- Maraudon - Pristine Waters (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 273;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 273,
				`name` = 'Maraudon - Pristine Waters (Heroic)',
				`position_x` = 495.702,
				`position_y` = 17.3372,
				`position_z` = -96.3128,
				`orientation` = 3.11854;

		-- Maraudon - Pristine Waters (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 319;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 319,
				`name` = 'Maraudon - Pristine Waters (Normal)',
				`position_x` = 495.702,
				`position_y` = 17.3372,
				`position_z` = -96.3128,
				`orientation` = 3.11854;

	-- Maraudon - Purple Crystals

		-- Maraudon - Purple Crystals (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 374;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 374,
				`name` = 'Maraudon - Purple Crystals (Mythic)',
				`position_x` = 752.91,
				`position_y` = -616.53,
				`position_z` = -33.11,
				`orientation` = 1.37;

		-- Maraudon - Purple Crystals (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 318;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 318,
				`name` = 'Maraudon - Purple Crystals (Heroic)',
				`position_x` = 752.91,
				`position_y` = -616.53,
				`position_z` = -33.11,
				`orientation` = 1.37;

		-- Maraudon - Purple Crystals (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 272;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 272,
				`name` = 'Maraudon - Purple Crystals (Normal)',
				`position_x` = 752.91,
				`position_y` = -616.53,
				`position_z` = -33.11,
				`orientation` = 1.37;

-- Scarlet Monastery

	-- Scarlet Monastery - Armory

		-- Scarlet Monastery - Armory (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 371;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 371,
				`name` = 'Scarlet Monastery - Armory (Mythic)',
				`position_x` = 1610.83,
				`position_y` = -323.433,
				`position_z` = 18.6738,
				`orientation` = 6.28022;

		-- Scarlet Monastery - Armory (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 163;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 163,
				`name` = 'Scarlet Monastery - Armory (Normal)',
				`position_x` = 1610.83,
				`position_y` = -323.433,
				`position_z` = 18.6738,
				`orientation` = 6.28022;

		-- Scarlet Monastery - Armory (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 315;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 315,
				`name` = 'Scarlet Monastery - Armory (Heroic)',
				`position_x` = 1610.83,
				`position_y` = -323.433,
				`position_z` = 18.6738,
				`orientation` = 6.28022;

	-- Scarlet Monastery - Cathedral

		-- Scarlet Monastery - Cathedral (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 164;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 164,
				`name` = 'Scarlet Monastery - Cathedral (Normal)',
				`position_x` = 855.683,
				`position_y` = 1321.5,
				`position_z` = 18.6709,
				`orientation` = 0.001747;

		-- Scarlet Monastery - Cathedral (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 316;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 316,
				`name` = 'Scarlet Monastery - Cathedral (Heroic)',
				`position_x` = 855.683,
				`position_y` = 1321.5,
				`position_z` = 18.6709,
				`orientation` = 0.001747;

		-- Scarlet Monastery - Cathedral (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 372;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 372,
				`name` = 'Scarlet Monastery - Cathedral (Mythic)',
				`position_x` = 855.683,
				`position_y` = 1321.5,
				`position_z` = 18.6709,
				`orientation` = 0.001747;

	-- Scarlet Monastery - Graveyard

		-- Scarlet Monastery - Graveyard (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 303;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 303,
				`name` = 'Scarlet Monastery - Graveyard (Heroic)',
				`position_x` = 1688.99,
				`position_y` = 1053.48,
				`position_z` = 18.6775,
				`orientation` = 0.00117;

		-- Scarlet Monastery - Graveyard (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 18;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 18,
				`name` = 'Scarlet Monastery - Graveyard (Normal)',
				`position_x` = 1688.99,
				`position_y` = 1053.48,
				`position_z` = 18.6775,
				`orientation` = 0.00117;

		-- Scarlet Monastery - Graveyard (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 359;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 359,
				`name` = 'Scarlet Monastery - Graveyard (Mythic)',
				`position_x` = 1688.99,
				`position_y` = 1053.48,
				`position_z` = 18.6775,
				`orientation` = 0.00117;

	-- Scarlet Monastery - Library

		-- Scarlet Monastery - Library (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 317;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 317,
				`name` = 'Scarlet Monastery - Library (Heroic)',
				`position_x` = 255.346,
				`position_y` = -209.09,
				`position_z` = 18.6773,
				`orientation` = 6.26656;

		-- Scarlet Monastery - Library (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 373;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 373,
				`name` = 'Scarlet Monastery - Library (Mythic)',
				`position_x` = 255.346,
				`position_y` = -209.09,
				`position_z` = 18.6773,
				`orientation` = 6.26656;

		-- Scarlet Monastery - Library (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 165;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 165,
				`name` = 'Scarlet Monastery - Library (Normal)',
				`position_x` = 255.346,
				`position_y` = -209.09,
				`position_z` = 18.6773,
				`orientation` = 6.26656;

-- Scholomance

	-- Scholomance (Heroic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 322;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 322,
			`name` = 'Scholomance (Heroic)',
			`position_x` = 196.37,
			`position_y` = 127.05,
			`position_z` = 134.91,
			`orientation` = 6.09;

	-- Scholomance (Normal)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 2;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 2,
			`name` = 'Scholomance (Normal)',
			`position_x` = 196.37,
			`position_y` = 127.05,
			`position_z` = 134.91,
			`orientation` = 6.09;

	-- Scholomance (Mythic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 378;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 378,
			`name` = 'Scholomance (Mythic)',
			`position_x` = 196.37,
			`position_y` = 127.05,
			`position_z` = 134.91,
			`orientation` = 6.09;

-- Stratholme

	-- Stratholme - Main Gate

		-- Stratholme - Main Gate (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 40;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 40,
				`name` = 'Stratholme - Main Gate (Normal)',
				`position_x` = 3395.09,
				`position_y` = -3380.25,
				`position_z` = 142.702,
				`orientation` = 0.1;

		-- Stratholme - Main Gate (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 313;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 313,
				`name` = 'Stratholme - Main Gate (Heroic)',
				`position_x` = 3395.09,
				`position_y` = -3380.25,
				`position_z` = 142.702,
				`orientation` = 0.1;

		-- Stratholme - Main Gate (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 369;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 369,
				`name` = 'Stratholme - Main Gate (Mythic)',
				`position_x` = 3395.09,
				`position_y` = -3380.25,
				`position_z` = 142.702,
				`orientation` = 0.1;

	-- Stratholme - Service Entrance

		-- Stratholme - Service Entrance (Heroic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 320;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 320,
				`name` = 'Stratholme - Service Entrance (Heroic)',
				`position_x` = 3593.15,
				`position_y` = -3646.56,
				`position_z` = 138.5,
				`orientation` = 5.33;

		-- Stratholme - Service Entrance (Mythic)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 376;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 376,
				`name` = 'Stratholme - Service Entrance (Mythic)',
				`position_x` = 3593.15,
				`position_y` = -3646.56,
				`position_z` = 138.5,
				`orientation` = 5.33;

		-- Stratholme - Service Entrance (Normal)
			DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 274;
			INSERT INTO `lfg_dungeon_template` SET
				`dungeonId` = 274,
				`name` = 'Stratholme - Service Entrance (Normal)',
				`position_x` = 3593.15,
				`position_y` = -3646.56,
				`position_z` = 138.5,
				`orientation` = 5.33;

-- The Crown Chemical Co.
	DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 288;
	INSERT INTO `lfg_dungeon_template` SET
		`dungeonId` = 288,
		`name` = 'The Crown Chemical Co.',
		`position_x` = -238.075,
		`position_y` = 2166.43,
		`position_z` = 88.853,
		`orientation` = 1.13446;

-- The Frost Lord Ahune
	DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 286;
	INSERT INTO `lfg_dungeon_template` SET
		`dungeonId` = 286,
		`name` = 'The Frost Lord Ahune',
		`position_x` = -100.396,
		`position_y` = -95.9996,
		`position_z` = -4.28423,
		`orientation` = 4.71239;

-- The Headless Horseman
	DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 285;
	INSERT INTO `lfg_dungeon_template` SET
		`dungeonId` = 285,
		`name` = 'The Headless Horseman',
		`position_x` = 1797.52,
		`position_y` = 1347.38,
		`position_z` = 18.8876,
		`orientation` = 3.142;

-- Uldaman

	-- Uldaman (Normal)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 22;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 22,
			`name` = 'Uldaman (Normal)',
			`position_x` = -226.8,
			`position_y` = 49.09,
			`position_z` = -46.03,
			`orientation` = 1.39;

	-- Uldaman (Mythic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 360;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 360,
			`name` = 'Uldaman (Mythic)',
			`position_x` = -226.8,
			`position_y` = 49.09,
			`position_z` = -46.03,
			`orientation` = 1.39;

	-- Uldaman (Heroic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 304;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 304,
			`name` = 'Uldaman (Heroic)',
			`position_x` = -226.8,
			`position_y` = 49.09,
			`position_z` = -46.03,
			`orientation` = 1.39;

-- Upper Blackrock Spire

	-- Upper Blackrock Spire (Mythic)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 370;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 370,
			`name` = 'Upper Blackrock Spire (Mythic)',
			`position_x` = 120.96,
			`position_y` = -344.5,
			`position_z` = 70.95,
			`orientation` = 0.78;

	-- Upper Blackrock Spire (Normal)
		DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 44;
		INSERT INTO `lfg_dungeon_template` SET
			`dungeonId` = 44,
			`name` = 'Upper Blackrock Spire (Normal)',
			`position_x` = 120.96,
			`position_y` = -344.5,
			`position_z` = 70.95,
			`orientation` = 0.78;

	-- Upper Blackrock Spire (Heroic)
	DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 314;
	INSERT INTO `lfg_dungeon_template` SET
		`dungeonId` = 314,
		`name` = 'Upper Blackrock Spire (Heroic)',
		`position_x` = 120.96,
		`position_y` = -344.5,
		`position_z` = 70.95,
		`orientation` = 0.78;