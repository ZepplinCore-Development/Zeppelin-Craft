-- ============================================================================
-- F-214 mail heirlooms - the per-slot pieces missing from the hunter set
-- ============================================================================
-- Stock 3.3.5a hunter heirlooms cover shoulders (42950 Champion Herod's
-- Shoulder), chest (48677 Champion's Deathdealer Breastplate), weapons and a
-- trinket. These add head/legs/feet/waist/hands/wrists in mail, on F-215's
-- per-slot armour bits:
--   0x00000001  stat budget: shoulder curve (stats from SSD 8, Champion Herod's
--               Shoulder - per-slot stat weights are later F-214 work)
--   0x00400000  armour material: mail (chest curve)
--   slot bit    0x01000000 head 13/16 .. 0x20000000 wrists 7/16
-- Armour applied by the core (ScalingStatValuesEntry::getArmorMod) and shown
-- by the client through WarcraftXL wxl-heirloom-slots.
-- Looks: classic hunter dungeon set Beaststalker (16675-16681).
-- IDs: Item Reservations CSV block 85000-85099 (Custom Heirlooms).
-- ============================================================================

DELETE FROM item_template WHERE entry BETWEEN 85006 AND 85011;

INSERT INTO item_template SET
  entry = 85006,
  class = 4,
  subclass = 3,
  name = 'Champion Herod''s Helm',
  displayid = 31410,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 1,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 8,
  ScalingStatValue = 20971521,  -- 0x01400001 head
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85007,
  class = 4,
  subclass = 3,
  name = 'Champion Herod''s Leggings',
  displayid = 31403,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 7,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 8,
  ScalingStatValue = 37748737,  -- 0x02400001 legs
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85008,
  class = 4,
  subclass = 3,
  name = 'Champion Herod''s Boots',
  displayid = 31408,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 8,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 8,
  ScalingStatValue = 71303169,  -- 0x04400001 feet
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85009,
  class = 4,
  subclass = 3,
  name = 'Champion Herod''s Belt',
  displayid = 31404,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 6,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 8,
  ScalingStatValue = 138412033,  -- 0x08400001 waist
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85010,
  class = 4,
  subclass = 3,
  name = 'Champion Herod''s Gauntlets',
  displayid = 31406,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 10,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 8,
  ScalingStatValue = 272629761,  -- 0x10400001 hands
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85011,
  class = 4,
  subclass = 3,
  name = 'Champion Herod''s Bracers',
  displayid = 31405,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 9,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 8,
  ScalingStatValue = 541065217,  -- 0x20400001 wrists
  armor = 2,
  bonding = 1,
  Material = 5;
