-- Maraudon Purple - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91018);
                INSERT INTO `spell_target_position`
                SET `ID` = 900601,
                    `EffectIndex` = '0', 
                    `MapID` = 349, 
                    `PositionX` = 752.90, 
                    `PositionY` = -616.50, 
                    `PositionZ` = -33.10, 
                    `Orientation` = 1.40, 
                    `VerifiedBuild` = '0';

-- Maraudon Purple - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900601);
                INSERT INTO `item_template`
                SET `entry` = 900601,
                    `name` = 'Orb of Teleport Maraudon Purple', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91018, 
                    `spellcharges_1` = '-1'; 


-- Maraudon Orange - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91019);
                INSERT INTO `spell_target_position`
                SET `ID` = 900602,
                    `EffectIndex` = '0', 
                    `MapID` = 349, 
                    `PositionX` = 1019.70, 
                    `PositionY` = -458.30, 
                    `PositionZ` = -43.40, 
                    `Orientation` = 0.30, 
                    `VerifiedBuild` = '0';

-- Maraudon Orange - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900602);
                INSERT INTO `item_template`
                SET `entry` = 900602,
                    `name` = 'Orb of Teleport Maraudon Orange', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91019, 
                    `spellcharges_1` = '-1'; 


-- Maraudon Pristine Waters - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91020);
                INSERT INTO `spell_target_position`
                SET `ID` = 900603,
                    `EffectIndex` = '0', 
                    `MapID` = 349, 
                    `PositionX` = 495.70, 
                    `PositionY` = 17.30, 
                    `PositionZ` = -96.30, 
                    `Orientation` = 3.10, 
                    `VerifiedBuild` = '0';

-- Maraudon Pristine Waters - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900603);
                INSERT INTO `item_template`
                SET `entry` = 900603,
                    `name` = 'Orb of Teleport Maraudon Pristine Waters', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91020, 
                    `spellcharges_1` = '-1'; 


-- Scarlet Monastery Armory - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91021);
                INSERT INTO `spell_target_position`
                SET `ID` = 900604,
                    `EffectIndex` = '0', 
                    `MapID` = 189, 
                    `PositionX` = 1610.80, 
                    `PositionY` = -323.40, 
                    `PositionZ` = 18.70, 
                    `Orientation` = 6.30, 
                    `VerifiedBuild` = '0';

-- Scarlet Monastery Armory - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900604);
                INSERT INTO `item_template`
                SET `entry` = 900604,
                    `name` = 'Orb of Teleport Scarlet Monastery Armory', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91021, 
                    `spellcharges_1` = '-1'; 


-- Scarlet Monastery Cathedral - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91022);
                INSERT INTO `spell_target_position`
                SET `ID` = 900605,
                    `EffectIndex` = '0', 
                    `MapID` = 189, 
                    `PositionX` = 855.70, 
                    `PositionY` = 1321.50, 
                    `PositionZ` = 18.70, 
                    `Orientation` = 0.00, 
                    `VerifiedBuild` = '0';

-- Scarlet Monastery Cathedral - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900605);
                INSERT INTO `item_template`
                SET `entry` = 900605,
                    `name` = 'Orb of Teleport Scarlet Monastery Cathedral', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91022, 
                    `spellcharges_1` = '-1'; 


-- Scarlet Monastery Graveyard - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91023);
                INSERT INTO `spell_target_position`
                SET `ID` = 900606,
                    `EffectIndex` = '0', 
                    `MapID` = 189, 
                    `PositionX` = 1689.00, 
                    `PositionY` = 1053.50, 
                    `PositionZ` = 18.70, 
                    `Orientation` = 0.00, 
                    `VerifiedBuild` = '0';

-- Scarlet Monastery Graveyard - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900606);
                INSERT INTO `item_template`
                SET `entry` = 900606,
                    `name` = 'Orb of Teleport Scarlet Monastery Graveyard', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91023, 
                    `spellcharges_1` = '-1'; 


-- Scarlet Monastery Library - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91024);
                INSERT INTO `spell_target_position`
                SET `ID` = 900607,
                    `EffectIndex` = '0', 
                    `MapID` = 189, 
                    `PositionX` = 255.40, 
                    `PositionY` = -209.10, 
                    `PositionZ` = 18.70, 
                    `Orientation` = 6.30, 
                    `VerifiedBuild` = '0';

-- Scarlet Monastery Library - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900607);
                INSERT INTO `item_template`
                SET `entry` = 900607,
                    `name` = 'Orb of Teleport Scarlet Monastery Library', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91024, 
                    `spellcharges_1` = '-1'; 


