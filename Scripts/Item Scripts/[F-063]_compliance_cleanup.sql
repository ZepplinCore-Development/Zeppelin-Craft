-- F-063 Stockades Loot Overhaul - compliance cleanup (May 2026)
-- Renumbered 901100-901110 -> 59091-59101 to bring items into the 56900-66499 reservation scope.
--
-- Run order (see also the F-063 review summary):
--   1. cd /workspace/project/Zeppelin-Craft
--   2. python3 -m cli.zep world sql changed                                             # applies the 5 F-063 boss SQL files
--   3. python3 -m cli.zep world sql query -f "Scripts/Item Scripts/[F-063]_compliance_cleanup.sql"
--   4. python3 -m cli.zep world creature heroic                                         # regenerates heroic_convertor.sql with the new 59xxx loot
--   5. python3 -m cli.zep world sql changed                                             # applies the regenerated heroic_convertor.sql
--   6. python3 -m cli.zep world sql query -f "Scripts/Item Scripts/zz_defunct_item_replacement.sql"   # migrates player inventories

-- Wipe stale creature_loot_template rows for vanilla AND heroic/mythic bosses.
-- Heroic/mythic rows get repopulated when the heroic converter is regenerated + applied.
DELETE FROM `creature_loot_template` WHERE `Item` BETWEEN 901100 AND 901110;

-- Drop the defunct item_template rows.
DELETE FROM `item_template` WHERE `entry` BETWEEN 901100 AND 901110;
