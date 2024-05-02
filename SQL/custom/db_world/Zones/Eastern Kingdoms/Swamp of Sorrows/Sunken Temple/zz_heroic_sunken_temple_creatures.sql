-- Heroic Atalai Corpse Eater
DELETE FROM `creature_template` WHERE entry = 9101300;
INSERT INTO `creature_template` VALUES (9101300, '0', '0', '0', '0', '0', '4778', '6676', '0', '0', 'Heroic Atalai Corpse Eater', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '5270', '5270', '0', '0', '0', '0', '0', '', '1', '1.0', '3.49', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101300 WHERE (`entry` = 5270);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5270) AND (`map` = 109);
-- Heroic Atalai Deathwalker
DELETE FROM `creature_template` WHERE entry = 9101301;
INSERT INTO `creature_template` VALUES (9101301, '0', '0', '0', '0', '0', '4773', '4774', '0', '0', 'Heroic Atalai Deathwalker', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '5271', '5271', '0', '0', '0', '0', '0', '', '1', '1.0', '3.4', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101301 WHERE (`entry` = 5271);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5271) AND (`map` = 109);
-- Heroic Atalai Deathwalkers Spirit
DELETE FROM `creature_template` WHERE entry = 9101302;
INSERT INTO `creature_template` VALUES (9101302, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Atalai Deathwalkers Spirit', NULL, NULL, '0', '60', '60', '0', '37', '0', '0.8', '0.285714', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.12', '1.0', '1.0', '1.0', '0', '70', '1', '652967935', '127', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101302 WHERE (`entry` = 8317);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8317) AND (`map` = 109);
-- Heroic Atalai High Priest
DELETE FROM `creature_template` WHERE entry = 9101303;
INSERT INTO `creature_template` VALUES (9101303, '0', '0', '0', '0', '0', '6675', '6677', '0', '0', 'Heroic Atalai High Priest', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5273', '5273', '0', '0', '0', '0', '0', '', '1', '1.0', '2.86', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101303 WHERE (`entry` = 5273);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5273) AND (`map` = 109);
-- Heroic Atalai Warrior
DELETE FROM `creature_template` WHERE entry = 9101304;
INSERT INTO `creature_template` VALUES (9101304, '0', '0', '0', '0', '0', '7709', '0', '0', '0', 'Heroic Atalai Warrior', NULL, NULL, '0', '60', '60', '0', '37', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5256', '5256', '0', '0', '0', '0', '0', '', '1', '1.0', '3.27', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101304 WHERE (`entry` = 5256);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5256) AND (`map` = 109);
-- Heroic Atalai Witch Doctor
DELETE FROM `creature_template` WHERE entry = 9101305;
INSERT INTO `creature_template` VALUES (9101305, '0', '0', '0', '0', '0', '6670', '6671', '0', '0', 'Heroic Atalai Witch Doctor', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5259', '5259', '0', '0', '0', '0', '0', '', '1', '1.0', '3.4', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101305 WHERE (`entry` = 5259);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5259) AND (`map` = 109);
-- Heroic Deep Lurker
DELETE FROM `creature_template` WHERE entry = 9101306;
INSERT INTO `creature_template` VALUES (9101306, '0', '0', '0', '0', '0', '631', '0', '0', '0', 'Heroic Deep Lurker', NULL, NULL, '0', '60', '60', '0', '14', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '8384', '0', '100044', '0', '0', '0', '0', '', '1', '1.0', '3.46', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101306 WHERE (`entry` = 8384);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8384) AND (`map` = 109);
-- Heroic Hakkari Bloodkeeper
DELETE FROM `creature_template` WHERE entry = 9101307;
INSERT INTO `creature_template` VALUES (9101307, '0', '0', '0', '0', '0', '7829', '0', '0', '0', 'Heroic Hakkari Bloodkeeper', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '8438', '0', '8438', '0', '0', '0', '0', '', '1', '1.0', '3.1', '1.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101307 WHERE (`entry` = 8438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8438) AND (`map` = 109);
-- Heroic Hakkari Frostwing
DELETE FROM `creature_template` WHERE entry = 9101308;
INSERT INTO `creature_template` VALUES (9101308, '0', '0', '0', '0', '0', '7569', '0', '0', '0', 'Heroic Hakkari Frostwing', NULL, NULL, '0', '60', '60', '0', '16', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '27', '0', '0', '0', '0', '1', '1', '5291', '0', '5291', '8909', '0', '0', '0', '', '1', '1.0', '2.97', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101308 WHERE (`entry` = 5291);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5291) AND (`map` = 109);
-- Heroic Hakkari Sapper
DELETE FROM `creature_template` WHERE entry = 9101309;
INSERT INTO `creature_template` VALUES (9101309, '0', '0', '0', '0', '0', '1336', '0', '0', '0', 'Heroic Hakkari Sapper', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '27', '0', '0', '0', '0', '1', '1', '8336', 
'0', '8336', '8910', '0', '0', '0', '', '1', '1.0', '3.17', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101309 WHERE (`entry` = 8336);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8336) AND (`map` = 109);
-- Heroic Malfurion Stormrage
DELETE FROM `creature_template` WHERE entry = 9101310;
INSERT INTO `creature_template` VALUES (9101310, '0', '0', '0', '0', '0', '15399', '0', '0', '0', 'Heroic Malfurion Stormrage', NULL, NULL, '0', '60', '60', '0', '994', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '1.95', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '4', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.33', '500.0', '1.0', '1.0', '0', '0', '1', '617299803', '0', '3', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101310 WHERE (`entry` = 15362);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15362) AND (`map` = 109);
-- Heroic Murk Worm
DELETE FROM `creature_template` WHERE entry = 9101311;
INSERT INTO `creature_template` VALUES (9101311, '0', '0', '0', '0', '0', '7549', '7671', '7672', '0', 'Heroic Murk Worm', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '42', '0', '0', '0', '0', '1', '65537', '5226', '0', '5226', '0', '0', '0', '0', '', '1', '1.0', '3.36', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101311 WHERE (`entry` = 5226);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5226) AND (`map` = 109);
-- Heroic Nightmare Scalebane
DELETE FROM `creature_template` WHERE entry = 9101312;
INSERT INTO `creature_template` VALUES (9101312, '0', '0', '0', '0', '0', '7903', '0', '0', '0', 'Heroic Nightmare Scalebane', NULL, NULL, '0', '60', '60', '0', '50', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '5277', '0', '5277', '0', '0', '0', '0', '', '1', '1.0', '2.87', '1.0', '1.45', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101312 WHERE (`entry` = 5277);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5277) AND (`map` = 109);
-- Heroic Nightmare Suppressor
DELETE FROM `creature_template` WHERE entry = 9101313;
INSERT INTO `creature_template` VALUES (9101313, '0', '0', '0', '0', '0', '7974', '0', '0', '0', 'Heroic Nightmare Suppressor', NULL, NULL, '0', '60', '60', '0', '50', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '8497', '0', '8497', '0', '0', '0', '0', '', '1', '1.0', '3.32', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101313 WHERE (`entry` = 8497);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8497) AND (`map` = 109);
-- Heroic Nightmare Wanderer
DELETE FROM `creature_template` WHERE entry = 9101314;
INSERT INTO `creature_template` VALUES (9101314, '0', '0', '0', '0', '0', '181', '0', '0', '0', 'Heroic Nightmare Wanderer', NULL, NULL, '0', '60', '60', '0', '50', 
'0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '5283', '0', '5283', '0', '0', '0', '0', '', '1', '1.0', '3.39', '1.0', '1.0', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101314 WHERE (`entry` = 5283);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5283) AND (`map` = 109);
-- Heroic Nightmare Wyrmkin
DELETE FROM `creature_template` WHERE entry = 9101315;
INSERT INTO `creature_template` VALUES (9101315, '0', '0', '0', '0', '0', '7863', '0', '0', '0', 'Heroic Nightmare Wyrmkin', NULL, NULL, '0', '60', '60', '0', '50', 
'0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.98', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '5280', '0', '5280', '0', '0', '0', '0', '', '1', '1.0', '3.03', '1.0', '1.0', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101315 WHERE (`entry` = 5280);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5280) AND (`map` = 109);
-- Heroic Saturated Ooze
DELETE FROM `creature_template` WHERE entry = 9101316;
INSERT INTO `creature_template` VALUES (9101316, '0', '0', '0', '0', '0', '682', '0', '0', '0', 'Heroic Saturated Ooze', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '5228', '5228', '0', '0', '0', '0', '0', '', '1', '1.0', '3.45', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101316 WHERE (`entry` = 5228);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5228) AND (`map` = 109);
-- Heroic Shade of Hakkar
DELETE FROM `creature_template` WHERE entry = 9101317;
INSERT INTO `creature_template` VALUES (9101317, '0', '0', '0', '0', '0', '7690', '0', '0', '0', 'Heroic Shade of Hakkar', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '2', '33554752', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.45', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101317 WHERE (`entry` = 8440);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8440) AND (`map` = 109);
-- Heroic Spawn of Hakkar
DELETE FROM `creature_template` WHERE entry = 9101318;
INSERT INTO `creature_template` VALUES (9101318, '0', '0', '0', '0', '0', '4065', '0', '0', '0', 'Heroic Spawn of Hakkar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '27', '0', '0', '0', '0', '1', '1', '5708', '0', '5708', '8323', '0', '0', '0', '', '0', '1.0', '3.12', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101318 WHERE (`entry` = 5708);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5708) AND (`map` = 109);
-- Heroic Unliving Atalai
DELETE FROM `creature_template` WHERE entry = 9101319;
INSERT INTO `creature_template` VALUES (9101319, '0', '0', '0', '0', '0', '4771', '4772', '0', '0', 'Heroic Unliving Atalai', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '5267', '5267', '0', '0', '0', '0', '0', '', '1', '1.0', '3.48', '1.0', '1.5', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101319 WHERE (`entry` = 5267);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5267) AND (`map` = 109);
-- Heroic Avatar of Hakkar
DELETE FROM `creature_template` WHERE entry = 9101320;
INSERT INTO `creature_template` VALUES (9101320, '0', '0', '0', '0', '0', '8053', '0', '0', '0', 'Heroic Avatar of Hakkar', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '1225', '1347', '1.0', '1.0', '2', '33555200', '2048', '0', '0', '0', '0', '0', '0', '10', '0', 
'9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.28', '1.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101320 WHERE (`entry` = 8443);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8443) AND (`map` = 109);
-- Heroic Dreamscythe
DELETE FROM `creature_template` WHERE entry = 9101321;
INSERT INTO `creature_template` VALUES (9101321, '0', '0', '0', '0', '0', '7553', '0', '0', '0', 'Heroic Dreamscythe', NULL, NULL, '0', '63', '63', '0', '50', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '5721', '0', '0', '0', '0', '', '1', '1.0', '6.16', '1.0', '1.0', '2.0', '0', '144', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101321 WHERE (`entry` = 5721);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5721) AND (`map` = 109);
-- Heroic Hazzas
DELETE FROM `creature_template` WHERE entry = 9101322;
INSERT INTO `creature_template` VALUES (9101322, '0', '0', '0', '0', '0', '9584', '0', '0', '0', 'Heroic Hazzas', NULL, NULL, '0', '63', '63', '0', '50', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '5722', '0', '0', '0', '0', '', '1', '1.0', '5.94', '1.0', '0.95', '2.0', '0', '144', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101322 WHERE (`entry` = 5722);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5722) AND (`map` = 109);
-- Heroic Jammalan the Prophet
DELETE FROM `creature_template` WHERE entry = 9101323;
INSERT INTO `creature_template` VALUES (9101323, '0', '0', '0', '0', '0', '6708', '0', '0', '0', 'Heroic Jammalan the Prophet', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '2', '320', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '5710', '0', '0', '0', '0', '0', '', '1', '1.0', '6.29', '1.0', '0.95', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101323 WHERE (`entry` = 5710);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5710) AND (`map` = 109);
-- Heroic Morphaz
DELETE FROM `creature_template` WHERE entry = 9101324;
INSERT INTO `creature_template` VALUES (9101324, '0', '0', '0', '0', '0', '7975', '0', '0', '0', 'Heroic Morphaz', NULL, NULL, '0', '63', '63', '0', '50', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', 
'5719', '0', '0', '0', '0', '', '1', '1.0', '6.36', '1.0', '1.0', '2.0', '0', '144', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101324 WHERE (`entry` = 5719);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5719) AND (`map` = 109);
-- Heroic Ogom the Wretched
DELETE FROM `creature_template` WHERE entry = 9101325;
INSERT INTO `creature_template` VALUES (9101325, '0', '0', '0', '0', '0', '6709', '0', '0', '0', 'Heroic Ogom the Wretched', NULL, NULL, '0', '63', '63', '0', '37', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '5711', '0', '0', '0', '0', '0', '', '1', '1.0', '6.34', '2.0', '0.95', '2.0', '0', '0', '1', '8912913', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101325 WHERE (`entry` = 5711);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5711) AND (`map` = 109);
-- Heroic Shade of Eranikus
DELETE FROM `creature_template` WHERE entry = 9101326;
INSERT INTO `creature_template` VALUES (9101326, '0', '0', '0', '0', '0', '7806', '0', '0', '0', 'Heroic Shade of Eranikus', NULL, NULL, '0', '63', '63', '0', '50', 
'0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '5709', '0', '0', '0', '0', '', '1', '1.0', '6.43', '1.0', '0.95', '2.0', '0', '144', '1', '646659935', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101326 WHERE (`entry` = 5709);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5709) AND (`map` = 109);
-- Heroic Weaver
DELETE FROM `creature_template` WHERE entry = 9101327;
INSERT INTO `creature_template` VALUES (9101327, '0', '0', '0', '0', '0', '6375', '0', '0', '0', 'Heroic Weaver', NULL, NULL, '0', '63', '63', '0', '50', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '5720', '0', '0', '0', '0', '', '1', '1.0', '6.49', '1.0', '1.0', '2.0', '0', '144', '1', '646659935', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101327 WHERE (`entry` = 5720);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5720) AND (`map` = 109);
-- Heroic Hukku
DELETE FROM `creature_template` WHERE entry = 9101328;
INSERT INTO `creature_template` VALUES (9101328, '0', '0', '0', '0', '0', '6702', '0', '0', '0', 'Heroic Hukku', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '5715', '0', '0', '0', '0', '0', '', '1', '1.0', '6.19', '1.5', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101328 WHERE (`entry` = 5715);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5715) AND (`map` = 109);
-- Heroic Loro
DELETE FROM `creature_template` WHERE entry = 9101329;
INSERT INTO `creature_template` VALUES (9101329, '0', '0', '0', '0', '0', '6700', '0', '0', '0', 'Heroic Loro', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '5714', '0', '0', '0', '0', '0', '', '1', '1.0', '6.01', '1.0', '1.45', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101329 WHERE (`entry` = 5714);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5714) AND (`map` = 109);
-- Heroic Mijan
DELETE FROM `creature_template` WHERE entry = 9101330;
INSERT INTO `creature_template` VALUES (9101330, '0', '0', '0', '0', '0', '6707', '0', '0', '0', 'Heroic Mijan', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '5717', '0', '0', '0', '0', '0', '', '1', '1.0', '6.03', '2.5', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101330 WHERE (`entry` = 5717);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5717) AND (`map` = 109);
-- Heroic Zolo
DELETE FROM `creature_template` WHERE entry = 9101331;
INSERT INTO `creature_template` VALUES (9101331, '0', '0', '0', '0', '0', '6699', '0', '0', '0', 'Heroic Zolo', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '5712', '0', '0', '0', '0', '0', '', '1', '1.0', '5.98', '1.5', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101331 WHERE (`entry` = 5712);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5712) AND (`map` = 109);
-- Heroic ZulLor
DELETE FROM `creature_template` WHERE entry = 9101332;
INSERT INTO `creature_template` VALUES (9101332, '0', '0', '0', '0', '0', '6701', '0', '0', '0', 'Heroic ZulLor', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '5716', '0', '0', '0', '0', '0', '', '1', '1.0', '5.84', '1.0', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101332 WHERE (`entry` = 5716);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5716) AND (`map` = 109);
-- Heroic Gasher
DELETE FROM `creature_template` WHERE entry = 9101333;
INSERT INTO `creature_template` VALUES (9101333, '0', '0', '0', '0', '0', '6698', '0', '0', '0', 'Heroic Gasher', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '1000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '5713', '0', '0', '0', '0', '0', '', '1', '1.0', '6.01', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101333 WHERE (`entry` = 5713);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5713) AND (`map` = 109);
-- Heroic Atalalarion
DELETE FROM `creature_template` WHERE entry = 9101334;
INSERT INTO `creature_template` VALUES (9101334, '0', '0', '0', '0', '0', '7873', '0', '0', '0', 'Heroic Atalalarion', 'Guardian of the Idol', NULL, '0', '63', '63', '0', '37', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '3000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '8580', '0', '0', '0', '0', '0', '', '1', '1.0', '6.45', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101334 WHERE (`entry` = 8580);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8580) AND (`map` = 109);
-- Heroic Atalai Skeleton
DELETE FROM `creature_template` WHERE entry = 9101335;
INSERT INTO `creature_template` VALUES (9101335, '0', '0', '0', '0', '0', '7555', '0', '0', '0', 'Heroic Atalai Skeleton', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.98', '2000', '1705', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.31', '1.0', '1.0', '1.0', '0', '0', '1', '646016863', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101335 WHERE (`entry` = 8324);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8324) AND (`map` = 109);
-- Heroic Atalai Slave
DELETE FROM `creature_template` WHERE entry = 9101336;
INSERT INTO `creature_template` VALUES (9101336, '0', '0', '0', '0', '0', '7554', '0', '0', '0', 'Heroic Atalai Slave', NULL, NULL, '0', '60', '60', '0', '37', '0', 
'1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '8318', '0', 
'0', '0', '0', '0', '0', '', '1', '1.0', '2.29', '1.0', '1.0', '1.0', '0', '0', '1', '17', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101336 WHERE (`entry` = 8318);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8318) AND (`map` = 109);
-- Heroic Elder Starsong
DELETE FROM `creature_template` WHERE entry = 9101337;
INSERT INTO `creature_template` VALUES (9101337, '0', '0', '0', '0', '0', '15639', '0', '0', '0', 'Heroic Elder Starsong', NULL, NULL, '21058', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.94', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', 
'0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.93', '1.0', '1.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101337 WHERE (`entry` = 15593);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15593) AND (`map` = 109);
-- Heroic Hakkari Minion
DELETE FROM `creature_template` WHERE entry = 9101338;
INSERT INTO `creature_template` VALUES (9101338, '0', '0', '0', '0', '0', '4768', '0', '0', '0', 'Heroic Hakkari Minion', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.97', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '35', '0', '0', '0', '0', '10', '1', '0', '0', '0', '10544', '0', '0', '0', '', '1', '1.0', '2.46', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101338 WHERE (`entry` = 8437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8437) AND (`map` = 109);
-- Heroic Hukkus Imp
DELETE FROM `creature_template` WHERE entry = 9101339;
INSERT INTO `creature_template` VALUES (9101339, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Heroic Hukkus Imp', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.03', '2000', '1639', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.29', '0.55', '0.95', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101339 WHERE (`entry` = 8658);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8658) AND (`map` = 109);
-- Heroic Hukkus Succubus
DELETE FROM `creature_template` WHERE entry = 9101340;
INSERT INTO `creature_template` VALUES (9101340, '0', '0', '0', '0', '0', '4162', '0', '0', '0', 'Heroic Hukkus Succubus', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.02', '2000', '1639', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.12', '1.0', '0.65', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101340 WHERE (`entry` = 8657);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8657) AND (`map` = 109);
-- Heroic Hukkus Voidwalker
DELETE FROM `creature_template` WHERE entry = 9101341;
INSERT INTO `creature_template` VALUES (9101341, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Heroic Hukkus Voidwalker', NULL, NULL, '0', '60', '60', '0', '90', 
'0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.07', '2000', '1639', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.37', '1.0', '1.35', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101341 WHERE (`entry` = 8656);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8656) AND (`map` = 109);
-- Heroic Nightmare Whelp
DELETE FROM `creature_template` WHERE entry = 9101342;
INSERT INTO `creature_template` VALUES (9101342, '0', '0', '0', '0', '0', '621', '0', '0', '0', 'Heroic Nightmare Whelp', NULL, NULL, '0', '60', '60', '0', '50', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '8319', '0', '8319', '0', '0', '0', '0', '', '1', '1.0', '2.32', '1.0', '1.0', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101342 WHERE (`entry` = 8319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8319) AND (`map` = 109);
-- Heroic Oozeling
DELETE FROM `creature_template` WHERE entry = 9101343;
INSERT INTO `creature_template` VALUES (9101343, '0', '0', '0', '0', '0', '7763', '0', '0', '0', 'Heroic Oozeling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.1', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.4', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101343 WHERE (`entry` = 8257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8257) AND (`map` = 109);
-- Heroic Slime Maggot
DELETE FROM `creature_template` WHERE entry = 9101344;
INSERT INTO `creature_template` VALUES (9101344, '0', '0', '0', '0', '0', '7571', '0', '0', '0', 'Heroic Slime Maggot', NULL, NULL, '0', '60', '60', '0', '14', '0', 
'1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8311', '0', 
'0', '0', '0', '0', '0', '', '1', '1.0', '1.98', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101344 WHERE (`entry` = 8311);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8311) AND (`map` = 109);
-- Mythic Atalai Corpse Eater
DELETE FROM `creature_template` WHERE entry = 9101345;
INSERT INTO `creature_template` VALUES (9101345, '0', '0', '0', '0', '0', '4778', '6676', '0', '0', 'Mythic Atalai Corpse Eater', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '5270', '5270', '0', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101345 WHERE (`entry` = 5270);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5270) AND (`map` = 109);
-- Mythic Atalai Deathwalker
DELETE FROM `creature_template` WHERE entry = 9101346;
INSERT INTO `creature_template` VALUES (9101346, '0', '0', '0', '0', '0', '4773', '4774', '0', '0', 'Mythic Atalai Deathwalker', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '5271', '5271', '0', '0', '0', '0', '0', '', '1', '1.0', '3.94', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101346 WHERE (`entry` = 5271);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5271) AND (`map` = 109);
-- Mythic Atalai Deathwalkers Spirit
DELETE FROM `creature_template` WHERE entry = 9101347;
INSERT INTO `creature_template` VALUES (9101347, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Atalai Deathwalkers Spirit', NULL, NULL, '0', '60', '60', '0', '37', '0', '0.8', '0.285714', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.26', '1.0', '1.0', '1.0', '0', '70', '1', '652967935', '127', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101347 WHERE (`entry` = 8317);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8317) AND (`map` = 109);
-- Mythic Atalai High Priest
DELETE FROM `creature_template` WHERE entry = 9101348;
INSERT INTO `creature_template` VALUES (9101348, '0', '0', '0', '0', '0', '6675', '6677', '0', '0', 'Mythic Atalai High Priest', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '7', '0', 
'5273', '5273', '0', '0', '0', '0', '0', '', '1', '1.0', '3.96', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101348 WHERE (`entry` = 5273);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5273) AND (`map` = 109);
-- Mythic Atalai Warrior
DELETE FROM `creature_template` WHERE entry = 9101349;
INSERT INTO `creature_template` VALUES (9101349, '0', '0', '0', '0', '0', '7709', '0', '0', '0', 'Mythic Atalai Warrior', NULL, NULL, '0', '60', '60', '0', '37', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5256', '5256', '0', '0', '0', '0', '0', '', '1', '1.0', '4.1', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101349 WHERE (`entry` = 5256);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5256) AND (`map` = 109);
-- Mythic Atalai Witch Doctor
DELETE FROM `creature_template` WHERE entry = 9101350;
INSERT INTO `creature_template` VALUES (9101350, '0', '0', '0', '0', '0', '6670', '6671', '0', '0', 'Mythic Atalai Witch Doctor', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5259', '5259', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101350 WHERE (`entry` = 5259);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5259) AND (`map` = 109);
-- Mythic Deep Lurker
DELETE FROM `creature_template` WHERE entry = 9101351;
INSERT INTO `creature_template` VALUES (9101351, '0', '0', '0', '0', '0', '631', '0', '0', '0', 'Mythic Deep Lurker', NULL, NULL, '0', '60', '60', '0', '14', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '8384', '0', '100044', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101351 WHERE (`entry` = 8384);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8384) AND (`map` = 109);
-- Mythic Hakkari Bloodkeeper
DELETE FROM `creature_template` WHERE entry = 9101352;
INSERT INTO `creature_template` VALUES (9101352, '0', '0', '0', '0', '0', '7829', '0', '0', '0', 'Mythic Hakkari Bloodkeeper', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '8438', '0', '8438', '0', '0', '0', '0', '', '1', '1.0', '4.36', '1.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101352 WHERE (`entry` = 8438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8438) AND (`map` = 109);
-- Mythic Hakkari Frostwing
DELETE FROM `creature_template` WHERE entry = 9101353;
INSERT INTO `creature_template` VALUES (9101353, '0', '0', '0', '0', '0', '7569', '0', '0', '0', 'Mythic Hakkari Frostwing', NULL, NULL, '0', '60', '60', '0', '16', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '27', '0', '0', '0', '0', '1', '1', '5291', '0', '5291', '8909', '0', '0', '0', '', '1', '1.0', '4.25', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101353 WHERE (`entry` = 5291);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5291) AND (`map` = 109);
-- Mythic Hakkari Sapper
DELETE FROM `creature_template` WHERE entry = 9101354;
INSERT INTO `creature_template` VALUES (9101354, '0', '0', '0', '0', '0', '1336', '0', '0', '0', 'Mythic Hakkari Sapper', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '27', '0', '0', '0', '0', '1', '1', '8336', 
'0', '8336', '8910', '0', '0', '0', '', '1', '1.0', '4.29', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101354 WHERE (`entry` = 8336);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8336) AND (`map` = 109);
-- Mythic Malfurion Stormrage
DELETE FROM `creature_template` WHERE entry = 9101355;
INSERT INTO `creature_template` VALUES (9101355, '0', '0', '0', '0', '0', '15399', '0', '0', '0', 'Mythic Malfurion Stormrage', NULL, NULL, '0', '60', '60', '0', '994', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '4', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.86', '500.0', '1.0', '1.0', '0', '0', '1', '617299803', '0', '3', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101355 WHERE (`entry` = 15362);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15362) AND (`map` = 109);
-- Mythic Murk Worm
DELETE FROM `creature_template` WHERE entry = 9101356;
INSERT INTO `creature_template` VALUES (9101356, '0', '0', '0', '0', '0', '7549', '7671', '7672', '0', 'Mythic Murk Worm', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '42', '0', '0', '0', '0', '1', '65537', '5226', '0', '5226', '0', '0', '0', '0', '', '1', '1.0', '4.29', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101356 WHERE (`entry` = 5226);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5226) AND (`map` = 109);
-- Mythic Nightmare Scalebane
DELETE FROM `creature_template` WHERE entry = 9101357;
INSERT INTO `creature_template` VALUES (9101357, '0', '0', '0', '0', '0', '7903', '0', '0', '0', 'Mythic Nightmare Scalebane', NULL, NULL, '0', '60', '60', '0', '50', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '5277', '0', '5277', '0', '0', '0', '0', '', '1', '1.0', '3.96', '1.0', '1.45', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101357 WHERE (`entry` = 5277);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5277) AND (`map` = 109);
-- Mythic Nightmare Suppressor
DELETE FROM `creature_template` WHERE entry = 9101358;
INSERT INTO `creature_template` VALUES (9101358, '0', '0', '0', '0', '0', '7974', '0', '0', '0', 'Mythic Nightmare Suppressor', NULL, NULL, '0', '60', '60', '0', '50', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '8497', '0', '8497', '0', '0', '0', '0', '', '1', '1.0', '4.4', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101358 WHERE (`entry` = 8497);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8497) AND (`map` = 109);
-- Mythic Nightmare Wanderer
DELETE FROM `creature_template` WHERE entry = 9101359;
INSERT INTO `creature_template` VALUES (9101359, '0', '0', '0', '0', '0', '181', '0', '0', '0', 'Mythic Nightmare Wanderer', NULL, NULL, '0', '60', '60', '0', '50', 
'0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '5283', '0', '5283', '0', '0', '0', '0', '', '1', '1.0', '3.91', '1.0', '1.0', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101359 WHERE (`entry` = 5283);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5283) AND (`map` = 109);
-- Mythic Nightmare Wyrmkin
DELETE FROM `creature_template` WHERE entry = 9101360;
INSERT INTO `creature_template` VALUES (9101360, '0', '0', '0', '0', '0', '7863', '0', '0', '0', 'Mythic Nightmare Wyrmkin', NULL, NULL, '0', '60', '60', '0', '50', 
'0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '5280', '0', '5280', '0', '0', '0', '0', '', '1', '1.0', '4.48', '1.0', '1.0', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101360 WHERE (`entry` = 5280);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5280) AND (`map` = 109);
-- Mythic Saturated Ooze
DELETE FROM `creature_template` WHERE entry = 9101361;
INSERT INTO `creature_template` VALUES (9101361, '0', '0', '0', '0', '0', '682', '0', '0', '0', 'Mythic Saturated Ooze', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '5228', '5228', '0', '0', '0', '0', '0', '', '1', '1.0', '4.42', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101361 WHERE (`entry` = 5228);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5228) AND (`map` = 109);
-- Mythic Shade of Hakkar
DELETE FROM `creature_template` WHERE entry = 9101362;
INSERT INTO `creature_template` VALUES (9101362, '0', '0', '0', '0', '0', '7690', '0', '0', '0', 'Mythic Shade of Hakkar', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '33554752', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.21', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101362 WHERE (`entry` = 8440);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8440) AND (`map` = 109);
-- Mythic Spawn of Hakkar
DELETE FROM `creature_template` WHERE entry = 9101363;
INSERT INTO `creature_template` VALUES (9101363, '0', '0', '0', '0', '0', '4065', '0', '0', '0', 'Mythic Spawn of Hakkar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '27', '0', '0', '0', '0', '1', '1', '5708', '0', '5708', '8323', '0', '0', '0', '', '0', '1.0', '4.31', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101363 WHERE (`entry` = 5708);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5708) AND (`map` = 109);
-- Mythic Unliving Atalai
DELETE FROM `creature_template` WHERE entry = 9101364;
INSERT INTO `creature_template` VALUES (9101364, '0', '0', '0', '0', '0', '4771', '4772', '0', '0', 'Mythic Unliving Atalai', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '5267', '5267', '0', '0', '0', '0', '0', '', '1', '1.0', '4.06', '1.0', '1.5', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101364 WHERE (`entry` = 5267);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5267) AND (`map` = 109);
-- Mythic Avatar of Hakkar
DELETE FROM `creature_template` WHERE entry = 9101365;
INSERT INTO `creature_template` VALUES (9101365, '0', '0', '0', '0', '0', '8053', '0', '0', '0', 'Mythic Avatar of Hakkar', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '1225', '1347', '1.0', '1.0', '2', '33555200', '2048', '0', '0', '0', '0', '0', '0', '10', '0', 
'9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.3', '1.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101365 WHERE (`entry` = 8443);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8443) AND (`map` = 109);
-- Mythic Dreamscythe
DELETE FROM `creature_template` WHERE entry = 9101366;
INSERT INTO `creature_template` VALUES (9101366, '0', '0', '0', '0', '0', '7553', '0', '0', '0', 'Mythic Dreamscythe', NULL, NULL, '0', '63', '63', '0', '50', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', '5721', '0', '0', '0', '0', '', '1', '1.0', '7.98', '1.0', '1.0', '2.0', '0', '144', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101366 WHERE (`entry` = 5721);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5721) AND (`map` = 109);
-- Mythic Hazzas
DELETE FROM `creature_template` WHERE entry = 9101367;
INSERT INTO `creature_template` VALUES (9101367, '0', '0', '0', '0', '0', '9584', '0', '0', '0', 'Mythic Hazzas', NULL, NULL, '0', '63', '63', '0', '50', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', '5722', '0', '0', '0', '0', '', '1', '1.0', '8.02', '1.0', '0.95', '2.0', '0', '144', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101367 WHERE (`entry` = 5722);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5722) AND (`map` = 109);
-- Mythic Jammalan the Prophet
DELETE FROM `creature_template` WHERE entry = 9101368;
INSERT INTO `creature_template` VALUES (9101368, '0', '0', '0', '0', '0', '6708', '0', '0', '0', 'Mythic Jammalan the Prophet', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '2', '320', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '5710', '0', '0', '0', '0', '0', '', '1', '1.0', '8.28', '1.0', '0.95', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101368 WHERE (`entry` = 5710);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5710) AND (`map` = 109);
-- Mythic Morphaz
DELETE FROM `creature_template` WHERE entry = 9101369;
INSERT INTO `creature_template` VALUES (9101369, '0', '0', '0', '0', '0', '7975', '0', '0', '0', 'Mythic Morphaz', NULL, NULL, '0', '63', '63', '0', '50', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', 
'5719', '0', '0', '0', '0', '', '1', '1.0', '8.28', '1.0', '1.0', '2.0', '0', '144', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101369 WHERE (`entry` = 5719);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5719) AND (`map` = 109);
-- Mythic Ogom the Wretched
DELETE FROM `creature_template` WHERE entry = 9101370;
INSERT INTO `creature_template` VALUES (9101370, '0', '0', '0', '0', '0', '6709', '0', '0', '0', 'Mythic Ogom the Wretched', NULL, NULL, '0', '63', '63', '0', '37', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '5711', '0', '0', '0', '0', '0', '', '1', '1.0', '7.99', '2.0', '0.95', '2.0', '0', '0', '1', '8912913', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101370 WHERE (`entry` = 5711);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5711) AND (`map` = 109);
-- Mythic Shade of Eranikus
DELETE FROM `creature_template` WHERE entry = 9101371;
INSERT INTO `creature_template` VALUES (9101371, '0', '0', '0', '0', '0', '7806', '0', '0', '0', 'Mythic Shade of Eranikus', NULL, NULL, '0', '63', '63', '0', '50', 
'0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', '5709', '0', '0', '0', '0', '', '1', '1.0', '8.1', '1.0', '0.95', '2.0', '0', '144', '1', '646659935', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101371 WHERE (`entry` = 5709);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5709) AND (`map` = 109);
-- Mythic Weaver
DELETE FROM `creature_template` WHERE entry = 9101372;
INSERT INTO `creature_template` VALUES (9101372, '0', '0', '0', '0', '0', '6375', '0', '0', '0', 'Mythic Weaver', NULL, NULL, '0', '63', '63', '0', '50', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', '5720', '0', '0', '0', '0', '', '1', '1.0', '8.21', '1.0', '1.0', '2.0', '0', '144', '1', '646659935', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101372 WHERE (`entry` = 5720);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5720) AND (`map` = 109);
-- Mythic Hukku
DELETE FROM `creature_template` WHERE entry = 9101373;
INSERT INTO `creature_template` VALUES (9101373, '0', '0', '0', '0', '0', '6702', '0', '0', '0', 'Mythic Hukku', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '5715', '0', '0', '0', '0', '0', '', '1', '1.0', '8.08', '1.5', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101373 WHERE (`entry` = 5715);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5715) AND (`map` = 109);
-- Mythic Loro
DELETE FROM `creature_template` WHERE entry = 9101374;
INSERT INTO `creature_template` VALUES (9101374, '0', '0', '0', '0', '0', '6700', '0', '0', '0', 'Mythic Loro', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '5714', '0', '0', '0', '0', '0', '', '1', '1.0', '7.98', '1.0', '1.45', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101374 WHERE (`entry` = 5714);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5714) AND (`map` = 109);
-- Mythic Mijan
DELETE FROM `creature_template` WHERE entry = 9101375;
INSERT INTO `creature_template` VALUES (9101375, '0', '0', '0', '0', '0', '6707', '0', '0', '0', 'Mythic Mijan', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '5717', '0', '0', '0', '0', '0', '', '1', '1.0', '8.46', '2.5', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101375 WHERE (`entry` = 5717);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5717) AND (`map` = 109);
-- Mythic Zolo
DELETE FROM `creature_template` WHERE entry = 9101376;
INSERT INTO `creature_template` VALUES (9101376, '0', '0', '0', '0', '0', '6699', '0', '0', '0', 'Mythic Zolo', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '5712', '0', '0', '0', '0', '0', '', '1', '1.0', '7.9', '1.5', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101376 WHERE (`entry` = 5712);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5712) AND (`map` = 109);
-- Mythic ZulLor
DELETE FROM `creature_template` WHERE entry = 9101377;
INSERT INTO `creature_template` VALUES (9101377, '0', '0', '0', '0', '0', '6701', '0', '0', '0', 'Mythic ZulLor', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '5716', '0', '0', '0', '0', '0', '', '1', '1.0', '8.46', '1.0', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101377 WHERE (`entry` = 5716);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5716) AND (`map` = 109);
-- Mythic Gasher
DELETE FROM `creature_template` WHERE entry = 9101378;
INSERT INTO `creature_template` VALUES (9101378, '0', '0', '0', '0', '0', '6698', '0', '0', '0', 'Mythic Gasher', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '1000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '5713', '0', '0', '0', '0', '0', '', '1', '1.0', '7.82', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101378 WHERE (`entry` = 5713);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5713) AND (`map` = 109);
-- Mythic Atalalarion
DELETE FROM `creature_template` WHERE entry = 9101379;
INSERT INTO `creature_template` VALUES (9101379, '0', '0', '0', '0', '0', '7873', '0', '0', '0', 'Mythic Atalalarion', 'Guardian of the Idol', NULL, '0', '63', '63', '0', '37', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.9', '3000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', 
'7', '0', '9100500', '8580', '0', '0', '0', '0', '0', '', '1', '1.0', '8.39', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101379 WHERE (`entry` = 8580);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8580) AND (`map` = 109);
-- Mythic Atalai Skeleton
DELETE FROM `creature_template` WHERE entry = 9101380;
INSERT INTO `creature_template` VALUES (9101380, '0', '0', '0', '0', '0', '7555', '0', '0', '0', 'Mythic Atalai Skeleton', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.91', '2000', '1705', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.29', '1.0', '1.0', '1.0', '0', '0', '1', '646016863', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101380 WHERE (`entry` = 8324);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8324) AND (`map` = 109);
-- Mythic Atalai Slave
DELETE FROM `creature_template` WHERE entry = 9101381;
INSERT INTO `creature_template` VALUES (9101381, '0', '0', '0', '0', '0', '7554', '0', '0', '0', 'Mythic Atalai Slave', NULL, NULL, '0', '60', '60', '0', '37', '0', 
'1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '8318', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.02', '1.0', '1.0', '1.0', '0', '0', '1', '17', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101381 WHERE (`entry` = 8318);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8318) AND (`map` = 109);
-- Mythic Elder Starsong
DELETE FROM `creature_template` WHERE entry = 9101382;
INSERT INTO `creature_template` VALUES (9101382, '0', '0', '0', '0', '0', '15639', '0', '0', '0', 'Mythic Elder Starsong', NULL, NULL, '21058', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.95', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', 
'0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.25', '1.0', '1.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101382 WHERE (`entry` = 15593);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15593) AND (`map` = 109);
-- Mythic Hakkari Minion
DELETE FROM `creature_template` WHERE entry = 9101383;
INSERT INTO `creature_template` VALUES (9101383, '0', '0', '0', '0', '0', '4768', '0', '0', '0', 'Mythic Hakkari Minion', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '35', '0', '0', '0', '0', '10', '1', '0', '0', '0', '10544', '0', '0', '0', '', '1', '1.0', '3.47', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101383 WHERE (`entry` = 8437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8437) AND (`map` = 109);
-- Mythic Hukkus Imp
DELETE FROM `creature_template` WHERE entry = 9101384;
INSERT INTO `creature_template` VALUES (9101384, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Mythic Hukkus Imp', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.02', '2000', '1639', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.33', '0.55', '0.95', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101384 WHERE (`entry` = 8658);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8658) AND (`map` = 109);
-- Mythic Hukkus Succubus
DELETE FROM `creature_template` WHERE entry = 9101385;
INSERT INTO `creature_template` VALUES (9101385, '0', '0', '0', '0', '0', '4162', '0', '0', '0', 'Mythic Hukkus Succubus', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.99', '2000', '1639', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.41', '1.0', '0.65', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101385 WHERE (`entry` = 8657);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8657) AND (`map` = 109);
-- Mythic Hukkus Voidwalker
DELETE FROM `creature_template` WHERE entry = 9101386;
INSERT INTO `creature_template` VALUES (9101386, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Mythic Hukkus Voidwalker', NULL, NULL, '0', '60', '60', '0', '90', 
'0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.04', '2000', '1639', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.2', '1.0', '1.35', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101386 WHERE (`entry` = 8656);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8656) AND (`map` = 109);
-- Mythic Nightmare Whelp
DELETE FROM `creature_template` WHERE entry = 9101387;
INSERT INTO `creature_template` VALUES (9101387, '0', '0', '0', '0', '0', '621', '0', '0', '0', 'Mythic Nightmare Whelp', NULL, NULL, '0', '60', '60', '0', '50', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '8319', '0', '8319', '0', '0', '0', '0', '', '1', '1.0', '2.9', '1.0', '1.0', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101387 WHERE (`entry` = 8319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8319) AND (`map` = 109);
-- Mythic Oozeling
DELETE FROM `creature_template` WHERE entry = 9101388;
INSERT INTO `creature_template` VALUES (9101388, '0', '0', '0', '0', '0', '7763', '0', '0', '0', 'Mythic Oozeling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.03', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', 
'0', '0', '0', '0', '', '1', '1.0', '3.16', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101388 WHERE (`entry` = 8257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8257) AND (`map` = 109);
-- Mythic Slime Maggot
DELETE FROM `creature_template` WHERE entry = 9101389;
INSERT INTO `creature_template` VALUES (9101389, '0', '0', '0', '0', '0', '7571', '0', '0', '0', 'Mythic Slime Maggot', NULL, NULL, '0', '60', '60', '0', '14', '0', 
'1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8311', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.21', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101389 WHERE (`entry` = 8311);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8311) AND (`map` = 109);