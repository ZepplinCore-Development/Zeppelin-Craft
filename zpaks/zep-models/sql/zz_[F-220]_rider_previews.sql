-- F-220 rider previews: one unspawned creature per rider display (900501, 900503, ... 900531), so the
-- F-216 picker has a card for it and lists it on the fused display it replaces
-- (creature_template_addon.mount). Each rider is ONE display; its other looks (the "fake": the fused
-- rider skin itself as the bake on the classic model) are options of that display
-- (zep-npc-wardrobe/display_options.json), picked on the display's page. Never spawned.
-- 902236+ = riders that already exist as their own HD model (no rider built): the existing display on
-- the riderless mount.
-- Retired: the former "Fake" previews (one display per look, never spawned), and the death knight
-- riders' previews (902217-902227 odd: the death knights stay fused, 2026-10-17).

DELETE FROM creature_template WHERE entry = 902202;
DELETE FROM creature_template_model WHERE CreatureID = 902202;
DELETE FROM creature_template_addon WHERE entry = 902202;
DELETE FROM creature_equip_template WHERE CreatureID = 902202;
DELETE FROM creature_template WHERE entry = 902204;
DELETE FROM creature_template_model WHERE CreatureID = 902204;
DELETE FROM creature_template_addon WHERE entry = 902204;
DELETE FROM creature_equip_template WHERE CreatureID = 902204;
DELETE FROM creature_template WHERE entry = 902206;
DELETE FROM creature_template_model WHERE CreatureID = 902206;
DELETE FROM creature_template_addon WHERE entry = 902206;
DELETE FROM creature_equip_template WHERE CreatureID = 902206;
DELETE FROM creature_template WHERE entry = 902208;
DELETE FROM creature_template_model WHERE CreatureID = 902208;
DELETE FROM creature_template_addon WHERE entry = 902208;
DELETE FROM creature_equip_template WHERE CreatureID = 902208;
DELETE FROM creature_template WHERE entry = 902210;
DELETE FROM creature_template_model WHERE CreatureID = 902210;
DELETE FROM creature_template_addon WHERE entry = 902210;
DELETE FROM creature_equip_template WHERE CreatureID = 902210;
DELETE FROM creature_template WHERE entry = 902212;
DELETE FROM creature_template_model WHERE CreatureID = 902212;
DELETE FROM creature_template_addon WHERE entry = 902212;
DELETE FROM creature_equip_template WHERE CreatureID = 902212;
DELETE FROM creature_template WHERE entry = 902214;
DELETE FROM creature_template_model WHERE CreatureID = 902214;
DELETE FROM creature_template_addon WHERE entry = 902214;
DELETE FROM creature_equip_template WHERE CreatureID = 902214;
DELETE FROM creature_template WHERE entry = 902216;
DELETE FROM creature_template_model WHERE CreatureID = 902216;
DELETE FROM creature_template_addon WHERE entry = 902216;
DELETE FROM creature_equip_template WHERE CreatureID = 902216;
DELETE FROM creature_template WHERE entry = 902218;
DELETE FROM creature_template_model WHERE CreatureID = 902218;
DELETE FROM creature_template_addon WHERE entry = 902218;
DELETE FROM creature_equip_template WHERE CreatureID = 902218;
DELETE FROM creature_template WHERE entry = 902220;
DELETE FROM creature_template_model WHERE CreatureID = 902220;
DELETE FROM creature_template_addon WHERE entry = 902220;
DELETE FROM creature_equip_template WHERE CreatureID = 902220;
DELETE FROM creature_template WHERE entry = 902222;
DELETE FROM creature_template_model WHERE CreatureID = 902222;
DELETE FROM creature_template_addon WHERE entry = 902222;
DELETE FROM creature_equip_template WHERE CreatureID = 902222;
DELETE FROM creature_template WHERE entry = 902224;
DELETE FROM creature_template_model WHERE CreatureID = 902224;
DELETE FROM creature_template_addon WHERE entry = 902224;
DELETE FROM creature_equip_template WHERE CreatureID = 902224;
DELETE FROM creature_template WHERE entry = 902226;
DELETE FROM creature_template_model WHERE CreatureID = 902226;
DELETE FROM creature_template_addon WHERE entry = 902226;
DELETE FROM creature_equip_template WHERE CreatureID = 902226;
DELETE FROM creature_template WHERE entry = 902228;
DELETE FROM creature_template_model WHERE CreatureID = 902228;
DELETE FROM creature_template_addon WHERE entry = 902228;
DELETE FROM creature_equip_template WHERE CreatureID = 902228;
DELETE FROM creature_template WHERE entry = 902230;
DELETE FROM creature_template_model WHERE CreatureID = 902230;
DELETE FROM creature_template_addon WHERE entry = 902230;
DELETE FROM creature_equip_template WHERE CreatureID = 902230;
DELETE FROM creature_template WHERE entry = 902232;
DELETE FROM creature_template_model WHERE CreatureID = 902232;
DELETE FROM creature_template_addon WHERE entry = 902232;
DELETE FROM creature_equip_template WHERE CreatureID = 902232;
DELETE FROM creature_template WHERE entry = 902238;
DELETE FROM creature_template_model WHERE CreatureID = 902238;
DELETE FROM creature_template_addon WHERE entry = 902238;
DELETE FROM creature_equip_template WHERE CreatureID = 902238;

