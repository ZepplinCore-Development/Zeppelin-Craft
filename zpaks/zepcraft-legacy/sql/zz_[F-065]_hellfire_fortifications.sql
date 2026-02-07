-- increase marks rewarded from 3 to 10 as PVP is not really viable.
UPDATE `quest_template` SET `RewardAmount1` = 10 WHERE `ID` IN (10106, 10110, 13408, 13409, 13410, 13411);