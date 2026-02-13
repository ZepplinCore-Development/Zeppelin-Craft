-- F-071: Swirl (Racial Traits Swapper) - Capital City Spawns
DELETE FROM `creature` WHERE (`id1` = 98888);
INSERT INTO `creature` (`id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(98888,0,0,0,0,0,1,1,0,-8414.8,649.0,97.4,0.59,300,0.0,0,12600,0,0,0,0,0,'',NULL),              -- Stormwind
(98888,0,0,0,0,0,1,1,0,-4771.4,-926.9,503.7,1.27,300,0.0,0,12600,0,0,0,0,0,'',NULL),              -- Ironforge
(98888,0,0,1,0,0,1,1,0,10187.6,2262.5,1346.6,2.55,300,0.0,0,12600,0,0,0,0,0,'',NULL),             -- Darnassus
(98888,0,0,1,0,0,1,1,0,5648.4,6469.6,-136.7,2.41,300,0.0,0,12600,0,0,0,0,0,'',NULL),              -- Exodar
(98888,0,0,1,0,0,1,1,0,1740.3,-4378.3,36.0,3.28,300,0.0,0,12600,0,0,0,0,0,'',NULL),              -- Orgrimmar
(98888,0,0,0,0,0,1,1,0,1558.4,421.6,-62.1,4.96,300,0.0,0,12600,0,0,0,0,0,'',NULL),               -- Undercity
(98888,0,0,1,0,0,1,1,0,-947.5,256.9,97.2,4.03,300,0.0,0,12600,0,0,0,0,0,'',NULL),                -- Thunder Bluff
(98888,0,0,0,0,0,1,1,0,7678.4,-5315.2,15.0,0.85,300,0.0,0,12600,0,0,0,0,0,'',NULL);              -- Silvermoon City
