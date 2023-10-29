-- The Stolen Tome (Warlock)
DELETE FROM `creature_questender` WHERE `id`=459 AND `quest`=1598;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (459, 1598);

-- The Stolen Tome (Warlock)
DELETE FROM `creature_queststarter` WHERE `id`=459 AND `quest`=1598;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (459, 1598);

-- Defias Thug
UPDATE `creature_template` SET `faction`=17 WHERE `entry`=38;

-- Diseased Timber Wolf
UPDATE `creature_template` SET `modelid1`=604, `name`='Timber Wolf' WHERE `entry`=69;

-- Kobold Laborer
UPDATE `creature_template` SET `maxlevel`=4 WHERE `entry`=80;

-- Garrick Padfoot
UPDATE `creature_template` SET `faction`=17 WHERE `entry`=103;

-- Kobold Worker
UPDATE `creature_template` SET `modelid1`=10912 WHERE `entry`=257;

-- Diseased Young Wolf
UPDATE `creature_template` SET `modelid1`=447, `name`='Young Wolf' WHERE `entry`=299;

-- Northshire Guard
UPDATE `creature_template` SET `minlevel`=55, `maxlevel`=55 WHERE `entry`=1642;

-- Lee Brown <Fisherman>
UPDATE `creature_template` SET `subname`='Fisherman' WHERE `entry`=1651;

-- Rebecca Laughlin <Tabard Designer>
UPDATE `creature_template` SET `subname`='Tabard Vendor' WHERE `entry`=5193;

-- Eldraeith <Herbalism Supplies>
UPDATE `creature_template` SET `subname`='Herbalism Supplier' WHERE `entry`=5503;

-- Diseased Timber Wolf
DELETE FROM `creature_template_addon` WHERE `entry`=69;

-- Diseased Young Wolf
DELETE FROM `creature_template_addon` WHERE `entry`=299;

-- Randal Hunter <Riding Trainer>
DELETE FROM `npc_trainer` WHERE `ID`=4732;
INSERT INTO `npc_trainer` (`ID`, `SpellID`) VALUES (4732, -450000);

-- Antonio Perelli <Traveling Salesman>
DELETE FROM `npc_vendor` WHERE `entry`=844 AND `item`=40411;

-- Dawn Brightstar <Arcane Goods>
DELETE FROM `npc_vendor` WHERE `entry`=958 AND `item` IN (22147, 22148, 37201, 40411);

-- Wolves Across the Border
DELETE FROM `quest_offer_reward` WHERE `ID`=33;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES (33, 1, 'You\'ve been busy! I can\'t wait to cook up that wolf meat...$b$bI have some things here you might want - take your pick!');

-- Wolves Across the Border
DELETE FROM `quest_request_items` WHERE `ID`=33;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES (33, 6, 6, 'Hey $N. I\'m getting hungry...did you get that tough wolf meat?');

-- Bounty on Garrick Padfoot
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=6;

-- Kobold Camp Cleanup
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Kill 10 Kobold Vermin, then return to Marshal McBride.', `RequiredNpcOrGoCount1`=10 WHERE `ID`=7;

-- Investigate Echo Ridge
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Kill 10 Kobold Workers, then report back to Marshal McBride.', `QuestDescription`='$N, my scouts tell me that the kobold infestation is larger than we had thought.  A group of kobold workers has camped near the Echo Ridge Mine to the north.$B$BGo to the mine and remove them.  We know there are at least 10.  Kill them, see if there are more, then report back to me.', `RequiredNpcOrGoCount1`=10 WHERE `ID`=15;

-- Brotherhood of Thieves
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Bring 12 Red Burlap Bandanas to Deputy Willem outside the Northshire Abbey.', `RequiredItemCount1`=12 WHERE `ID`=18;

-- Skirmish at Echo Ridge
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Kill 12 Kobold Laborers, then return to Marshal McBride at Northshire Abbey.', `RequiredNpcOrGoCount1`=12 WHERE `ID`=21;

-- Wolves Across the Border
UPDATE `quest_template` SET `Flags`=8, `LogDescription`='Bring 8 pieces of Tough Wolf Meat to Eagan Peltskinner outside Northshire Abbey.', `QuestDescription`='I hate those nasty timber wolves!  But I sure like eating wolf steaks...  Bring me tough wolf meat and I will exchange it for something you\'ll find useful.$B$BTough wolf meat is gathered from hunting the timber wolves and young wolves wandering the Northshire countryside.', `RequiredItemId1`=750 WHERE `ID`=33;

-- Report to Goldshire
UPDATE `quest_template` SET `Flags`=0 WHERE `ID`=54;

-- A Threat Within
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=783;

-- Rest and Relaxation
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=2158;

-- Encrypted Letter
UPDATE `quest_template` SET `Flags`=0 WHERE `ID`=3102;

-- Milly Osworth
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=3903;

-- Milly's Harvest
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=3904;

-- Grape Manifest
UPDATE `quest_template` SET `Flags`=0 WHERE `ID`=3905;