-- Blackrock Depths Prison - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91025);
                INSERT INTO `spell_target_position`
                SET `ID` = 900608,
                    `EffectIndex` = '0', 
                    `MapID` = 230, 
                    `PositionX` = 458.30, 
                    `PositionY` = 26.50, 
                    `PositionZ` = -70.70, 
                    `Orientation` = 4.90, 
                    `VerifiedBuild` = '0';

-- Blackrock Depths Prison - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900608);
                INSERT INTO `item_template`
                SET `entry` = 900608,
                    `name` = 'Orb of Teleport Blackrock Depths Prison', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91025, 
                    `spellcharges_1` = '-1'; 


-- Blackrock Depths Upper City - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91026);
                INSERT INTO `spell_target_position`
                SET `ID` = 900609,
                    `EffectIndex` = '0', 
                    `MapID` = 230, 
                    `PositionX` = 881.50, 
                    `PositionY` = -237.30, 
                    `PositionZ` = -49.90, 
                    `Orientation` = 5.80, 
                    `VerifiedBuild` = '0';

-- Blackrock Depths Upper City - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900609);
                INSERT INTO `item_template`
                SET `entry` = 900609,
                    `name` = 'Orb of Teleport Blackrock Depths Upper City', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91026, 
                    `spellcharges_1` = '-1'; 


-- Zul''Farrak - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91027);
                INSERT INTO `spell_target_position`
                SET `ID` = 900610,
                    `EffectIndex` = '0', 
                    `MapID` = 209, 
                    `PositionX` = 1214.20, 
                    `PositionY` = 841.50, 
                    `PositionZ` = 8.90, 
                    `Orientation` = 6.10, 
                    `VerifiedBuild` = '0';

-- Zul''Farrak - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900610);
                INSERT INTO `item_template`
                SET `entry` = 900610,
                    `name` = 'Orb of Teleport Zul''Farrak', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91027, 
                    `spellcharges_1` = '-1'; 


-- Sunken Temple - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91028);
                INSERT INTO `spell_target_position`
                SET `ID` = 900611,
                    `EffectIndex` = '0', 
                    `MapID` = 109, 
                    `PositionX` = -319.20, 
                    `PositionY` = 99.90, 
                    `PositionZ` = -131.85, 
                    `Orientation` = 3.20, 
                    `VerifiedBuild` = '0';

-- Sunken Temple - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900611);
                INSERT INTO `item_template`
                SET `entry` = 900611,
                    `name` = 'Orb of Teleport Sunken Temple', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91028, 
                    `spellcharges_1` = '-1'; 


-- Wailing Caverns - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91029);
                INSERT INTO `spell_target_position`
                SET `ID` = 900612,
                    `EffectIndex` = '0', 
                    `MapID` = 43, 
                    `PositionX` = -163.50, 
                    `PositionY` = 132.90, 
                    `PositionZ` = -73.70, 
                    `Orientation` = 5.80, 
                    `VerifiedBuild` = '0';

-- Wailing Caverns - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900612);
                INSERT INTO `item_template`
                SET `entry` = 900612,
                    `name` = 'Orb of Teleport Wailing Caverns', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91029, 
                    `spellcharges_1` = '-1'; 


-- Ragefire Chasm - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91030);
                INSERT INTO `spell_target_position`
                SET `ID` = 900613,
                    `EffectIndex` = '0', 
                    `MapID` = 389, 
                    `PositionX` = 3.80, 
                    `PositionY` = -14.80, 
                    `PositionZ` = -17.90, 
                    `Orientation` = 4.20, 
                    `VerifiedBuild` = '0';

-- Ragefire Chasm - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900613);
                INSERT INTO `item_template`
                SET `entry` = 900613,
                    `name` = 'Orb of Teleport Ragefire Chasm', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91030, 
                    `spellcharges_1` = '-1'; 


-- Deadmines - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91031);
                INSERT INTO `spell_target_position`
                SET `ID` = 900614,
                    `EffectIndex` = '0', 
                    `MapID` = 36, 
                    `PositionX` = -16.40, 
                    `PositionY` = -383.10, 
                    `PositionZ` = 61.20, 
                    `Orientation` = 2.50, 
                    `VerifiedBuild` = '0';

-- Deadmines - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900614);
                INSERT INTO `item_template`
                SET `entry` = 900614,
                    `name` = 'Orb of Teleport Deadmines', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91031, 
                    `spellcharges_1` = '-1'; 


