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
