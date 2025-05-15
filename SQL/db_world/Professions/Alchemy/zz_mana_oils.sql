-- Mana Oils stack to 200 and have a single charge. 

-- Exceptional Mana Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 36899);

-- Superior Mana Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 22521);

-- Brilliant Mana Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 20748);

-- Lesser Mana Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 20747);

-- Minor Mana Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 20745);