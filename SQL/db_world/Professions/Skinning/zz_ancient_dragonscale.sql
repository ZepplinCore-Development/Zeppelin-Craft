-- Ancient Dragonscale
    DELETE FROM `item_template` WHERE (`entry` = 57801);
    INSERT INTO `item_template`
    SET `entry` = 57801,
        `class` = 7, -- Tradegoods
        `subclass` = 6, -- Leather        
        `name` = 'Ancient Dragonscale',
        `displayid` = 140266,
        `Quality` = 3, -- Blue
        `BuyPrice` = 20000, -- 2G
        `SellPrice` = 5000, -- 50S
        `stackable` = 20;