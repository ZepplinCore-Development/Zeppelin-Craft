-- reduce scale from 1 to 0.5, this boy is way too big for that tiny cave.
UPDATE `creature_template_model` SET `DisplayScale` = 0.5 WHERE (`CreatureID` = 17942);