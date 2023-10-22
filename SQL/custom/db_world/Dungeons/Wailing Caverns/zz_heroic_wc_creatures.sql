-- Heroic Deviate Adder
DELETE FROM `creature_template` WHERE entry = 9100100;
INSERT INTO `creature_template` VALUES (9100100, '0', '0', '0', '0', '0', '4317', '0', '0', '0', 'Heroic Deviate Adder', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '35', '0', '0', '0', '0', '1', '1', '5048', '0', '100009', '10543', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100100 WHERE (`entry` = 5048);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5048);
-- Heroic Deviate Crocolisk
DELETE FROM `creature_template` WHERE entry = 9100101;
INSERT INTO `creature_template` VALUES (9100101, '0', '0', '0', '0', '0', '2996', '0', '0', '0', 'Heroic Deviate Crocolisk', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '6', '0', '0', '0', '0', '1', '1', '5053', '0', '100004', '5848', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100101 WHERE (`entry` = 5053);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5053);
-- Heroic Deviate Dreadfang
DELETE FROM `creature_template` WHERE entry = 9100102;
INSERT INTO `creature_template` VALUES (9100102, '0', '0', '0', '0', '0', '3006', '0', '0', '0', 'Heroic Deviate Dreadfang', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '27', '0', '0', '0', '0', '1', '1', '5056', '0', '100009', '8899', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100102 WHERE (`entry` = 5056);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5056);
-- Heroic Deviate Guardian
DELETE FROM `creature_template` WHERE entry = 9100103;
INSERT INTO `creature_template` VALUES (9100103, '0', '0', '0', '0', '0', '755', '0', '0', '0', 'Heroic Deviate Guardian', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '11', '0', '0', '0', '0', '1', '1', '3637', '0', '100009', '13180', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100103 WHERE (`entry` = 3637);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3637);
-- Heroic Deviate Lasher
DELETE FROM `creature_template` WHERE entry = 9100104;
INSERT INTO `creature_template` VALUES (9100104, '0', '0', '0', '0', '0', '8172', '0', '0', '0', 'Heroic Deviate Lasher', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.1', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '5055', '0', '100041', '0', '0', '0', '0', '', '1', '1.0', '0.3', '1.0', '0.95', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100104 WHERE (`entry` = 5055);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5055);
-- Heroic Deviate Moccasin
DELETE FROM `creature_template` WHERE entry = 9100105;
INSERT INTO `creature_template` VALUES (9100105, '0', '0', '0', '0', '0', '4305', '0', '0', '0', 'Heroic Deviate Moccasin', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '35', '0', '0', '0', '0', '1', '1', '5762', '0', '100009', '11587', '0', '21', '104', '', '0', '1.0', '3.0', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100105 WHERE (`entry` = 5762);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5762);
-- Heroic Deviate Python
DELETE FROM `creature_template` WHERE entry = 9100106;
INSERT INTO `creature_template` VALUES (9100106, '0', '0', '0', '0', '0', '8173', '8174', '0', '0', 'Heroic Deviate Python', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8886', '0', '100009', '0', '0', '0', '0', '', '1', '1.0', '0.4', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100106 WHERE (`entry` = 8886);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 8886);
-- Heroic Deviate Ravager
DELETE FROM `creature_template` WHERE entry = 9100107;
INSERT INTO `creature_template` VALUES (9100107, '0', '0', '0', '0', '0', '1747', '0', '0', '0', 'Heroic Deviate Ravager', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '11', '0', '0', '0', '0', '1', '1', '3636', '0', '100009', '13218', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100107 WHERE (`entry` = 3636);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3636);
-- Heroic Deviate Shambler
DELETE FROM `creature_template` WHERE entry = 9100108;
INSERT INTO `creature_template` VALUES (9100108, '0', '0', '0', '0', '0', '1084', '0', '0', '0', 'Heroic Deviate Shambler', NULL, NULL, '0', '60', '60', '0', '270', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.05', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '5761', '0', '100041', '0', '0', '29', '178', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100108 WHERE (`entry` = 5761);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5761);
-- Heroic Deviate Venomwing
DELETE FROM `creature_template` WHERE entry = 9100109;
INSERT INTO `creature_template` VALUES (9100109, '0', '0', '0', '0', '0', '2706', '0', '0', '0', 'Heroic Deviate Venomwing', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '27', '0', '0', '0', '0', '1', '1', '5756', '0', '100009', '8901', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100109 WHERE (`entry` = 5756);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5756);
-- Heroic Deviate Viper
DELETE FROM `creature_template` WHERE entry = 9100110;
INSERT INTO `creature_template` VALUES (9100110, '0', '0', '0', '0', '0', '4312', '0', '0', '0', 'Heroic Deviate Viper', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '35', '0', '0', '0', '0', '1', '1', '5755', '0', '100009', '12939', '0', '0', '0', '', '1', '1.0', '2.5', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100110 WHERE (`entry` = 5755);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5755);
-- Heroic Disciple of Naralex
DELETE FROM `creature_template` WHERE entry = 9100111;
INSERT INTO `creature_template` VALUES (9100111, '0', '0', '0', '0', '0', '1941', '0', '0', '0', 'Heroic Disciple of Naralex', NULL, NULL, '201', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.7', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '529', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100111 WHERE (`entry` = 3678);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3678);
-- Heroic Druid of the Fang
DELETE FROM `creature_template` WHERE entry = 9100112;
INSERT INTO `creature_template` VALUES (9100112, '0', '0', '0', '0', '0', '4211', '4232', '4233', '4234', 'Heroic Druid of the Fang', NULL, NULL, '0', '60', '60', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3840', '3840', '0', '0', '0', '36', '136', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100112 WHERE (`entry` = 3840);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3840);
-- Heroic Evolving Ectoplasm
DELETE FROM `creature_template` WHERE entry = 9100113;
INSERT INTO `creature_template` VALUES (9100113, '0', '0', '0', '0', '0', '1751', '0', '0', '0', 'Heroic Evolving Ectoplasm', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.8', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '3640', '3640', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100113 WHERE (`entry` = 3640);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3640);
-- Heroic Naralex
DELETE FROM `creature_template` WHERE entry = 9100114;
INSERT INTO `creature_template` VALUES (9100114, '0', '0', '0', '0', '0', '4216', '0', '0', '0', 'Heroic Naralex', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.9', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.02', '1.0', '1.0', '1.0', '0', 
'0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100114 WHERE (`entry` = 3679);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3679);
-- Heroic Nightmare Ectoplasm
DELETE FROM `creature_template` WHERE entry = 9100115;
INSERT INTO `creature_template` VALUES (9100115, '0', '0', '0', '0', '0', '470', '360', '2028', '358', 'Heroic Nightmare Ectoplasm', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.6', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '5763', '0', '0', '0', '0', '7', '34', '', '0', '1.0', '1.02', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100115 WHERE (`entry` = 5763);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5763);
-- Heroic Deviate Faerie Dragon
DELETE FROM `creature_template` WHERE entry = 9100116;
INSERT INTO `creature_template` VALUES (9100116, '0', '0', '0', '0', '0', '1267', '0', '0', '0', 'Heroic Deviate Faerie Dragon', NULL, NULL, '0', '63', '63', '0', '32', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.99', '2000', '1631', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '5912', '0', '0', '144', '192', '', '0', '1.0', '4.41', '1.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100116 WHERE (`entry` = 5912);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5912);
-- Heroic Kresh
DELETE FROM `creature_template` WHERE entry = 9100117;
INSERT INTO `creature_template` VALUES (9100117, '0', '0', '0', '0', '0', '5126', '0', '0', '0', 'Heroic Kresh', NULL, NULL, '0', '63', '63', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '9100400', '0', '100006', '5934', '0', '0', '0', '', '1', '1.0', '4.2', '1.0', '5.0', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100117 WHERE (`entry` = 3653);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3653);
-- Heroic Lady Anacondra
DELETE FROM `creature_template` WHERE entry = 9100118;
INSERT INTO `creature_template` VALUES (9100118, '0', '0', '0', '0', '0', '4313', '0', '0', '0', 'Heroic Lady Anacondra', 'Fanglord', NULL, '0', '63', '63', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3671', '0', '0', '0', '56', '180', '', '1', '1.0', '4.46', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100118 WHERE (`entry` = 3671);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3671);
-- Heroic Lord Cobrahn
DELETE FROM `creature_template` WHERE entry = 9100119;
INSERT INTO `creature_template` VALUES (9100119, '0', '0', '0', '0', '0', '4213', '0', '0', '0', 'Heroic Lord Cobrahn', 'Fanglord', NULL, '0', '63', '63', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3669', '0', '0', '0', '87', '168', '', '1', '1.0', '3.92', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100119 WHERE (`entry` = 3669);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3669);
-- Heroic Lord Pythas
DELETE FROM `creature_template` WHERE entry = 9100120;
INSERT INTO `creature_template` VALUES (9100120, '0', '0', '0', '0', '0', '4214', '0', '0', '0', 'Heroic Lord Pythas', 'Fanglord', NULL, '0', '63', '63', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.93', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3670', '0', '0', '0', '135', '181', '', '1', '1.0', '3.91', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100120 WHERE (`entry` = 3670);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3670);
-- Heroic Lord Serpentis
DELETE FROM `creature_template` WHERE entry = 9100121;
INSERT INTO `creature_template` VALUES (9100121, '0', '0', '0', '0', '0', '4215', '0', '0', '0', 'Heroic Lord Serpentis', 'Fanglord', NULL, '0', '63', '63', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3673', '0', '0', '0', '156', '255', '', '1', '1.0', '4.08', '3.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100121 WHERE (`entry` = 3673);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3673);
-- Heroic Mutanus the Devourer
DELETE FROM `creature_template` WHERE entry = 9100122;
INSERT INTO `creature_template` VALUES (9100122, '0', '0', '0', '0', '0', '4088', '0', '0', '0', 'Heroic Mutanus the Devourer', NULL, NULL, '0', '63', '63', '0', '270', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3654', '0', '0', '0', '50', '270', '', '1', '1.0', '4.34', '1.0', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100122 WHERE (`entry` = 3654);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3654);
-- Heroic Skum
DELETE FROM `creature_template` WHERE entry = 9100123;
INSERT INTO `creature_template` VALUES (9100123, '0', '0', '0', '0', '0', '4203', '0', '0', '0', 'Heroic Skum', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '3674', '0', '0', '0', '0', '', '1', '1.0', '3.97', '1.0', '0.95', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100123 WHERE (`entry` = 3674);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3674);
-- Heroic Verdan the Everliving
DELETE FROM `creature_template` WHERE entry = 9100124;
INSERT INTO `creature_template` VALUES (9100124, '0', '0', '0', '0', '0', '4256', '0', '0', '0', 'Heroic Verdan the Everliving', NULL, NULL, '0', '63', '63', '0', '270', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '3500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '9100400', '0', '100041', '0', '0', '211', '281', '', '1', '1.0', '4.18', '1.0', '0.95', '2.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100124 WHERE (`entry` = 5775);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5775);