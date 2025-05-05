-- The scale of Mutations in Botanica was far too small (1).
UPDATE `creature_template_model` SET `DisplayScale` = 2 WHERE `CreatureID` IN (19513, 19865, 19598, 21560, 21562, 21561);