DELETE FROM creature_template WHERE entry = 902217;
DELETE FROM creature_template_model WHERE CreatureID = 902217;
DELETE FROM creature_template_addon WHERE entry = 902217;
DELETE FROM creature_equip_template WHERE CreatureID = 902217;
DELETE FROM creature_template WHERE entry = 902219;
DELETE FROM creature_template_model WHERE CreatureID = 902219;
DELETE FROM creature_template_addon WHERE entry = 902219;
DELETE FROM creature_equip_template WHERE CreatureID = 902219;
DELETE FROM creature_template WHERE entry = 902221;
DELETE FROM creature_template_model WHERE CreatureID = 902221;
DELETE FROM creature_template_addon WHERE entry = 902221;
DELETE FROM creature_equip_template WHERE CreatureID = 902221;
DELETE FROM creature_template WHERE entry = 902223;
DELETE FROM creature_template_model WHERE CreatureID = 902223;
DELETE FROM creature_template_addon WHERE entry = 902223;
DELETE FROM creature_equip_template WHERE CreatureID = 902223;
DELETE FROM creature_template WHERE entry = 902225;
DELETE FROM creature_template_model WHERE CreatureID = 902225;
DELETE FROM creature_template_addon WHERE entry = 902225;
DELETE FROM creature_equip_template WHERE CreatureID = 902225;
DELETE FROM creature_template WHERE entry = 902227;
DELETE FROM creature_template_model WHERE CreatureID = 902227;
DELETE FROM creature_template_addon WHERE entry = 902227;
DELETE FROM creature_equip_template WHERE CreatureID = 902227;
DELETE FROM creature_template WHERE entry = 902203;
INSERT INTO creature_template SET
  `entry` = 902203,
  `name` = 'F-220 Tauren Canoe Paddler',
  `subname` = 'rider preview, display 900501',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902203;
INSERT INTO creature_template_model SET
  CreatureID = 902203,
  Idx = 0,
  CreatureDisplayID = 900501,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902203;
INSERT INTO creature_template_addon SET
  entry = 902203,
  mount = 21602,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902205;
INSERT INTO creature_template SET
  `entry` = 902205,
  `name` = 'F-220 Gurubashi Bat Rider',
  `subname` = 'rider preview, display 900503',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902205;
INSERT INTO creature_template_model SET
  CreatureID = 902205,
  Idx = 0,
  CreatureDisplayID = 900503,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902205;
INSERT INTO creature_template_addon SET
  entry = 902205,
  mount = 15303,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902207;
INSERT INTO creature_template SET
  `entry` = 902207,
  `name` = 'F-220 Fel Orc Drake Rider',
  `subname` = 'rider preview, display 900505',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902207;
INSERT INTO creature_template_model SET
  CreatureID = 902207,
  Idx = 0,
  CreatureDisplayID = 900505,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902207;
INSERT INTO creature_template_addon SET
  entry = 902207,
  mount = 18813,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902209;
INSERT INTO creature_template SET
  `entry` = 902209,
  `name` = 'F-220 Gnome Rocket Car Driver',
  `subname` = 'rider preview, display 900507',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902209;
INSERT INTO creature_template_model SET
  CreatureID = 902209,
  Idx = 0,
  CreatureDisplayID = 900507,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902209;
INSERT INTO creature_template_addon SET
  entry = 902209,
  mount = 2490,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902211;
INSERT INTO creature_template SET
  `entry` = 902211,
  `name` = 'F-220 Gnome Tank Pilot (armour)',
  `subname` = 'rider preview, display 900509',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902211;
INSERT INTO creature_template_model SET
  CreatureID = 902211,
  Idx = 0,
  CreatureDisplayID = 900509,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902211;
INSERT INTO creature_template_addon SET
  entry = 902211,
  mount = 22700,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902213;
INSERT INTO creature_template SET
  `entry` = 902213,
  `name` = 'F-220 Gnome Tank Pilot',
  `subname` = 'rider preview, display 900511',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902213;
INSERT INTO creature_template_model SET
  CreatureID = 902213,
  Idx = 0,
  CreatureDisplayID = 900511,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902213;
INSERT INTO creature_template_addon SET
  entry = 902213,
  mount = 5926,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902215;
