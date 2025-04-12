SET @BADGE_OF_HEROISM = 58200,
    @HEROIC_SATCHEL = 58300,
    @MYTHIC_SATCHEL = 58301;

-- Classic Random 5-15 AND Classic Random 15-25
    DELETE FROM `item_loot_template` WHERE (`Entry` = 51999 AND `Item` = @BADGE_OF_HEROISM);
    INSERT INTO `item_loot_template` SET
        `Entry` = 51999,
        `Item` = @BADGE_OF_HEROISM,
        `Comment` = 'Satchel of Helpful Goods - Badge of Heroism';

-- Classic Random 24-34
    DELETE FROM `item_loot_template` WHERE (`Entry` = 52000 AND `Item` = @BADGE_OF_HEROISM);
    INSERT INTO `item_loot_template` SET
        `Entry` = 52000,
        `Item` = @BADGE_OF_HEROISM,
        `Comment` = 'Satchel of Helpful Goods - Badge of Heroism';

-- Classic Random 35-45
    DELETE FROM `item_loot_template` WHERE (`Entry` = 52001 AND `Item` = @BADGE_OF_HEROISM);
    INSERT INTO `item_loot_template` SET
        `Entry` = 52001,
        `Item` = @BADGE_OF_HEROISM,
        `Comment` = 'Satchel of Helpful Goods - Badge of Heroism';

-- Classic Random 46-55
    DELETE FROM `item_loot_template` WHERE (`Entry` = 52002 AND `Item` = @BADGE_OF_HEROISM);
    INSERT INTO `item_loot_template` SET
        `Entry` = 52002,
        `Item` = @BADGE_OF_HEROISM,
        `Comment` = 'Satchel of Helpful Goods - Badge of Heroism';

-- Classic Random 56-60
    DELETE FROM `item_loot_template` WHERE (`Entry` = 52003 AND `Item` = @BADGE_OF_HEROISM);
    INSERT INTO `item_loot_template` SET
        `Entry` = 52003,
        `Item` = @BADGE_OF_HEROISM,
        `Comment` = 'Satchel of Helpful Goods - Badge of Heroism';

-- Classic Random Heroic
    DELETE FROM `item_template` WHERE (`entry` = @HEROIC_SATCHEL);
    INSERT INTO `item_template` SET
        `entry` = @HEROIC_SATCHEL,
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

    DELETE FROM `item_loot_template` WHERE (`Entry` = @HEROIC_SATCHEL);
    INSERT INTO `item_loot_template` SET
        `Entry` = @HEROIC_SATCHEL,
        `Item` = 1,
        `Reference` = 10050,
        `GroupId` = 1,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @HEROIC_SATCHEL,
        `Item` = 2,
        `Reference` = 10051,
        `GroupId` = 2,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @HEROIC_SATCHEL,
        `Item` = 3,
        `Reference` = 10052,
        `GroupId` = 3,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @HEROIC_SATCHEL,
        `Item` = 4,
        `Reference` = 10053,
        `GroupId` = 4,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @HEROIC_SATCHEL,
        `Item` = @BADGE_OF_HEROISM,
        `Comment` = 'Satchel of Helpful Goods - Badge of Heroism';

-- Classic Random Mythic
    DELETE FROM `item_template` WHERE (`entry` = @MYTHIC_SATCHEL);
        INSERT INTO `item_template` SET
            `entry` = @MYTHIC_SATCHEL,
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

    DELETE FROM `item_loot_template` WHERE (`Entry` = @MYTHIC_SATCHEL);

    INSERT INTO `item_loot_template` SET
        `Entry` = @MYTHIC_SATCHEL,
        `Item` = 1,
        `Reference` = 10050,
        `GroupId` = 1,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @MYTHIC_SATCHEL,
        `Item` = 2,
        `Reference` = 10051,
        `GroupId` = 2,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @MYTHIC_SATCHEL,
        `Item` = 3,
        `Reference` = 10052,
        `GroupId` = 3,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @MYTHIC_SATCHEL,
        `Item` = 4,
        `Reference` = 10053,
        `GroupId` = 4,
        `Comment` = 'Satchel of Helpful Goods - (ReferenceTable)';

    INSERT INTO `item_loot_template` SET
        `Entry` = @MYTHIC_SATCHEL,
        `Item` = @BADGE_OF_HEROISM,
        `Comment` = 'Satchel of Helpful Goods - Badge of Heroism';