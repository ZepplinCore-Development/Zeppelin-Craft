-- =====================================================================
-- F-067 Fatter Stacks - Soul Shard (6265)
--
-- stackable  1 -> 10   Warlocks stop burning a bag slot per shard.
--                      Kept at 10 (not 100) on purpose: a 20-slot soul
--                      pouch still carries 200 shards, so shard bags
--                      keep their point.
-- maxcount  32 -> 0    Removes the 32-shard hard carry cap.
--
-- Deliberately a SEPARATE file from zz_[F-067]_increased_stack_sizes.sql.
-- That file's blanket by-value rules (100->1000, 20->200, 10->100, 5->50)
-- are apply-once-on-stock; editing it changes its hash and `zep world sql
-- changed` would re-run those rules against the already-migrated live DB,
-- cascading every item currently sitting on a tier boundary.
--
-- Shards are consumed as ordinary spell reagents (Spell::TakeReagents ->
-- Player::DestroyItemCount), and returned on pet dismiss via
-- CanStoreNewItem/StoreNewItem - both are stack-aware, so nothing in the
-- warlock kit needs a code change.
-- =====================================================================

-- Stock row -> one consolidated UPDATE (CLAUDE.md: SQL Idempotency Pattern)
UPDATE `item_template` SET
  `stackable` = 10,
  `maxcount` = 0
WHERE `entry` = 6265; -- Soul Shard
