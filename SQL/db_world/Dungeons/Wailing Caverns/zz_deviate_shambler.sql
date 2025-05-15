-- Reduce magic resistances from 100 to 50 for Deviate Shambler
UPDATE `creature_template_resistance` SET `Resistance` = 50 WHERE (`CreatureID` = 5761);