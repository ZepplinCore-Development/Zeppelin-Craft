-- I-186 Worgoblin Mount Item ID Compliance
-- Renumbers upstream mod-worgoblin mount items into the Mounts reservation row
-- (56900-66499 scope) via in-place UPDATE.
--
-- Mapping:
--   62461 → 58104  (Goblin Trike Key)
--   62462 → 58105  (Goblin Turbo-Trike Key)
--   73838 → 58102  (Mountain Horse)
--   73839 → 58103  (Swift Mountain Horse)
--
-- Apply-order dependency: This file lives in mod-worgoblin/sql/ (priority 20).
-- The upstream mod-worgoblin worgoblin.sql runs at the same zpak priority,
-- before this file alphabetically, populating 62461/62462/73838/73839 with the
-- four mod-worgoblin items. This file then renumbers them, freeing 62461/62462
-- for zep-dungeons/sql/zz_[AUTO,F-013]_outland_heroic_items.sql (priority 100)
-- to insert Greaves of the Lowering Opportunity / Treads of Regulating Switch
-- at those IDs.
--
-- If the live DB has F-013 content at 62461/62462 (because F-013 was applied
-- historically BEFORE this I-186 file existed and overwrote the upstream Trike
-- Keys), the renumber will misroute. Recovery: clear the AC updates-tracker
-- rows for both worgoblin.sql and zz_[AUTO,F-013]_outland_heroic_items.sql,
-- then run `zep world sql changed` so all three files re-apply in priority order.
--
-- Idempotency + drift safety: each UPDATE is name-guarded so it only renumbers
-- the actual upstream Worgoblin item, never whatever F-013 has currently parked
-- at 62461/62462. The original (name-less) form caused a drift incident: after
-- F-013 outland heroic loot regen'd and re-claimed 62461/62462, a subsequent
-- re-apply of this file (triggered by an unrelated filename rename) renamed
-- F-013's random-suffix items to 58104/58105, displacing the Trike Keys.
-- The name guard makes this file safe to re-apply at any time regardless of
-- what's at 62461/62462.
--
-- The JOIN-guarded DELETE still wipes dest rows when source rows exist, but
-- only when those source rows are the upstream Worgoblin items (matched by
-- entry+name).

DELETE t1 FROM `item_template` t1
JOIN `item_template` t2 ON (
    (t2.`entry` = 73838 AND t2.`name` = 'Mountain Horse') OR
    (t2.`entry` = 73839 AND t2.`name` = 'Swift Mountain Horse') OR
    (t2.`entry` = 62461 AND t2.`name` = 'Goblin Trike Key') OR
    (t2.`entry` = 62462 AND t2.`name` = 'Goblin Turbo-Trike Key')
)
WHERE t1.`entry` IN (58102, 58103, 58104, 58105);

UPDATE `item_template` SET `entry` = 58102 WHERE `entry` = 73838 AND `name` = 'Mountain Horse';
UPDATE `item_template` SET `entry` = 58103 WHERE `entry` = 73839 AND `name` = 'Swift Mountain Horse';
UPDATE `item_template` SET `entry` = 58104 WHERE `entry` = 62461 AND `name` = 'Goblin Trike Key';
UPDATE `item_template` SET `entry` = 58105 WHERE `entry` = 62462 AND `name` = 'Goblin Turbo-Trike Key';
