-- Formula: Mystic Resonator
    DELETE FROM `item_template` WHERE (`entry` = 902312);
    INSERT INTO `item_template`
    SET `entry` = 902312,
        `class` = 9, -- Recipe
        `subclass` = 8, -- Enchanting
        `name` = 'Formula: Mystic Resonator',
        `displayid` = 1301,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 4, -- Epic
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 333, -- Enchanting
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 72559,
        `spelltrigger_2` = 6;

-- Mystic Resonator
    DELETE FROM `item_template` WHERE (`entry` = 902313);
    INSERT INTO `item_template`
    SET `entry` = 902313,
        `class` = 0, -- Consumable
        `subclass` = 6, -- Item Enhancement
        `SellPrice` = 100000, -- 10G       
        `name` = 'Mystic Resonator',
        `description` = '|cff00ff00Use: Adds or re-rolls an extra stat on to an item.|n|n|cffff0000WARNING: This will replace any extra stats with a new one.',
        `displayid` = 23286,
        `stackable` = 20,
        `Quality` = 4, -- Epic
        `Flags` = 32832, -- PLAYERCAST + NO DISENCHANT
        `bonding` = 1, -- BOE
        `spellid_1` = 10694,
        `spellcharges_1` = -1;