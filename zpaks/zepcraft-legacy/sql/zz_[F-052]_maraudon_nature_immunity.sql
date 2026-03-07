-- Remove nature immunity from Maraudon earth creatures, replace with 30 nature resistance
UPDATE `creature_template` SET `spell_school_immune_mask` = 0 WHERE `entry` IN (12201, 11783, 11784, 12237);

DELETE FROM `creature_template_resistance` WHERE `CreatureID` IN (12201, 11783, 11784, 12237) AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES
(12201, 3, 30),
(11783, 3, 30),
(11784, 3, 30),
(12237, 3, 30);
