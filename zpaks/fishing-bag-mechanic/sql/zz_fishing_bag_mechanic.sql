-- [F-157] fishing-bag-mechanic: item_template
-- Convert Big Iron Fishing Pole (6367) from weapon to reagent/tool
-- class 5 = Reagent, subclass 1 = Reagent, InventoryType 0 = Non-equippable
-- Clear weapon damage fields, set TotemCategory 221

UPDATE `item_template` SET
  `class` = 5,
  `subclass` = 1,
  `InventoryType` = 0,
  `TotemCategory` = 221,
  `dmg_min1` = 0,
  `dmg_max1` = 0,
  `dmg_type1` = 0,
  `delay` = 0,
  `sheath` = 0
WHERE `entry` = 6367;
