-- [F-164R] Rocksteady Family - spellvisual (split from F-164). Rocksurge only.
-- Visual 90020: Rocksurge — clone of stock Ground Spike visual 12718, impact_kit
-- repointed to the 1/3-scale kit 90020 (cast_kit 181 kept). Rocksurge (900263)
-- spell_visual_1 -> 90020 (set in [F-164R]_spell.sql). Temp-table clone copies the
-- rest of 12718 exactly.
DELETE FROM `spellvisual` WHERE `id` = 90020;
CREATE TEMPORARY TABLE `_rsg_vis` SELECT * FROM `spellvisual` WHERE `id` = 12718;
UPDATE `_rsg_vis` SET `id` = 90020, `impact_kit` = 90020;
INSERT INTO `spellvisual` SELECT * FROM `_rsg_vis`;
DROP TEMPORARY TABLE `_rsg_vis`;

-- Visual 90021: Rockwall (900223) persistent buff — the swirling Volcanic Shield rocks,
-- bigger. state_kit 90021 = the orbiting-rock state kit at 1.8x scale (kit 90021 ->
-- effect 90021, clones of Volcanic Shield's 90010 chain). Only state_kit is set: Rockwall
-- is an instant defensive CD, so no precast/cast/impact flourish — just the rock shell that
-- orbits for the buff duration. Rockwall (900223) spell_visual_1 -> 90021 (set in spell.sql).
DELETE FROM `spellvisual` WHERE `id` = 90021;
INSERT INTO `spellvisual` (`id`, `state_kit`) VALUES (90021, 90021);
