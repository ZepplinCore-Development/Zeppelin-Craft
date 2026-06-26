-- [F-164E] Earthen Reprisal — split from F-164 Shaman Tuning
-- World-side scaling for Earthen Reprisal (900114): 10% AP as bonus physical damage.
-- See [F-164E]_spell.sql (DBC record) and zz_[F-164E]_earthen_reprisal_trainer.sql (trainer).

-- ============================================================================
-- spell_bonus_data
-- ============================================================================
DELETE FROM `spell_bonus_data` WHERE `entry` = 900114;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(900114, 0, 0, 0.10, 0, 'Earthen Reprisal - 10% AP as bonus physical damage');
