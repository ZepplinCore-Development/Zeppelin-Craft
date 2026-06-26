-- [F-164T] Earthwarden - Thunderborne Leap — world-side data
-- Sub-feature of F-164 (Earthwarden). Owns the Thunderborne Leap C++ script binding
-- and spell_bonus_data. Spell DBC definitions live in dbc/[F-164T]_spell.sql.

-- ============================================================================
-- spell_script_names — Thunderborne Leap cast handler (900173 -> 900174 triggered AoE)
-- ============================================================================
DELETE FROM `spell_script_names` WHERE `spell_id` = 900173;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(900173, 'spell_sha_thunderborne_leap');

-- ============================================================================
-- spell_bonus_data — Thunderborne Leap impact (triggered) AP coefficient
-- ============================================================================
DELETE FROM `spell_bonus_data` WHERE `entry` = 900174;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(900174, 0, 0, 0.20, 0, 'Thunderborne Leap (triggered) - 20% AP as AOE nature damage on landing');
