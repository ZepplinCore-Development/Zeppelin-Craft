-- ============================================================================
-- F-214 heirlooms for the slots stock 3.3.5a never covered: shields, relics
-- (totem / libram / idol / sigil) and a wand
-- ============================================================================
-- Shields scale armour through the per-slot armour mechanism (ex F-215): plate
-- chest-material bit 0x800000 + SHIELD slot bit 0x40000000 = 44/16 (2.75x) of the
-- plate chest curve - stock green/blue shields run 2.4-3.3x plate chest from
-- level 10 to 80. Server: Zeppelin-Core patch 0054; client: WarcraftXL extension
-- wxl-heirloom-slots (wxl-framework patch 0007, bundle v8BB31). Stat budget 0x4
-- (one-hand weapon curve). Block value is static (no scaling curve exists): 0.
-- Relics: stats only, ranged stat budget 0x10. Wand: wand DPS curve 0x4000 +
-- ranged stat budget 0x10, like the stock heirloom bow (0x2010).
-- Stats from the class set's ScalingStatDistribution:
--   7  Polished Valor (str/sta/crit)          9  Mystical Elements (sp/sta/int/mp5)
--   11 Preened Ironfeather (sp/sta/int/spi)   16 Tattered Dreadmist (sp/sta/int/spi)
-- IDs: Item Reservations CSV block 85000-85099 (Custom Heirlooms).
-- ============================================================================

DELETE FROM item_template WHERE entry BETWEEN 85036 AND 85042;

INSERT INTO item_template SET
  entry = 85036,
  class = 4,
  subclass = 6,
  name = 'Polished Bulwark of Valor',
  displayid = 18700,         -- Commander's Crest
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 14,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 1082130436,  -- 0x40800004 shield, plate, 1H budget
  armor = 2,
  block = 0,
  bonding = 1,
  Material = 6,
  sheath = 4;

INSERT INTO item_template SET
  entry = 85037,
  class = 4,
  subclass = 6,
  name = 'Mystical Ward of Elements',
  displayid = 23750,         -- Rhombeard Protector
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 14,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 9,
  ScalingStatValue = 1082130436,  -- 0x40800004 shield, plate, 1H budget
  armor = 2,
  block = 0,
  bonding = 1,
  Material = 6,
  sheath = 4;

INSERT INTO item_template SET
  entry = 85038,
  class = 4,
  subclass = 9,
  name = 'Mystical Totem of Elements',
  displayid = 34957,         -- Totem of Rage
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 28,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 9,
  ScalingStatValue = 16,     -- 0x10 ranged/relic budget
  TotemCategory = 21,        -- Master Totem: counts as Earth/Air/Fire/Water (user: no need to carry the four)
  bonding = 1,
  Material = -1;

INSERT INTO item_template SET
  entry = 85039,
  class = 4,
  subclass = 7,
  name = 'Polished Libram of Valor',
  displayid = 34961,         -- Libram of Truth
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 28,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 16,
  bonding = 1,
  Material = -1;

INSERT INTO item_template SET
  entry = 85040,
  class = 4,
  subclass = 8,
  name = 'Preened Idol of Ironfeather',
  displayid = 34954,         -- Idol of Rejuvenation
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 28,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 11,
  ScalingStatValue = 16,
  bonding = 1,
  Material = -1;

INSERT INTO item_template SET
  entry = 85041,
  class = 4,
  subclass = 10,
  name = 'Polished Sigil of Valor',
  displayid = 51588,         -- Sigil of the Dark Rider
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 28,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 7,
  ScalingStatValue = 16,
  bonding = 1,
  Material = -1;

INSERT INTO item_template SET
  entry = 85042,
  class = 2,
  subclass = 19,
  name = 'Tattered Dreadmist Wand',
  displayid = 24106,         -- Skul's Ghastly Touch
  Quality = 7,
  Flags = 134221824,
  BuyCount = 1,
  InventoryType = 26,
  ItemLevel = 1,
  stackable = 1,
  ScalingStatDistribution = 16,
  ScalingStatValue = 16400,  -- 0x4010 wand DPS + ranged budget
  dmg_min1 = 1,
  dmg_type1 = 5,             -- shadow
  delay = 1800,
  RangedModRange = 100,
  bonding = 1,
  Material = 2;