INSERT INTO creature_template SET
  `entry` = 902215,
  `name` = 'F-220 Wyvern Rider',
  `subname` = 'rider preview, display 900513',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902215;
INSERT INTO creature_template_model SET
  CreatureID = 902215,
  Idx = 0,
  CreatureDisplayID = 900513,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902215;
INSERT INTO creature_template_addon SET
  entry = 902215,
  mount = 17203,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902229;
INSERT INTO creature_template SET
  `entry` = 902229,
  `name` = 'F-220 Demon Knight Rider',
  `subname` = 'rider preview, display 900527',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902229;
INSERT INTO creature_template_model SET
  CreatureID = 902229,
  Idx = 0,
  CreatureDisplayID = 900527,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902229;
INSERT INTO creature_template_addon SET
  entry = 902229,
  mount = 15649,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902231;
INSERT INTO creature_template SET
  `entry` = 902231,
  `name` = 'F-220 Mounted Knight',
  `subname` = 'rider preview, display 900529',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902231;
INSERT INTO creature_template_model SET
  CreatureID = 902231,
  Idx = 0,
  CreatureDisplayID = 900529,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902231;
INSERT INTO creature_template_addon SET
  entry = 902231,
  mount = 1545,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902233;
INSERT INTO creature_template SET
  `entry` = 902233,
  `name` = 'F-220 Orc Drake Rider',
  `subname` = 'rider preview, display 900531',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902233;
INSERT INTO creature_template_model SET
  CreatureID = 902233,
  Idx = 0,
  CreatureDisplayID = 900531,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902233;
INSERT INTO creature_template_addon SET
  entry = 902233,
  mount = 9723,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902236;
INSERT INTO creature_template SET
  `entry` = 902236,
  `name` = 'F-220 HD Rider Teron Gorefiend',
  `subname` = 'rider preview, display 21262',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902236;
INSERT INTO creature_template_model SET
  CreatureID = 902236,
  Idx = 0,
  CreatureDisplayID = 21262,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902236;
INSERT INTO creature_template_addon SET
  entry = 902236,
  mount = 21263,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902237;
INSERT INTO creature_template SET
  `entry` = 902237,
  `name` = 'F-220 HD Rider Headless Horseman',
  `subname` = 'rider preview, display 22352',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902237;
INSERT INTO creature_template_model SET
  CreatureID = 902237,
  Idx = 0,
  CreatureDisplayID = 22352,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902237;
INSERT INTO creature_template_addon SET
  entry = 902237,
  mount = 22351,
  bytes2 = 1;

-- retired: Teron's built fake / look pair (an HD rider exists)
DELETE FROM creature_template WHERE entry IN (902234, 902235);
DELETE FROM creature_template_model WHERE CreatureID IN (902234, 902235);
DELETE FROM creature_template_addon WHERE entry IN (902234, 902235);

DELETE FROM creature_template WHERE entry = 902239;
INSERT INTO creature_template SET
  `entry` = 902239,
  `name` = 'F-220 Gnome Mechastrider Pilot',
  `subname` = 'rider preview, display 900509',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902239;
INSERT INTO creature_template_model SET
  CreatureID = 902239,
  Idx = 0,
  CreatureDisplayID = 900509,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902239;
INSERT INTO creature_template_addon SET
  entry = 902239,
  mount = 6978,
  bytes2 = 1;

-- weapons (creature_equip_template) the fused model names by texture, so the picker draws them
DELETE FROM creature_equip_template WHERE CreatureID = 902203;
DELETE FROM creature_equip_template WHERE CreatureID = 902205;
DELETE FROM creature_equip_template WHERE CreatureID = 902207;
INSERT INTO creature_equip_template SET
  CreatureID = 902207,
  ID = 1,
  ItemID1 = 24044,
  ItemID2 = 0,
  ItemID3 = 0,
  VerifiedBuild = 0;
DELETE FROM creature_equip_template WHERE CreatureID = 902209;
DELETE FROM creature_equip_template WHERE CreatureID = 902211;
DELETE FROM creature_equip_template WHERE CreatureID = 902213;
DELETE FROM creature_equip_template WHERE CreatureID = 902215;
INSERT INTO creature_equip_template SET
  CreatureID = 902215,
  ID = 1,
  ItemID1 = 19353,
  ItemID2 = 0,
  ItemID3 = 0,
  VerifiedBuild = 0;
DELETE FROM creature_equip_template WHERE CreatureID = 902229;
DELETE FROM creature_equip_template WHERE CreatureID = 902231;
DELETE FROM creature_equip_template WHERE CreatureID = 902233;
DELETE FROM creature_equip_template WHERE CreatureID = 902236;
DELETE FROM creature_equip_template WHERE CreatureID = 902237;
DELETE FROM creature_equip_template WHERE CreatureID = 902239;
