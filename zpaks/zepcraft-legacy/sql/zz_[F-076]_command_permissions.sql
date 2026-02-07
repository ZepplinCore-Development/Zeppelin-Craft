-- Anyone can use GPS command
UPDATE `command` SET `security` = 0 WHERE name = 'gps';

-- Anyone can use NPC command
UPDATE `command` SET `security` = 0 WHERE name = 'npc';

-- Anyone can use NPC GUID command
UPDATE `command` SET `security` = 0 WHERE name = 'npc guid';

-- Anyone can use NPC INFO command
UPDATE `command` SET `security` = 0 WHERE name = 'npc info';