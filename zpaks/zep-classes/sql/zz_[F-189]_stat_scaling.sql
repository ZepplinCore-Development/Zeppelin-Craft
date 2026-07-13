-- F-189 Generalized Stat Scaling for Spell Effects — data layer (LEGACY / mostly superseded)
-- A data-driven map "spell X scales effect N on stat S at coefficient C", for stats
-- AzerothCore's spell_bonus_data can't express (armor, block value, stamina, health…).
-- Read by the tooltip generator so the addon can fold the stat term into the displayed value.
--
-- SUPERSEDED by F-188: stat scaling is now native on the spell effect (any SCHOOL_DAMAGE
-- effect with effect_misc_value_b != 0 scales on MiscValue's stat at coeff = MiscValueB/100,
-- handled in Spell::EffectSchoolDMG). The generator reads the DBC MiscValue directly, so the
-- DBC is the single source of truth (server + addon). This table is kept only as a fallback
-- for any future addon-only need; rows here are NOT applied by the server.

CREATE TABLE IF NOT EXISTS spell_stat_scaling (
  spell_id   INT UNSIGNED   NOT NULL,
  eff_index  TINYINT UNSIGNED NOT NULL,
  stat_id    VARCHAR(32)    NOT NULL COMMENT 'matches the addon StatReader keys (BLOCK_VALUE, ARMOR, …)',
  coeff      FLOAT          NOT NULL,
  PRIMARY KEY (spell_id, eff_index, stat_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- (Rockslam 900119 stat-scaling cleanup moved to zz_[F-164R]_stat_scaling.sql)
