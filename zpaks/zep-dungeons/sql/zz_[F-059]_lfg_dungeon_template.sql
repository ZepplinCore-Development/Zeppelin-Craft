-- [F-059] Sunken Temple Upper/Lower lfg_dungeon_template
-- Teleport locations for LFG dungeon finder
-- Both wings use the same entrance (single physical dungeon, map 109)

-- Sunken Temple Upper

    -- Sunken Temple Upper (Normal)
        DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 28;
        INSERT INTO `lfg_dungeon_template` SET
            `dungeonId` = 28,
            `name` = 'Sunken Temple Upper (Normal)',
            `position_x` = -319.24,
            `position_y` = 99.9,
            `position_z` = -131.85,
            `orientation` = 3.19;

    -- Sunken Temple Upper (Heroic)
        DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 307;
        INSERT INTO `lfg_dungeon_template` SET
            `dungeonId` = 307,
            `name` = 'Sunken Temple Upper (Heroic)',
            `position_x` = -319.24,
            `position_y` = 99.9,
            `position_z` = -131.85,
            `orientation` = 3.19;

    -- Sunken Temple Upper (Mythic)
        DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 363;
        INSERT INTO `lfg_dungeon_template` SET
            `dungeonId` = 363,
            `name` = 'Sunken Temple Upper (Mythic)',
            `position_x` = -319.24,
            `position_y` = 99.9,
            `position_z` = -131.85,
            `orientation` = 3.19;

-- Sunken Temple Lower

    -- Sunken Temple Lower (Normal)
        DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 455;
        INSERT INTO `lfg_dungeon_template` SET
            `dungeonId` = 455,
            `name` = 'Sunken Temple Lower (Normal)',
            `position_x` = -319.24,
            `position_y` = 99.9,
            `position_z` = -131.85,
            `orientation` = 3.19;

    -- Sunken Temple Lower (Heroic)
        DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 456;
        INSERT INTO `lfg_dungeon_template` SET
            `dungeonId` = 456,
            `name` = 'Sunken Temple Lower (Heroic)',
            `position_x` = -319.24,
            `position_y` = 99.9,
            `position_z` = -131.85,
            `orientation` = 3.19;

    -- Sunken Temple Lower (Mythic)
        DELETE FROM `lfg_dungeon_template` WHERE `dungeonId` = 457;
        INSERT INTO `lfg_dungeon_template` SET
            `dungeonId` = 457,
            `name` = 'Sunken Temple Lower (Mythic)',
            `position_x` = -319.24,
            `position_y` = 99.9,
            `position_z` = -131.85,
            `orientation` = 3.19;
