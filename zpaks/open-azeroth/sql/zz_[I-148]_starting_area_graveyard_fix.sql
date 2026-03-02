-- Open Azeroth added new parent areas for each starting zone and reshuffled
-- original sub-areas underneath them. The server does one level of parent zone
-- lookup for graveyard resolution, so areas nested under the new OA parents
-- can't find a graveyard and players get sent to distant fallback graveyards.

-- ============================================================================
-- GY 912 - Sunstrider Isle GY (Blood Elf starting area)
-- OA added 6455 (Sunstrider Isle) under Eversong Woods (3430)
-- Sub-areas of 6455: 3431, 3432, 3484, 3485
-- ============================================================================

    DELETE FROM `graveyard_zone` WHERE `ID` = 912 AND `GhostZone` IN (6455, 3431, 3432, 3484, 3485);
    INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `Faction`, `Comment`) VALUES
        (912, 6455, 0, 'Eversong Woods, Sunstrider Isle'),
        (912, 3431, 0, 'Eversong Woods, Sunstrider Isle (subzone)'),
        (912, 3432, 0, 'Eversong Woods, Shrine of Dath''Remar'),
        (912, 3484, 0, 'Eversong Woods, The Sunspire'),
        (912, 3485, 0, 'Eversong Woods, Falthrien Academy');

-- ============================================================================
-- GY 709 - Valley of Trials GY (Orc starting area)
-- OA added 6451 (Valley of Trials) under Durotar (14)
-- Sub-areas of 6451: 363 (Valley of Trials), 364 (The Den)
-- ============================================================================

    DELETE FROM `graveyard_zone` WHERE `ID` = 709 AND `GhostZone` IN (6451, 363, 364);
    INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `Faction`, `Comment`) VALUES
        (709, 6451, 67, 'Durotar, Valley of Trials'),
        (709, 363, 67, 'Durotar, Valley of Trials (subzone)'),
        (709, 364, 67, 'Durotar, The Den');

-- ============================================================================
-- GY 94 - Deathknell GY (Undead starting area)
-- OA added 6454 (Deathknell) under Tirisfal Glades (85)
-- Sub-areas of 6454: 154 (Deathknell), 155 (Night Web's Hollow),
--                     4915 (Rotbrain Encampment), 5692 (The Deathknell Graves)
-- ============================================================================

    DELETE FROM `graveyard_zone` WHERE `ID` = 94 AND `GhostZone` IN (6454, 154, 155, 4915, 5692);
    INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `Faction`, `Comment`) VALUES
        (94, 6454, 67, 'Tirisfal Glades, Deathknell'),
        (94, 154, 67, 'Tirisfal Glades, Deathknell (subzone)'),
        (94, 155, 67, 'Tirisfal Glades, Night Web''s Hollow'),
        (94, 4915, 67, 'Tirisfal Glades, Rotbrain Encampment'),
        (94, 5692, 67, 'Tirisfal Glades, The Deathknell Graves');

-- ============================================================================
-- GY 918 - Ammen Vale GY (Draenei starting area)
-- OA added 6456 (Ammen Vale) under Azuremyst Isle (3524)
-- Sub-areas of 6456: 3526 (Ammen Vale)
-- ============================================================================

    DELETE FROM `graveyard_zone` WHERE `ID` = 918 AND `GhostZone` IN (6456, 3526);
    INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `Faction`, `Comment`) VALUES
        (918, 6456, 0, 'Azuremyst Isle, Ammen Vale'),
        (918, 3526, 0, 'Azuremyst Isle, Ammen Vale (subzone)');
