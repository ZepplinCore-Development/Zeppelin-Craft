UPDATE `creature_template` SET `mingold` = 0, `maxgold` = 0
WHERE `mingold` < 10000 AND `maxgold` < 10000;