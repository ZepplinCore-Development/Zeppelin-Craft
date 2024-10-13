-- Codex: Prayer of Fortitude I
UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17413);
DELETE FROM `spell_dbc` WHERE (`ID` = 21562);

-- Codex: Prayer of Fortitude II
UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17414);
DELETE FROM `spell_dbc` WHERE (`ID` = 21564);

-- Codex: Prayer of Fortitude III
UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 29549);