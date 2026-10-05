-- ============================================================================
-- F-214 leather heirlooms - Stained Shadowcraft (rogue)
-- ============================================================================
-- Stock 3.3.5a heirlooms for this set cover shoulders (42952 Stained Shadowcraft Spaulders),
-- chest (48689 Stained Shadowcraft Tunic), weapons and trinkets. These add head/legs/feet/
-- waist/hands/wrists in leather, on F-215's per-slot armour bits (same recipe as
-- zz_[F-214]_mail_heirlooms.sql):
--   0x00000001  stat budget: shoulder curve (stats from SSD 10, the set's
--               shoulder - per-slot stat weights are later F-214 work)
--   0x00200000  armour material: leather (chest curve)
--   slot bit    0x01000000 head 13/16 .. 0x20000000 wrists 7/16
-- Armour applied by the core (ScalingStatValuesEntry::getArmorMod) and shown
-- by the client through WarcraftXL wxl-heirloom-slots.
-- Looks: classic dungeon set Shadowcraft (16707-16721).
-- IDs: Item Reservations CSV block 85000-85099 (Custom Heirlooms).
-- ============================================================================

DELETE FROM item_template WHERE entry BETWEEN 85024 AND 85029;

INSERT INTO item_template SET
  entry = 85024,
  class = 4,
  subclass = 2,
  name = 'Stained Shadowcraft Cap',
  displayid = 28180,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 1,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 10,
  ScalingStatValue = 18874369,  -- 0x01200001 head
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85025,
  class = 4,
  subclass = 2,
  name = 'Stained Shadowcraft Pants',
  displayid = 28161,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 7,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 10,
  ScalingStatValue = 35651585,  -- 0x02200001 legs
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85026,
  class = 4,
  subclass = 2,
  name = 'Stained Shadowcraft Boots',
  displayid = 28162,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 8,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 10,
  ScalingStatValue = 69206017,  -- 0x04200001 feet
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85027,
  class = 4,
  subclass = 2,
  name = 'Stained Shadowcraft Belt',
  displayid = 28177,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 6,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 10,
  ScalingStatValue = 136314881,  -- 0x08200001 waist
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85028,
  class = 4,
  subclass = 2,
  name = 'Stained Shadowcraft Gloves',
  displayid = 28166,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 10,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 10,
  ScalingStatValue = 270532609,  -- 0x10200001 hands
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85029,
  class = 4,
  subclass = 2,
  name = 'Stained Shadowcraft Bracers',
  displayid = 24190,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 9,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 10,
  ScalingStatValue = 538968065,  -- 0x20200001 wrists
  armor = 2,
  bonding = 1,
  Material = 8;
