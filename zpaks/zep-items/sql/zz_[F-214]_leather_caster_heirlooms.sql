-- ============================================================================
-- F-214 leather heirlooms - Preened Ironfeather (druid)
-- ============================================================================
-- Stock 3.3.5a heirlooms for this set cover shoulders (42984 Preened Ironfeather Shoulders),
-- chest (48687 Preened Ironfeather Breastplate), weapons and trinkets. These add head/legs/feet/
-- waist/hands/wrists in leather, on F-215's per-slot armour bits (same recipe as
-- zz_[F-214]_mail_heirlooms.sql):
--   0x00000001  stat budget: shoulder curve (stats from SSD 11, the set's
--               shoulder - per-slot stat weights are later F-214 work)
--   0x00200000  armour material: leather (chest curve)
--   slot bit    0x01000000 head 13/16 .. 0x20000000 wrists 7/16
-- Armour applied by the core (ScalingStatValuesEntry::getArmorMod) and shown
-- by the client through WarcraftXL wxl-heirloom-slots.
-- Looks: classic dungeon set Wildheart (16706-16720; the Ironfeather set has only shoulders and chest).
-- IDs: Item Reservations CSV block 85000-85099 (Custom Heirlooms).
-- ============================================================================

DELETE FROM item_template WHERE entry BETWEEN 85030 AND 85035;

INSERT INTO item_template SET
  entry = 85030,
  class = 4,
  subclass = 2,
  name = 'Preened Ironfeather Cowl',
  displayid = 31228,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 1,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 11,
  ScalingStatValue = 18874369,  -- 0x01200001 head
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85031,
  class = 4,
  subclass = 2,
  name = 'Preened Ironfeather Kilt',
  displayid = 29975,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 7,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 11,
  ScalingStatValue = 35651585,  -- 0x02200001 legs
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85032,
  class = 4,
  subclass = 2,
  name = 'Preened Ironfeather Boots',
  displayid = 29981,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 8,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 11,
  ScalingStatValue = 69206017,  -- 0x04200001 feet
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85033,
  class = 4,
  subclass = 2,
  name = 'Preened Ironfeather Belt',
  displayid = 29976,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 6,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 11,
  ScalingStatValue = 136314881,  -- 0x08200001 waist
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85034,
  class = 4,
  subclass = 2,
  name = 'Preened Ironfeather Gloves',
  displayid = 29979,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 10,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 11,
  ScalingStatValue = 270532609,  -- 0x10200001 hands
  armor = 2,
  bonding = 1,
  Material = 8;

INSERT INTO item_template SET
  entry = 85035,
  class = 4,
  subclass = 2,
  name = 'Preened Ironfeather Bracers',
  displayid = 29977,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 9,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 11,
  ScalingStatValue = 538968065,  -- 0x20200001 wrists
  armor = 2,
  bonding = 1,
  Material = 8;
