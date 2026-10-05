-- ============================================================================
-- F-214 cloth heirlooms - Tattered Dreadmist (priest, mage, warlock)
-- ============================================================================
-- Stock 3.3.5a heirlooms for this set cover shoulders (42985 Tattered Dreadmist Mantle),
-- chest (48691 Tattered Dreadmist Robe), weapons and trinkets. These add head/legs/feet/
-- waist/hands/wrists in cloth, on F-215's per-slot armour bits (same recipe as
-- zz_[F-214]_mail_heirlooms.sql):
--   0x00000001  stat budget: shoulder curve (stats from SSD 16, the set's
--               shoulder - per-slot stat weights are later F-214 work)
--   0x00100000  armour material: cloth (chest curve)
--   slot bit    0x01000000 head 13/16 .. 0x20000000 wrists 7/16
-- Armour applied by the core (ScalingStatValuesEntry::getArmorMod) and shown
-- by the client through WarcraftXL wxl-heirloom-slots.
-- Looks: classic dungeon set Dreadmist (16698-16705).
-- IDs: Item Reservations CSV block 85000-85099 (Custom Heirlooms).
-- ============================================================================
-- 85000-85005 began as the F-215 test pieces "(F-215 Test)" in
-- zz_[F-215]_test_heirlooms.sql; promoted here to the real cloth set (2026-10-04).
-- ============================================================================

DELETE FROM item_template WHERE entry BETWEEN 85000 AND 85005;

INSERT INTO item_template SET
  entry = 85000,
  class = 4,
  subclass = 1,
  name = 'Tattered Dreadmist Mask',
  displayid = 31263,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 1,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 16,
  ScalingStatValue = 17825793,  -- 0x01100001 head
  armor = 2,
  bonding = 1,
  Material = 7;

INSERT INTO item_template SET
  entry = 85001,
  class = 4,
  subclass = 1,
  name = 'Tattered Dreadmist Leggings',
  displayid = 29797,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 7,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 16,
  ScalingStatValue = 34603009,  -- 0x02100001 legs
  armor = 2,
  bonding = 1,
  Material = 7;

INSERT INTO item_template SET
  entry = 85002,
  class = 4,
  subclass = 1,
  name = 'Tattered Dreadmist Sandals',
  displayid = 29799,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 8,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 16,
  ScalingStatValue = 68157441,  -- 0x04100001 feet
  armor = 2,
  bonding = 1,
  Material = 7;

INSERT INTO item_template SET
  entry = 85003,
  class = 4,
  subclass = 1,
  name = 'Tattered Dreadmist Belt',
  displayid = 29793,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 6,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 16,
  ScalingStatValue = 135266305,  -- 0x08100001 waist
  armor = 2,
  bonding = 1,
  Material = 7;

INSERT INTO item_template SET
  entry = 85004,
  class = 4,
  subclass = 1,
  name = 'Tattered Dreadmist Wraps',
  displayid = 29800,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 10,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 16,
  ScalingStatValue = 269484033,  -- 0x10100001 hands
  armor = 2,
  bonding = 1,
  Material = 7;

INSERT INTO item_template SET
  entry = 85005,
  class = 4,
  subclass = 1,
  name = 'Tattered Dreadmist Bracers',
  displayid = 29795,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 9,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 16,
  ScalingStatValue = 537919489,  -- 0x20100001 wrists
  armor = 2,
  bonding = 1,
  Material = 7;
