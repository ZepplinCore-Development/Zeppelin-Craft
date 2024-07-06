-- Clam Knight Conch - Item Template
    DELETE FROM `item_template` WHERE (`entry` = 902329);
    INSERT INTO `item_template`
    SET `entry` = 902329,
        `name` = 'Clam Knight Conch',
        `displayid` = 7177,
        `Quality` = 4, -- EPIC
        `Flags` = 4, -- Has Loot
        `bonding` = 1, -- BOP
        `class` = 16; -- MISC  

-- Clam Knight Conch - loot
DELETE FROM `item_loot_template` WHERE (`Entry` = 902329) AND (`Item` IN (57000, 902327, 902328));
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(902329, 57000, 0, 100, 0, 1, 4, 1, 1, 'Compressed Thermal Anvil'),
(902329, 902327, 0, 100, 0, 1, 5, 1, 1, 'Portable Guild Bank'),
(902329, 902328, 0, 100, 0, 1, 2, 1, 1, 'Reagent Portal');