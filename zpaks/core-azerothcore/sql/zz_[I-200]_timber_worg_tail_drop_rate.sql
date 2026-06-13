-- [I-200] Timber Worg Alpha (18477) dropped Timber Worg Tail (25807) at 15%
-- while Timber Worg (18476) and Ironjaw (18670) drop it at 25%. Match them.
UPDATE creature_loot_template SET Chance = 25 WHERE Entry = 18477 AND Item = 25807;
