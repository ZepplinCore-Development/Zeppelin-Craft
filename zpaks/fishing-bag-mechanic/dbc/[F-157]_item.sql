-- [F-157] fishing-bag-mechanic: item
-- Sync DBC item table for Big Iron Fishing Pole (6367) to match world DB change
-- class 5, subclass 1, inventory_type 0, sheath 0

-- item: 1 update
UPDATE `item` SET `class` = 5, `subclass` = 1, `inventory_type` = 0, `sheath` = 0 WHERE `id` = 6367;
