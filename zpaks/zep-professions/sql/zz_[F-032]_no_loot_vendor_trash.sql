-- [F-032] Vendor-trash loot for gathering creatures that had no normal loot table.
-- Audit of all F-032 mineable/herbable/engineerable/skinnable creatures found 25
-- with creature_template.lootid = 0; an empty kill-loot corpse despawns almost
-- immediately, making the gather loot (skinloot) unreachable. Each gets a thematic,
-- level-appropriate grey vendor-trash table (top drop at 100% so every kill leaves
-- loot). Trash borrowed from loot-bearing siblings in the same gathering tier.
-- lootid = creature entry is set in the matching zz_mobs_<type>_[F-032].sql line.
-- (Farahlon Crumbler 21077 is handled in zz_[F-032]_farahlon_crumbler_loot.sql.)

-- =====================================================================
-- MINING (stone / crystal trash)
-- =====================================================================

-- 17179 Restless Spirit of Earth (lvl 4, tier 100020)
DELETE FROM `creature_loot_template` WHERE `Entry` = 17179;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (17179, 5741, 0, 100, 0, 1, 0, 1, 2, 'Restless Spirit of Earth - Rock Chip'),
  (17179, 4784, 0, 20,  0, 1, 0, 1, 1, 'Restless Spirit of Earth - Lifeless Stone');

-- 5891 Minor Manifestation of Earth (lvl 15, tier 100020)
DELETE FROM `creature_loot_template` WHERE `Entry` = 5891;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (5891, 5741, 0, 100, 0, 1, 0, 1, 2, 'Minor Manifestation of Earth - Rock Chip'),
  (5891, 4784, 0, 20,  0, 1, 0, 1, 1, 'Minor Manifestation of Earth - Lifeless Stone');

-- 4528 Stone Rumbler (lvl 28, tier 100022)
DELETE FROM `creature_loot_template` WHERE `Entry` = 4528;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (4528, 4784, 0, 100, 0, 1, 0, 1, 2, 'Stone Rumbler - Lifeless Stone'),
  (4528, 5741, 0, 25,  0, 1, 0, 1, 1, 'Stone Rumbler - Rock Chip');

-- 4661 Gelkis Rumbler (lvl 30, tier 100022)
DELETE FROM `creature_loot_template` WHERE `Entry` = 4661;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (4661, 4784, 0, 100, 0, 1, 0, 1, 2, 'Gelkis Rumbler - Lifeless Stone'),
  (4661, 5741, 0, 25,  0, 1, 0, 1, 1, 'Gelkis Rumbler - Rock Chip');

-- 7765 Rockbiter (lvl 45, tier 100023)
DELETE FROM `creature_loot_template` WHERE `Entry` = 7765;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (7765, 4784, 0, 100, 0, 1, 0, 1, 2, 'Rockbiter - Lifeless Stone'),
  (7765, 4552, 0, 25,  0, 1, 0, 1, 1, 'Rockbiter - Smooth Stone Chip'),
  (7765, 4554, 0, 8,   0, 1, 0, 1, 1, 'Rockbiter - Shiny Polished Stone');

-- 12099 Firesworn (lvl 60, tier 100025)
DELETE FROM `creature_loot_template` WHERE `Entry` = 12099;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (12099, 4787, 0, 100, 0, 1, 0, 1, 2, 'Firesworn - Burning Pitch'),
  (12099, 4784, 0, 20,  0, 1, 0, 1, 1, 'Firesworn - Lifeless Stone');

-- 19305 Goliathon (lvl 63, tier 100026)
DELETE FROM `creature_loot_template` WHERE `Entry` = 19305;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (19305, 29579, 0, 100, 0, 1, 0, 2, 4, 'Goliathon - Crystalized Stone Chips'),
  (19305, 29578, 0, 20,  0, 1, 0, 1, 2, 'Goliathon - Crystalized Stone');

-- 19066 Crystalhide Colossus (lvl 63, tier 100026)
DELETE FROM `creature_loot_template` WHERE `Entry` = 19066;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (19066, 29579, 0, 100, 0, 1, 0, 2, 4, 'Crystalhide Colossus - Crystalized Stone Chips'),
  (19066, 29578, 0, 20,  0, 1, 0, 1, 2, 'Crystalhide Colossus - Crystalized Stone');

-- 19419 Raging Shardling (lvl 63, tier 100026)
DELETE FROM `creature_loot_template` WHERE `Entry` = 19419;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (19419, 29579, 0, 100, 0, 1, 0, 1, 2, 'Raging Shardling - Crystalized Stone Chips'),
  (19419, 29578, 0, 20,  0, 1, 0, 1, 1, 'Raging Shardling - Crystalized Stone');

