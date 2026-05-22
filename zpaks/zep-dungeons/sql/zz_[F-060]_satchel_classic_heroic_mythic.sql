SET @CLASSIC_HEROIC_SATCHEL = 58300,
    @CLASSIC_MYTHIC_SATCHEL = 58301;

-- Classic Heroic
    DELETE FROM `item_template` WHERE (`entry` = @CLASSIC_HEROIC_SATCHEL);
    INSERT INTO `item_template` SET
        `entry` = @CLASSIC_HEROIC_SATCHEL,
        `class` = 15,
        `name` = 'Satchel of Helpful Goods',
        `displayid` = 56915,
        `Quality` = 3,
        `Flags` = 4,
        `ItemLevel` = 57,
        `delay` = 0,
        `bonding` = 1,
        `Material` = 4,
        `VerifiedBuild` = '11159';

    DELETE FROM `item_loot_template` WHERE (`Entry` = @CLASSIC_HEROIC_SATCHEL);
    INSERT INTO `item_loot_template` SET
        `Entry` = @CLASSIC_HEROIC_SATCHEL,
        `Item` = 1,
        `Reference` = 10050,
        `GroupId` = 1,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @CLASSIC_HEROIC_SATCHEL,
        `Item` = 2,
        `Reference` = 10051,
        `GroupId` = 2,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @CLASSIC_HEROIC_SATCHEL,
        `Item` = 3,
        `Reference` = 10052,
        `GroupId` = 3,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @CLASSIC_HEROIC_SATCHEL,
        `Item` = 4,
        `Reference` = 10053,
        `GroupId` = 4,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

-- Classic Mythic
    DELETE FROM `item_template` WHERE (`entry` = @CLASSIC_MYTHIC_SATCHEL);
        INSERT INTO `item_template` SET
            `entry` = @CLASSIC_MYTHIC_SATCHEL,
            `class` = 15,
            `name` = 'Satchel of Helpful Goods',
            `displayid` = 56915,
            `Quality` = 3,
            `Flags` = 4,
            `ItemLevel` = 57,
            `delay` = 0,
            `bonding` = 1,
            `Material` = 4,
            `VerifiedBuild` = '11159';

    DELETE FROM `item_loot_template` WHERE (`Entry` = @CLASSIC_MYTHIC_SATCHEL);

    INSERT INTO `item_loot_template` SET
        `Entry` = @CLASSIC_MYTHIC_SATCHEL,
        `Item` = 1,
        `Reference` = 10050,
        `GroupId` = 1,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @CLASSIC_MYTHIC_SATCHEL,
        `Item` = 2,
        `Reference` = 10051,
        `GroupId` = 2,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @CLASSIC_MYTHIC_SATCHEL,
        `Item` = 3,
        `Reference` = 10052,
        `GroupId` = 3,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @CLASSIC_MYTHIC_SATCHEL,
        `Item` = 4,
        `Reference` = 10053,
        `GroupId` = 4,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';
