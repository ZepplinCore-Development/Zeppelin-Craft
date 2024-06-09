-- Maraudon Purple - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91018);
                INSERT INTO `spell_target_position`
                SET `ID` = 91018,
                    `EffectIndex` = '0',
                    `MapID` = 349,
                    `PositionX` = 752.9,
                    `PositionY` = -616.5,
                    `PositionZ` = -33.1,
                    `Orientation` = 1.4,
                    `VerifiedBuild` = '0';
                    
                -- Maraudon Purple - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901901);
                INSERT INTO `item_template`
                SET `entry` = 901901,
                    `name` = 'Orb of Teleport Maraudon Purple',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91018,
                    `spellcharges_1` = '-1';
                    
                
-- Maraudon Orange - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91019);
                INSERT INTO `spell_target_position`
                SET `ID` = 91019,
                    `EffectIndex` = '0',
                    `MapID` = 349,
                    `PositionX` = 1019.7,
                    `PositionY` = -458.3,
                    `PositionZ` = -43.4,
                    `Orientation` = 0.3,
                    `VerifiedBuild` = '0';
                    
                -- Maraudon Orange - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901902);
                INSERT INTO `item_template`
                SET `entry` = 901902,
                    `name` = 'Orb of Teleport Maraudon Orange',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91019,
                    `spellcharges_1` = '-1';
                    
                
-- Maraudon Pristine Waters - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91020);
                INSERT INTO `spell_target_position`
                SET `ID` = 91020,
                    `EffectIndex` = '0',
                    `MapID` = 349,
                    `PositionX` = 495.7,
                    `PositionY` = 17.3,
                    `PositionZ` = -96.3,
                    `Orientation` = 3.1,
                    `VerifiedBuild` = '0';
                    
                -- Maraudon Pristine Waters - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901903);
                INSERT INTO `item_template`
                SET `entry` = 901903,
                    `name` = 'Orb of Teleport Maraudon Pristine Waters',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91020,
                    `spellcharges_1` = '-1';
                    
                
-- Scarlet Monastery Armory - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91021);
                INSERT INTO `spell_target_position`
                SET `ID` = 91021,
                    `EffectIndex` = '0',
                    `MapID` = 189,
                    `PositionX` = 1610.8,
                    `PositionY` = -323.4,
                    `PositionZ` = 18.7,
                    `Orientation` = 6.3,
                    `VerifiedBuild` = '0';
                    
                -- Scarlet Monastery Armory - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901904);
                INSERT INTO `item_template`
                SET `entry` = 901904,
                    `name` = 'Orb of Teleport Scarlet Monastery Armory',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91021,
                    `spellcharges_1` = '-1';
                    
                
-- Scarlet Monastery Cathedral - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91022);
                INSERT INTO `spell_target_position`
                SET `ID` = 91022,
                    `EffectIndex` = '0',
                    `MapID` = 189,
                    `PositionX` = 855.7,
                    `PositionY` = 1321.5,
                    `PositionZ` = 18.7,
                    `Orientation` = 0,
                    `VerifiedBuild` = '0';
                    
                -- Scarlet Monastery Cathedral - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901905);
                INSERT INTO `item_template`
                SET `entry` = 901905,
                    `name` = 'Orb of Teleport Scarlet Monastery Cathedral',
                    `class` = 12,
                    `displayid` = '141026',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91022,
                    `spellcharges_1` = '-1';
                    
                
-- Scarlet Monastery Graveyard - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91023);
                INSERT INTO `spell_target_position`
                SET `ID` = 91023,
                    `EffectIndex` = '0',
                    `MapID` = 189,
                    `PositionX` = 1689,
                    `PositionY` = 1053.5,
                    `PositionZ` = 18.7,
                    `Orientation` = 0,
                    `VerifiedBuild` = '0';
                    
                -- Scarlet Monastery Graveyard - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901906);
                INSERT INTO `item_template`
                SET `entry` = 901906,
                    `name` = 'Orb of Teleport Scarlet Monastery Graveyard',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91023,
                    `spellcharges_1` = '-1';
                    
                
