SET @CLASSIC_HEROIC_SATCHEL = 58300,
    @CLASSIC_MYTHIC_SATCHEL = 58301,
    @OUTLAND_HEROIC_SATCHEL = 58302,
    @OUTLAND_MYTHIC_SATCHEL = 58303,    
    @NORTHREND_HEROIC_SATCHEL = 58304,
    @NORTHREND_MYTHIC_SATCHEL = 58305;

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
        `StatsCount` = 0,
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
            `StatsCount` = 0,
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

-- Outland Heroic

    DELETE FROM `item_template` WHERE (`entry` = @OUTLAND_HEROIC_SATCHEL);
    INSERT INTO `item_template` SET
        `entry` = @OUTLAND_HEROIC_SATCHEL,
        `class` = 15,
        `name` = 'Satchel of Helpful Goods',
        `displayid` = 56915,
        `Quality` = 3,
        `Flags` = 4,
        `ItemLevel` = 70,
        `StatsCount` = 0,
        `delay` = 0,
        `bonding` = 1,
        `Material` = 4,
        `VerifiedBuild` = '11159';

    DELETE FROM `item_loot_template` WHERE (`Entry` = @OUTLAND_HEROIC_SATCHEL);
    INSERT INTO `item_loot_template` SET
        `Entry` = @OUTLAND_HEROIC_SATCHEL,
        `Item` = 1,
        `Reference` = 10058,
        `GroupId` = 1,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @OUTLAND_HEROIC_SATCHEL,
        `Item` = 2,
        `Reference` = 10059,
        `GroupId` = 2,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @OUTLAND_HEROIC_SATCHEL,
        `Item` = 3,
        `Reference` = 10060,
        `GroupId` = 3,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @OUTLAND_HEROIC_SATCHEL,
        `Item` = 4,
        `Reference` = 10061,
        `GroupId` = 4,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

-- Outland Mythic

-- Northrend Heroic

-- Northrend Mythic