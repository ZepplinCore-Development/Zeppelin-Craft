-- [F-164R] Rocksteady Family - stat-scaling cleanup for Rockslam (split from F-189
-- zz_[F-189]_stat_scaling.sql). The spell_stat_scaling table itself is created/owned by
-- F-189; this file only owns the Rockslam (900119) row.
--
-- Rockslam (900119): block-value scaling MOVED to native F-188 (effect_misc_value_a_1 = 1
-- BLOCK_VALUE, b_1 = 100). The DELETE clears the old stopgap row so the addon reads scaling
-- from the DBC, not from spell_stat_scaling. The table is created by F-189 (which sorts/applies
-- before this file), so the DELETE always has a target; it is a harmless no-op once the row is gone.
DELETE FROM `spell_stat_scaling` WHERE `spell_id` = 900119;
