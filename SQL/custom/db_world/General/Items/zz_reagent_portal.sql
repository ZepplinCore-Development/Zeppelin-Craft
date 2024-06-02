-- Reagent Portal
    DELETE FROM `item_template` WHERE (`entry` = 902328);
    INSERT INTO `item_template`
    SET `entry` = 902328,
        `name` = 'Reagent Portal',
        `description` = 'The techno-sorcery of Justurn is now yours to command.',
        `displayid` = 67105,
        `Quality` = 4, -- EPIC
        `bonding` = 1, -- BOP
        `class` = 15, -- Misc
        `maxcount` = 1,
        `flags` = 64,
        `spellid_1` = 75136,
        `spellcooldown_1` = 900000;