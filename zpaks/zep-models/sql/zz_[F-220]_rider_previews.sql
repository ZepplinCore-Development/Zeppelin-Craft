-- F-220 rider previews (generated with the zep-npc-wardrobe f220_* manifests): one unspawned creature
-- per rider display 900500-900533, so the F-216 picker has a card for it and lists it in the Rider menu of
-- the fused display it replaces (creature_template_addon.mount). "Fake" = the fused rider skin itself as the
-- bake; "Look" = the look-alike items (lib/npc_outfit lookalike). Never spawned; ids 902202-902233.
-- 902236+ = riders that already exist as their own HD model (no rider built): the existing display on
-- the riderless mount.

DELETE FROM creature_template WHERE entry = 902202;
INSERT INTO creature_template SET
  `entry` = 902202,
  `name` = 'F-220 Fake Tauren Canoe Paddler',
  `subname` = 'rider preview, display 900500',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902202;
INSERT INTO creature_template_model SET
  CreatureID = 902202,
  Idx = 0,
  CreatureDisplayID = 900500,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902202;
INSERT INTO creature_template_addon SET
  entry = 902202,
  mount = 21602,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902203;
INSERT INTO creature_template SET
  `entry` = 902203,
  `name` = 'F-220 Look Tauren Canoe Paddler',
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

DELETE FROM creature_template WHERE entry = 902204;
INSERT INTO creature_template SET
  `entry` = 902204,
  `name` = 'F-220 Fake Gurubashi Bat Rider',
  `subname` = 'rider preview, display 900502',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902204;
INSERT INTO creature_template_model SET
  CreatureID = 902204,
  Idx = 0,
  CreatureDisplayID = 900502,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902204;
INSERT INTO creature_template_addon SET
  entry = 902204,
  mount = 15303,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902205;
INSERT INTO creature_template SET
  `entry` = 902205,
  `name` = 'F-220 Look Gurubashi Bat Rider',
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

DELETE FROM creature_template WHERE entry = 902206;
INSERT INTO creature_template SET
  `entry` = 902206,
  `name` = 'F-220 Fake Fel Orc Drake Rider',
  `subname` = 'rider preview, display 900504',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902206;
INSERT INTO creature_template_model SET
  CreatureID = 902206,
  Idx = 0,
  CreatureDisplayID = 900504,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902206;
INSERT INTO creature_template_addon SET
  entry = 902206,
  mount = 18813,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902207;
INSERT INTO creature_template SET
  `entry` = 902207,
  `name` = 'F-220 Look Fel Orc Drake Rider',
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

DELETE FROM creature_template WHERE entry = 902208;
INSERT INTO creature_template SET
  `entry` = 902208,
  `name` = 'F-220 Fake Gnome Rocket Car Driver',
  `subname` = 'rider preview, display 900506',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902208;
INSERT INTO creature_template_model SET
  CreatureID = 902208,
  Idx = 0,
  CreatureDisplayID = 900506,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902208;
INSERT INTO creature_template_addon SET
  entry = 902208,
  mount = 2490,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902209;
INSERT INTO creature_template SET
  `entry` = 902209,
  `name` = 'F-220 Look Gnome Rocket Car Driver',
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

DELETE FROM creature_template WHERE entry = 902210;
INSERT INTO creature_template SET
  `entry` = 902210,
  `name` = 'F-220 Fake Gnome Tank Pilot (armour)',
  `subname` = 'rider preview, display 900508',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902210;
INSERT INTO creature_template_model SET
  CreatureID = 902210,
  Idx = 0,
  CreatureDisplayID = 900508,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902210;
INSERT INTO creature_template_addon SET
  entry = 902210,
  mount = 22700,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902211;
INSERT INTO creature_template SET
  `entry` = 902211,
  `name` = 'F-220 Look Gnome Tank Pilot (armour)',
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

DELETE FROM creature_template WHERE entry = 902212;
INSERT INTO creature_template SET
  `entry` = 902212,
  `name` = 'F-220 Fake Gnome Tank Pilot',
  `subname` = 'rider preview, display 900510',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902212;
INSERT INTO creature_template_model SET
  CreatureID = 902212,
  Idx = 0,
  CreatureDisplayID = 900510,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902212;
INSERT INTO creature_template_addon SET
  entry = 902212,
  mount = 5926,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902213;
INSERT INTO creature_template SET
  `entry` = 902213,
  `name` = 'F-220 Look Gnome Tank Pilot',
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

