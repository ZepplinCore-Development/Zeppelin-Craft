-- Heroic Annora
DELETE FROM `creature_template` WHERE entry = 9101000;
INSERT INTO `creature_template` VALUES (9101000, '0', '0', '0', '0', '0', '10609', '0', '0', '0', 'Heroic Annora', 'Master Enchanter', NULL, '4171', '60', '60', '0', '35', '81', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '1617', '1.0', '1.0', '1', '0', '2048', '0', '0', '2', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101000 WHERE (`entry` = 11073);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11073);
-- Heroic Cleft Scorpid
DELETE FROM `creature_template` WHERE entry = 9101001;
INSERT INTO `creature_template` VALUES (9101001, '0', '0', '0', '0', '0', '5985', '0', '0', '0', 'Heroic Cleft Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.2', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '20', '0', '0', '0', '0', '1', '1', '7078', '0', '7078', '8851', '0', '0', '0', '', '1', '1.0', '0.75', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101001 WHERE (`entry` = 7078);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7078);
-- Heroic Deadly Cleft Scorpid
DELETE FROM `creature_template` WHERE entry = 9101002;
INSERT INTO `creature_template` VALUES (9101002, '0', '0', '0', '0', '0', '5985', '0', '0', '0', 'Heroic Deadly Cleft Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '1716', '1.0', '1.0', '1', '0', '2048', '0', '20', '0', '0', '0', '0', '1', '1', '7405', '0', '7405', '8854', '0', '0', '0', '', '1', '1.0', '0.75', '1.0', 
'0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101002 WHERE (`entry` = 7405);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7405);
-- Heroic Earthen Custodian
DELETE FROM `creature_template` WHERE entry = 9101003;
INSERT INTO `creature_template` VALUES (9101003, '0', '0', '0', '0', '0', '6025', '0', '0', '0', 'Heroic Earthen Custodian', NULL, NULL, '0', '60', '60', '0', '470', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.15', '2000', '1661', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7309', '0', '0', '0', '0', '28', '67', '', '1', '1.0', '0.25', '1.0', '1.0', 
'0.5', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101003 WHERE (`entry` = 7309);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7309);
-- Heroic Earthen Guardian
DELETE FROM `creature_template` WHERE entry = 9101004;
INSERT INTO `creature_template` VALUES (9101004, '0', '0', '0', '0', '0', '6026', '0', '0', '0', 'Heroic Earthen Guardian', NULL, NULL, '0', '60', '60', '0', '470', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2300', '1672', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7076', '0', '0', '0', '0', '34', '101', '', '1', '1.0', '0.25', '1.0', '0.8', '0.5', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101004 WHERE (`entry` = 7076);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7076);
-- Heroic Earthen Hallshaper
DELETE FROM `creature_template` WHERE entry = 9101005;
INSERT INTO `creature_template` VALUES (9101005, '0', '0', '0', '0', '0', '6025', '0', '0', '0', 'Heroic Earthen Hallshaper', NULL, NULL, '0', '60', '60', '0', '470', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.85', '2000', '1661', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7077', '0', '0', '0', '0', '33', '71', '', '1', '1.0', '0.25', '1.0', '0.7', '0.5', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101005 WHERE (`entry` = 7077);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7077);
-- Heroic Earthen Rocksmasher
DELETE FROM `creature_template` WHERE entry = 9101006;
INSERT INTO `creature_template` VALUES (9101006, '0', '0', '0', '0', '0', '6010', '0', '0', '0', 'Heroic Earthen Rocksmasher', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.25', '2700', '1661', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7011', '7011', '0', '0', '0', '75', '304', '', '1', '1.0', '1.2', '1.0', '0.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101006 WHERE (`entry` = 7011);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7011);
-- Heroic Earthen Sculptor
DELETE FROM `creature_template` WHERE entry = 9101007;
INSERT INTO `creature_template` VALUES (9101007, '0', '0', '0', '0', '0', '6009', '0', '0', '0', 'Heroic Earthen Sculptor', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.9', '2000', '1661', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7012', '7012', '0', '0', '0', '65', '1087', '', '1', '1.0', '1.2', '1.0', '0.8', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101007 WHERE (`entry` = 7012);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7012);
-- Heroic Earthen Stonebreaker
DELETE FROM `creature_template` WHERE entry = 9101008;
INSERT INTO `creature_template` VALUES (9101008, '0', '0', '0', '0', '0', '6010', '0', '0', '0', 'Heroic Earthen Stonebreaker', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.2', '2700', '1661', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7396', '7396', '0', '0', '0', '83', '422', '', '1', '1.0', '1.2', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101008 WHERE (`entry` = 7396);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7396);
-- Heroic Earthen Stonecarver
DELETE FROM `creature_template` WHERE entry = 9101009;
INSERT INTO `creature_template` VALUES (9101009, '0', '0', '0', '0', '0', '6009', '0', '0', '0', 'Heroic Earthen Stonecarver', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '1661', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7397', '7397', '0', '0', '0', '71', '197', '', '1', '1.0', '1.2', '1.0', '0.75', '1.0', '0', '0', '1', '8192', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101009 WHERE (`entry` = 7397);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7397);
-- Heroic Jadespine Basilisk
DELETE FROM `creature_template` WHERE entry = 9101010;
INSERT INTO `creature_template` VALUES (9101010, '0', '0', '0', '0', '0', '4486', '0', '0', '0', 'Heroic Jadespine Basilisk', NULL, NULL, '0', '60', '60', '0', '49', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '4863', '0', '4863', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101010 WHERE (`entry` = 4863);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4863);
-- Heroic Lore Keeper of Norgannon
DELETE FROM `creature_template` WHERE entry = 9101011;
INSERT INTO `creature_template` VALUES (9101011, '0', '0', '0', '0', '0', '6589', '0', '0', '0', 'Heroic Lore Keeper of Norgannon', NULL, NULL, '562', '60', '60', '0', '35', '1', '1.5', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.2', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '64', '318', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101011 WHERE (`entry` = 7172);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7172);
-- Heroic Obsidian Shard
DELETE FROM `creature_template` WHERE entry = 9101012;
INSERT INTO `creature_template` VALUES (9101012, '0', '0', '0', '0', '0', '3731', '0', '0', '0', 'Heroic Obsidian Shard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.5', '1300', '1826', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '9', '32768', '0', '0', '100031', '0', '0', '23', '115', '', '1', '1.0', '0.5', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101012 WHERE (`entry` = 7209);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7209);
-- Heroic Remains of a Paladin
DELETE FROM `creature_template` WHERE entry = 9101013;
INSERT INTO `creature_template` VALUES (9101013, '0', '0', '0', '0', '0', '5711', '0', '0', '0', 'Heroic Remains of a Paladin', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.15', '2000', '2000', '1.0', '1.0', '2', '2', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.1', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101013 WHERE (`entry` = 6912);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6912);
-- Heroic Shadowforge Ambusher
DELETE FROM `creature_template` WHERE entry = 9101014;
INSERT INTO `creature_template` VALUES (9101014, '0', '0', '0', '0', '0', '5991', '0', '0', '0', 'Heroic Shadowforge Ambusher', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.25', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7091', '0', '0', '0', '0', '80', '309', '', '1', '1.0', '1.2', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101014 WHERE (`entry` = 7091);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7091);
-- Heroic Shadowforge Archaeologist
DELETE FROM `creature_template` WHERE entry = 9101015;
INSERT INTO `creature_template` VALUES (9101015, '0', '0', '0', '0', '0', '6067', '0', '0', '0', 'Heroic Shadowforge Archaeologist', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4849', '4849', '0', '0', '0', '300', '396', '', '1', '1.0', '3.0', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101015 WHERE (`entry` = 4849);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4849);
-- Heroic Shadowforge Darkcaster
DELETE FROM `creature_template` WHERE entry = 9101016;
INSERT INTO `creature_template` VALUES (9101016, '0', '0', '0', '0', '0', '6055', '0', '0', '0', 'Heroic Shadowforge Darkcaster', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.95', '2000', '1384', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4848', '4848', '0', '0', '0', '257', '930', '', '1', '1.0', '3.0', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101016 WHERE (`entry` = 4848);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4848);
-- Heroic Shadowforge Geologist
DELETE FROM `creature_template` WHERE entry = 9101017;
INSERT INTO `creature_template` VALUES (9101017, '0', '0', '0', '0', '0', '6056', '0', '0', '0', 'Heroic Shadowforge Geologist', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.7', '2000', '1393', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7030', '7030', '0', '0', '0', '231', '996', '', '1', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101017 WHERE (`entry` = 7030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7030);
-- Heroic Shadowforge Relic Hunter
DELETE FROM `creature_template` WHERE entry = 9101018;
INSERT INTO `creature_template` VALUES (9101018, '0', '0', '0', '0', '0', '6054', '0', '0', '0', 'Heroic Shadowforge Relic Hunter', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '1475', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4847', '4847', '0', '0', '0', '225', '298', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101018 WHERE (`entry` = 4847);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4847);
-- Heroic Shadowforge Sharpshooter
DELETE FROM `creature_template` WHERE entry = 9101019;
INSERT INTO `creature_template` VALUES (9101019, '0', '0', '0', '0', '0', '6057', '0', '0', '0', 'Heroic Shadowforge Sharpshooter', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7290', '7290', '0', '0', '0', '300', '1233', '', '1', '1.0', '3.0', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101019 WHERE (`entry` = 7290);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7290);
-- Heroic Shrike Bat
DELETE FROM `creature_template` WHERE entry = 9101020;
INSERT INTO `creature_template` VALUES (9101020, '0', '0', '0', '0', '0', '1954', '0', '0', '0', 'Heroic Shrike Bat', NULL, NULL, '0', '60', '60', '0', '411', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.75', '2000', '1485', '1.0', '1.0', '1', '0', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4861', '0', '4861', '5791', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101020 WHERE (`entry` = 4861);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4861);
-- Heroic Stone Steward
DELETE FROM `creature_template` WHERE entry = 9101021;
INSERT INTO `creature_template` VALUES (9101021, '0', '0', '0', '0', '0', '2234', '0', '0', '0', 'Heroic Stone Steward', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '4860', '0', '100032', '0', '0', '211', '993', '', '1', '1.0', '3.0', '1.0', '1.45', '1.0', '0', '0', '1', '17408', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101021 WHERE (`entry` = 4860);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4860);
-- Heroic Stonevault Ambusher
DELETE FROM `creature_template` WHERE entry = 9101022;
INSERT INTO `creature_template` VALUES (9101022, '0', '0', '0', '0', '0', '763', '0', '0', '0', 'Heroic Stonevault Ambusher', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7175', '7175', '0', '0', '0', '50', '228', '', '1', '1.0', '1.0', '1.0', '0.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101022 WHERE (`entry` = 7175);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7175);
-- Heroic Stonevault Brawler
DELETE FROM `creature_template` WHERE entry = 9101023;
INSERT INTO `creature_template` VALUES (9101023, '0', '0', '0', '0', '0', '11166', '0', '0', '0', 'Heroic Stonevault Brawler', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4855', '4855', '0', '0', '0', '247', '1195', '', '1', '1.0', '3.0', '1.0', '0.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101023 WHERE (`entry` = 4855);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4855);
-- Heroic Stonevault Cave Lurker
DELETE FROM `creature_template` WHERE entry = 9101024;
INSERT INTO `creature_template` VALUES (9101024, '0', '0', '0', '0', '0', '722', '0', '0', '0', 'Heroic Stonevault Cave Lurker', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.9', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4850', '4850', '0', '0', '0', '249', '867', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101024 WHERE (`entry` = 4850);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4850);
-- Heroic Stonevault Flameweaver
DELETE FROM `creature_template` WHERE entry = 9101025;
INSERT INTO `creature_template` VALUES (9101025, '0', '0', '0', '0', '0', '160', '0', '0', '0', 'Heroic Stonevault Flameweaver', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.8', '2000', '1384', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7321', '7321', '0', '0', '0', '246', '687', '', '1', '1.0', '3.0', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101025 WHERE (`entry` = 7321);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7321);
-- Heroic Stonevault Geomancer
DELETE FROM `creature_template` WHERE entry = 9101026;
INSERT INTO `creature_template` VALUES (9101026, '0', '0', '0', '0', '0', '1194', '0', '0', '0', 'Heroic Stonevault Geomancer', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.95', '2000', '1384', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4853', '4853', '0', '0', '0', '257', '911', '', '1', '1.0', '3.0', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101026 WHERE (`entry` = 4853);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4853);
-- Heroic Stonevault Mauler
DELETE FROM `creature_template` WHERE entry = 9101027;
INSERT INTO `creature_template` VALUES (9101027, '0', '0', '0', '0', '0', '11166', '0', '0', '0', 'Heroic Stonevault Mauler', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7320', '7320', '0', '0', '0', '220', '1056', '', '1', '1.0', '3.0', '1.0', '0.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101027 WHERE (`entry` = 7320);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7320);
-- Heroic Stonevault Oracle
DELETE FROM `creature_template` WHERE entry = 9101028;
INSERT INTO `creature_template` VALUES (9101028, '0', '0', '0', '0', '0', '160', '0', '0', '0', 'Heroic Stonevault Oracle', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.8', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4852', '4852', '0', '0', '0', '133', '887', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101028 WHERE (`entry` = 4852);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4852);
-- Heroic Stonevault Rockchewer
DELETE FROM `creature_template` WHERE entry = 9101029;
INSERT INTO `creature_template` VALUES (9101029, '0', '0', '0', '0', '0', '721', '0', '0', '0', 'Heroic Stonevault Rockchewer', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.31251', '2500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4851', '4851', '0', '0', '0', '216', '831', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101029 WHERE (`entry` = 4851);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4851);
-- Heroic Vault Warder
DELETE FROM `creature_template` WHERE entry = 9101030;
INSERT INTO `creature_template` VALUES (9101030, '0', '0', '0', '0', '0', '5989', '0', '0', '0', 'Heroic Vault Warder', NULL, NULL, '0', '60', '60', '0', '470', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2500', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '10120', '0', '100032', '0', '0', '392', '517', '', '0', '1.0', '4.0', '1.0', '6.7', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101030 WHERE (`entry` = 10120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10120);
-- Heroic Venomlash Scorpid
DELETE FROM `creature_template` WHERE entry = 9101031;
INSERT INTO `creature_template` VALUES (9101031, '0', '0', '0', '0', '0', '2488', '0', '0', '0', 'Heroic Venomlash Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '1475', '1.0', '1.0', '1', '0', '2048', '0', '20', '0', '0', '0', '0', '1', '1', '7022', '0', '7022', '5873', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101031 WHERE (`entry` = 7022);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7022);
-- Heroic Ancient Stone Keeper
DELETE FROM `creature_template` WHERE entry = 9101032;
INSERT INTO `creature_template` VALUES (9101032, '0', '0', '0', '0', '0', '10798', '0', '0', '0', 'Heroic Ancient Stone Keeper', NULL, NULL, '0', '63', '63', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2800', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100400', '0', '100032', '0', '0', '249', '904', '', '0', '1.0', '6.26', '1.0', '1.55', '2.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101032 WHERE (`entry` = 7206);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7206);
-- Heroic Archaedas
DELETE FROM `creature_template` WHERE entry = 9101033;
INSERT INTO `creature_template` VALUES (9101033, '0', '0', '0', '0', '0', '5988', '0', '0', '0', 'Heroic Archaedas', 'Ancient Stone Watcher', NULL, '0', '63', '63', '0', '14', '0', '1.5', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.93', '2600', '1800', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '5', '0', '9100400', '0', '0', '0', '0', '1352', '1770', '', '0', '1.0', '6.21', '1.0', '0.7', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101033 WHERE (`entry` = 2748);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 2748);
-- Heroic Baelog
DELETE FROM `creature_template` WHERE entry = 9101034;
INSERT INTO `creature_template` VALUES (9101034, '0', '0', '0', '0', '0', '5710', '0', '0', '0', 'Heroic Baelog', NULL, NULL, '0', '63', '63', '0', '122', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '6906', '0', '0', '0', '271', '1116', '', '0', '1.0', '6.01', '1.0', '1.3', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101034 WHERE (`entry` = 6906);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6906);
-- Heroic Eric "The Swift"
DELETE FROM `creature_template` WHERE entry = 9101035;
INSERT INTO `creature_template` VALUES (9101035, '0', '0', '0', '0', '0', '5708', '0', '0', '0', 'Heroic Eric "The Swift"', NULL, NULL, '0', '63', '63', '0', '122', '2', '1.0', '2.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '6907', '0', '0', '0', '231', '676', '', '1', '1.0', '5.85', '1.0', 
'1.0', '1.0', '0', '188', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101035 WHERE (`entry` = 6907);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6907);
-- Heroic Galgann Firehammer
DELETE FROM `creature_template` WHERE entry = 9101036;
INSERT INTO `creature_template` VALUES (9101036, '0', '0', '0', '0', '0', '6059', '0', '0', '0', 'Heroic Galgann Firehammer', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '2000', '1100', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '415', '1324', '', '0', '1.0', '5.89', '1.0', '0.7', '2.0', '0', '0', '1', '8390672', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101036 WHERE (`entry` = 7291);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7291);
-- Heroic Grimlok
DELETE FROM `creature_template` WHERE entry = 9101037;
INSERT INTO `creature_template` VALUES (9101037, '0', '0', '0', '0', '0', '11165', '0', '0', '0', 'Heroic Grimlok', 'Stonevault Chieftain', NULL, '0', '63', '63', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '1402', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4854', '0', '0', '0', '388', '1378', '', '0', '1.0', '6.08', '2.0', '0.75', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101037 WHERE (`entry` = 4854);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4854);
-- Heroic Ironaya
DELETE FROM `creature_template` WHERE entry = 9101038;
INSERT INTO `creature_template` VALUES (9101038, '0', '0', '0', '0', '0', '6089', '0', '0', '0', 'Heroic Ironaya', NULL, NULL, '0', '63', '63', '0', '59', '0', '1.66667', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2900', '1850', '1.0', '1.0', '1', '33554434', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '9100400', '0', '0', '0', '0', '379', '922', '', '0', '1.0', '5.93', '1.0', '0.95', '2.0', '0', '0', '1', '617316187', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101038 WHERE (`entry` = 7228);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7228);
-- Heroic Obsidian Sentinel
DELETE FROM `creature_template` WHERE entry = 9101039;
INSERT INTO `creature_template` VALUES (9101039, '0', '0', '0', '0', '0', '5285', '0', '0', '0', 'Heroic Obsidian Sentinel', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '9', '32768', '9100400', '0', '100032', '0', '0', '417', '1162', '', '1', '1.0', '6.4', '1.0', '1.0', '2.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101039 WHERE (`entry` = 7023);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7023);
-- Heroic Olaf
DELETE FROM `creature_template` WHERE entry = 9101040;
INSERT INTO `creature_template` VALUES (9101040, '0', '0', '0', '0', '0', '5709', '0', '0', '0', 'Heroic Olaf', NULL, NULL, '0', '63', '63', '0', '122', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '6908', '0', '0', '0', '295', '919', '', '0', '1.0', '6.0', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101040 WHERE (`entry` = 6908);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6908);
-- Heroic Revelosh
DELETE FROM `creature_template` WHERE entry = 9101041;
INSERT INTO `creature_template` VALUES (9101041, '0', '0', '0', '0', '0', '5945', '0', '0', '0', 'Heroic Revelosh', NULL, NULL, '0', '63', '63', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '5.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '6910', '0', '0', '0', '227', '696', '', '1', '1.0', '6.4', '2.0', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101041 WHERE (`entry` = 6910);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6910);
-- Heroic Stone Keeper
DELETE FROM `creature_template` WHERE entry = 9101042;
INSERT INTO `creature_template` VALUES (9101042, '0', '0', '0', '0', '0', '10805', '0', '0', '0', 'Heroic Stone Keeper', NULL, NULL, '0', '63', '63', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2800', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100400', '0', '100032', '0', '0', '322', '1455', '', '1', '1.0', '6.08', '1.0', '1.4', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101042 WHERE (`entry` = 4857);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4857);
-- Mythic Annora
DELETE FROM `creature_template` WHERE entry = 9101043;
INSERT INTO `creature_template` VALUES (9101043, '0', '0', '0', '0', '0', '10609', '0', '0', '0', 'Mythic Annora', 'Master Enchanter', NULL, '4171', '60', '60', '0', '35', '81', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.92', '2000', '1617', '1.0', '1.0', '1', '0', '2048', '0', '0', '2', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.26', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101043 WHERE (`entry` = 11073);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11073);
-- Mythic Cleft Scorpid
DELETE FROM `creature_template` WHERE entry = 9101044;
INSERT INTO `creature_template` VALUES (9101044, '0', '0', '0', '0', '0', '5985', '0', '0', '0', 'Mythic Cleft Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '20', '0', '0', '0', '0', '1', '1', '7078', '0', '7078', '8851', '0', '0', '0', '', '1', '1.0', '3.85', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101044 WHERE (`entry` = 7078);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7078);
-- Mythic Deadly Cleft Scorpid
DELETE FROM `creature_template` WHERE entry = 9101045;
INSERT INTO `creature_template` VALUES (9101045, '0', '0', '0', '0', '0', '5985', '0', '0', '0', 'Mythic Deadly Cleft Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.04', '2000', '1716', '1.0', '1.0', '1', '0', '2048', '0', '20', '0', '0', '0', '0', '1', '1', '7405', '0', '7405', '8854', '0', '0', '0', '', '1', '1.0', '4.28', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101045 WHERE (`entry` = 7405);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7405);
-- Mythic Earthen Custodian
DELETE FROM `creature_template` WHERE entry = 9101046;
INSERT INTO `creature_template` VALUES (9101046, '0', '0', '0', '0', '0', '6025', '0', '0', '0', 'Mythic Earthen Custodian', NULL, NULL, '0', '60', '60', '0', '470', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '2000', '1661', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7309', '0', '0', '0', '0', '28', '67', '', '1', '1.0', '4.27', '1.0', '1.0', 
'0.5', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101046 WHERE (`entry` = 7309);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7309);
-- Mythic Earthen Guardian
DELETE FROM `creature_template` WHERE entry = 9101047;
INSERT INTO `creature_template` VALUES (9101047, '0', '0', '0', '0', '0', '6026', '0', '0', '0', 'Mythic Earthen Guardian', NULL, NULL, '0', '60', '60', '0', '470', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.97', '2300', '1672', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7076', '0', '0', '0', '0', '34', '101', '', '1', '1.0', '4.15', '1.0', '0.8', 
'0.5', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101047 WHERE (`entry` = 7076);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7076);
-- Mythic Earthen Hallshaper
DELETE FROM `creature_template` WHERE entry = 9101048;
INSERT INTO `creature_template` VALUES (9101048, '0', '0', '0', '0', '0', '6025', '0', '0', '0', 'Mythic Earthen Hallshaper', NULL, NULL, '0', '60', '60', '0', '470', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '1661', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7077', '0', '0', '0', '0', '33', '71', '', '1', '1.0', '3.92', '1.0', '0.7', '0.5', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101048 WHERE (`entry` = 7077);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7077);
-- Mythic Earthen Rocksmasher
DELETE FROM `creature_template` WHERE entry = 9101049;
INSERT INTO `creature_template` VALUES (9101049, '0', '0', '0', '0', '0', '6010', '0', '0', '0', 'Mythic Earthen Rocksmasher', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2700', '1661', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7011', '7011', '0', '0', '0', '75', '304', '', '1', '1.0', '4.46', '1.0', '0.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101049 WHERE (`entry` = 7011);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7011);
-- Mythic Earthen Sculptor
DELETE FROM `creature_template` WHERE entry = 9101050;
INSERT INTO `creature_template` VALUES (9101050, '0', '0', '0', '0', '0', '6009', '0', '0', '0', 'Mythic Earthen Sculptor', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.94', '2000', '1661', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7012', '7012', '0', '0', '0', '65', '1087', '', '1', '1.0', '4.43', '1.0', '0.8', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101050 WHERE (`entry` = 7012);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7012);
-- Mythic Earthen Stonebreaker
DELETE FROM `creature_template` WHERE entry = 9101051;
INSERT INTO `creature_template` VALUES (9101051, '0', '0', '0', '0', '0', '6010', '0', '0', '0', 'Mythic Earthen Stonebreaker', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.92', '2700', '1661', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7396', '7396', '0', '0', '0', '83', '422', '', '1', '1.0', '3.84', '1.0', 
'0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101051 WHERE (`entry` = 7396);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7396);
-- Mythic Earthen Stonecarver
DELETE FROM `creature_template` WHERE entry = 9101052;
INSERT INTO `creature_template` VALUES (9101052, '0', '0', '0', '0', '0', '6009', '0', '0', '0', 'Mythic Earthen Stonecarver', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.95', '2000', '1661', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7397', '7397', '0', '0', '0', '71', '197', '', '1', '1.0', '4.46', '1.0', '0.75', '1.0', '0', '0', '1', '8192', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101052 WHERE (`entry` = 7397);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7397);
-- Mythic Jadespine Basilisk
DELETE FROM `creature_template` WHERE entry = 9101053;
INSERT INTO `creature_template` VALUES (9101053, '0', '0', '0', '0', '0', '4486', '0', '0', '0', 'Mythic Jadespine Basilisk', NULL, NULL, '0', '60', '60', '0', '49', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '4863', '0', '4863', '0', '0', '0', '0', '', '1', '1.0', '4.32', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101053 WHERE (`entry` = 4863);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4863);
-- Mythic Lore Keeper of Norgannon
DELETE FROM `creature_template` WHERE entry = 9101054;
INSERT INTO `creature_template` VALUES (9101054, '0', '0', '0', '0', '0', '6589', '0', '0', '0', 'Mythic Lore Keeper of Norgannon', NULL, NULL, '562', '60', '60', '0', '35', '1', '1.5', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.92', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '64', '318', '', '1', '1.0', '3.81', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101054 WHERE (`entry` = 7172);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7172);
-- Mythic Obsidian Shard
DELETE FROM `creature_template` WHERE entry = 9101055;
INSERT INTO `creature_template` VALUES (9101055, '0', '0', '0', '0', '0', '3731', '0', '0', '0', 'Mythic Obsidian Shard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.91', '1300', '1826', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '9', '32768', '0', '0', '100031', '0', '0', '23', '115', '', '1', '1.0', '4.11', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101055 WHERE (`entry` = 7209);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7209);
-- Mythic Remains of a Paladin
DELETE FROM `creature_template` WHERE entry = 9101056;
INSERT INTO `creature_template` VALUES (9101056, '0', '0', '0', '0', '0', '5711', '0', '0', '0', 'Mythic Remains of a Paladin', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '2', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.97', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101056 WHERE (`entry` = 6912);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6912);
-- Mythic Shadowforge Ambusher
DELETE FROM `creature_template` WHERE entry = 9101057;
INSERT INTO `creature_template` VALUES (9101057, '0', '0', '0', '0', '0', '5991', '0', '0', '0', 'Mythic Shadowforge Ambusher', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.99', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7091', '0', '0', '0', '0', '80', '309', '', '1', '1.0', '3.85', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101057 WHERE (`entry` = 7091);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7091);
-- Mythic Shadowforge Archaeologist
DELETE FROM `creature_template` WHERE entry = 9101058;
INSERT INTO `creature_template` VALUES (9101058, '0', '0', '0', '0', '0', '6067', '0', '0', '0', 'Mythic Shadowforge Archaeologist', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4849', '4849', '0', '0', '0', '300', '396', '', '1', '1.0', '3.85', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101058 WHERE (`entry` = 4849);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4849);
-- Mythic Shadowforge Darkcaster
DELETE FROM `creature_template` WHERE entry = 9101059;
INSERT INTO `creature_template` VALUES (9101059, '0', '0', '0', '0', '0', '6055', '0', '0', '0', 'Mythic Shadowforge Darkcaster', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '1384', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4848', '4848', '0', '0', '0', '257', '930', '', '1', '1.0', '3.89', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101059 WHERE (`entry` = 4848);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4848);
-- Mythic Shadowforge Geologist
DELETE FROM `creature_template` WHERE entry = 9101060;
INSERT INTO `creature_template` VALUES (9101060, '0', '0', '0', '0', '0', '6056', '0', '0', '0', 'Mythic Shadowforge Geologist', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '1393', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7030', '7030', '0', '0', '0', '231', '996', '', '1', '1.0', '4.23', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101060 WHERE (`entry` = 7030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7030);
-- Mythic Shadowforge Relic Hunter
DELETE FROM `creature_template` WHERE entry = 9101061;
INSERT INTO `creature_template` VALUES (9101061, '0', '0', '0', '0', '0', '6054', '0', '0', '0', 'Mythic Shadowforge Relic Hunter', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '1475', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4847', '4847', '0', '0', '0', '225', '298', '', '1', '1.0', '3.85', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101061 WHERE (`entry` = 4847);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4847);
-- Mythic Shadowforge Sharpshooter
DELETE FROM `creature_template` WHERE entry = 9101062;
INSERT INTO `creature_template` VALUES (9101062, '0', '0', '0', '0', '0', '6057', '0', '0', '0', 'Mythic Shadowforge Sharpshooter', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7290', '7290', '0', '0', '0', '300', '1233', '', '1', '1.0', '4.12', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101062 WHERE (`entry` = 7290);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7290);
-- Mythic Shrike Bat
DELETE FROM `creature_template` WHERE entry = 9101063;
INSERT INTO `creature_template` VALUES (9101063, '0', '0', '0', '0', '0', '1954', '0', '0', '0', 'Mythic Shrike Bat', NULL, NULL, '0', '60', '60', '0', '411', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '1485', '1.0', '1.0', '1', '0', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4861', '0', '4861', '5791', '0', '0', '0', '', '1', '1.0', '4.07', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101063 WHERE (`entry` = 4861);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4861);
-- Mythic Stone Steward
DELETE FROM `creature_template` WHERE entry = 9101064;
INSERT INTO `creature_template` VALUES (9101064, '0', '0', '0', '0', '0', '2234', '0', '0', '0', 'Mythic Stone Steward', NULL, NULL, '0', '60', '60', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '4860', '0', '100032', '0', '0', '211', '993', '', '1', '1.0', '4.2', '1.0', '1.45', '1.0', '0', '0', '1', '17408', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101064 WHERE (`entry` = 4860);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4860);
-- Mythic Stonevault Ambusher
DELETE FROM `creature_template` WHERE entry = 9101065;
INSERT INTO `creature_template` VALUES (9101065, '0', '0', '0', '0', '0', '763', '0', '0', '0', 'Mythic Stonevault Ambusher', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7175', '7175', '0', '0', '0', '50', '228', '', '1', '1.0', '4.08', '1.0', '0.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101065 WHERE (`entry` = 7175);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7175);
-- Mythic Stonevault Brawler
DELETE FROM `creature_template` WHERE entry = 9101066;
INSERT INTO `creature_template` VALUES (9101066, '0', '0', '0', '0', '0', '11166', '0', '0', '0', 'Mythic Stonevault Brawler', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4855', '4855', '0', '0', '0', '247', '1195', '', '1', '1.0', '4.41', '1.0', 
'0.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101066 WHERE (`entry` = 4855);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4855);
-- Mythic Stonevault Cave Lurker
DELETE FROM `creature_template` WHERE entry = 9101067;
INSERT INTO `creature_template` VALUES (9101067, '0', '0', '0', '0', '0', '722', '0', '0', '0', 'Mythic Stonevault Cave Lurker', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4850', '4850', '0', '0', '0', '249', '867', '', '1', '1.0', '4.18', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101067 WHERE (`entry` = 4850);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4850);
-- Mythic Stonevault Flameweaver
DELETE FROM `creature_template` WHERE entry = 9101068;
INSERT INTO `creature_template` VALUES (9101068, '0', '0', '0', '0', '0', '160', '0', '0', '0', 'Mythic Stonevault Flameweaver', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '1384', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7321', '7321', '0', '0', '0', '246', '687', '', '1', '1.0', '4.27', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101068 WHERE (`entry` = 7321);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7321);
-- Mythic Stonevault Geomancer
DELETE FROM `creature_template` WHERE entry = 9101069;
INSERT INTO `creature_template` VALUES (9101069, '0', '0', '0', '0', '0', '1194', '0', '0', '0', 'Mythic Stonevault Geomancer', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '1384', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4853', '4853', '0', '0', '0', '257', '911', '', '1', '1.0', '3.93', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101069 WHERE (`entry` = 4853);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4853);
-- Mythic Stonevault Mauler
DELETE FROM `creature_template` WHERE entry = 9101070;
INSERT INTO `creature_template` VALUES (9101070, '0', '0', '0', '0', '0', '11166', '0', '0', '0', 'Mythic Stonevault Mauler', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7320', '7320', '0', '0', '0', '220', '1056', '', '1', '1.0', '4.3', '1.0', '0.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101070 WHERE (`entry` = 7320);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7320);
-- Mythic Stonevault Oracle
DELETE FROM `creature_template` WHERE entry = 9101071;
INSERT INTO `creature_template` VALUES (9101071, '0', '0', '0', '0', '0', '160', '0', '0', '0', 'Mythic Stonevault Oracle', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4852', '4852', '0', '0', '0', '133', '887', '', '1', '1.0', '4.37', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101071 WHERE (`entry` = 4852);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4852);
-- Mythic Stonevault Rockchewer
DELETE FROM `creature_template` WHERE entry = 9101072;
INSERT INTO `creature_template` VALUES (9101072, '0', '0', '0', '0', '0', '721', '0', '0', '0', 'Mythic Stonevault Rockchewer', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4851', '4851', '0', '0', '0', '216', '831', '', '1', '1.0', '3.94', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101072 WHERE (`entry` = 4851);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4851);
-- Mythic Vault Warder
DELETE FROM `creature_template` WHERE entry = 9101073;
INSERT INTO `creature_template` VALUES (9101073, '0', '0', '0', '0', '0', '5989', '0', '0', '0', 'Mythic Vault Warder', NULL, NULL, '0', '60', '60', '0', '470', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2500', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '10120', '0', '100032', '0', '0', '392', '517', '', '0', '1.0', '3.8', '1.0', '6.7', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101073 WHERE (`entry` = 10120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10120);
-- Mythic Venomlash Scorpid
DELETE FROM `creature_template` WHERE entry = 9101074;
INSERT INTO `creature_template` VALUES (9101074, '0', '0', '0', '0', '0', '2488', '0', '0', '0', 'Mythic Venomlash Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '1475', '1.0', '1.0', '1', '0', '2048', '0', '20', '0', '0', '0', '0', '1', '1', '7022', '0', '7022', '5873', '0', '0', '0', '', '1', '1.0', '4.13', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101074 WHERE (`entry` = 7022);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7022);
-- Mythic Ancient Stone Keeper
DELETE FROM `creature_template` WHERE entry = 9101075;
INSERT INTO `creature_template` VALUES (9101075, '0', '0', '0', '0', '0', '10798', '0', '0', '0', 'Mythic Ancient Stone Keeper', NULL, NULL, '0', '63', '63', '0', '415', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2800', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100500', '0', '100032', '0', '0', '249', '904', '', '0', '1.0', '8.4', '1.0', '1.55', '2.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101075 WHERE (`entry` = 7206);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7206);
-- Mythic Archaedas
DELETE FROM `creature_template` WHERE entry = 9101076;
INSERT INTO `creature_template` VALUES (9101076, '0', '0', '0', '0', '0', '5988', '0', '0', '0', 'Mythic Archaedas', 'Ancient Stone Watcher', NULL, '0', '63', '63', '0', '14', '0', '1.5', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2600', '1800', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '5', '0', '9100500', '0', '0', '0', '0', '1352', '1770', '', '0', '1.0', '7.81', '1.0', '0.7', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101076 WHERE (`entry` = 2748);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 2748);
-- Mythic Baelog
DELETE FROM `creature_template` WHERE entry = 9101077;
INSERT INTO `creature_template` VALUES (9101077, '0', '0', '0', '0', '0', '5710', '0', '0', '0', 'Mythic Baelog', NULL, NULL, '0', '63', '63', '0', '122', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '6906', '0', '0', '0', '271', '1116', '', '0', '1.0', '7.87', '1.0', '1.3', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101077 WHERE (`entry` = 6906);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6906);
-- Mythic Eric "The Swift"
DELETE FROM `creature_template` WHERE entry = 9101078;
INSERT INTO `creature_template` VALUES (9101078, '0', '0', '0', '0', '0', '5708', '0', '0', '0', 'Mythic Eric "The Swift"', NULL, NULL, '0', '63', '63', '0', '122', '2', '1.0', '2.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '6907', '0', '0', '0', '231', '676', '', '1', '1.0', '8.34', '1.0', 
'1.0', '1.0', '0', '188', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101078 WHERE (`entry` = 6907);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6907);
-- Mythic Galgann Firehammer
DELETE FROM `creature_template` WHERE entry = 9101079;
INSERT INTO `creature_template` VALUES (9101079, '0', '0', '0', '0', '0', '6059', '0', '0', '0', 'Mythic Galgann Firehammer', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.9', '2000', '1100', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '415', '1324', '', '0', '1.0', '8.37', '1.0', '0.7', '2.0', '0', '0', '1', '8390672', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101079 WHERE (`entry` = 7291);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7291);
-- Mythic Grimlok
DELETE FROM `creature_template` WHERE entry = 9101080;
INSERT INTO `creature_template` VALUES (9101080, '0', '0', '0', '0', '0', '11165', '0', '0', '0', 'Mythic Grimlok', 'Stonevault Chieftain', NULL, '0', '63', '63', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '2000', '1402', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4854', '0', '0', '0', '388', '1378', '', '0', '1.0', '8.35', '2.0', '0.75', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101080 WHERE (`entry` = 4854);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4854);
-- Mythic Ironaya
DELETE FROM `creature_template` WHERE entry = 9101081;
INSERT INTO `creature_template` VALUES (9101081, '0', '0', '0', '0', '0', '6089', '0', '0', '0', 'Mythic Ironaya', NULL, NULL, '0', '63', '63', '0', '59', '0', '1.66667', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2900', '1850', '1.0', '1.0', '1', '33554434', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '9100500', '0', '0', '0', '0', '379', '922', '', '0', '1.0', '8.3', '1.0', '0.95', '2.0', '0', '0', '1', '617316187', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101081 WHERE (`entry` = 7228);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7228);
-- Mythic Obsidian Sentinel
DELETE FROM `creature_template` WHERE entry = 9101082;
INSERT INTO `creature_template` VALUES (9101082, '0', '0', '0', '0', '0', '5285', '0', '0', '0', 'Mythic Obsidian Sentinel', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '9', '32768', '9100500', '0', '100032', '0', '0', '417', '1162', '', '1', '1.0', '8.05', 
'1.0', '1.0', '2.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101082 WHERE (`entry` = 7023);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7023);
-- Mythic Olaf
DELETE FROM `creature_template` WHERE entry = 9101083;
INSERT INTO `creature_template` VALUES (9101083, '0', '0', '0', '0', '0', '5709', '0', '0', '0', 'Mythic Olaf', NULL, NULL, '0', '63', '63', '0', '122', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '6908', '0', '0', '0', '295', '919', '', '0', '1.0', '7.96', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101083 WHERE (`entry` = 6908);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6908);
-- Mythic Revelosh
DELETE FROM `creature_template` WHERE entry = 9101084;
INSERT INTO `creature_template` VALUES (9101084, '0', '0', '0', '0', '0', '5945', '0', '0', '0', 'Mythic Revelosh', NULL, NULL, '0', '63', '63', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '6910', '0', '0', '0', '227', '696', '', '1', '1.0', '7.81', '2.0', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101084 WHERE (`entry` = 6910);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6910);
-- Mythic Stone Keeper
DELETE FROM `creature_template` WHERE entry = 9101085;
INSERT INTO `creature_template` VALUES (9101085, '0', '0', '0', '0', '0', '10805', '0', '0', '0', 'Mythic Stone Keeper', NULL, NULL, '0', '63', '63', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '2800', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100500', '0', '100032', '0', '0', '322', '1455', '', '1', '1.0', '8.36', '1.0', '1.4', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101085 WHERE (`entry` = 4857);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4857);