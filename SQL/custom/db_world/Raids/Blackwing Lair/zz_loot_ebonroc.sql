-- Ebonroc Loot Table
    DELETE FROM `creature_loot_template` WHERE (`Entry` = 14601 AND `Item` = 900000);
    INSERT INTO `creature_loot_template` SET
        `Entry` = 14601,
        `Item` = 900000,
        `Reference` = 900000,
        `Comment` = 'Ebonroc - Elementium Trinket Recipes';

-- Ebonroc Skinning Table
    DELETE FROM `skinning_loot_template` WHERE (`Entry` = 14601);
    INSERT INTO `skinning_loot_template` SET
        `Entry` = 14601,
        `Item` = 57801,
        `GroupId` = 1,
        `MinCount` = 2,
        `MaxCount` = 4,
        `Comment` = 'Ebonroc - Ancient Dragonscale';
