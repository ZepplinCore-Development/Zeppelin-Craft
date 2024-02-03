-- Basilisk Brain
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8394);

-- Redstone Basilisk Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5990) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5990, 0, 8394, 0);

-- Redstone Crystalhide Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5991) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5991, 0, 8394, 0);

-- Deatheye Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8302) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8302, 0, 8394, 0);
