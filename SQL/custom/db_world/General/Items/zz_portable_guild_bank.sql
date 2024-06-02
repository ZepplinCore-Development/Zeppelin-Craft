-- Portable Guild Bank
    DELETE FROM `item_template` WHERE (`entry` = 902327);
    INSERT INTO `item_template`
    SET `entry` = 902327,
        `name` = 'Portable Guild Bank',
        `description` = 'Sharing has never been easier',
        `displayid` = 32549,
        `Quality` = 4, -- EPIC
        `bonding` = 1, -- BOP
        `class` = 15, -- Misc
        `maxcount` = 1,
        `flags` = 64,
        `spellid_1` = 42766,
        `spellcooldown_1` = 900000;