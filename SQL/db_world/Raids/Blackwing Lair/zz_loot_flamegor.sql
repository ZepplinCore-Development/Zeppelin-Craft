-- Flamegor Loot Table
    DELETE FROM `creature_loot_template` WHERE (`Entry` = 11981 AND `Item` = 900000);
    INSERT INTO `creature_loot_template` SET
        `Entry` = 11981,
        `Item` = 900000,
        `Reference` = 900000,
        `Comment` = 'Flamegor - Elementium Trinket Recipes';

-- Flamegor Skinning Table
    DELETE FROM `skinning_loot_template` WHERE (`Entry` = 11981);
    INSERT INTO `skinning_loot_template` SET
        `Entry` = 11981,
        `Item` = 57801,
        `MinCount` = 2,
        `MaxCount` = 4,
        `Comment` = 'Ancient Dragonscale';
