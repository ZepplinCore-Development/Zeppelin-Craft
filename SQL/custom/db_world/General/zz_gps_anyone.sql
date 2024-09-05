-- Anyone can use GPS command
UPDATE `command` SET `security` = 0 WHERE name = 'gps';