-- ============================================================================
-- F-214 plate heirlooms - Polished Valor (warrior, paladin, death knight)
-- ============================================================================
-- Stock 3.3.5a heirlooms for this set cover shoulders (42949 Polished Spaulders of Valor),
-- chest (48685 Polished Breastplate of Valor), weapons and trinkets. These add head/legs/feet/
-- waist/hands/wrists in plate, on F-215's per-slot armour bits (same recipe as
-- zz_[F-214]_mail_heirlooms.sql):
--   0x00000001  stat budget: shoulder curve (stats from SSD 7, the set's
--               shoulder - per-slot stat weights are later F-214 work)
--   0x00800000  armour material: plate (chest curve)
--   slot bit    0x01000000 head 13/16 .. 0x20000000 wrists 7/16
-- Armour applied by the core (ScalingStatValuesEntry::getArmorMod) and shown
-- by the client through WarcraftXL wxl-heirloom-slots.
-- Looks: classic dungeon set Valor (16730-16737).
-- IDs: Item Reservations CSV block 85000-85099 (Custom Heirlooms).
-- ============================================================================

DELETE FROM item_template WHERE entry BETWEEN 85012 AND 85017;

INSERT INTO item_template SET
  entry = 85012,
  class = 4,
  subclass = 4,
  name = 'Polished Helm of Valor',
  displayid = 42241,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 1,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 25165825,  -- 0x01800001 head
  armor = 2,
  bonding = 1,
  Material = 6;

INSERT INTO item_template SET
  entry = 85013,
  class = 4,
  subclass = 4,
  name = 'Polished Legplates of Valor',
  displayid = 29963,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 7,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 41943041,  -- 0x02800001 legs
  armor = 2,
  bonding = 1,
  Material = 6;

INSERT INTO item_template SET
  entry = 85014,
  class = 4,
  subclass = 4,
  name = 'Polished Boots of Valor',
  displayid = 29960,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 8,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 75497473,  -- 0x04800001 feet
  armor = 2,
  bonding = 1,
  Material = 6;

INSERT INTO item_template SET
  entry = 85015,
  class = 4,
  subclass = 4,
  name = 'Polished Belt of Valor',
  displayid = 29959,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 6,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 142606337,  -- 0x08800001 waist
  armor = 2,
  bonding = 1,
  Material = 6;

INSERT INTO item_template SET
  entry = 85016,
  class = 4,
  subclass = 4,
  name = 'Polished Gauntlets of Valor',
  displayid = 29962,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 10,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 276824065,  -- 0x10800001 hands
  armor = 2,
  bonding = 1,
  Material = 6;

INSERT INTO item_template SET
  entry = 85017,
  class = 4,
  subclass = 4,
  name = 'Polished Bracers of Valor',
  displayid = 29961,
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 9,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 545259521,  -- 0x20800001 wrists
  armor = 2,
  bonding = 1,
  Material = 6;
