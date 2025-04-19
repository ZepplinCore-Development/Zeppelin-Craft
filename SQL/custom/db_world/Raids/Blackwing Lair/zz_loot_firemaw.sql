-- Elementium Recipe Reference Loot Table
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 900000);
    INSERT INTO `reference_loot_template` SET
        `Entry` = 900000,
        `Item` = 57500,
        `Chance` = 0,
        `GroupId` = 1,
        `Comment` = 'Design: Elementium Talisman';

    INSERT INTO `reference_loot_template` SET
        `Entry` = 900000,
        `Item` = 57001,
        `Chance` = 0,
        `GroupId` = 1,
        `Comment` = 'Plans: Elementium Aegis';

    INSERT INTO `reference_loot_template` SET
        `Entry` = 900000,
        `Item` = 57204,
        `Chance` = 0,
        `GroupId` = 1,
        `Comment` = 'Schematic: Elementium Targeting Matrix';

-- Firemaw Loot Table
    DELETE FROM `creature_loot_template` WHERE (`Entry` = 11983 AND `Item` = 900000);
    INSERT INTO `creature_loot_template` SET
        `Entry` = 11983,
        `Item` = 900000,
        `Reference` = 900000,
        `Comment` = 'Firemaw - Elementium Trinket Recipes';

-- Firemaw Skinning Loot Table
    DELETE FROM `skinning_loot_template` WHERE (`Entry` = 11983);
    INSERT INTO `skinning_loot_template` SET
        `Entry` = 11983,
        `Item` = 57801,
        `GroupId` = 1,
        `MinCount` = 2,
        `MaxCount` = 4,
        `Comment` = 'Firemaw - Ancient Dragonscale';





