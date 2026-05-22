-- I-184 override for [BASE,F-030]_item.sql — strip stale upstream-ID DBC item rows for
-- Mountain Horse (73838) and Swift Mountain Horse (73839). The new 58102-58103 rows
-- get synced into DBC item by [AUTO,F-044] in zep-legacy (priority 999, applies last).
--
-- Trike Keys (62461/62462) intentionally NOT deleted: those IDs are owned by F-013
-- Outland Heroic loot (Greaves of the Lowering Opportunity / Treads of Regulating Switch),
-- which writes its own item_template rows. [AUTO,F-044] re-syncs DBC item for those IDs
-- with F-013's class 4 (Armor) data, replacing the BASE,F-030 class 15 Trike Key data.
DELETE FROM `item` WHERE `id` IN (73838, 73839);
