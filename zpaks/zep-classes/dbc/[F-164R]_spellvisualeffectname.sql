-- [F-164R] Rocksteady Family - spellvisualeffectname (split from F-164). Rocksurge only.
-- Effect 90020: Rocksurge erupting spike at 0.9x stock scale, stock playback speed.
-- Clone of stock 4751 "Earth Spike" (Spells\GroundSpike_Impact.mdx, scale 1.0);
-- scale = stock * 0.9 and file_name is repointed to a custom windup-trimmed model so
-- Ground Spike (still effect 4751) is unaffected. The custom model
-- Spells\Rocksurge_Spike.m2 (+ Rocksurge_Spike00.skin) is GroundSpike_Impact with
-- every animation/global-sequence duration and keyframe timestamp halved; it ships
-- in the zep-models zpak (PATCH-Z). The model is also windup-trimmed: anim0's
-- leading ~300ms (stock) flat lead-in is removed so the spike erupts immediately
-- instead of after the ground-effect telegraph. Rebuild from pristine stock with:
--   python3 /tmp/m2_retime.py <stock GroundSpike_Impact.M2> <dst Rocksurge_Spike.m2> 300 1.0 --write
-- Temp-table clone copies flags exactly from stock.
DELETE FROM `spellvisualeffectname` WHERE `id` = 90020;
CREATE TEMPORARY TABLE `_rsg_evn` SELECT * FROM `spellvisualeffectname` WHERE `id` = 4751;
UPDATE `_rsg_evn` SET `id` = 90020, `name` = 'Earth Spike (Rocksurge 0.9 scale, stock speed)', `scale` = `scale` * 0.9, `file_name` = 'Spells\\Rocksurge_Spike.mdx';
INSERT INTO `spellvisualeffectname` SELECT * FROM `_rsg_evn`;
DROP TEMPORARY TABLE `_rsg_evn`;

-- Effect 90021: Rockwall orbiting rock STATE — a wall of 6 Uldum river-rock clumps
-- orbiting the shaman (visually distinct from Volcanic Shield's rocks). Custom model
-- spells\rockwall_riverrocks.mdx, built from the retail uldum_riverrocksgrass doodad:
--   1) backported to WotLK MD20 v264 via Retroport (M2Mod txid-remove + m2i roundtrip,
--      then MultiConverter Legion->Wotlk) in Zeppelin-Tools;
--   2) M2 edit (scratch make_ring6.py): clump scaled 0.2x, duplicated 6x at 60deg around
--      the vertical axis at radius 1.5 / torso height (forms the ring), all verts skinned
--      to the root bone; root bone pivot moved to origin and given the 0x200 "transformed"
--      flag (REQUIRED — without it the client ignores the bone's animation = static);
--      a GLOBAL SEQUENCE (4000ms) drives a full Z-yaw on the root bone so the ring orbits
--      continuously (global seq loops independent of animation playback).
-- DBC scale 1.15 = the requested +15% size. Model + rockwall_riverrocks.blp ship in zep-models.
DELETE FROM `spellvisualeffectname` WHERE `id` = 90021;
CREATE TEMPORARY TABLE `_rkw_evn` SELECT * FROM `spellvisualeffectname` WHERE `id` = 90010;
UPDATE `_rkw_evn` SET `id` = 90021, `name` = 'Rockwall State (orbiting river rocks ring x6)', `scale` = 1.15, `file_name` = 'spells\\rockwall_riverrocks.mdx';
INSERT INTO `spellvisualeffectname` SELECT * FROM `_rkw_evn`;
DROP TEMPORARY TABLE `_rkw_evn`;