DELETE FROM creature_template WHERE entry = 902214;
INSERT INTO creature_template SET
  `entry` = 902214,
  `name` = 'F-220 Fake Wyvern Rider',
  `subname` = 'rider preview, display 900512',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902214;
INSERT INTO creature_template_model SET
  CreatureID = 902214,
  Idx = 0,
  CreatureDisplayID = 900512,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902214;
INSERT INTO creature_template_addon SET
  entry = 902214,
  mount = 17203,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902215;
INSERT INTO creature_template SET
  `entry` = 902215,
  `name` = 'F-220 Look Wyvern Rider',
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

DELETE FROM creature_template WHERE entry = 902216;
INSERT INTO creature_template SET
  `entry` = 902216,
  `name` = 'F-220 Fake Death Knight Rider (black)',
  `subname` = 'rider preview, display 900514',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902216;
INSERT INTO creature_template_model SET
  CreatureID = 902216,
  Idx = 0,
  CreatureDisplayID = 900514,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902216;
INSERT INTO creature_template_addon SET
  entry = 902216,
  mount = 6380,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902217;
INSERT INTO creature_template SET
  `entry` = 902217,
  `name` = 'F-220 Look Death Knight Rider (black)',
  `subname` = 'rider preview, display 900515',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902217;
INSERT INTO creature_template_model SET
  CreatureID = 902217,
  Idx = 0,
  CreatureDisplayID = 900515,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902217;
INSERT INTO creature_template_addon SET
  entry = 902217,
  mount = 6380,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902218;
INSERT INTO creature_template SET
  `entry` = 902218,
  `name` = 'F-220 Fake Lady Blaumeux',
  `subname` = 'rider preview, display 900516',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902218;
INSERT INTO creature_template_model SET
  CreatureID = 902218,
  Idx = 0,
  CreatureDisplayID = 900516,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902218;
INSERT INTO creature_template_addon SET
  entry = 902218,
  mount = 16153,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902219;
INSERT INTO creature_template SET
  `entry` = 902219,
  `name` = 'F-220 Look Lady Blaumeux',
  `subname` = 'rider preview, display 900517',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902219;
INSERT INTO creature_template_model SET
  CreatureID = 902219,
  Idx = 0,
  CreatureDisplayID = 900517,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902219;
INSERT INTO creature_template_addon SET
  entry = 902219,
  mount = 16153,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902220;
INSERT INTO creature_template SET
  `entry` = 902220,
  `name` = 'F-220 Fake Death Knight Rider (gold-red, female)',
  `subname` = 'rider preview, display 900518',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902220;
INSERT INTO creature_template_model SET
  CreatureID = 902220,
  Idx = 0,
  CreatureDisplayID = 900518,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902220;
INSERT INTO creature_template_addon SET
  entry = 902220,
  mount = 25116,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902221;
INSERT INTO creature_template SET
  `entry` = 902221,
  `name` = 'F-220 Look Death Knight Rider (gold-red, female)',
  `subname` = 'rider preview, display 900519',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902221;
INSERT INTO creature_template_model SET
  CreatureID = 902221,
  Idx = 0,
  CreatureDisplayID = 900519,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902221;
INSERT INTO creature_template_addon SET
  entry = 902221,
  mount = 25116,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902222;
INSERT INTO creature_template SET
  `entry` = 902222,
  `name` = 'F-220 Fake Highlord Mograine',
  `subname` = 'rider preview, display 900520',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902222;
INSERT INTO creature_template_model SET
  CreatureID = 902222,
  Idx = 0,
  CreatureDisplayID = 900520,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902222;
INSERT INTO creature_template_addon SET
  entry = 902222,
  mount = 16139,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902223;
INSERT INTO creature_template SET
  `entry` = 902223,
  `name` = 'F-220 Look Highlord Mograine',
  `subname` = 'rider preview, display 900521',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902223;
INSERT INTO creature_template_model SET
  CreatureID = 902223,
  Idx = 0,
  CreatureDisplayID = 900521,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902223;
INSERT INTO creature_template_addon SET
  entry = 902223,
  mount = 16139,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902224;
INSERT INTO creature_template SET
  `entry` = 902224,
  `name` = 'F-220 Fake Thane Korthazz',
  `subname` = 'rider preview, display 900522',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902224;
INSERT INTO creature_template_model SET
  CreatureID = 902224,
  Idx = 0,
  CreatureDisplayID = 900522,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902224;
