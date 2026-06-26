-- [F-164R] Rocksteady Family - spellvisualkit (split from F-164). Rocksurge only.
-- Kit 90020: Rocksurge impact kit — clone of stock 11248 (Ground Spike impact),
-- world_effect repointed to the 1/3-scale spike model 90020. Temp-table clone
-- copies every other column exactly from stock.
DELETE FROM `spellvisualkit` WHERE `id` = 90020;
CREATE TEMPORARY TABLE `_rsg_kit` SELECT * FROM `spellvisualkit` WHERE `id` = 11248;
UPDATE `_rsg_kit` SET `id` = 90020, `world_effect` = 90020;
INSERT INTO `spellvisualkit` SELECT * FROM `_rsg_kit`;
DROP TEMPORARY TABLE `_rsg_kit`;
