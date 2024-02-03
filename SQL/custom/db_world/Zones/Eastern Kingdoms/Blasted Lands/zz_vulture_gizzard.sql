-- Vulture Gizzard
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8396);

-- Spiteflayer Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8299) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8299, 0, 8396, 0);

-- Black Slayer Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5982) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5982, 0, 8396, 0);

