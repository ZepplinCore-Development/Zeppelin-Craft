-- I-186 Clan Centaur Item ID Compliance
-- Renumbers upstream mod-clan-centaur Magram + Gelkis vendor loot into the
-- Miscellaneous reservation row at 58311-58329 (56900-66499 scope).
--
-- Mapping:
--   200300 → 58311  Dar'kar of the Third Khan
--   200301 → 58312  Ceremonial Magram Dagger
--   200302 → 58313  Gauntlets of the Khan
--   200303 → 58314  Magram Windstriker
--   200304 → 58315  Centaur Battle Harness
--   200305 → 58316  Dustguider Sash
--   200306 → 58317  Centaur Longbow
--   200307 → 58318  Centaur Stompers
--   200308 → 58319  Packrunner Harness
--   200309 → 58320  Windwatcher Sash
--   200310 → 58321  Batu'kar of the Second Khan
--   200311 → 58322  Ceremonial Centaur Ring
--   200312 → 58323  Gelkis Earthbinder
--   200313 → 58324  Maraudine Oath Pauldrons
--   200314 → 58325  Windbinder Gloves
--   200315 → 58326  Mantle of Centaur Authority
--   200316 → 58327  Centaur Skullcap
--   200317 → 58328  Grips of the Unified Storm
--   200318 → 58329  Warleader Sash
--
-- Apply-order: mod-clan-centaur priority 25 runs upstream Items.sql + NPCVendors.sql
-- first, then zz_[I-179]_Centaur_Longbow.sql (stats UPDATE on 200306), then this
-- file (UPDATE renumber). After all applies, the Longbow stats land at 58317.
--
-- Idempotency: JOIN-guarded DELETE wipes dest rows only when source rows exist
-- (first run after upstream apply). On reruns the source IDs are gone and the
-- cross-join is empty, so dest stays and the UPDATEs no-op.

DELETE t1 FROM `item_template` t1
JOIN `item_template` t2 ON t2.`entry` BETWEEN 200300 AND 200318
WHERE t1.`entry` BETWEEN 58311 AND 58329;

DELETE v1 FROM `npc_vendor` v1
JOIN `item_template` t2 ON t2.`entry` BETWEEN 200300 AND 200318
WHERE v1.`item` BETWEEN 58311 AND 58329;

UPDATE `item_template` SET `entry` = 58311 WHERE `entry` = 200300;
UPDATE `item_template` SET `entry` = 58312 WHERE `entry` = 200301;
UPDATE `item_template` SET `entry` = 58313 WHERE `entry` = 200302;
UPDATE `item_template` SET `entry` = 58314 WHERE `entry` = 200303;
UPDATE `item_template` SET `entry` = 58315 WHERE `entry` = 200304;
UPDATE `item_template` SET `entry` = 58316 WHERE `entry` = 200305;
UPDATE `item_template` SET `entry` = 58317 WHERE `entry` = 200306;
UPDATE `item_template` SET `entry` = 58318 WHERE `entry` = 200307;
UPDATE `item_template` SET `entry` = 58319 WHERE `entry` = 200308;
UPDATE `item_template` SET `entry` = 58320 WHERE `entry` = 200309;
UPDATE `item_template` SET `entry` = 58321 WHERE `entry` = 200310;
UPDATE `item_template` SET `entry` = 58322 WHERE `entry` = 200311;
UPDATE `item_template` SET `entry` = 58323 WHERE `entry` = 200312;
UPDATE `item_template` SET `entry` = 58324 WHERE `entry` = 200313;
UPDATE `item_template` SET `entry` = 58325 WHERE `entry` = 200314;
UPDATE `item_template` SET `entry` = 58326 WHERE `entry` = 200315;
UPDATE `item_template` SET `entry` = 58327 WHERE `entry` = 200316;
UPDATE `item_template` SET `entry` = 58328 WHERE `entry` = 200317;
UPDATE `item_template` SET `entry` = 58329 WHERE `entry` = 200318;

UPDATE `npc_vendor` SET `item` = 58311 WHERE `item` = 200300;
UPDATE `npc_vendor` SET `item` = 58312 WHERE `item` = 200301;
UPDATE `npc_vendor` SET `item` = 58313 WHERE `item` = 200302;
UPDATE `npc_vendor` SET `item` = 58314 WHERE `item` = 200303;
UPDATE `npc_vendor` SET `item` = 58315 WHERE `item` = 200304;
UPDATE `npc_vendor` SET `item` = 58316 WHERE `item` = 200305;
UPDATE `npc_vendor` SET `item` = 58317 WHERE `item` = 200306;
UPDATE `npc_vendor` SET `item` = 58318 WHERE `item` = 200307;
UPDATE `npc_vendor` SET `item` = 58319 WHERE `item` = 200308;
UPDATE `npc_vendor` SET `item` = 58320 WHERE `item` = 200309;
UPDATE `npc_vendor` SET `item` = 58321 WHERE `item` = 200310;
UPDATE `npc_vendor` SET `item` = 58322 WHERE `item` = 200311;
UPDATE `npc_vendor` SET `item` = 58323 WHERE `item` = 200312;
UPDATE `npc_vendor` SET `item` = 58324 WHERE `item` = 200313;
UPDATE `npc_vendor` SET `item` = 58325 WHERE `item` = 200314;
UPDATE `npc_vendor` SET `item` = 58326 WHERE `item` = 200315;
UPDATE `npc_vendor` SET `item` = 58327 WHERE `item` = 200316;
UPDATE `npc_vendor` SET `item` = 58328 WHERE `item` = 200317;
UPDATE `npc_vendor` SET `item` = 58329 WHERE `item` = 200318;
