-- [F-164T] Custom SpellVisual for Thunderborne Leap impact (900174).
-- TL uses Thunder Clap's visual (145), whose state_kit = 360 carries no stun pose, so
-- its (real) stunned targets stood with no stun animation. This clone keeps 145's
-- cast/impact (the leap-landing look) and sets state_kit = 349 — the STUN stand-state
-- used by Hammer of Justice (322) and Shockwave (10703) — so stunned targets play the
-- stun animation. 145 is stock/shared, so we clone instead of editing it.
DELETE FROM `spellvisual` WHERE `id` = 90041;
DROP TEMPORARY TABLE IF EXISTS `_tl_vis`;
CREATE TEMPORARY TABLE `_tl_vis` SELECT * FROM `spellvisual` WHERE `id` = 145;
UPDATE `_tl_vis` SET `id` = 90041, `state_kit` = 349;
INSERT INTO `spellvisual` SELECT * FROM `_tl_vis`;
DROP TEMPORARY TABLE `_tl_vis`;
