-- Ancient Dragonscale skinning drops from BWL dragons

-- Firemaw
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 11983);
INSERT INTO `skinning_loot_template` SET
    `Entry` = 11983,
    `Item` = 57801,
    `GroupId` = 1,
    `MinCount` = 2,
    `MaxCount` = 4,
    `Comment` = 'Firemaw - Ancient Dragonscale';

-- Ebonroc
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 14601);
INSERT INTO `skinning_loot_template` SET
    `Entry` = 14601,
    `Item` = 57801,
    `GroupId` = 1,
    `MinCount` = 2,
    `MaxCount` = 4,
    `Comment` = 'Ebonroc - Ancient Dragonscale';

-- Flamegor
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 11981);
INSERT INTO `skinning_loot_template` SET
    `Entry` = 11981,
    `Item` = 57801,
    `MinCount` = 2,
    `MaxCount` = 4,
    `Comment` = 'Flamegor - Ancient Dragonscale';
