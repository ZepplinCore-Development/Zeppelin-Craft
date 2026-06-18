-- [F-164] Custom spellvisualkit entries

-- Kit 90001: Spirit Communion — Ghost_state base effect (717)
-- Ghostly spirit aura appears around the caster
-- anim_id 54 = cast directed (blends with movement like Rejuvenation)
DELETE FROM `spellvisualkit` WHERE `id` = 90001;
INSERT INTO `spellvisualkit` (`id`, `anim_id`, `base_effect`) VALUES (90001, 54, 717);

-- Kit 90010: Volcanic Shield persistent buff — clone of stock Earth Shield state kit 6428
-- base_effect 90010 = orbiting red rocks WITH flames (custom model; its rock-bone particle
--   emitter was retargeted to the VOLCANIC_FIRE 4x4 flame sheet, so flames orbit on the rocks)
-- start_anim_id/anim_id/char_proc_* = -1 (none) per stock kit 6428
DELETE FROM `spellvisualkit` WHERE `id` = 90010;
INSERT INTO `spellvisualkit` (`id`, `start_anim_id`, `anim_id`, `base_effect`, `char_proc_1`, `char_proc_2`, `char_proc_3`, `char_proc_4`)
VALUES (90010, 4294967295, 4294967295, 90010, 4294967295, 4294967295, 4294967295, 4294967295);

-- Kit 90011 (precast) / 90012 (cast): red Lightning hand flourish on BOTH hands.
-- The "big lines coming down from the sky" are the IMPACT effect the shields play on the
-- caster at cast completion (Water Shield visual 7358 impact_kit 6809 = WaterShield_Impact_Base).
-- Volcanic Shield had no impact_kit; it's added on the visual (90003 -> stock kit 62 =
-- LightningShield_Impact_Base). Cast kit just keeps red hands + Tectonic sound (12981).
-- Kit 90013 (impact): custom red impact effect, base_effect 90013, sound_id 0 (the Tectonic
--   cast sound on kit 90012 covers the cast; no extra lightning-impact sound).
DELETE FROM `spellvisualkit` WHERE `id` IN (90011, 90012, 90013);
INSERT INTO `spellvisualkit` (`id`, `start_anim_id`, `anim_id`, `left_hand_effect`, `right_hand_effect`, `base_effect`, `sound_id`, `char_proc_1`, `char_proc_2`, `char_proc_3`, `char_proc_4`) VALUES
  (90011, 4294967295, 52,         90011, 90011, 0,     0,     4294967295, 4294967295, 4294967295, 4294967295),
  (90012, 4294967295, 54,         90012, 90012, 0,     12981, 4294967295, 4294967295, 4294967295, 4294967295),
  (90013, 4294967295, 4294967295, 0,     0,     90013, 0,     4294967295, 4294967295, 4294967295, 4294967295);

-- Kit 90020: Rocksurge impact kit — clone of stock 11248 (Ground Spike impact),
-- world_effect repointed to the 1/3-scale spike model 90020. Temp-table clone
-- copies every other column exactly from stock.
DELETE FROM `spellvisualkit` WHERE `id` = 90020;
CREATE TEMPORARY TABLE `_rsg_kit` SELECT * FROM `spellvisualkit` WHERE `id` = 11248;
UPDATE `_rsg_kit` SET `id` = 90020, `world_effect` = 90020;
INSERT INTO `spellvisualkit` SELECT * FROM `_rsg_kit`;
DROP TEMPORARY TABLE `_rsg_kit`;
