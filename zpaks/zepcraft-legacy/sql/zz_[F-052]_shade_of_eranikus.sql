-- Deep Slumber is cast on  a random player that does not have the highest threat
UPDATE `smart_scripts` SET `target_type` = 6 WHERE (`entryorguid` = 5709) AND (`action_param1` = 12890);