-- Scarlet Monastery Library - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91024);
                INSERT INTO `spell_target_position`
                SET `ID` = 91024,
                    `EffectIndex` = '0',
                    `MapID` = 189,
                    `PositionX` = 255.4,
                    `PositionY` = -209.1,
                    `PositionZ` = 18.7,
                    `Orientation` = 6.3,
                    `VerifiedBuild` = '0';
                    
                -- Scarlet Monastery Library - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901907);
                INSERT INTO `item_template`
                SET `entry` = 901907,
                    `name` = 'Orb of Teleport Scarlet Monastery Library',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91024,
                    `spellcharges_1` = '-1';
                    
                
-- Blackrock Depths Prison - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91025);
                INSERT INTO `spell_target_position`
                SET `ID` = 91025,
                    `EffectIndex` = '0',
                    `MapID` = 230,
                    `PositionX` = 458.3,
                    `PositionY` = 26.5,
                    `PositionZ` = -70.7,
                    `Orientation` = 4.9,
                    `VerifiedBuild` = '0';
                    
                -- Blackrock Depths Prison - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901908);
                INSERT INTO `item_template`
                SET `entry` = 901908,
                    `name` = 'Orb of Teleport Blackrock Depths Prison',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91025,
                    `spellcharges_1` = '-1';
                    
                
-- Blackrock Depths Upper City - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91026);
                INSERT INTO `spell_target_position`
                SET `ID` = 91026,
                    `EffectIndex` = '0',
                    `MapID` = 230,
                    `PositionX` = 881.5,
                    `PositionY` = -237.3,
                    `PositionZ` = -49.9,
                    `Orientation` = 5.8,
                    `VerifiedBuild` = '0';
                    
                -- Blackrock Depths Upper City - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901909);
                INSERT INTO `item_template`
                SET `entry` = 901909,
                    `name` = 'Orb of Teleport Blackrock Depths Upper City',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91026,
                    `spellcharges_1` = '-1';
                    
                
-- Zul''Farrak - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91027);
                INSERT INTO `spell_target_position`
                SET `ID` = 91027,
                    `EffectIndex` = '0',
                    `MapID` = 209,
                    `PositionX` = 1214.2,
                    `PositionY` = 841.5,
                    `PositionZ` = 8.9,
                    `Orientation` = 6.1,
                    `VerifiedBuild` = '0';
                    
                -- Zul''Farrak - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901910);
                INSERT INTO `item_template`
                SET `entry` = 901910,
                    `name` = 'Orb of Teleport Zul''Farrak',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91027,
                    `spellcharges_1` = '-1';
                    
                
-- Sunken Temple - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91028);
                INSERT INTO `spell_target_position`
                SET `ID` = 91028,
                    `EffectIndex` = '0',
                    `MapID` = 109,
                    `PositionX` = -319.2,
                    `PositionY` = 99.9,
                    `PositionZ` = -131.85,
                    `Orientation` = 3.2,
                    `VerifiedBuild` = '0';
                    
                -- Sunken Temple - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901911);
                INSERT INTO `item_template`
                SET `entry` = 901911,
                    `name` = 'Orb of Teleport Sunken Temple',
                    `class` = 12,
                    `displayid` = '141026',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91028,
                    `spellcharges_1` = '-1';
                    
                
-- Wailing Caverns - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91029);
                INSERT INTO `spell_target_position`
                SET `ID` = 91029,
                    `EffectIndex` = '0',
                    `MapID` = 43,
                    `PositionX` = -163.5,
                    `PositionY` = 132.9,
                    `PositionZ` = -73.7,
                    `Orientation` = 5.8,
                    `VerifiedBuild` = '0';
                    
                -- Wailing Caverns - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901912);
                INSERT INTO `item_template`
                SET `entry` = 901912,
                    `name` = 'Orb of Teleport Wailing Caverns',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91029,
                    `spellcharges_1` = '-1';
                    
                
