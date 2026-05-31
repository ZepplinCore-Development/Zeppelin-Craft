-- F-004 Codex / F-001 Writing Tables collision fix (I-186 follow-up, May 2026).
--
-- Background: I-186 renumbered the F-004 Codex/Tome books from 100001-100005 to
-- 57486-57490 (Inscription reservation row). The ID-availability check missed that
-- F-001 Writing Tables (zep-professions, priority 100) already claim 57486-57489.
-- zep-legacy (priority 999) won, so the world DB ended up with Codexes at 57486-57489
-- and the F-001 inscription quests (90136-90143) silently rewarded Codexes instead of
-- Writing Tables. Codexes are not craftable inscription items, so they don't belong in
-- the Inscription range — moved to Miscellaneous (58335-58339).
--
-- This one-shot cleanup deletes the stale Codex rows at 57486-57490 so that:
--   * F-001 Writing Tables can re-INSERT at 57486-57489 (apply F-001 explicitly after this)
--   * The orphaned 57490 row is removed (no F-001 counterpart)
--   * Stale Codex creature_loot drops on ToC/BWL/Strat/etc. are cleared so the renumbered
--     F-004 SQL can re-INSERT them at 58335-58339.
--
-- Apply order:
--   1. zep world sql changed                                                        # apply renumbered F-004 (inserts at 58335-58339)
--   2. zep world sql modify -f "Scripts/Item Scripts/[F-004]_codex_misc_renumber_cleanup.sql"
--   3. zep world sql modify -f "zpaks/zep-professions/sql/zz_[F-001]_writing_tables.sql"  # re-INSERT writing tables
--   4. zep world creature heroic                                                    # regen F-074 heroic_convertor
--   5. zep world sql changed                                                        # apply regen'd heroic_convertor
--   6. zep world sql modify -f "Scripts/Item Scripts/zz_defunct_item_replacement.sql"
--   7. zep build patch-mpq --parse-build -p Z                                       # rebuild DBC PATCH-Z
--   8. zep build patch-mpq --parse-build -p A                                       # rebuild atlasloot PATCH-A

DELETE FROM `creature_loot_template` WHERE `Item` BETWEEN 57486 AND 57490;
DELETE FROM `item_template` WHERE `entry` BETWEEN 57486 AND 57490;
