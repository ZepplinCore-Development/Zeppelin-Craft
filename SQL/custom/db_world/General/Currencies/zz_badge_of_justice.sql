-- remove the required level of 70 from badge of justice
UPDATE `item_template` SET `RequiredLevel` = 0 WHERE (`entry` = 29434);