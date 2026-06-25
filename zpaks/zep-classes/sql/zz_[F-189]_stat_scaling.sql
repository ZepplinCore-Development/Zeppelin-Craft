-- F-189 Generalized Stat Scaling for Spell Effects — data layer
-- A data-driven map "spell X scales effect N on stat S at coefficient C", for stats
-- AzerothCore's spell_bonus_data can't express (armor, block value, stamina, health…).
-- Read by the tooltip generator (zep build tooltip-data) so the addon can fold the
-- stat term into the displayed value. The server still applies the actual damage via
-- the spell's existing script; the generic table-driven SpellScript is a later F-189 step.

CREATE TABLE IF NOT EXISTS spell_stat_scaling (
  spell_id   INT UNSIGNED   NOT NULL,
  eff_index  TINYINT UNSIGNED NOT NULL,
  stat_id    VARCHAR(32)    NOT NULL COMMENT 'matches the addon StatReader keys (BLOCK_VALUE, ARMOR, …)',
  coeff      FLOAT          NOT NULL,
  PRIMARY KEY (spell_id, eff_index, stat_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Rockslam (F-164 Earthwarden): the strike scales on the caster's block value (coeff 1.0),
-- matching desc var 189 ($m1 + per-level + $bv) and the server-side script.
DELETE FROM spell_stat_scaling WHERE spell_id = 900119;
INSERT INTO spell_stat_scaling (spell_id, eff_index, stat_id, coeff) VALUES
  (900119, 1, 'BLOCK_VALUE', 1.0);
