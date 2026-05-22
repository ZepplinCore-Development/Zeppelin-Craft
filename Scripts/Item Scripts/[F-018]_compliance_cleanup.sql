-- F-018 Daily Dungeon Quest Rewards - compliance cleanup (May 2026)
-- The 47 daily dungeon quest reward items were renumbered 901700-901746 → 58700-58746
-- (Azeroth Daily Dungeon Items reservation row 58700-58799) by updating the CSV
-- source (cli/lib/dungeon/data/Dungeon Daily Quests.csv) and regenerating the
-- AUTO SQL via `zep world dungeon quests`.
--
-- The regenerated AUTO file creates the new 58700-58746 rows but its
-- per-id DELETE+INSERT pattern targets only the NEW IDs, leaving stale 901700-901746
-- rows in item_template, creature_loot_template, and creature_questitem from the
-- prior generation's apply. This file drops those stale rows.
--
-- quest_template is NOT touched: the AUTO file's DELETE+INSERT for each daily quest
-- ID rebuilds the row with the new RequiredItemId1 value pointing at 58700-58746.
--
-- Run order:
--   1. cd /workspace/project/Zeppelin-Craft
--   2. python3 -m cli.zep world dungeon quests                                  # regen AUTO with new IDs (already done if CSV was updated)
--   3. python3 -m cli.zep world sql changed                                     # apply regen'd AUTO
--   4. python3 -m cli.zep world sql modify -f "Scripts/Item Scripts/[F-018]_compliance_cleanup.sql"
--   5. python3 -m cli.zep world sql modify -f "Scripts/Item Scripts/zz_defunct_item_replacement.sql"
--   6. python3 -m cli.zep build patch-mpq --parse-build -p Z

DELETE FROM `creature_loot_template` WHERE `Item` BETWEEN 901700 AND 901746;
DELETE FROM `creature_questitem` WHERE `ItemId` BETWEEN 901700 AND 901746;
DELETE FROM `item_template` WHERE `entry` BETWEEN 901700 AND 901746;