-- Ragefire Chasm - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91030);
                INSERT INTO `spell_target_position`
                SET `ID` = 91030,
                    `EffectIndex` = '0',
                    `MapID` = 389,
                    `PositionX` = 3.8,
                    `PositionY` = -14.8,
                    `PositionZ` = -17.9,
                    `Orientation` = 4.2,
                    `VerifiedBuild` = '0';
                    
                -- Ragefire Chasm - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901913);
                INSERT INTO `item_template`
                SET `entry` = 901913,
                    `name` = 'Orb of Teleport Ragefire Chasm',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91030,
                    `spellcharges_1` = '-1';
                    
                
-- Deadmines - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91031);
                INSERT INTO `spell_target_position`
                SET `ID` = 91031,
                    `EffectIndex` = '0',
                    `MapID` = 36,
                    `PositionX` = -16.4,
                    `PositionY` = -383.1,
                    `PositionZ` = 61.2,
                    `Orientation` = 2.5,
                    `VerifiedBuild` = '0';
                    
                -- Deadmines - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901914);
                INSERT INTO `item_template`
                SET `entry` = 901914,
                    `name` = 'Orb of Teleport Deadmines',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91031,
                    `spellcharges_1` = '-1';
                    
                
-- Shadowfang Keep - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91032);
                INSERT INTO `spell_target_position`
                SET `ID` = 91032,
                    `EffectIndex` = '0',
                    `MapID` = 209,
                    `PositionX` = -228.4,
                    `PositionY` = 2110.2,
                    `PositionZ` = 76.9,
                    `Orientation` = 0.6,
                    `VerifiedBuild` = '0';
                    
                -- Shadowfang Keep - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901915);
                INSERT INTO `item_template`
                SET `entry` = 901915,
                    `name` = 'Orb of Teleport Shadowfang Keep',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91032,
                    `spellcharges_1` = '-1';
                    
                
-- Blackfathom Deeps - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91033);
                INSERT INTO `spell_target_position`
                SET `ID` = 91033,
                    `EffectIndex` = '0',
                    `MapID` = 48,
                    `PositionX` = -151.9,
                    `PositionY` = 106.9,
                    `PositionZ` = -39.9,
                    `Orientation` = 4.5,
                    `VerifiedBuild` = '0';
                    
                -- Blackfathom Deeps - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901916);
                INSERT INTO `item_template`
                SET `entry` = 901916,
                    `name` = 'Orb of Teleport Blackfathom Deeps',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91033,
                    `spellcharges_1` = '-1';
                    
                
-- Stormwind Stockade - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91034);
                INSERT INTO `spell_target_position`
                SET `ID` = 91034,
                    `EffectIndex` = '0',
                    `MapID` = 34,
                    `PositionX` = 54.2,
                    `PositionY` = 0.3,
                    `PositionZ` = -18.4,
                    `Orientation` = 6.3,
                    `VerifiedBuild` = '0';
                    
                -- Stormwind Stockade - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901917);
                INSERT INTO `item_template`
                SET `entry` = 901917,
                    `name` = 'Orb of Teleport Stormwind Stockade',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91034,
                    `spellcharges_1` = '-1';
                    
                
-- Uldaman East - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91038);
                INSERT INTO `spell_target_position`
                SET `ID` = 91038,
                    `EffectIndex` = '0',
                    `MapID` = 70,
                    `PositionX` = -227.3,
                    `PositionY` = 58.9,
                    `PositionZ` = -46,
                    `Orientation` = 1.7,
                    `VerifiedBuild` = '0';
                    
                -- Uldaman East - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901921);
                INSERT INTO `item_template`
                SET `entry` = 901921,
                    `name` = 'Orb of Teleport Uldaman East',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91038,
                    `spellcharges_1` = '-1';
                    
                
