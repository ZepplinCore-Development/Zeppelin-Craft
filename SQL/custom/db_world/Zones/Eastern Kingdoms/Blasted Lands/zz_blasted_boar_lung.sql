-- Blasted Boar Lung
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8392);

-- Ashmane Boar Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5992) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5992, 0, 8392, 0);

-- Helboar Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5993) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5993, 0, 8392, 0);

-- Grunter Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8303) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8303, 0, 8392, 0);
