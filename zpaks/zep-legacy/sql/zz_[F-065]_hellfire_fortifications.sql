-- increase marks rewarded from 3 to 10 as PVP is not really viable.
-- 10106/10110/13410/13411: marks are RewardItem1
UPDATE `quest_template` SET `RewardAmount1` = 10 WHERE `ID` IN (10106, 10110, 13410, 13411);
-- 13408/13409: marks are RewardItem2 (RewardItem1 is a unique trinket, must be x1)
UPDATE `quest_template` SET `RewardAmount1` = 1, `RewardAmount2` = 10 WHERE `ID` IN (13408, 13409);