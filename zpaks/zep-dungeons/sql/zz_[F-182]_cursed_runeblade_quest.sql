-- =====================================================================
-- F-182 The Cursed Runeblade (Frostmourne quest)
-- Broll Bearmantle (32376) sends the player into Icecrown Citadel to
-- defeat Arthas / The Lich King (36597). The cursed Frostmourne drops as
-- the "Cursed Runeblade" quest item; Broll uncurses it on turn-in and
-- grants the wieldable Frostmourne (33475).
-- =====================================================================

SET @QUESTID        := 91182;
SET @BROLL          := 32376;   -- Broll Bearmantle (quest giver + ender)
SET @LICHKING       := 36597;   -- The Lich King (ICC encounter, boss_the_lich_king)
SET @CURSED_BLADE   := 58340;   -- Cursed Runeblade (new quest item, Misc reservation block)
SET @FROSTMOURNE    := 33475;   -- Frostmourne (Legendary reward, itemized in zep-items F-182)


-- ---------------------------------------------------------------------
-- Quest item: Cursed Runeblade (58340)
-- Quest-class item (class 12) so AC treats it as a quest deliverable;
-- bonding 4 (BIND_QUEST_ITEM) auto-cleans up on turn-in/abandon.
-- ---------------------------------------------------------------------
DELETE FROM `item_template` WHERE `entry` = @CURSED_BLADE;
INSERT INTO `item_template` SET
    `entry`               = @CURSED_BLADE,
    `class`               = 12,
    `subclass`            = 0,
    `SoundOverrideSubclass` = -1,
    `name`                = 'Cursed Runeblade',
    `description`         = 'The runeblade thrums with the trapped souls of the Scourge. Only a druid of Broll Bearmantle''s will could hope to cleanse it.',
    `displayid`           = 46609,
    `Quality`             = 4,
    `Flags`               = 0,
    `FlagsExtra`          = 0,
    `BuyCount`            = 1,
    `BuyPrice`            = 0,
    `SellPrice`          = 0,
    `InventoryType`       = 0,
    `AllowableClass`      = -1,
    `AllowableRace`       = -1,
    `ItemLevel`           = 80,
    `RequiredLevel`       = 80,
    `maxcount`            = 1,
    `stackable`           = 1,
    `bonding`             = 4,
    `Material`            = 1,
    `sheath`             = 0,
    `VerifiedBuild`       = 0;


-- ---------------------------------------------------------------------
-- Loot: The Lich King (36597) drops the Cursed Runeblade.
-- QuestRequired = 1 -> AC only drops it to players on this quest and
-- builds a per-player copy for every eligible raider (stock loot intact).
-- ---------------------------------------------------------------------
DELETE FROM `creature_loot_template` WHERE `Entry` = @LICHKING AND `Item` = @CURSED_BLADE;
INSERT INTO `creature_loot_template` SET
    `Entry`         = @LICHKING,
    `Item`          = @CURSED_BLADE,
    `Reference`     = 0,
    `Chance`        = 100,
    `QuestRequired` = 1,
    `LootMode`      = 1,
    `GroupId`       = 0,
    `MinCount`      = 1,
    `MaxCount`      = 1,
    `Comment`       = 'F-182 Cursed Runeblade (quest item)';


-- ---------------------------------------------------------------------
-- Quest: The Cursed Runeblade (91182)
-- ---------------------------------------------------------------------
DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID`                 = @QUESTID,
    `QuestType`          = 2,
    `QuestLevel`         = 80,
    `MinLevel`           = 80,
    `QuestSortID`        = 210,   -- Icecrown
    `QuestInfoID`        = 0,
    `RewardXPDifficulty` = 0,
    `RewardMoney`        = 200000,
    `RewardItem1`        = @FROSTMOURNE,
    `RewardAmount1`      = 1,
    `RequiredItemId1`    = @CURSED_BLADE,
    `RequiredItemCount1` = 1,
    `LogTitle`           = 'The Cursed Runeblade',
    `LogDescription`     = 'Enter Icecrown Citadel, defeat Arthas the Lich King, and bring the cursed Frostmourne to Broll Bearmantle.',
    `QuestDescription`   = 'The runeblade Frostmourne is the heart of the Scourge''s power. So long as Arthas wields it, the dead march at his command - and my own mother marches among them, her free will torn away.$B$BSlay the Lich King within Icecrown Citadel, $N, and tear the cursed blade from his frozen grip. Bring it to me. With the Scourge leaderless and the blade in my hands, I will cleanse it of its curse - and perhaps free those it has enslaved.',
    `QuestCompletionLog` = 'Return to Broll Bearmantle at the Argent Tournament Grounds with the Cursed Runeblade.',
    `ObjectiveText1`     = '',
    `VerifiedBuild`      = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` SET
    `ID`               = @QUESTID,
    `MaxLevel`         = 0,
    `AllowableClasses` = 0,
    `SpecialFlags`     = 0;

-- Turn-in (item present) text
DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` SET
    `ID`         = @QUESTID,
    `RewardText` = 'You have done it, $N. Arthas has fallen, and the Scourge stands leaderless at last.$B$BGive me the blade. I feel the souls trapped within - so many, crying out... Among them, I pray, is one I lost long ago.$B$BThe curse is broken. Take up Frostmourne, hero - wield it now in freedom, not in chains.';

-- "Still need the item" text
DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` SET
    `ID`             = @QUESTID,
    `CompletionText` = 'Frostmourne must be torn from the Lich King''s grasp before I can cleanse it. Return to me when the deed is done.';

-- Quest giver / ender = Broll Bearmantle
DELETE FROM `creature_queststarter` WHERE `id` = @BROLL AND `quest` = @QUESTID;
INSERT INTO `creature_queststarter` SET `id` = @BROLL, `quest` = @QUESTID;

DELETE FROM `creature_questender` WHERE `id` = @BROLL AND `quest` = @QUESTID;
INSERT INTO `creature_questender` SET `id` = @BROLL, `quest` = @QUESTID;
