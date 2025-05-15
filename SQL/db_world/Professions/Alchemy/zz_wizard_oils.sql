-- Wizard Oils stack to 200 and have a single charge. 

-- Exceptional Wizard Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 36900);

-- Superior Wizard Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 22522);

-- Brilliant Wizard Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 20749);

-- Lesser Wizard Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 20746);

-- Minor Wizard Oil
UPDATE `item_template` SET `stackable` = 200, `spellcharges_1` = -1 WHERE (`entry` = 20744);