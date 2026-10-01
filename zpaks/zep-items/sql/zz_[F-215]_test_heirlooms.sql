-- ============================================================================
-- F-215 test heirlooms - one cloth piece per new heirloom armour slot
-- ============================================================================
-- Exercises the per-slot armour bits: ScalingStatValue = stat budget bit +
-- chest-material bit + ONE high slot bit. Armour = cloth chest curve * n / 16,
-- applied by the core (ScalingStatValuesEntry::getArmorMod) and shown by the
-- client through the WarcraftXL module wxl-heirloom-slots.
--
--   0x00000001  stat budget: shoulder curve (stats from SSD 16 = Tattered
--               Dreadmist Mantle; proper per-slot stats are F-214's job)
--   0x00100000  armour material: cloth (chest curve)
--   slot bit    0x01000000 head 13/16   0x02000000 legs 14/16
--               0x04000000 feet 11/16   0x08000000 waist 9/16
--               0x10000000 hands 10/16  0x20000000 wrists 7/16
--
-- Fields follow stock heirloom 42985 Tattered Dreadmist Mantle, without its
-- on-equip XP bonus (57353). Looks from the classic Dreadmist set (16698-16705).
-- IDs: Item Reservations CSV block 85000-85099 (Custom Heirlooms).
-- ============================================================================

DELETE FROM item_template WHERE entry BETWEEN 85000 AND 85005;

INSERT INTO item_template SET
  entry = 85000,
  class = 4,
  subclass = 1,
  name = 'Tattered Dreadmist Mask (F-215 Test)',
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
  name = 'Tattered Dreadmist Leggings (F-215 Test)',
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
  name = 'Tattered Dreadmist Sandals (F-215 Test)',
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
  name = 'Tattered Dreadmist Belt (F-215 Test)',
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
  name = 'Tattered Dreadmist Wraps (F-215 Test)',
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
  name = 'Tattered Dreadmist Bracers (F-215 Test)',
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
