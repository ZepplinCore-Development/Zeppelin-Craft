-- Remove Deatholme Necromancer near Dar'Khan Drathir
DELETE FROM `creature` WHERE (`id` = 16317) AND (`guid` IN (82879, 82915));
