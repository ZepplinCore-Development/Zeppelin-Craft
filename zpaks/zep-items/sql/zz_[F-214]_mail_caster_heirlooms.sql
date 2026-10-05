-- ============================================================================
-- F-214 mail heirlooms - Mystical Elements (shaman)
-- ============================================================================
-- Stock 3.3.5a heirlooms for this set cover shoulders (42951 Mystical Pauldrons of Elements),
-- chest (48683 Mystical Vest of Elements), weapons and trinkets. These add head/legs/feet/
-- waist/hands/wrists in mail, on F-215's per-slot armour bits (same recipe as
-- zz_[F-214]_mail_heirlooms.sql):
--   0x00000001  stat budget: shoulder curve (stats from SSD 9, the set's
--               shoulder - per-slot stat weights are later F-214 work)
--   0x00400000  armour material: mail (chest curve)
--   slot bit    0x01000000 head 13/16 .. 0x20000000 wrists 7/16
-- Armour applied by the core (ScalingStatValuesEntry::getArmorMod) and shown
-- by the client through WarcraftXL wxl-heirloom-slots.
-- Looks: classic dungeon set Elements (16666-16673).
-- IDs: Item Reservations CSV block 85000-85099 (Custom Heirlooms).
-- ============================================================================

DELETE FROM item_template WHERE entry BETWEEN 85018 AND 85023;

INSERT INTO item_template SET
  entry = 85018,
  class = 4,
  subclass = 3,
  name = 'Mystical Coif of Elements',
  displayid = 45174,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 1,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 9,
  ScalingStatValue = 20971521,  -- 0x01400001 head
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85019,
  class = 4,
  subclass = 3,
  name = 'Mystical Kilt of Elements',
  displayid = 31415,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 7,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 9,
  ScalingStatValue = 37748737,  -- 0x02400001 legs
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85020,
  class = 4,
  subclass = 3,
  name = 'Mystical Boots of Elements',
  displayid = 31412,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 8,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 9,
  ScalingStatValue = 71303169,  -- 0x04400001 feet
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85021,
  class = 4,
  subclass = 3,
  name = 'Mystical Cord of Elements',
  displayid = 31413,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 6,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 9,
  ScalingStatValue = 138412033,  -- 0x08400001 waist
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85022,
  class = 4,
  subclass = 3,
  name = 'Mystical Gauntlets of Elements',
  displayid = 31414,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 10,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 9,
  ScalingStatValue = 272629761,  -- 0x10400001 hands
  armor = 2,
  bonding = 1,
  Material = 5;

INSERT INTO item_template SET
  entry = 85023,
  class = 4,
  subclass = 3,
  name = 'Mystical Bindings of Elements',
  displayid = 31411,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 9,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 9,
  ScalingStatValue = 541065217,  -- 0x20400001 wrists
  armor = 2,
  bonding = 1,
  Material = 5;
