-- Prayer of Fortitude

    -- Codex: Prayer of Fortitude I
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17413);
        DELETE FROM `spell_dbc` WHERE (`ID` = 21562);

    -- Codex: Prayer of Fortitude II
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17414);
        DELETE FROM `spell_dbc` WHERE (`ID` = 21564);

    -- Codex: Prayer of Fortitude III
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 29549);
        DELETE FROM `spell_dbc` WHERE (`ID` = 25392);

-- Gift of the Wild

    -- Book: Gift of the Wild I
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17682);
        DELETE FROM `spell_dbc` WHERE (`ID` = 21849);
        
    -- Book: Gift of the Wild II
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17683);
        DELETE FROM `spell_dbc` WHERE (`ID` = 21850);
        
    -- Book: Gift of the Wild III
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 22146);
        DELETE FROM `spell_dbc` WHERE (`ID` = 26991);

-- Arcane Brilliance

    -- Book: Arcane Brilliance I
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 18600);
        DELETE FROM `spell_dbc` WHERE (`ID` = 23028);
        
    -- Book: Arcane Brilliance II
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 22153);
        DELETE FROM `spell_dbc` WHERE (`ID` = 27127);
        
    -- Book: Arcane Brilliance III
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 33316);
        DELETE FROM `spell_dbc` WHERE (`ID` = 43002);