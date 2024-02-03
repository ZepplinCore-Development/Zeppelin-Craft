-- Snickerfang Jowl
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8391);

-- Snickerfang Hyena Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5985) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5985, 0, 8391, 0);

-- Ravage Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8300) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8300, 0, 8391, 0);

-- Starving Snickerfang Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5984) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5984, 0, 8391, 0);
