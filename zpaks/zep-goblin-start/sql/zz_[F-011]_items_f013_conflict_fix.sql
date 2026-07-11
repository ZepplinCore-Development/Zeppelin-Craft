-- [F-011] Recover 2 goblin quest items that collided with F-013 AUTO ranges.
-- Neltharion referenced items 60203 (quest 14138 "Taking Care of Business") and
-- 62335 (quest 25265 "Victory!") but never shipped them in item_template, so the
-- goblin-port remap left the quest refs on their raw retail IDs -- which F-013's
-- generator (60200-63199) later claimed. Real items recreated in F-011's block
-- (84300-84799) from retail Cata data; quest refs repointed in the quest templates.
-- Stock 3.3.5a displays reused (no custom-icon pipeline needed).

-- 60203 -> 84505  Sassy's Incentive (quest item; StartItem + RequiredItemId1 of 14138)
DELETE FROM item_template WHERE entry = 84505;
INSERT INTO item_template SET
  `entry` = 84505,
  `class` = 12,
  `subclass` = 0,
  `SoundOverrideSubclass` = -1,
  `name` = 'Sassy''s Incentive',
  `displayid` = 2533,
  `Quality` = 1,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 0,
  `SellPrice` = 0,
  `InventoryType` = 0,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 1,
  `RequiredLevel` = 0,
  `maxcount` = 1,
  `stackable` = 1,
  `bonding` = 4,
  `description` = 'It''s ticking! Sassy is ruthless!!!',
  `Material` = 0,
  `sheath` = 0,
  `VerifiedBuild` = 0;

-- 62335 -> 84506  Thrall's Gift (rare leather wrist; RewardChoiceItemID3 of 25265)
DELETE FROM item_template WHERE entry = 84506;
INSERT INTO item_template SET
  `entry` = 84506,
  `class` = 4,
  `subclass` = 2,
  `SoundOverrideSubclass` = -1,
  `name` = 'Thrall''s Gift',
  `displayid` = 17170,
  `Quality` = 3,
  `Flags` = 0,
  `FlagsExtra` = 0,
  `BuyCount` = 1,
  `BuyPrice` = 570,
  `SellPrice` = 114,
  `InventoryType` = 9,
  `AllowableClass` = -1,
  `AllowableRace` = -1,
  `ItemLevel` = 12,
  `RequiredLevel` = 1,
  `maxcount` = 0,
  `stackable` = 1,
  `stat_type1` = 3,
  `stat_value1` = 3,
  `armor` = 29,
  `bonding` = 1,
  `Material` = 8,
  `sheath` = 0,
  `MaxDurability` = 30,
  `VerifiedBuild` = 0;
