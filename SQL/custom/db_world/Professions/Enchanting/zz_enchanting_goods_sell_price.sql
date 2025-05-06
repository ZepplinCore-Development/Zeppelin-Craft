-- Add a sell price to enchanting trade goods where it is missing.
    UPDATE `item_template` SET `SellPrice` = `BuyPrice` / 2 WHERE (`class` = 7 AND `subclass` = 12 AND `SellPrice` = 0);

