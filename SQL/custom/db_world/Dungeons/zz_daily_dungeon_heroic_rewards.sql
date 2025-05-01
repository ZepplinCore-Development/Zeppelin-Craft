-- Adds Azerite Shards to the reward table for Outland Heroic Dungeon Daily quests.
UPDATE `quest_template` 
SET `RewardItem2` = 58302, 
    `RewardAmount2` = 4 
WHERE `ID` IN (
    SELECT `entry` 
    FROM `pool_quest` 
    WHERE `pool_entry` = 356
);