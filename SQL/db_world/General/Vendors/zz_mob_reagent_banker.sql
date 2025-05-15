
-- Reagent Banker - Template
DELETE FROM `creature_template` WHERE (`entry` = 190011);
INSERT INTO creature_template SET
    `entry` = 190011,
    `name` = 'Vitalik',
    `subname` = 'Reagent Bank',
    `minlevel` = 6,
    `maxlevel` = 6,
    `faction` = 35,
    `npcflag` = 1,
    `speed_run` = 1.0,
    `BaseAttackTime` = 2000,
    `unit_class` = 1,
    `type` = 7,
    `type_flags` = 138412032,
    `flags_extra` = 2,
    `ScriptName` = 'npc_reagent_banker_account';

DELETE FROM creature_template_model WHERE `CreatureID` = 190011;
INSERT INTO creature_template_model SET
    `CreatureID` = '190011',
    `idx` = 1,
    `CreatureDisplayID` = '20988',
    `probability` = 1.0;

-- Reagent Banker - Spawns
DELETE FROM `creature` WHERE (`id1` = 190011);
DELETE FROM `creature` WHERE (`id1` = 190012);
INSERT INTO `creature` (`id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(190011,0,0,1,0,0,1,1,0,1655.42,-4439.59,18.598,2.0365,300,0.0,0,120,0,0,0,0,0,'',NULL),
(190011,0,0,530,0,0,1,1,0,9551.35,-7500.14,16.2567,0.0199656,300,0.0,0,120,0,0,0,0,0,'',NULL),
(190011,0,0,1,0,0,1,1,0,9949.61,2496.38,1317.52,4.73746,300,0.0,0,97,0,0,0,0,0,'',NULL),
(190011,0,0,530,0,0,1,1,0,-3904.94,-11596.1,-137.214,4.75951,300,0.0,0,97,0,0,0,0,0,'',NULL),
(190011,0,0,0,0,0,1,1,0,-8881.28,632.179,96.4776,0.327091,300,0.0,0,97,0,0,0,0,0,'',NULL),
(190011,0,0,0,0,0,1,1,0,-4892.00,-962.62,502.60,2.24261,300,0.0,0,97,0,0,0,0,0,'',NULL), -- Ironforge
(190011,0,0,1,0,0,1,1,0,-1252.57,47.6004,127.095,3.31421,300,0.0,0,97,0,0,0,0,0,'',NULL),
(190011,0,0,0,0,0,1,1,0,1597.11,276.688,-55.3425,4.61282,300,0.0,0,97,0,0,0,0,0,'',NULL),
(190011,0,0,530,0,0,1,1,0,9722.21,-7501.23,13.5123,0.663381,300,0.0,0,97,0,0,0,0,0,'',NULL),
(190011,0,0,530,0,0,1,1,0,-1749.1,5511.45,-12.4276,3.12819,300,0.0,0,97,0,0,0,0,0,'',NULL),
(190011,0,0,530,0,0,1,1,0,-1999.65,5388.08,-12.4277,1.21575,300,0.0,0,97,0,0,0,0,0,'',NULL),
(190011,0,0,571,0,0,1,1,0,5909.68,621.168,646.725,5.69266,300,0.0,0,120,0,0,0,0,0,'',NULL),
(190011,0,0,0,0,0,1,1,0,-14467.0,453.038,15.3399,0.674248,300,0.0,0,120,0,0,0,0,0,'',NULL), -- Booty Bay
(190011,0,0,571,0,0,1,1,0,5705.02,651.497,646.234,2.16229,300,0.0,0,120,0,0,0,0,0,'',NULL);