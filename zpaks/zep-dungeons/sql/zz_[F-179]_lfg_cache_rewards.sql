-- F-179 Phase 5: LFG daily quest reward swap (azeroth heroic + mythic)
--
-- Replaces the heroic/mythic Satchel of Helpful Goods (58300/58301) on
-- the daily LFG completion quests with direct armor + weapon cache awards.
-- Resolves F-008 (Differentiated Heroic and Mythic Satchel Rewards) for
-- azeroth scope via sidestep — no satchel container, caches awarded directly.
--
-- Caches (owned by F-074):
--   66200 Azeroth Heroic Armor Cache
--   66201 Azeroth Heroic Weapon Cache
--   66202 Azeroth Mythic Armor Cache
--   66203 Azeroth Mythic Weapon Cache
--
-- Affected quests (per `lfg_dungeon_rewards`):
--   90003  Azeroth Heroic Random (1st of day) — dungeonId 401
--   90004  Azeroth Heroic Random (Nth)        — dungeonId 401
--   90005  Azeroth Mythic Random (1st of day) — dungeonId 406
--   90006  Azeroth Mythic Random (Nth)        — dungeonId 406
--
-- Original reward layouts (verified against live DB 2026-05-30):
--   90003  RewardItem1=58300 ×1, RewardItem2=58200 ×2, RewardItem3=58302 ×0(?), RewardItem4=0
--   90004  RewardItem1=58300 ×1, RewardItem2=58302 ×3, RewardItem3=0, RewardItem4=0
--   90005  RewardItem1=58301 ×1, RewardItem2=58200 ×3, RewardItem3=58302 ×0(?), RewardItem4=0
--   90006  RewardItem1=58301 ×1, RewardItem2=58302 ×5, RewardItem3=0, RewardItem4=0
--
-- New layout: cache items in RewardItem1/2, shift existing currency/azerite
-- down to RewardItem3/4 so players keep all original rewards plus get the
-- caches. Idempotent — applies UPDATE statements which are safe to re-run.
--
-- Outland (58304/58305) and Northrend (58306/58307) heroic/mythic satchels
-- deferred to F-074 Phase 2 when those tier caches come online.

-- Azerite shard amounts: heroic = 5, mythic = 8. The previous swap accidentally
-- set them to 1 (heroic 1st-of-day) and 3/5 (Nth) — restoring to the intended
-- 5/8 design values across all four quests.

-- Heroic 1st-of-day
UPDATE `quest_template` SET
    `RewardItem1` = 66200, `RewardAmount1` = 1,
    `RewardItem2` = 66201, `RewardAmount2` = 1,
    `RewardItem3` = 58200, `RewardAmount3` = 2,
    `RewardItem4` = 58302, `RewardAmount4` = 5
WHERE `ID` = 90003;

-- Heroic Nth
UPDATE `quest_template` SET
    `RewardItem1` = 66200, `RewardAmount1` = 1,
    `RewardItem2` = 66201, `RewardAmount2` = 1,
    `RewardItem3` = 58302, `RewardAmount3` = 5,
    `RewardItem4` = 0,     `RewardAmount4` = 0
WHERE `ID` = 90004;

-- Mythic 1st-of-day
UPDATE `quest_template` SET
    `RewardItem1` = 66202, `RewardAmount1` = 1,
    `RewardItem2` = 66203, `RewardAmount2` = 1,
    `RewardItem3` = 58200, `RewardAmount3` = 3,
    `RewardItem4` = 58302, `RewardAmount4` = 8
WHERE `ID` = 90005;

-- Mythic Nth
UPDATE `quest_template` SET
    `RewardItem1` = 66202, `RewardAmount1` = 1,
    `RewardItem2` = 66203, `RewardAmount2` = 1,
    `RewardItem3` = 58302, `RewardAmount3` = 8,
    `RewardItem4` = 0,     `RewardAmount4` = 0
WHERE `ID` = 90006;
