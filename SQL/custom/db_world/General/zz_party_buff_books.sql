-- Codex: Prayer of Fortitude I
UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17413);
DELETE FROM `spell_dbc` WHERE (`ID` = 21562);