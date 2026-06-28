-- [F-164] Custom spellvisual rows (Spirit Communion 90002).
-- [MIGRATED -> F-164D] Volcanic Shield eruption visual 90001 moved to [F-164D]_spellvisual.sql.
-- [MIGRATED -> F-164R] Rocksurge visual 90020 moved to [F-164R]_spellvisual.sql.

-- Visual 90002: Spirit Communion — ghost/spirit effect + heal glow
-- cast_kit 90001 = custom kit (Ghost_state + cast directed anim, blends with movement)
-- caster_impact_kit 232 = Heal_Low_Base (subtle heal glow on self)
DELETE FROM `spellvisual` WHERE `id` = 90002;
INSERT INTO `spellvisual` (`id`, `cast_kit`, `caster_impact_kit`) VALUES (90002, 90001, 232);

-- [MIGRATED -> F-164D] Volcanic Shield buff visual 90003 moved to [F-164D]_spellvisual.sql.

-- (Rocksurge visual 90020 moved to [F-164R]_spellvisual.sql)
