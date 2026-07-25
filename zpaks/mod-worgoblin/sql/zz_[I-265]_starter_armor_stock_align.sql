-- I-265: Goblin + Worgen starter gear carried Cataclysm armor values (cloth robe 13,
-- leather tunic 19, mail chest 31), colliding with the F-011 quest rewards.
--
-- Stock-DBC verification (original_dbc.charstartoutfit): NO stock WotLK race starts a
-- warrior or paladin in mail -- every class starts in a cosmetic shirt + cloth pants +
-- Misc boots for ~2 armor total. The only real armor piece any stock starter wears is the
-- shaman's Primitive Kilt (14). The Unadorned Chain mail set appears in ZERO stock outfits
-- (it only exists as a custom-added Blood Elf warrior outfit, a Cata-only race/class).
--
-- So the goblin/worgen sets carrying real Leather/Mail-typed pieces is itself the Cata
-- anomaly. To match stock intent (weak starter gear, every quest reward an upgrade) drop
-- every piece to the stock ~1-2 armor range, by slot size:
--   chest / robe / legs -> 2,   boots / gloves / belt -> 1.
-- Quest armor rewards (cloth 4-24, leather 5-46, mail 66+) are then all clear upgrades.
-- F-081 purge-whites owns Quality/stat/DisenchantID columns on these rows -- untouched here.

-- Chest, robe, legs (invtype 5 / 20 / 7) -> 2 armor
UPDATE `item_template` SET `armor` = 2 WHERE `entry` IN (
  -- cloth robes
  49505, 49510, 49520, 49399, 49403, 49408,
  -- cloth pants
  49506, 49512, 49521, 49400, 49404, 49409,
  -- leather chests
  49502, 49514, 52550, 49563, 49570, 49574,
  -- leather pants
  49503, 49515, 52551, 49566, 49568, 49572,
  -- mail chests
  49524, 49578,
  -- mail legs
  49528, 49576
);

-- Boots, gloves, belt (invtype 8 / 10 / 6) -> 1 armor
UPDATE `item_template` SET `armor` = 1 WHERE `entry` IN (
  -- cloth boots
  49508, 49522, 49531, 49401, 49406, 49407,
  -- leather boots
  49504, 49516, 52552, 49564, 49569, 49575,
  -- leather gloves
  49565, 49571, 49573,
  -- mail boots
  49527, 49579,
  -- mail gloves
  49529,
  -- mail belt
  49577
);

-- Worn Wood Chopper (goblin warrior / worgen hunter): align damage with stock starter
-- 2H analogs (Worn Battleaxe 12282 / Battleworn Hammer 2361: 3-5 dmg, 2.90 speed).
UPDATE `item_template` SET `dmg_min1` = 3, `dmg_max1` = 5 WHERE `entry` = 52532;