-- Shadowfang Keep - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91032);
                INSERT INTO `spell_target_position`
                SET `ID` = 900615,
                    `EffectIndex` = '0', 
                    `MapID` = 209, 
                    `PositionX` = -228.40, 
                    `PositionY` = 2110.20, 
                    `PositionZ` = 76.90, 
                    `Orientation` = 0.60, 
                    `VerifiedBuild` = '0';

-- Shadowfang Keep - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900615);
                INSERT INTO `item_template`
                SET `entry` = 900615,
                    `name` = 'Orb of Teleport Shadowfang Keep', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91032, 
                    `spellcharges_1` = '-1'; 


-- Blackfathom Deeps - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91033);
                INSERT INTO `spell_target_position`
                SET `ID` = 900616,
                    `EffectIndex` = '0', 
                    `MapID` = 48, 
                    `PositionX` = -151.90, 
                    `PositionY` = 106.90, 
                    `PositionZ` = -39.90, 
                    `Orientation` = 4.50, 
                    `VerifiedBuild` = '0';

-- Blackfathom Deeps - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900616);
                INSERT INTO `item_template`
                SET `entry` = 900616,
                    `name` = 'Orb of Teleport Blackfathom Deeps', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91033, 
                    `spellcharges_1` = '-1'; 


-- Stormwind Stockade - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91034);
                INSERT INTO `spell_target_position`
                SET `ID` = 900617,
                    `EffectIndex` = '0', 
                    `MapID` = 34, 
                    `PositionX` = 54.20, 
                    `PositionY` = 0.30, 
                    `PositionZ` = -18.40, 
                    `Orientation` = 6.30, 
                    `VerifiedBuild` = '0';

-- Stormwind Stockade - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900617);
                INSERT INTO `item_template`
                SET `entry` = 900617,
                    `name` = 'Orb of Teleport Stormwind Stockade', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91034, 
                    `spellcharges_1` = '-1'; 


-- Gnomeregan - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91035);
                INSERT INTO `spell_target_position`
                SET `ID` = 900618,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Gnomeregan - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900618);
                INSERT INTO `item_template`
                SET `entry` = 900618,
                    `name` = 'Orb of Teleport Gnomeregan', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91035, 
                    `spellcharges_1` = '-1'; 


-- Razorfen Kraul - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91036);
                INSERT INTO `spell_target_position`
                SET `ID` = 900619,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Razorfen Kraul - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900619);
                INSERT INTO `item_template`
                SET `entry` = 900619,
                    `name` = 'Orb of Teleport Razorfen Kraul', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91036, 
                    `spellcharges_1` = '-1'; 


-- Razorfen Downs - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91037);
                INSERT INTO `spell_target_position`
                SET `ID` = 900620,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Razorfen Downs - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900620);
                INSERT INTO `item_template`
                SET `entry` = 900620,
                    `name` = 'Orb of Teleport Razorfen Downs', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91037, 
                    `spellcharges_1` = '-1'; 


-- Uldaman East - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91038);
                INSERT INTO `spell_target_position`
                SET `ID` = 900621,
                    `EffectIndex` = '0', 
                    `MapID` = 70, 
                    `PositionX` = -227.30, 
                    `PositionY` = 58.90, 
                    `PositionZ` = -46.00, 
                    `Orientation` = 1.70, 
                    `VerifiedBuild` = '0';

-- Uldaman East - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900621);
                INSERT INTO `item_template`
                SET `entry` = 900621,
                    `name` = 'Orb of Teleport Uldaman East', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91038, 
                    `spellcharges_1` = '-1'; 


-- Blackrock Spire Lower - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91039);
                INSERT INTO `spell_target_position`
                SET `ID` = 900622,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Blackrock Spire Lower - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900622);
                INSERT INTO `item_template`
                SET `entry` = 900622,
                    `name` = 'Orb of Teleport Blackrock Spire Lower', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91039, 
                    `spellcharges_1` = '-1'; 


-- Blackrock Spire Upper - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91040);
                INSERT INTO `spell_target_position`
                SET `ID` = 900623,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Blackrock Spire Upper - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900623);
                INSERT INTO `item_template`
                SET `entry` = 900623,
                    `name` = 'Orb of Teleport Blackrock Spire Upper', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91040, 
                    `spellcharges_1` = '-1'; 


-- Dire Maul East - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91041);
                INSERT INTO `spell_target_position`
                SET `ID` = 900624,
                    `EffectIndex` = '0', 
                    `MapID` = 429, 
                    `PositionX` = -201.20, 
                    `PositionY` = -327.60, 
                    `PositionZ` = -2.70, 
                    `Orientation` = 5.30, 
                    `VerifiedBuild` = '0';

