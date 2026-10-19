-- [F-031] zep-professions: skillline
-- Lockpicking reclassified to secondary skills category

-- skillline: 1 updates
UPDATE `skillline` SET `category` = 9 WHERE `id` = 633;
