-- F-066: Remove Hearthstone (6948) from CharStartOutfit
-- F-066 deletes the Hearthstone from item_template, so CharStartOutfit
-- references to it must also be cleared to suppress startup warnings.

UPDATE `charstartoutfit` SET `item_1` = -1 WHERE `item_1` = 6948;
UPDATE `charstartoutfit` SET `item_2` = -1 WHERE `item_2` = 6948;
UPDATE `charstartoutfit` SET `item_3` = -1 WHERE `item_3` = 6948;
UPDATE `charstartoutfit` SET `item_4` = -1 WHERE `item_4` = 6948;
UPDATE `charstartoutfit` SET `item_5` = -1 WHERE `item_5` = 6948;
UPDATE `charstartoutfit` SET `item_6` = -1 WHERE `item_6` = 6948;
UPDATE `charstartoutfit` SET `item_7` = -1 WHERE `item_7` = 6948;
UPDATE `charstartoutfit` SET `item_8` = -1 WHERE `item_8` = 6948;
UPDATE `charstartoutfit` SET `item_9` = -1 WHERE `item_9` = 6948;
UPDATE `charstartoutfit` SET `item_10` = -1 WHERE `item_10` = 6948;
UPDATE `charstartoutfit` SET `item_11` = -1 WHERE `item_11` = 6948;
UPDATE `charstartoutfit` SET `item_12` = -1 WHERE `item_12` = 6948;
UPDATE `charstartoutfit` SET `item_13` = -1 WHERE `item_13` = 6948;
UPDATE `charstartoutfit` SET `item_14` = -1 WHERE `item_14` = 6948;
UPDATE `charstartoutfit` SET `item_15` = -1 WHERE `item_15` = 6948;
UPDATE `charstartoutfit` SET `item_16` = -1 WHERE `item_16` = 6948;
UPDATE `charstartoutfit` SET `item_17` = -1 WHERE `item_17` = 6948;
UPDATE `charstartoutfit` SET `item_18` = -1 WHERE `item_18` = 6948;
UPDATE `charstartoutfit` SET `item_19` = -1 WHERE `item_19` = 6948;
UPDATE `charstartoutfit` SET `item_20` = -1 WHERE `item_20` = 6948;
UPDATE `charstartoutfit` SET `item_21` = -1 WHERE `item_21` = 6948;
UPDATE `charstartoutfit` SET `item_22` = -1 WHERE `item_22` = 6948;
UPDATE `charstartoutfit` SET `item_23` = -1 WHERE `item_23` = 6948;
UPDATE `charstartoutfit` SET `item_24` = -1 WHERE `item_24` = 6948;
