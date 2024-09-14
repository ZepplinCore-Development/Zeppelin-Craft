-- Dark Iron Residue stacks to 2000
UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 18945);

-- Dark Iron Scraps stacks to 2000
UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 22528);

-- Cryptfiend Parts stacks to 2000
UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 22525);

-- Bone Fragments stacks to 2000
UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 22526);

-- Libram of Rumination stacks to 20, non unique
UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11732);

-- Libram of Constitution stacks to 20, non unique
UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11733);

-- Libram of Tenacity stacks to 20, non unique
UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11734);

-- Libram of Resilience stacks to 20, non unique
UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11736);

-- Libram of Voracity stacks to 20, non unique
UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11737);

-- Libram of Rapidity stacks to 20, non unique
UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 18332);

-- Libram of Focus stacks to 20, non unique
UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 18333);

-- Libram of Protection stacks to 20, non unique
UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 18334);

-- Increases stack sizes to 200 where it is currently 20.
UPDATE `item_template` SET `stackable` = 200 WHERE (`stackable` = 20);