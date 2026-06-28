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

-- Visual 90021: Rockwall (900223) — a ring of 6 Uldum river-rock clumps orbiting the
-- shaman (a wall of rocks), state-only. state_kit 90021 -> effect 90021 = the backported
-- river-rocks model duplicated 6x at 60deg with a looping yaw track. No impact/cast/precast
-- (no rock burst, no lightning, no hand animation) — just the orbiting rock wall.
-- Rockwall (900223) spell_visual_1 -> 90021 (set in spell.sql).
DELETE FROM `spellvisual` WHERE `id` = 90021;
INSERT INTO `spellvisual` (`id`, `state_kit`) VALUES (90021, 90021);
