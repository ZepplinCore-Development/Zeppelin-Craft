-- Taim Ragetotem
DELETE FROM `creature` WHERE `id1`=7427;
INSERT INTO `creature` (`id1`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES (7427, 1, -1384.29, -98.6163, 159.018, 2.87979, 300);

-- Kergul Bloodaxe <Warsong Gulch Battlemaster>
DELETE FROM `creature` WHERE `id1`=10360;
INSERT INTO `creature` (`id1`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES (10360, 1, -1381.29, -75.9809, 160.602, 3.19395, 300);

-- Martin Lindsey <Arathi Basin Battlemaster>
DELETE FROM `creature` WHERE `id1`=12198;
INSERT INTO `creature` (`id1`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES (12198, 1, -995.143, 217.173, 104.729, 4.46804, 500);

-- Kurm Stonehoof <Mining Supplier>
UPDATE `creature_template` SET `subname`='Mining Supplier' WHERE `entry`=3002;

-- Nida Winterhoof <Herbalism Supplier>
UPDATE `creature_template` SET `subname`='Expert Enchanter' WHERE `entry`=3014;

-- Kard Ragetotem <Sword and Dagger Merchant>
UPDATE `creature_template` SET `subname`='Sword and Dagger Merchant' WHERE `entry`=3021;

-- Naal Mistrunner <Cooking Supplier>
UPDATE `creature_template` SET `subname`='Cooking Supplier' WHERE `entry`=3027;

-- Sewa Mistrunner <Fishing Supplier>
UPDATE `creature_template` SET `subname`='Fishing Supplier' WHERE `entry`=3029;

-- Cairne Bloodhoof <High Chieftain>
UPDATE `creature_template` SET `minlevel`=63, `maxlevel`=63 WHERE `entry`=3057;

-- Honor Guard
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60, `rank`=0 WHERE `entry`=3083;

-- Bluffwatcher
UPDATE `creature_template` SET `minlevel`=55, `maxlevel`=55, `faction`=105 WHERE `entry`=3084;

-- Chepi <Reagent Vendor>
UPDATE `creature_template` SET `subname`='Reagent Vendor' WHERE `entry`=8361;

-- Kuruk <General Goods Vendor>
UPDATE `creature_template` SET `subname`='General Goods Vendor' WHERE `entry`=8362;

-- Shadi Mistrunner <Trade Goods Supplier>
UPDATE `creature_template` SET `subname`='Trade Goods Supplier' WHERE `entry`=8363;

-- Hunter Sagewind
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60 WHERE `entry`=14440;

-- Hunter Ragetotem
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60 WHERE `entry`=14441;

-- Kurm Stonehoof <Mining Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3002 AND `item` IN (20815, 20824);

-- Fyr Mistrunner <Bread Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=3003 AND `item` IN (27855, 33449, 35950);

-- Mahu <Leatherworking & Tailoring Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3005 AND `item`=38426;

-- Nida Winterhoof <Herbalism Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3014 AND `item`=40411;

-- Kuna Thunderhorn <Bowyer & Fletching Goods>
DELETE FROM `npc_vendor` WHERE `entry`=3015 AND `item`=28053;

-- Nata Dawnstrider <Enchanting Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3012 AND `item`=6342;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (3012, 6342, 1, 7200);

-- Kaga Mistrunner <Meat Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=3025 AND `item` IN (27854, 33454, 35953);

-- Naal Mistrunner <Cooking Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3027 AND `item`=30817;

-- Thrumn <Tabard Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=5189 AND `item` IN (15197, 15199, 19031, 19505, 24004, 31773, 31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221);

-- Innkeeper Pala <Innkeeper>
DELETE FROM `npc_vendor` WHERE `entry`=6746 AND `item` IN (27857, 28399, 33443, 33444, 33445, 35952, 35954);

-- Chepi <Reagent Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=8361 AND `item` IN (22147, 22148, 37201, 44605, 44614, 44615);