-- Dire Maul East - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900624);
                INSERT INTO `item_template`
                SET `entry` = 900624,
                    `name` = 'Orb of Teleport Dire Maul East', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91041, 
                    `spellcharges_1` = '-1'; 


-- Dire Maul West - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91042);
                INSERT INTO `spell_target_position`
                SET `ID` = 900625,
                    `EffectIndex` = '0', 
                    `MapID` = 429, 
                    `PositionX` = -65.30, 
                    `PositionY` = 158.30, 
                    `PositionZ` = -3.50, 
                    `Orientation` = 1.80, 
                    `VerifiedBuild` = '0';

-- Dire Maul West - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900625);
                INSERT INTO `item_template`
                SET `entry` = 900625,
                    `name` = 'Orb of Teleport Dire Maul West', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91042, 
                    `spellcharges_1` = '-1'; 


-- Dire Maul North - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91043);
                INSERT INTO `spell_target_position`
                SET `ID` = 900626,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Dire Maul North - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900626);
                INSERT INTO `item_template`
                SET `entry` = 900626,
                    `name` = 'Orb of Teleport Dire Maul North', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91043, 
                    `spellcharges_1` = '-1'; 


-- Stratholme Undead - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91044);
                INSERT INTO `spell_target_position`
                SET `ID` = 900627,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Stratholme Undead - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900627);
                INSERT INTO `item_template`
                SET `entry` = 900627,
                    `name` = 'Orb of Teleport Stratholme Undead', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91044, 
                    `spellcharges_1` = '-1'; 


-- Stratholme Living - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91045);
                INSERT INTO `spell_target_position`
                SET `ID` = 900628,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Stratholme Living - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900628);
                INSERT INTO `item_template`
                SET `entry` = 900628,
                    `name` = 'Orb of Teleport Stratholme Living', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91045, 
                    `spellcharges_1` = '-1'; 


-- Scholomance - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91046);
                INSERT INTO `spell_target_position`
                SET `ID` = 900629,
                    `EffectIndex` = '0', 
                    `MapID` = , 
                    `PositionX` = , 
                    `PositionY` = , 
                    `PositionZ` = , 
                    `Orientation` = , 
                    `VerifiedBuild` = '0';

-- Scholomance - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900629);
                INSERT INTO `item_template`
                SET `entry` = 900629,
                    `name` = 'Orb of Teleport Scholomance', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91046, 
                    `spellcharges_1` = '-1'; 


-- Uldaman West - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91047);
                INSERT INTO `spell_target_position`
                SET `ID` = 900630,
                    `EffectIndex` = '0', 
                    `MapID` = 70, 
                    `PositionX` = -207.40, 
                    `PositionY` = 391.60, 
                    `PositionZ` = -39.20, 
                    `Orientation` = 3.20, 
                    `VerifiedBuild` = '0';

-- Uldaman West - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900630);
                INSERT INTO `item_template`
                SET `entry` = 900630,
                    `name` = 'Orb of Teleport Uldaman West', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91047, 
                    `spellcharges_1` = '-1'; 


-- Hellfire Ramparts - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91072);
                INSERT INTO `spell_target_position`
                SET `ID` = 900631,
                    `EffectIndex` = '0', 
                    `MapID` = 543, 
                    `PositionX` = -1352.90, 
                    `PositionY` = 1642.90, 
                    `PositionZ` = -68.40, 
                    `Orientation` = 0.70, 
                    `VerifiedBuild` = '0';

-- Hellfire Ramparts - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900631);
                INSERT INTO `item_template`
                SET `entry` = 900631,
                    `name` = 'Orb of Teleport Hellfire Ramparts', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91072, 
                    `spellcharges_1` = '-1'; 


-- Blood Furnace - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91073);
                INSERT INTO `spell_target_position`
                SET `ID` = 900632,
                    `EffectIndex` = '0', 
                    `MapID` = 542, 
                    `PositionX` = -2.90, 
                    `PositionY` = 7.30, 
                    `PositionZ` = -44.50, 
                    `Orientation` = 4.80, 
                    `VerifiedBuild` = '0';

-- Blood Furnace - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 900632);
                INSERT INTO `item_template`
                SET `entry` = 900632,
                    `name` = 'Orb of Teleport Blood Furnace', 
                    `displayid` = '6009', 
                    `Quality` = '2', 
                    `bonding` = '2', 
                    `spellid_1` = 91073, 
                    `spellcharges_1` = '-1'; 


