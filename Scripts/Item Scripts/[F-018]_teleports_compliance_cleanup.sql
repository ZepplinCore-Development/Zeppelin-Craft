-- F-018 Daily Dungeon Teleports - compliance cleanup (May 2026)
-- 62 teleport orb items renumbered 901901-901962 → 58600-58661
-- (Dungeon Teleport Orbs reservation row 58600-58699). CSV source updated and
-- AUTO regenerated via `zep world dungeon teleports`. This file drops stale
-- 901901-901962 rows so the renumber is complete.
--
-- Run order:
--   1. python3 -m cli.zep world dungeon teleports         (already done if CSV was updated)
--   2. python3 -m cli.zep world sql modify -f "Scripts/Item Scripts/[F-018]_teleports_compliance_cleanup.sql"
--   3. python3 -m cli.zep world sql changed -k            (applies AUTO regen)
--   4. python3 -m cli.zep world sql modify -f "Scripts/Item Scripts/zz_defunct_item_replacement.sql"
--   5. python3 -m cli.zep build patch-mpq --parse-build -p Z

DELETE FROM `item_template` WHERE `entry` BETWEEN 901901 AND 901962;
