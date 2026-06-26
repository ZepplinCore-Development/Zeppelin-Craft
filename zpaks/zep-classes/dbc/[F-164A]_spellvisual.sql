-- [F-164A] Custom SpellVisual for Tectonic Blast (900121).
-- Tectonic Blast was cloned from Shockwave (SpellVisual 10703), inheriting its
-- state_kit = 349 — the persistent STUN stand-state played on the target while the
-- spell's aura is active. TB does not stun (it applies an AP-reduction aura), so its
-- debuffed targets wrongly played the stun pose for the debuff's duration.
-- This clone keeps 10703's cast/impact/area (the ground-shockwave damage visual) and
-- only drops the stun state (state_kit = 0). 10703 is stock/shared, so we clone instead
-- of editing it.
DELETE FROM `spellvisual` WHERE `id` = 90040;
DROP TEMPORARY TABLE IF EXISTS `_tb_vis`;
CREATE TEMPORARY TABLE `_tb_vis` SELECT * FROM `spellvisual` WHERE `id` = 10703;
UPDATE `_tb_vis` SET `id` = 90040, `state_kit` = 0;
INSERT INTO `spellvisual` SELECT * FROM `_tb_vis`;
DROP TEMPORARY TABLE `_tb_vis`;