INSERT INTO creature_template_addon SET
  entry = 902224,
  mount = 16155,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902225;
INSERT INTO creature_template SET
  `entry` = 902225,
  `name` = 'F-220 Look Thane Korthazz',
  `subname` = 'rider preview, display 900523',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902225;
INSERT INTO creature_template_model SET
  CreatureID = 902225,
  Idx = 0,
  CreatureDisplayID = 900523,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902225;
INSERT INTO creature_template_addon SET
  entry = 902225,
  mount = 16155,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902226;
INSERT INTO creature_template SET
  `entry` = 902226,
  `name` = 'F-220 Fake Sir Zeliek',
  `subname` = 'rider preview, display 900524',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902226;
INSERT INTO creature_template_model SET
  CreatureID = 902226,
  Idx = 0,
  CreatureDisplayID = 900524,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902226;
INSERT INTO creature_template_addon SET
  entry = 902226,
  mount = 16154,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902227;
INSERT INTO creature_template SET
  `entry` = 902227,
  `name` = 'F-220 Look Sir Zeliek',
  `subname` = 'rider preview, display 900525',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902227;
INSERT INTO creature_template_model SET
  CreatureID = 902227,
  Idx = 0,
  CreatureDisplayID = 900525,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902227;
INSERT INTO creature_template_addon SET
  entry = 902227,
  mount = 16154,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902228;
INSERT INTO creature_template SET
  `entry` = 902228,
  `name` = 'F-220 Fake Demon Knight Rider',
  `subname` = 'rider preview, display 900526',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902228;
INSERT INTO creature_template_model SET
  CreatureID = 902228,
  Idx = 0,
  CreatureDisplayID = 900526,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902228;
INSERT INTO creature_template_addon SET
  entry = 902228,
  mount = 15649,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902229;
INSERT INTO creature_template SET
  `entry` = 902229,
  `name` = 'F-220 Look Demon Knight Rider',
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

DELETE FROM creature_template WHERE entry = 902230;
INSERT INTO creature_template SET
  `entry` = 902230,
  `name` = 'F-220 Fake Mounted Knight',
  `subname` = 'rider preview, display 900528',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902230;
INSERT INTO creature_template_model SET
  CreatureID = 902230,
  Idx = 0,
  CreatureDisplayID = 900528,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902230;
INSERT INTO creature_template_addon SET
  entry = 902230,
  mount = 1545,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902231;
INSERT INTO creature_template SET
  `entry` = 902231,
  `name` = 'F-220 Look Mounted Knight',
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

DELETE FROM creature_template WHERE entry = 902232;
INSERT INTO creature_template SET
  `entry` = 902232,
  `name` = 'F-220 Fake Orc Drake Rider',
  `subname` = 'rider preview, display 900530',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902232;
INSERT INTO creature_template_model SET
  CreatureID = 902232,
  Idx = 0,
  CreatureDisplayID = 900530,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902232;
INSERT INTO creature_template_addon SET
  entry = 902232,
  mount = 9723,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902233;
INSERT INTO creature_template SET
  `entry` = 902233,
  `name` = 'F-220 Look Orc Drake Rider',
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
  mount = 22653,
  bytes2 = 1;

-- retired: Teron's built fake / look pair (an HD rider exists)
DELETE FROM creature_template WHERE entry IN (902234, 902235);
DELETE FROM creature_template_model WHERE CreatureID IN (902234, 902235);
DELETE FROM creature_template_addon WHERE entry IN (902234, 902235);

DELETE FROM creature_template WHERE entry = 902238;
INSERT INTO creature_template SET
  `entry` = 902238,
  `name` = 'F-220 Fake Gnome Mechastrider Pilot',
  `subname` = 'rider preview, display 900508',
  `minlevel` = 60,
  `maxlevel` = 60,
  `faction` = 35,
  `unit_class` = 1,
  `type` = 7,
  `type_flags` = 2048;
DELETE FROM creature_template_model WHERE CreatureID = 902238;
INSERT INTO creature_template_model SET
  CreatureID = 902238,
  Idx = 0,
  CreatureDisplayID = 900508,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;
DELETE FROM creature_template_addon WHERE entry = 902238;
INSERT INTO creature_template_addon SET
  entry = 902238,
  mount = 6978,
  bytes2 = 1;

DELETE FROM creature_template WHERE entry = 902239;
INSERT INTO creature_template SET
  `entry` = 902239,
  `name` = 'F-220 Look Gnome Mechastrider Pilot',
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
