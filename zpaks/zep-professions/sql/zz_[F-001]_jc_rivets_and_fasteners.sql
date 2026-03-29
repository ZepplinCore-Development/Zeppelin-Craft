-- =====================================================
-- JC TOOLKIT COMPONENTS: Rivets, Fasteners, Drills, Screwdrivers
-- Cross-profession crafted materials for Jeweler's Kit assembly
-- BS makes rivets, JC makes fasteners, Eng makes drills + screwdrivers
-- JC assembles final toolkit from all components
-- =====================================================

-- Clean up
DELETE FROM `item_template` WHERE `entry` IN (57009, 57010, 57011, 57012);
DELETE FROM `item_template` WHERE `entry` IN (57508, 57509, 57510, 57511);
DELETE FROM `item_template` WHERE `entry` IN (57213, 57214, 57215);
DELETE FROM `item_template` WHERE `entry` IN (57216, 57217, 57218, 57219);
DELETE FROM `trainer_spell` WHERE `SpellId` IN (91252, 91253, 91254, 91255, 91256, 91257, 91258, 91259, 91260, 91261, 91262, 91263, 91264, 91265, 91266, 91267, 91268, 91269, 91270);

-- =====================================================
-- BS RIVET ITEMS (Trade Goods > Parts, stackable, no bind)
-- =====================================================

INSERT INTO `item_template` SET
    `entry` = 57009, `class` = 7, `subclass` = 1,
    `name` = 'Bronze Rivets', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154867, `Quality` = 2, `ItemLevel` = 10,
    `stackable` = 20, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57010, `class` = 7, `subclass` = 1,
    `name` = 'Truesilver Rivets', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 140159, `Quality` = 2, `ItemLevel` = 40,
    `stackable` = 20, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57011, `class` = 7, `subclass` = 1,
    `name` = 'Adamantite Rivets', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 140380, `Quality` = 2, `ItemLevel` = 60,
    `stackable` = 20, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57012, `class` = 7, `subclass` = 1,
    `name` = 'Saronite Rivets', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154869, `Quality` = 2, `ItemLevel` = 75,
    `stackable` = 20, `bonding` = 0;

-- =====================================================
-- JC FASTENER ITEMS (Trade Goods > Parts, stackable, no bind)
-- =====================================================

INSERT INTO `item_template` SET
    `entry` = 57508, `class` = 7, `subclass` = 1,
    `name` = 'Bronze Fasteners', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154868, `Quality` = 2, `ItemLevel` = 10,
    `stackable` = 20, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57509, `class` = 7, `subclass` = 1,
    `name` = 'Truesilver Fasteners', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 137462, `Quality` = 2, `ItemLevel` = 40,
    `stackable` = 20, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57510, `class` = 7, `subclass` = 1,
    `name` = 'Adamantite Fasteners', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 135539, `Quality` = 2, `ItemLevel` = 60,
    `stackable` = 20, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57511, `class` = 7, `subclass` = 1,
    `name` = 'Saronite Fasteners', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154870, `Quality` = 2, `ItemLevel` = 75,
    `stackable` = 20, `bonding` = 0;

-- =====================================================
-- ENG SCREWDRIVER ITEMS (Reagent > Tool, no bind)
-- =====================================================

INSERT INTO `item_template` SET
    `entry` = 57213, `class` = 5, `subclass` = 1,
    `name` = 'Bronze Screwdriver', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154875, `Quality` = 2, `ItemLevel` = 10,
    `stackable` = 5, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57214, `class` = 5, `subclass` = 1,
    `name` = 'Fel Iron Screwdriver', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154876, `Quality` = 2, `ItemLevel` = 60,
    `stackable` = 5, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57215, `class` = 5, `subclass` = 1,
    `name` = 'Saronite Screwdriver', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154877, `Quality` = 2, `ItemLevel` = 75,
    `stackable` = 5, `bonding` = 0;

-- =====================================================
-- ENG DRILL ITEMS (Reagent > Tool, no bind)
-- =====================================================

INSERT INTO `item_template` SET
    `entry` = 57216, `class` = 5, `subclass` = 1,
    `name` = 'Bronze Drill', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154871, `Quality` = 2, `ItemLevel` = 10,
    `stackable` = 5, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57217, `class` = 5, `subclass` = 1,
    `name` = 'Gold Drill', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154872, `Quality` = 2, `ItemLevel` = 40,
    `stackable` = 5, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57218, `class` = 5, `subclass` = 1,
    `name` = 'Fel Iron Drill', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154873, `Quality` = 2, `ItemLevel` = 60,
    `stackable` = 5, `bonding` = 0;

INSERT INTO `item_template` SET
    `entry` = 57219, `class` = 5, `subclass` = 1,
    `name` = 'Saronite Drill', `description` = 'Used in Jewelcrafting kit assembly.',
    `displayid` = 154874, `Quality` = 2, `ItemLevel` = 75,
    `stackable` = 5, `bonding` = 0;

-- =====================================================
-- BS TRAINER SPELLS (Rivet recipes)
-- Trainers: 58, 59 (all tiers), 616, 617, 618 (lower tiers)
-- =====================================================