-- 19420 Goliathon Shardling (lvl 61, tier 100026)
DELETE FROM `creature_loot_template` WHERE `Entry` = 19420;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (19420, 29579, 0, 100, 0, 1, 0, 1, 2, 'Goliathon Shardling - Crystalized Stone Chips'),
  (19420, 29578, 0, 20,  0, 1, 0, 1, 1, 'Goliathon Shardling - Crystalized Stone');

-- 20599 Lured Colossus (lvl 62, tier 100026)
DELETE FROM `creature_loot_template` WHERE `Entry` = 20599;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (20599, 29579, 0, 100, 0, 1, 0, 2, 4, 'Lured Colossus - Crystalized Stone Chips'),
  (20599, 29578, 0, 20,  0, 1, 0, 1, 2, 'Lured Colossus - Crystalized Stone');

-- 21936 Crazed Shardling (lvl 69, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 21936;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (21936, 29579, 0, 100,     0, 1, 0, 1, 2, 'Crazed Shardling - Crystalized Stone Chips'),
  (21936, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Crazed Shardling - Crystalized Stone'),
  (21936, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Crazed Shardling - Crystal Fragments'),
  (21936, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Crazed Shardling - Strange Crystal');

-- 22115 Enraged Earth Shard (lvl 69, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 22115;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (22115, 29579, 0, 100,     0, 1, 0, 1, 2, 'Enraged Earth Shard - Crystalized Stone Chips'),
  (22115, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Enraged Earth Shard - Crystalized Stone'),
  (22115, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Enraged Earth Shard - Crystal Fragments'),
  (22115, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Enraged Earth Shard - Strange Crystal');

-- 22344 Morcrush Shardling (lvl 68, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 22344;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (22344, 29579, 0, 100,     0, 1, 0, 1, 2, 'Morcrush Shardling - Crystalized Stone Chips'),
  (22344, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Morcrush Shardling - Crystalized Stone'),
  (22344, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Morcrush Shardling - Crystal Fragments'),
  (22344, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Morcrush Shardling - Strange Crystal');

-- 22390 Mountain Shardling (lvl 71, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 22390;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (22390, 29579, 0, 100,     0, 1, 0, 1, 2, 'Mountain Shardling - Crystalized Stone Chips'),
  (22390, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Mountain Shardling - Crystalized Stone'),
  (22390, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Mountain Shardling - Crystal Fragments'),
  (22390, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Mountain Shardling - Strange Crystal');

-- 22391 Vortex Shardling (lvl 72, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 22391;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (22391, 29579, 0, 100,     0, 1, 0, 1, 2, 'Vortex Shardling - Crystalized Stone Chips'),
  (22391, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Vortex Shardling - Crystalized Stone'),
  (22391, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Vortex Shardling - Crystal Fragments'),
  (22391, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Vortex Shardling - Strange Crystal');

-- 22054 Behemothon, King of the Colossi (lvl 69, tier 100028)
DELETE FROM `creature_loot_template` WHERE `Entry` = 22054;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (22054, 29580, 0, 100, 0, 1, 0, 1, 2, 'Behemothon - Crystal Fragments'),
  (22054, 29581, 0, 20,  0, 1, 0, 1, 1, 'Behemothon - Strange Crystal');

-- 21078 Farahlon Shardling (lvl 70, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 21078;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (21078, 29579, 0, 100,     0, 1, 0, 1, 2, 'Farahlon Shardling - Crystalized Stone Chips'),
  (21078, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Farahlon Shardling - Crystalized Stone'),
  (21078, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Farahlon Shardling - Crystal Fragments'),
  (21078, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Farahlon Shardling - Strange Crystal');

-- 21328 Apex Crumbler (lvl 66-67, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 21328;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (21328, 29579, 0, 100,     0, 1, 0, 1, 2, 'Apex Crumbler - Crystalized Stone Chips'),
  (21328, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Apex Crumbler - Crystalized Stone'),
  (21328, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Apex Crumbler - Crystal Fragments'),
  (21328, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Apex Crumbler - Strange Crystal');

-- 21079 Cragskaar Shardling (lvl 69, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 21079;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (21079, 29579, 0, 100,     0, 1, 0, 1, 2, 'Cragskaar Shardling - Crystalized Stone Chips'),
  (21079, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Cragskaar Shardling - Crystalized Stone'),
  (21079, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Cragskaar Shardling - Crystal Fragments'),
  (21079, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Cragskaar Shardling - Strange Crystal');

-- 19759 Newly Crafted Infernal (lvl 68-69, tier 100027)
DELETE FROM `creature_loot_template` WHERE `Entry` = 19759;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (19759, 29579, 0, 100,     0, 1, 0, 1, 2, 'Newly Crafted Infernal - Crystalized Stone Chips'),
  (19759, 29578, 0, 17.3551, 0, 1, 0, 1, 1, 'Newly Crafted Infernal - Crystalized Stone'),
  (19759, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Newly Crafted Infernal - Crystal Fragments'),
  (19759, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Newly Crafted Infernal - Strange Crystal');

-- =====================================================================
-- ENGINEERING (mechanical scrap)
-- =====================================================================

-- 2676 Compact Harvest Reaper (lvl 22, tier 100031)
DELETE FROM `creature_loot_template` WHERE `Entry` = 2676;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (2676, 23380, 0, 100, 0, 1, 0, 1, 1, 'Compact Harvest Reaper - Broken Power Core'),
  (2676, 23333, 0, 25,  0, 1, 0, 1, 1, 'Compact Harvest Reaper - Shattered Power Core');

-- 6669 The Threshwackonator 4100 (lvl 20, tier 100031)
DELETE FROM `creature_loot_template` WHERE `Entry` = 6669;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (6669, 23380, 0, 100, 0, 1, 0, 1, 1, 'The Threshwackonator 4100 - Broken Power Core'),
  (6669, 23333, 0, 25,  0, 1, 0, 1, 1, 'The Threshwackonator 4100 - Shattered Power Core');

-- 7209 Obsidian Shard (lvl 35, tier 100031)
DELETE FROM `creature_loot_template` WHERE `Entry` = 7209;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (7209, 23380, 0, 100, 0, 1, 0, 1, 1, 'Obsidian Shard - Broken Power Core'),
  (7209, 23333, 0, 25,  0, 1, 0, 1, 1, 'Obsidian Shard - Shattered Power Core');

-- 7915 Walking Bomb (lvl 30, tier 100031)
DELETE FROM `creature_loot_template` WHERE `Entry` = 7915;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (7915, 23380, 0, 100, 0, 1, 0, 1, 1, 'Walking Bomb - Broken Power Core'),
  (7915, 23333, 0, 25,  0, 1, 0, 1, 1, 'Walking Bomb - Shattered Power Core');

-- 38224 Mechachicken (lvl 8, tier 100030) - I-323.
-- Trash borrowed from KTC Oil Bot 39376, the loot-bearing mechanical sibling in the
-- same zone and level band (Kezan, lvl 9-10); both items are grey and Kezan-native.
DELETE FROM `creature_loot_template` WHERE `Entry` = 38224;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (38224, 84416, 0, 100, 0, 1, 0, 1, 1, 'Mechachicken - Defective Gear'),
  (38224, 84415, 0, 20,  0, 1, 0, 1, 1, 'Mechachicken - Flimsy Sprocket');

-- =====================================================================
-- HERBALISM (plant trash)
-- =====================================================================

-- 5806 Treant Ally (lvl 23, tier 100042)
DELETE FROM `creature_loot_template` WHERE `Entry` = 5806;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (5806, 3777,  0, 100, 0, 1, 0, 1, 2, 'Treant Ally - Lethargy Root'),
  (5806, 20843, 0, 25,  0, 1, 0, 1, 1, 'Treant Ally - Smashed Petal'),
  (5806, 20842, 0, 8,   0, 1, 0, 1, 1, 'Treant Ally - Frayed Tender Vine');

-- 1244 Rethiel the Greenwarden (lvl 30, tier 100042)
DELETE FROM `creature_loot_template` WHERE `Entry` = 1244;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (1244, 3777,  0, 100, 0, 1, 0, 1, 2, 'Rethiel the Greenwarden - Lethargy Root'),
  (1244, 20843, 0, 25,  0, 1, 0, 1, 1, 'Rethiel the Greenwarden - Smashed Petal'),
  (1244, 20842, 0, 8,   0, 1, 0, 1, 1, 'Rethiel the Greenwarden - Frayed Tender Vine');

-- 6932 Swamp Spirit (lvl 40, tier 100043)
DELETE FROM `creature_loot_template` WHERE `Entry` = 6932;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (6932, 3777,  0, 100, 0, 1, 0, 1, 2, 'Swamp Spirit - Lethargy Root'),
  (6932, 20843, 0, 25,  0, 1, 0, 1, 1, 'Swamp Spirit - Smashed Petal'),
  (6932, 20842, 0, 8,   0, 1, 0, 1, 1, 'Swamp Spirit - Frayed Tender Vine');

-- =====================================================================
-- SKINNING (beast trash)
-- =====================================================================

-- 4535 Tamed Battleboar (lvl 26, tier 100001)
DELETE FROM `creature_loot_template` WHERE `Entry` = 4535;
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
  (4535, 771,  0, 100, 0, 1, 0, 1, 1, 'Tamed Battleboar - Chipped Boar Tusk'),
  (4535, 2295, 0, 20,  0, 1, 0, 1, 1, 'Tamed Battleboar - Large Boar Tusk');
