-- F-097: Bump Thresher Oil drop rate to 80% for Young Murk Thresher
UPDATE `creature_loot_template` SET `Chance` = 80 WHERE `Entry` = 4388 AND `Item` = 33126;
