-- ============================================================================
-- The Grovewarden (F-094 / I-451)
-- ============================================================================
-- Horde, Splintertree Post (west gate), Ashenvale. Gurda Ragescar (12718) sends
-- you to kill Elderbark (900963), the ancient elemental calling the
-- Shadethicket up out of the earth. Solo slay quest after Foulweald Prayer
-- Beads 91224, offered together with Heart of the Grove 91226 and alongside
-- Timber Rights 91225 (same woods, one trip).
-- Numbers follow Never Again! 9536 (slay finale, XP diff 6).
-- Reward: choice of three item level 30 green belts (mail Str, leather Agi,
-- cloth Int), each in the green waist band of `zep world item budget`
-- (budget 8.87, band 8.25-11.48).
-- ============================================================================

SET @QUESTID   := 91227;
SET @PREV      := 91224;   -- Foulweald Prayer Beads (Yama Snowhoof)
SET @GURDA     := 12718;   -- Gurda Ragescar, Splintertree Post west gate
SET @ELDERBARK := 900963;  -- Elderbark, custom named mob (this file)
SET @GUID      := 3110760; -- explicit guid, see zz_[F-094]_awful_experiments.sql for why
SET @BELT_STR  := 58355;   -- Grovewarden's Girdle  (mail,    Str / Sta)
SET @BELT_AGI  := 58356;   -- Barkhide Belt         (leather, Agi / Sta)
SET @BELT_INT  := 58357;   -- Sapwood Cord          (cloth,   Int / Spi)

-- QUEST TEMPLATE
DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 29,
    `MinLevel` = 24,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 6,
    `RewardMoney` = 3000,
    `Flags` = 8,
    `RewardChoiceItemID1` = @BELT_STR,
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = @BELT_AGI,
    `RewardChoiceItemQuantity2` = 1,
    `RewardChoiceItemID3` = @BELT_INT,
    `RewardChoiceItemQuantity3` = 1,
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 6,
    `AllowableRaces` = 946,
    `RequiredNpcOrGo1` = @ELDERBARK,
    `RequiredNpcOrGoCount1` = 1,
    `LogTitle` = 'The Grovewarden',
    `LogDescription` = 'Slay Elderbark, the Grovewarden, in the woods just west of the Warsong Lumber Camp, then return to Gurda Ragescar at Splintertree Post.',
    `QuestDescription` = 'The Grovewarden has a name, $N. The spirits whispered it when I burned one of Yama''s Foulweald beads: Elderbark. An ancient of the Shadethicket, older than the night elves'' oldest tree, and the same sickness that took the Foulweald has crept into its roots. It has decided that our lumber camp is a wound to be closed.$B$BIt walks the woods just west of the Warsong Lumber Camp, east of the post, close enough to hear the peons'' axes, and it is surrounded by the things it has woken. It is old and strong, and it will not fall easily. Clear its guards before you face it. Bring it down, and the forest will go back to sleep.',
    `QuestCompletionLog` = 'Return to Gurda Ragescar at Splintertree Post in Ashenvale.',
    `ObjectiveText1` = 'Elderbark slain',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, @PREV, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'I can still hear it calling, $N. Elderbark still stands.');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 2, 'Silence. For the first time since we came to this forest, the ground is silent.$B$BThe loggers will drink to you tonight, and Kuray''bin will claim he planned it all. Let him. Take one of these - the crews made them from the bark you brought down. Wear it, and remember the forest has a long memory.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@GURDA, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@GURDA, @QUESTID);

-- ELDERBARK - level 29 named mob, rank 0 (normal). Zeppelin has no open-world
-- elites (F-080 Solo World): named kills are normal rank with the
-- `named_solo_fight` multipliers of cli/lib/creature/normal.py (health 2.0-2.5x,
-- damage 2.0-2.3x); this takes the middle of both. Other fields follow
-- Shadethicket Bark Ripper 3784 (faction 16, type 4, speeds, loot table).
DELETE FROM `creature_template` WHERE `entry` = @ELDERBARK;
INSERT INTO `creature_template` SET
    `entry` = @ELDERBARK,
    `name` = 'Elderbark',
    `subname` = 'The Grovewarden',
    `minlevel` = 29,
    `maxlevel` = 29,
    `exp` = 0,
    `faction` = 16,
    `npcflag` = 0,
    `speed_walk` = 0.666668,
    `speed_run` = 1.14286,
    `detection_range` = 20,
    `rank` = 0,
    `DamageModifier` = 2.15,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `BaseVariance` = 1,
    `RangeVariance` = 1,
    `unit_class` = 1,
    `type` = 4,
    `lootid` = 3784,
    `mingold` = 900,
    `maxgold` = 1400,
    `AIName` = 'SmartAI',
    `MovementType` = 1,
    `HoverHeight` = 1,
    `HealthModifier` = 2.25,
    `ManaModifier` = 1,
    `ArmorModifier` = 1,
    `ExperienceModifier` = 1,
    `RegenHealth` = 1,
    `VerifiedBuild` = 0;

