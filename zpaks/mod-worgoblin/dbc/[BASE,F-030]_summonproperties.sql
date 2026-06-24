-- [BASE,F-030] mod-worgoblin: summonproperties
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-030]_summonproperties.sql with overrides

-- summonproperties: 1 inserts, 0 updates, 0 deletes
DELETE FROM `summonproperties` WHERE `id` = 2421;
INSERT INTO `summonproperties` (`id`, `control`, `faction`, `title`, `slot`, `flags`) VALUES (2421, 1, 0, 0, 0, 2320);