-- Dire Maul East - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91041);
                INSERT INTO `spell_target_position`
                SET `ID` = 91041,
                    `EffectIndex` = '0',
                    `MapID` = 429,
                    `PositionX` = -201.2,
                    `PositionY` = -327.6,
                    `PositionZ` = -2.7,
                    `Orientation` = 5.3,
                    `VerifiedBuild` = '0';
                    
                -- Dire Maul East - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901924);
                INSERT INTO `item_template`
                SET `entry` = 901924,
                    `name` = 'Orb of Teleport Dire Maul East',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91041,
                    `spellcharges_1` = '-1';
                    
                
-- Dire Maul West - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91042);
                INSERT INTO `spell_target_position`
                SET `ID` = 91042,
                    `EffectIndex` = '0',
                    `MapID` = 429,
                    `PositionX` = -65.3,
                    `PositionY` = 158.3,
                    `PositionZ` = -3.5,
                    `Orientation` = 1.8,
                    `VerifiedBuild` = '0';
                    
                -- Dire Maul West - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901925);
                INSERT INTO `item_template`
                SET `entry` = 901925,
                    `name` = 'Orb of Teleport Dire Maul West',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91042,
                    `spellcharges_1` = '-1';
                    
                
-- Uldaman West - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91047);
                INSERT INTO `spell_target_position`
                SET `ID` = 91047,
                    `EffectIndex` = '0',
                    `MapID` = 70,
                    `PositionX` = -207.4,
                    `PositionY` = 391.6,
                    `PositionZ` = -39.2,
                    `Orientation` = 3.2,
                    `VerifiedBuild` = '0';
                    
                -- Uldaman West - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901930);
                INSERT INTO `item_template`
                SET `entry` = 901930,
                    `name` = 'Orb of Teleport Uldaman West',
                    `class` = 12,
                    `displayid` = '141026',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91047,
                    `spellcharges_1` = '-1';
                    
                
-- Hellfire Ramparts - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91072);
                INSERT INTO `spell_target_position`
                SET `ID` = 91072,
                    `EffectIndex` = '0',
                    `MapID` = 543,
                    `PositionX` = -1354.5,
                    `PositionY` = 1644.7,
                    `PositionZ` = 68.4,
                    `Orientation` = 0.7,
                    `VerifiedBuild` = '0';
                    
                -- Hellfire Ramparts - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901931);
                INSERT INTO `item_template`
                SET `entry` = 901931,
                    `name` = 'Orb of Teleport Hellfire Ramparts',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91072,
                    `spellcharges_1` = '-1';
                    
                
-- Blood Furnace - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91073);
                INSERT INTO `spell_target_position`
                SET `ID` = 91073,
                    `EffectIndex` = '0',
                    `MapID` = 542,
                    `PositionX` = -2.9,
                    `PositionY` = 7.3,
                    `PositionZ` = -44.5,
                    `Orientation` = 4.8,
                    `VerifiedBuild` = '0';
                    
                -- Blood Furnace - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901932);
                INSERT INTO `item_template`
                SET `entry` = 901932,
                    `name` = 'Orb of Teleport Blood Furnace',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91073,
                    `spellcharges_1` = '-1';
                    
                
-- Slave Pens - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91086);
                INSERT INTO `spell_target_position`
                SET `ID` = 91086,
                    `EffectIndex` = '0',
                    `MapID` = 547,
                    `PositionX` = 125,
                    `PositionY` = -124.7,
                    `PositionZ` = -1.1,
                    `Orientation` = 1.1,
                    `VerifiedBuild` = '0';
                    
                -- Slave Pens - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901956);
                INSERT INTO `item_template`
                SET `entry` = 901956,
                    `name` = 'Orb of Teleport Slave Pens',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = 91086,
                    `spellcharges_1` = '-1';
                    
                
