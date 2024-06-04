-- reduce scale from 1 to 0.5, this boy is way too big for that tiny cave.
UPDATE `creature_template` SET `scale` = 0.5 WHERE (`entry` = 17942);