-- Increased drop chance  of the scout report from 5% to 15%.
DELETE FROM `creature_loot_template` WHERE (`Entry` = 18124 AND `Item` = 24373);
INSERT INTO `creature_loot_template` SET
    `Entry` = 18124,
    `Item` = 24373,
    `Chance` = 15,
    `QuestRequired` = 1,
    `Comment` = 'Withered Giant - Scout Jyobas Report';