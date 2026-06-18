# Legacy archive

## legacy_update_spell.sql
Pristine copy of `Scripts/Patch Builder/Updates/update_spell.sql` as it existed at
git `90d5823a^` — the parent of `90d5823a` ("chore: Migrate elite_scaler to CLI,
remove redundant Scripts (F-074)"), which deleted it.

This 30k-line file was the old Patch Builder DBC spell-edit source. Some of its edits
were never migrated into zpaks and became **live-only** (applied in the DBC DB but with
no source file, so a `dbc db rebuild` would revert them). Kept here as a recovery
fallback. To re-author edits from it, translate the pre-migration column names to the
current schema (see memory `reference_orphaned_update_spell_recovery`) and validate
against `SHOW COLUMNS FROM spell`.

F-014 Mage Tuning's Foundation edits were the first recovered from it (2026-06-18).