-- Eagan Peltskinner
UPDATE `quest_template` SET `QuestDescription`='Eagan Peltskinner is looking for someone to hunt wolves for him.  That\'s good news, because we\'re seeing a lot more wolves in Northshire Valley lately.$B$BIf you\'re interested then speak with Eagan.  He\'s around the side of the abbey, to the left.' WHERE `ID`=5261;

-- Bounty on Garrick Padfoot
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=6;

-- Kobold Camp Cleanup
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=7;

-- Investigate Echo Ridge
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=15;

-- Brotherhood of Thieves
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=18;

-- Skirmish at Echo Ridge
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=21;

-- Wolves Across the Border
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=33;

-- Report to Goldshire
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=54;

-- A Threat Within
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=783;

-- Rest and Relaxation
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=2158;

-- Simple Letter
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3100;

-- Consecrated Letter
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3101;

-- Encrypted Letter
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3102;

-- Hallowed Letter
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3103;

-- Glyphic Letter
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3104;

-- Tainted Letter
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3105;

-- Milly Osworth
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3903;

-- Milly's Harvest
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3904;

-- Grape Manifest
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=3905;

-- Eagan Peltskinner
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=5261;

-- Timber Wolf
DELETE FROM `creature_loot_template` WHERE `Entry`=69 AND `Item`=750;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `QuestRequired`, `MinCount`, `MaxCount`, `Comment`) VALUES (69, 750, 80, 1, 1, 1, 'Timber Wolf - Tough Wolf Meat');

-- Young Wolf
DELETE FROM `creature_loot_template` WHERE `Entry`=299 AND `Item`=750;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `QuestRequired`, `MinCount`, `MaxCount`, `Comment`) VALUES (299, 750, 80, 1, 1, 1, 'Young Wolf - Tough Wolf Meat');

DELETE FROM `creature_questitem` WHERE `CreatureEntry` IN (69, 299);
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(69, 0, 750, 0),
(299, 0, 750, 0);

-- Restore Mirror Lake Orchard creatures removed in WotLK
DELETE FROM `creature` WHERE `guid` IN (80391, 80392, 80393, 80394, 80396, 80397, 80399, 80400, 80401, 80402, 80403, 80404, 80405) AND `id1` IN (116, 94);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(80391, 116, 0, 0, 0, 0, 0, 1, 1, 1, -9441.48, 469.81, 53.2758, 4.26422, 180, 5, 0, 156, 0, 1, 0, 0, 0, '', 0),
(80392, 116, 0, 0, 0, 0, 0, 1, 1, 1, -9444.94, 473.775, 52.3257, 4.03171, 180, 5, 0, 156, 0, 1, 0, 0, 0, '', 0),
(80393, 116, 0, 0, 0, 0, 0, 1, 1, 1, -9437.72, 486.039, 53.3307, 5.58505, 180, 5, 0, 156, 0, 1, 0, 0, 0, '', 0),
(80394, 116, 0, 0, 0, 0, 0, 1, 1, 1, -9433.15, 482.528, 53.2474, 2.53073, 180, 5, 0, 156, 0, 1, 0, 0, 0, '', 0),
(80396, 94, 0, 0, 0, 0, 0, 1, 1, 1, -9464.65, 480.308, 53.0385, 3.48143, 180, 5, 0, 102, 0, 1, 0, 0, 0, '', 0),
(80397, 94, 0, 0, 0, 0, 0, 1, 1, 1, -9453.23, 512.811, 56.3243, 6.18203, 180, 5, 0, 102, 0, 1, 0, 0, 0, '', 0),
(80399, 116, 0, 0, 0, 0, 0, 1, 1, 1, -9447.86, 462.158, 52.2864, 4.2586, 180, 5, 0, 156, 0, 1, 0, 0, 0, '', 0),
(80400, 94, 0, 0, 0, 0, 0, 1, 1, 1, -9495.64, 457.065, 52.3032, 2.96413, 180, 5, 0, 102, 0, 1, 0, 0, 0, '', 0),
(80401, 94, 0, 0, 0, 0, 0, 1, 1, 1, -9479.78, 470.421, 51.6672, 5.18983, 180, 5, 0, 102, 0, 1, 0, 0, 0, '', 0),
(80402, 94, 0, 0, 0, 0, 0, 1, 1, 1, -9459.9, 426.179, 52.6221, 3.6223, 180, 5, 0, 102, 0, 1, 0, 0, 0, '', 0),
(80403, 116, 0, 0, 0, 0, 0, 1, 1, 1, -9441.33, 447.532, 52.5032, 3.9619, 180, 5, 0, 156, 0, 1, 0, 0, 0, '', 0),
(80404, 116, 0, 0, 0, 0, 0, 1, 1, 1, -9445.96, 451.56, 52.6251, 1.93731, 180, 5, 0, 156, 0, 1, 0, 0, 0, '', 0),
(80405, 94, 0, 0, 0, 0, 0, 1, 1, 1, -9517.96, 494.378, 52.2181, 5.29769, 180, 5, 0, 102, 0, 1, 0, 0, 0, '', 0);
