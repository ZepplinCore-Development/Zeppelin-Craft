UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0 WHERE (`ID` = 10551);
UPDATE `quest_template` SET `RewardFactionOverride1` = 0 WHERE (`ID` = 10551);
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0 WHERE (`ID` = 10552);
UPDATE `quest_template` SET `RewardFactionOverride1` = 0 WHERE (`ID` = 10552);
UPDATE `reputation_spillover_template` SET `faction`=932, `faction1`=935, `rate_1`=0.5, `rank_1`=4, `faction2`=0, `rate_2`=0, `rank_2`=0 WHERE `faction`=932;
UPDATE `reputation_spillover_template` SET `faction`=934, `faction1`=935, `rate_1`=0.5, `rank_1`=4, `faction2`=0, `rate_2`=0, `rank_2`=0 WHERE `faction`=934;
