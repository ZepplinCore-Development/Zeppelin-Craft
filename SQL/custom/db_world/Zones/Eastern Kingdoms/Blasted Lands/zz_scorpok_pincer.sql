-- Scorpok Pincer
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8393);

-- Scorpok Stinger Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5988) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5988, 0, 8393, 0);

-- Clack the Reaver Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8301) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8301, 0, 8393, 0);

