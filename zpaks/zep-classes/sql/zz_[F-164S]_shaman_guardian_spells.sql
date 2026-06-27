-- [F-164S] Stonebond - world-side support (split from F-164 zz_[F-164]_shaman_guardian_spells.sql).
-- The C++ SpellScript SOURCE (spell_sha_stonebond, spell_sha_stonebond_pulse) stays in core
-- patch 0017; the binding rows below are data and move with this feature. The server-side
-- totem-retire + stock-totem support lives in zz_[F-164]_stonebond.sql (also Stonebond-owned).

-- ============================================================================
-- spell_script_names — C++ SpellScript bindings
-- spell_sha_stonebond attaches to every stock Stoneclaw summon rank; AfterCast grabs the
-- just-summoned earth totem and only activates when the talent marker (900225) is up.
-- 900224 kept in the DELETE to purge the orphaned old binding (spell_sha_stoneguard_totem,
-- the retired custom totem); it is intentionally NOT re-inserted below.
-- ============================================================================
DELETE FROM `spell_script_names` WHERE `spell_id` IN (5730, 6390, 6391, 6392, 10427, 10428, 25525, 58580, 58581, 58582, 900224, 900226);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(5730,  'spell_sha_stonebond'),
(6390,  'spell_sha_stonebond'),
(6391,  'spell_sha_stonebond'),
(6392,  'spell_sha_stonebond'),
(10427, 'spell_sha_stonebond'),
(10428, 'spell_sha_stonebond'),
(25525, 'spell_sha_stonebond'),
(58580, 'spell_sha_stonebond'),
(58581, 'spell_sha_stonebond'),
(58582, 'spell_sha_stonebond'),
-- Stonebond pulse driver (900226): re-casts the split (900222) on the owner each tick
(900226, 'spell_sha_stonebond_pulse');
