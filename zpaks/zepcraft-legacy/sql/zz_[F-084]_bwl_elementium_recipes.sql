-- Elementium Recipe Reference Loot Table (shared by all 3 dragons)
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

-- Firemaw Elementium Recipes
DELETE FROM `creature_loot_template` WHERE (`Entry` = 11983 AND `Item` = 900000);
INSERT INTO `creature_loot_template` SET
    `Entry` = 11983,
    `Item` = 900000,
    `Reference` = 900000,
    `Comment` = 'Firemaw - Elementium Trinket Recipes';

-- Ebonroc Elementium Recipes
DELETE FROM `creature_loot_template` WHERE (`Entry` = 14601 AND `Item` = 900000);
INSERT INTO `creature_loot_template` SET
    `Entry` = 14601,
    `Item` = 900000,
    `Reference` = 900000,
    `Comment` = 'Ebonroc - Elementium Trinket Recipes';

-- Flamegor Elementium Recipes
DELETE FROM `creature_loot_template` WHERE (`Entry` = 11981 AND `Item` = 900000);
INSERT INTO `creature_loot_template` SET
    `Entry` = 11981,
    `Item` = 900000,
    `Reference` = 900000,
    `Comment` = 'Flamegor - Elementium Trinket Recipes';
