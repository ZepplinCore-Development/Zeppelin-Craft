-- [F-164H] Spirit Communion - world-side support (split from F-164 zz_[F-164]_shaman_guardian_spells.sql).
-- spell_linked_spell: (1) casting the active (900185) consumes the Spirited buff (900184);
-- (2) learning the active auto-teaches the on-kill passive (900183).

-- Consume Spirited buff when active is cast
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 900185 AND `spell_effect` = -900184;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(900185, -900184, 0, 'Spirit Communion: remove Spirited buff on cast');

-- Auto-teach passive (900183) when active (900185) is learned
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 900185 AND `spell_effect` = 900183 AND `type` = 2;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(900185, 900183, 2, 'Spirit Communion: learn passive on-kill proc when active is learned');