-- Bark Ripper's treant display, scaled up (one row, so one scale - see the
-- Creatures note on per-display DisplayScale). creature_model_info 2024 exists.
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ELDERBARK;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
    (@ELDERBARK, 0, 2024, 1.5, 1, 0);

-- AI: the Bark Ripper's Tendon Rip, plus Trample and Entangling Roots on a
-- random attacker, and Strength of Stone once at 50% health.
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ELDERBARK AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
    (@ELDERBARK, 0, 0, 0, 0, 0, 100, 0,  5000,  8000, 14000, 18000, 0, 0, 11,  3604, 32, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Elderbark - In Combat - Cast Tendon Rip'),
    (@ELDERBARK, 0, 1, 0, 0, 0, 100, 0,  9000, 12000, 16000, 20000, 0, 0, 11,  5568,  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Elderbark - In Combat - Cast Trample'),
    (@ELDERBARK, 0, 2, 0, 0, 0, 100, 0, 12000, 15000, 22000, 26000, 0, 0, 11, 11922,  0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Elderbark - In Combat - Cast Entangling Roots on random attacker'),
    (@ELDERBARK, 0, 3, 0, 2, 0, 100, 1,     0,    50,     0,     0, 0, 0, 11,  6864,  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Elderbark - At 50% HP - Cast Strength of Stone (once)');

-- SPAWN - one, on dry flat ground (slope < 1 yd over 12 yd, no water within
-- 12 yd: Scripts/F-094/liquid_at.py) on the river bank ~230 yd west of the
-- Warsong Lumber Camp, among the south-eastern Bark Rippers. The first spot
-- (2185 -3140, heightmap z 90.8) was the river bed under 12 yd of water - the
-- heightmap gives the floor, not the water. 5 min respawn.
DELETE FROM `creature` WHERE `id` = @ELDERBARK OR `guid` = @GUID;
INSERT INTO `creature` SET
    `guid` = @GUID,
    `id` = @ELDERBARK,
    `map` = 1,
    `spawnMask` = 1,
    `phaseMask` = 1,
    `position_x` = 2190.0,
    `position_y` = -3220.0,
    `position_z` = 101.5,
    `orientation` = 2.0,
    `spawntimesecs` = 300,
    `wander_distance` = 5,
    `MovementType` = 1,
    `VerifiedBuild` = 0;

-- REWARDS - item level 30 greens, bind on pickup. Armor, durability and price
-- follow stock ilvl 30 green belts: Wicked Chain Waistband 15539 (mail),
-- Windborne Belt 6719 (leather), Resilient Cord 14406 (cloth).
DELETE FROM `item_template` WHERE `entry` IN (@BELT_STR, @BELT_AGI, @BELT_INT);
INSERT INTO `item_template` SET
    `entry` = @BELT_STR,
    `class` = 4,
    `subclass` = 3,
    `name` = 'Grovewarden''s Girdle',
    `displayid` = 27045,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 6413,
    `SellPrice` = 1282,
    `InventoryType` = 6,
    `ItemLevel` = 30,
    `RequiredLevel` = 25,
    `stackable` = 1,
    `stat_type1` = 4,
    `stat_value1` = 6,
    `stat_type2` = 7,
    `stat_value2` = 4,
    `armor` = 111,
    `bonding` = 1,
    `Material` = 5,
    `MaxDurability` = 35,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = 0;
INSERT INTO `item_template` SET
    `entry` = @BELT_AGI,
    `class` = 4,
    `subclass` = 2,
    `name` = 'Barkhide Belt',
    `displayid` = 17134,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 5486,
    `SellPrice` = 1097,
    `InventoryType` = 6,
    `ItemLevel` = 30,
    `RequiredLevel` = 25,
    `stackable` = 1,
    `stat_type1` = 3,
    `stat_value1` = 6,
    `stat_type2` = 7,
    `stat_value2` = 4,
    `armor` = 53,
    `bonding` = 1,
    `Material` = 8,
    `MaxDurability` = 30,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = 0;
INSERT INTO `item_template` SET
    `entry` = @BELT_INT,
    `class` = 4,
    `subclass` = 1,
    `name` = 'Sapwood Cord',
    `displayid` = 25998,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 4675,
    `SellPrice` = 935,
    `InventoryType` = 6,
    `ItemLevel` = 30,
    `RequiredLevel` = 25,
    `stackable` = 1,
    `stat_type1` = 5,
    `stat_value1` = 5,
    `stat_type2` = 6,
    `stat_value2` = 4,
    `armor` = 24,
    `bonding` = 1,
    `Material` = 7,
    `MaxDurability` = 25,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = 0;

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 0 = RequiredNpcOrGo1;
-- a small square around Elderbark's spawn and wander. -1 = turn-in at Gurda.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  0, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 2230, -3180, 0),
    (@QUESTID, 0, 1, 2230, -3260, 0),
    (@QUESTID, 0, 2, 2150, -3260, 0),
    (@QUESTID, 0, 3, 2150, -3180, 0),
    (@QUESTID, 1, 0, 1938, -2337, 0);
