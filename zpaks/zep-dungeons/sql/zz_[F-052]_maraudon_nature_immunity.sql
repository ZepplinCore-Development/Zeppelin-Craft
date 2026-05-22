-- Remove nature immunity from Maraudon earth creatures, replace with 30 nature resistance
UPDATE `creature_template` SET `CreatureImmunitiesId` = -325 WHERE `entry` = 12201;
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` IN (11783, 11784);
UPDATE `creature_template` SET `CreatureImmunitiesId` = -229 WHERE `entry` = 12237;

DELETE FROM `creature_template_resistance` WHERE `CreatureID` IN (12201, 11783, 11784, 12237) AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES
(12201, 3, 30),
(11783, 3, 30),
(11784, 3, 30),
(12237, 3, 30);