-- Copper Rivets (91252) - skill 75 - all BS trainers
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(58, 91252, 500, 164, 75), (59, 91252, 500, 164, 75),
(616, 91252, 500, 164, 75), (617, 91252, 500, 164, 75), (618, 91252, 500, 164, 75);

-- Truesilver Rivets (91253) - skill 225
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(58, 91253, 5000, 164, 225), (59, 91253, 5000, 164, 225), (618, 91253, 5000, 164, 225);

-- Adamantite Rivets (91254) - skill 300
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(58, 91254, 50000, 164, 300), (59, 91254, 50000, 164, 300);

-- Saronite Rivets (91255) - skill 375
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(58, 91255, 100000, 164, 375), (59, 91255, 100000, 164, 375);

-- =====================================================
-- JC TRAINER SPELLS (Fastener + Assembly recipes)
-- Trainers: 111 (GM), 112 (Master), 113 (city)
-- =====================================================

-- Copper Fasteners (91256) - skill 75 - all JC trainers
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(111, 91256, 500, 755, 75), (112, 91256, 500, 755, 75), (113, 91256, 500, 755, 75);

-- Truesilver Fasteners (91257) - skill 225
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(111, 91257, 5000, 755, 225), (112, 91257, 5000, 755, 225), (113, 91257, 5000, 755, 225);

-- Adamantite Fasteners (91258) - skill 300
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(111, 91258, 50000, 755, 300), (112, 91258, 50000, 755, 300);

-- Saronite Fasteners (91259) - skill 375
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(111, 91259, 100000, 755, 375);

-- Journeyman Jeweler's Kit (91267) - skill 75 - all JC trainers
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(111, 91267, 1000, 755, 75), (112, 91267, 1000, 755, 75), (113, 91267, 1000, 755, 75);

-- Artisan Jeweler's Kit (91268) - skill 225
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(111, 91268, 10000, 755, 225), (112, 91268, 10000, 755, 225), (113, 91268, 10000, 755, 225);

-- Master Jeweler's Kit (91269) - skill 300
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(111, 91269, 100000, 755, 300), (112, 91269, 100000, 755, 300);

-- Grand Master Jeweler's Kit (91270) - skill 375
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(111, 91270, 200000, 755, 375);

-- =====================================================
-- ENG TRAINER SPELLS (Screwdriver + Drill recipes)
-- Trainers: 626, 628, 92 (journeyman), 84-88, 90, 91 (artisan+), 89 (GM)
-- =====================================================

-- Copper Screwdriver (91260) - skill 75 - all eng trainers
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(626, 91260, 500, 202, 75), (628, 91260, 500, 202, 75), (92, 91260, 500, 202, 75),
(84, 91260, 500, 202, 75), (85, 91260, 500, 202, 75), (86, 91260, 500, 202, 75),
(87, 91260, 500, 202, 75), (88, 91260, 500, 202, 75), (90, 91260, 500, 202, 75),
(91, 91260, 500, 202, 75), (89, 91260, 500, 202, 75);

-- Copper Drill (91263) - skill 75 - all eng trainers
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(626, 91263, 500, 202, 75), (628, 91263, 500, 202, 75), (92, 91263, 500, 202, 75),
(84, 91263, 500, 202, 75), (85, 91263, 500, 202, 75), (86, 91263, 500, 202, 75),
(87, 91263, 500, 202, 75), (88, 91263, 500, 202, 75), (90, 91263, 500, 202, 75),
(91, 91263, 500, 202, 75), (89, 91263, 500, 202, 75);

-- Gold Drill (91264) - skill 225 - artisan+ trainers
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(628, 91264, 5000, 202, 225), (92, 91264, 5000, 202, 225),
(84, 91264, 5000, 202, 225), (85, 91264, 5000, 202, 225),
(86, 91264, 5000, 202, 225), (87, 91264, 5000, 202, 225), (88, 91264, 5000, 202, 225),
(90, 91264, 5000, 202, 225), (91, 91264, 5000, 202, 225), (89, 91264, 5000, 202, 225);

-- Fel Iron Screwdriver (91261) - skill 300 - master+ trainers
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(84, 91261, 50000, 202, 300), (85, 91261, 50000, 202, 300), (86, 91261, 50000, 202, 300),
(87, 91261, 50000, 202, 300), (88, 91261, 50000, 202, 300), (90, 91261, 50000, 202, 300),
(91, 91261, 50000, 202, 300), (89, 91261, 50000, 202, 300);

-- Fel Iron Drill (91265) - skill 300 - master+ trainers
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(84, 91265, 50000, 202, 300), (85, 91265, 50000, 202, 300), (86, 91265, 50000, 202, 300),
(87, 91265, 50000, 202, 300), (88, 91265, 50000, 202, 300), (90, 91265, 50000, 202, 300),
(91, 91265, 50000, 202, 300), (89, 91265, 50000, 202, 300);

-- Saronite Screwdriver (91262) - skill 375 - GM trainer only
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(89, 91262, 100000, 202, 375);

-- Saronite Drill (91266) - skill 375 - GM trainer only
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`) VALUES
(89, 91266, 100000, 202, 375);
