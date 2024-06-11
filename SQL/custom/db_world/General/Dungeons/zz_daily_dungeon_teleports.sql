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
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141026',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141024',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141026',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141026',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91034,
                    `spellcharges_1` = '-1';
                    
                
-- Gnomeregan - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91035);
                INSERT INTO `spell_target_position`
                SET `ID` = 91035,
                    `EffectIndex` = '0',
                    `MapID` = 90,
                    `PositionX` = -337.1,
                    `PositionY` = -0.4,
                    `PositionZ` = -152.8,
                    `Orientation` = 2.8,
                    `VerifiedBuild` = '0';
                    
                -- Gnomeregan - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901918);
                INSERT INTO `item_template`
                SET `entry` = 901918,
                    `name` = 'Orb of Teleport Gnomeregan',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91035,
                    `spellcharges_1` = '-1';
                    
                
-- Razorfen Kraul - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91036);
                INSERT INTO `spell_target_position`
                SET `ID` = 91036,
                    `EffectIndex` = '0',
                    `MapID` = 47,
                    `PositionX` = 1943.4,
                    `PositionY` = 1546.8,
                    `PositionZ` = 82.2,
                    `Orientation` = 1.4,
                    `VerifiedBuild` = '0';
                    
                -- Razorfen Kraul - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901919);
                INSERT INTO `item_template`
                SET `entry` = 901919,
                    `name` = 'Orb of Teleport Razorfen Kraul',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91036,
                    `spellcharges_1` = '-1';
                    
                
-- Razorfen Downs - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91037);
                INSERT INTO `spell_target_position`
                SET `ID` = 91037,
                    `EffectIndex` = '0',
                    `MapID` = 129,
                    `PositionX` = 2592.6,
                    `PositionY` = 1104.9,
                    `PositionZ` = 51.5,
                    `Orientation` = 4.7,
                    `VerifiedBuild` = '0';
                    
                -- Razorfen Downs - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901920);
                INSERT INTO `item_template`
                SET `entry` = 901920,
                    `name` = 'Orb of Teleport Razorfen Downs',
                    `class` = 12,
                    `displayid` = '141026',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91037,
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
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91038,
                    `spellcharges_1` = '-1';
                    
                
-- Blackrock Spire Lower - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91039);
                INSERT INTO `spell_target_position`
                SET `ID` = 91039,
                    `EffectIndex` = '0',
                    `MapID` = 229,
                    `PositionX` = 78.5,
                    `PositionY` = -242.8,
                    `PositionZ` = 57.3,
                    `Orientation` = 4.8,
                    `VerifiedBuild` = '0';
                    
                -- Blackrock Spire Lower - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901922);
                INSERT INTO `item_template`
                SET `entry` = 901922,
                    `name` = 'Orb of Teleport Blackrock Spire Lower',
                    `class` = 12,
                    `displayid` = '141026',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91039,
                    `spellcharges_1` = '-1';
                    
                
-- Blackrock Spire Upper - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91040);
                INSERT INTO `spell_target_position`
                SET `ID` = 91040,
                    `EffectIndex` = '0',
                    `MapID` = 229,
                    `PositionX` = 120.5,
                    `PositionY` = -345.8,
                    `PositionZ` = 71,
                    `Orientation` = 0.8,
                    `VerifiedBuild` = '0';
                    
                -- Blackrock Spire Upper - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901923);
                INSERT INTO `item_template`
                SET `entry` = 901923,
                    `name` = 'Orb of Teleport Blackrock Spire Upper',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91040,
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
                    `displayid` = '141026',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91042,
                    `spellcharges_1` = '-1';
                    
                
-- Dire Maul North - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91043);
                INSERT INTO `spell_target_position`
                SET `ID` = 91043,
                    `EffectIndex` = '0',
                    `MapID` = 429,
                    `PositionX` = 257.1,
                    `PositionY` = -27,
                    `PositionZ` = -2.6,
                    `Orientation` = 6.3,
                    `VerifiedBuild` = '0';
                    
                -- Dire Maul North - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901926);
                INSERT INTO `item_template`
                SET `entry` = 901926,
                    `name` = 'Orb of Teleport Dire Maul North',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91043,
                    `spellcharges_1` = '-1';
                    
                
-- Stratholme Undead - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91044);
                INSERT INTO `spell_target_position`
                SET `ID` = 91044,
                    `EffectIndex` = '0',
                    `MapID` = 329,
                    `PositionX` = 3612.1,
                    `PositionY` = -3647.7,
                    `PositionZ` = 138.5,
                    `Orientation` = 0.4,
                    `VerifiedBuild` = '0';
                    
                -- Stratholme Undead - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901927);
                INSERT INTO `item_template`
                SET `entry` = 901927,
                    `name` = 'Orb of Teleport Stratholme Undead',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91044,
                    `spellcharges_1` = '-1';
                    
                
-- Stratholme Living - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91045);
                INSERT INTO `spell_target_position`
                SET `ID` = 91045,
                    `EffectIndex` = '0',
                    `MapID` = 329,
                    `PositionX` = 3400,
                    `PositionY` = -3380.3,
                    `PositionZ` = 142.6,
                    `Orientation` = 0,
                    `VerifiedBuild` = '0';
                    
                -- Stratholme Living - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901928);
                INSERT INTO `item_template`
                SET `entry` = 901928,
                    `name` = 'Orb of Teleport Stratholme Living',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91045,
                    `spellcharges_1` = '-1';
                    
                
-- Scholomance - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91046);
                INSERT INTO `spell_target_position`
                SET `ID` = 91046,
                    `EffectIndex` = '0',
                    `MapID` = 289,
                    `PositionX` = 200.3,
                    `PositionY` = 125.8,
                    `PositionZ` = 134.9,
                    `Orientation` = 4.7,
                    `VerifiedBuild` = '0';
                    
                -- Scholomance - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901929);
                INSERT INTO `item_template`
                SET `entry` = 901929,
                    `name` = 'Orb of Teleport Scholomance',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91046,
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
                    `displayid` = '141022',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
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
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91073,
                    `spellcharges_1` = '-1';
                    
                
-- Ahn''kahet: The Old Kingdom - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91088);
                INSERT INTO `spell_target_position`
                SET `ID` = 91088,
                    `EffectIndex` = '0',
                    `MapID` = 619,
                    `PositionX` = 346.7,
                    `PositionY` = -1101.7,
                    `PositionZ` = 58.3,
                    `Orientation` = 0.6,
                    `VerifiedBuild` = '0';
                    
                -- Ahn''kahet: The Old Kingdom - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901933);
                INSERT INTO `item_template`
                SET `entry` = 901933,
                    `name` = 'Orb of Teleport Ahn''kahet: The Old Kingdom',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91088,
                    `spellcharges_1` = '-1';
                    
                
-- Ajzol-Nerub - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91089);
                INSERT INTO `spell_target_position`
                SET `ID` = 91089,
                    `EffectIndex` = '0',
                    `MapID` = 601,
                    `PositionX` = 425.7,
                    `PositionY` = 783.6,
                    `PositionZ` = 827.8,
                    `Orientation` = 5.5,
                    `VerifiedBuild` = '0';
                    
                -- Ajzol-Nerub - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901934);
                INSERT INTO `item_template`
                SET `entry` = 901934,
                    `name` = 'Orb of Teleport Ajzol-Nerub',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91089,
                    `spellcharges_1` = '-1';
                    
                
-- Arcatraz - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91090);
                INSERT INTO `spell_target_position`
                SET `ID` = 91090,
                    `EffectIndex` = '0',
                    `MapID` = 552,
                    `PositionX` = 14.2,
                    `PositionY` = -0.1,
                    `PositionZ` = -0.2,
                    `Orientation` = 6.3,
                    `VerifiedBuild` = '0';
                    
                -- Arcatraz - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901935);
                INSERT INTO `item_template`
                SET `entry` = 901935,
                    `name` = 'Orb of Teleport Arcatraz',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91090,
                    `spellcharges_1` = '-1';
                    
                
-- Auchenai Crypts - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91091);
                INSERT INTO `spell_target_position`
                SET `ID` = 91091,
                    `EffectIndex` = '0',
                    `MapID` = 558,
                    `PositionX` = -20.6,
                    `PositionY` = 0.2,
                    `PositionZ` = -0.1,
                    `Orientation` = 0,
                    `VerifiedBuild` = '0';
                    
                -- Auchenai Crypts - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901936);
                INSERT INTO `item_template`
                SET `entry` = 901936,
                    `name` = 'Orb of Teleport Auchenai Crypts',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91091,
                    `spellcharges_1` = '-1';
                    
                
-- Black Morass - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91092);
                INSERT INTO `spell_target_position`
                SET `ID` = 91092,
                    `EffectIndex` = '0',
                    `MapID` = 269,
                    `PositionX` = -1525.5,
                    `PositionY` = 7106,
                    `PositionZ` = 32.2,
                    `Orientation` = 3.2,
                    `VerifiedBuild` = '0';
                    
                -- Black Morass - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901937);
                INSERT INTO `item_template`
                SET `entry` = 901937,
                    `name` = 'Orb of Teleport Black Morass',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91092,
                    `spellcharges_1` = '-1';
                    
                
-- Botanica - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91093);
                INSERT INTO `spell_target_position`
                SET `ID` = 91093,
                    `EffectIndex` = '0',
                    `MapID` = 553,
                    `PositionX` = -2,
                    `PositionY` = 0,
                    `PositionZ` = -1.5,
                    `Orientation` = 1.6,
                    `VerifiedBuild` = '0';
                    
                -- Botanica - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901938);
                INSERT INTO `item_template`
                SET `entry` = 901938,
                    `name` = 'Orb of Teleport Botanica',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91093,
                    `spellcharges_1` = '-1';
                    
                
-- Culling of Stratholme - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91094);
                INSERT INTO `spell_target_position`
                SET `ID` = 91094,
                    `EffectIndex` = '0',
                    `MapID` = 595,
                    `PositionX` = 1547.5,
                    `PositionY` = 570.2,
                    `PositionZ` = 92.6,
                    `Orientation` = 1.1,
                    `VerifiedBuild` = '0';
                    
                -- Culling of Stratholme - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901939);
                INSERT INTO `item_template`
                SET `entry` = 901939,
                    `name` = 'Orb of Teleport Culling of Stratholme',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91094,
                    `spellcharges_1` = '-1';
                    
                
-- Drak''Tharon Keep - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91095);
                INSERT INTO `spell_target_position`
                SET `ID` = 91095,
                    `EffectIndex` = '0',
                    `MapID` = 600,
                    `PositionX` = -522.1,
                    `PositionY` = -529.4,
                    `PositionZ` = 11,
                    `Orientation` = 4.2,
                    `VerifiedBuild` = '0';
                    
                -- Drak''Tharon Keep - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901940);
                INSERT INTO `item_template`
                SET `entry` = 901940,
                    `name` = 'Orb of Teleport Drak''Tharon Keep',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91095,
                    `spellcharges_1` = '-1';
                    
                
-- Forge of Souls - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91096);
                INSERT INTO `spell_target_position`
                SET `ID` = 91096,
                    `EffectIndex` = '0',
                    `MapID` = 632,
                    `PositionX` = 4915.4,
                    `PositionY` = 2190.1,
                    `PositionZ` = 638.7,
                    `Orientation` = 2,
                    `VerifiedBuild` = '0';
                    
                -- Forge of Souls - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901941);
                INSERT INTO `item_template`
                SET `entry` = 901941,
                    `name` = 'Orb of Teleport Forge of Souls',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91096,
                    `spellcharges_1` = '-1';
                    
                
-- Gundrak - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91097);
                INSERT INTO `spell_target_position`
                SET `ID` = 91097,
                    `EffectIndex` = '0',
                    `MapID` = 604,
                    `PositionX` = 1868.3,
                    `PositionY` = 631.6,
                    `PositionZ` = 176.7,
                    `Orientation` = 3.1,
                    `VerifiedBuild` = '0';
                    
                -- Gundrak - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901942);
                INSERT INTO `item_template`
                SET `entry` = 901942,
                    `name` = 'Orb of Teleport Gundrak',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91097,
                    `spellcharges_1` = '-1';
                    
                
-- Halls of Lightning - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91098);
                INSERT INTO `spell_target_position`
                SET `ID` = 91098,
                    `EffectIndex` = '0',
                    `MapID` = 602,
                    `PositionX` = 1331.5,
                    `PositionY` = 238.6,
                    `PositionZ` = 52.5,
                    `Orientation` = 4.7,
                    `VerifiedBuild` = '0';
                    
                -- Halls of Lightning - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901943);
                INSERT INTO `item_template`
                SET `entry` = 901943,
                    `name` = 'Orb of Teleport Halls of Lightning',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91098,
                    `spellcharges_1` = '-1';
                    
                
-- Halls of Reflection - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91099);
                INSERT INTO `spell_target_position`
                SET `ID` = 91099,
                    `EffectIndex` = '0',
                    `MapID` = 668,
                    `PositionX` = 5245.9,
                    `PositionY` = 1939.7,
                    `PositionZ` = 707.7,
                    `Orientation` = 0.8,
                    `VerifiedBuild` = '0';
                    
                -- Halls of Reflection - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901944);
                INSERT INTO `item_template`
                SET `entry` = 901944,
                    `name` = 'Orb of Teleport Halls of Reflection',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91099,
                    `spellcharges_1` = '-1';
                    
                
-- Halls of Stone - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91100);
                INSERT INTO `spell_target_position`
                SET `ID` = 91100,
                    `EffectIndex` = '0',
                    `MapID` = 599,
                    `PositionX` = 1153.3,
                    `PositionY` = 797.5,
                    `PositionZ` = 195.9,
                    `Orientation` = 4.7,
                    `VerifiedBuild` = '0';
                    
                -- Halls of Stone - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901945);
                INSERT INTO `item_template`
                SET `entry` = 901945,
                    `name` = 'Orb of Teleport Halls of Stone',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91100,
                    `spellcharges_1` = '-1';
                    
                
-- Magister''s Terrace - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91101);
                INSERT INTO `spell_target_position`
                SET `ID` = 91101,
                    `EffectIndex` = '0',
                    `MapID` = 585,
                    `PositionX` = 38.5,
                    `PositionY` = 0.2,
                    `PositionZ` = -2.8,
                    `Orientation` = 6.24,
                    `VerifiedBuild` = '0';
                    
                -- Magister''s Terrace - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901946);
                INSERT INTO `item_template`
                SET `entry` = 901946,
                    `name` = 'Orb of Teleport Magister''s Terrace',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91101,
                    `spellcharges_1` = '-1';
                    
                
-- Mana-Tombs - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91102);
                INSERT INTO `spell_target_position`
                SET `ID` = 91102,
                    `EffectIndex` = '0',
                    `MapID` = 557,
                    `PositionX` = -2.4,
                    `PositionY` = 1.7,
                    `PositionZ` = -0.9,
                    `Orientation` = 3,
                    `VerifiedBuild` = '0';
                    
                -- Mana-Tombs - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901947);
                INSERT INTO `item_template`
                SET `entry` = 901947,
                    `name` = 'Orb of Teleport Mana-Tombs',
                    `class` = 12,
                    `displayid` = '141026',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91102,
                    `spellcharges_1` = '-1';
                    
                
-- Mechanar - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91103);
                INSERT INTO `spell_target_position`
                SET `ID` = 91103,
                    `EffectIndex` = '0',
                    `MapID` = 554,
                    `PositionX` = -27.8,
                    `PositionY` = 0.7,
                    `PositionZ` = -1.8,
                    `Orientation` = 0,
                    `VerifiedBuild` = '0';
                    
                -- Mechanar - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901948);
                INSERT INTO `item_template`
                SET `entry` = 901948,
                    `name` = 'Orb of Teleport Mechanar',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91103,
                    `spellcharges_1` = '-1';
                    
                
-- Nexus - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91104);
                INSERT INTO `spell_target_position`
                SET `ID` = 91104,
                    `EffectIndex` = '0',
                    `MapID` = 576,
                    `PositionX` = 145.9,
                    `PositionY` = -10.5,
                    `PositionZ` = -16.6,
                    `Orientation` = 1.5,
                    `VerifiedBuild` = '0';
                    
                -- Nexus - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901949);
                INSERT INTO `item_template`
                SET `entry` = 901949,
                    `name` = 'Orb of Teleport Nexus',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91104,
                    `spellcharges_1` = '-1';
                    
                
-- Oculus - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91105);
                INSERT INTO `spell_target_position`
                SET `ID` = 91105,
                    `EffectIndex` = '0',
                    `MapID` = 578,
                    `PositionX` = 1060,
                    `PositionY` = 984.5,
                    `PositionZ` = 361.1,
                    `Orientation` = 5.7,
                    `VerifiedBuild` = '0';
                    
                -- Oculus - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901950);
                INSERT INTO `item_template`
                SET `entry` = 901950,
                    `name` = 'Orb of Teleport Oculus',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91105,
                    `spellcharges_1` = '-1';
                    
                
-- Old Hillsbrad Foothills - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91106);
                INSERT INTO `spell_target_position`
                SET `ID` = 91106,
                    `EffectIndex` = '0',
                    `MapID` = 560,
                    `PositionX` = 2384.9,
                    `PositionY` = 1189.9,
                    `PositionZ` = 67.4,
                    `Orientation` = 4.1,
                    `VerifiedBuild` = '0';
                    
                -- Old Hillsbrad Foothills - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901951);
                INSERT INTO `item_template`
                SET `entry` = 901951,
                    `name` = 'Orb of Teleport Old Hillsbrad Foothills',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91106,
                    `spellcharges_1` = '-1';
                    
                
-- Pit of Saron - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91107);
                INSERT INTO `spell_target_position`
                SET `ID` = 91107,
                    `EffectIndex` = '0',
                    `MapID` = 658,
                    `PositionX` = 441.3,
                    `PositionY` = 216.9,
                    `PositionZ` = 528.7,
                    `Orientation` = 0.1,
                    `VerifiedBuild` = '0';
                    
                -- Pit of Saron - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901952);
                INSERT INTO `item_template`
                SET `entry` = 901952,
                    `name` = 'Orb of Teleport Pit of Saron',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91107,
                    `spellcharges_1` = '-1';
                    
                
-- Sethekk Halls - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91108);
                INSERT INTO `spell_target_position`
                SET `ID` = 91108,
                    `EffectIndex` = '0',
                    `MapID` = 556,
                    `PositionX` = -3.6,
                    `PositionY` = -0.1,
                    `PositionZ` = 0,
                    `Orientation` = 0,
                    `VerifiedBuild` = '0';
                    
                -- Sethekk Halls - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901953);
                INSERT INTO `item_template`
                SET `entry` = 901953,
                    `name` = 'Orb of Teleport Sethekk Halls',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91108,
                    `spellcharges_1` = '-1';
                    
                
-- Shadow Labyrinth - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91109);
                INSERT INTO `spell_target_position`
                SET `ID` = 91109,
                    `EffectIndex` = '0',
                    `MapID` = 555,
                    `PositionX` = -5.1,
                    `PositionY` = 0.1,
                    `PositionZ` = -1.1,
                    `Orientation` = 3.1,
                    `VerifiedBuild` = '0';
                    
                -- Shadow Labyrinth - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901954);
                INSERT INTO `item_template`
                SET `entry` = 901954,
                    `name` = 'Orb of Teleport Shadow Labyrinth',
                    `class` = 12,
                    `displayid` = '141024',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91109,
                    `spellcharges_1` = '-1';
                    
                
-- Shattered Halls - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91110);
                INSERT INTO `spell_target_position`
                SET `ID` = 91110,
                    `EffectIndex` = '0',
                    `MapID` = 540,
                    `PositionX` = -38.7,
                    `PositionY` = -15,
                    `PositionZ` = -14,
                    `Orientation` = 1.1,
                    `VerifiedBuild` = '0';
                    
                -- Shattered Halls - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901955);
                INSERT INTO `item_template`
                SET `entry` = 901955,
                    `name` = 'Orb of Teleport Shattered Halls',
                    `class` = 12,
                    `displayid` = '141021',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91110,
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
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91086,
                    `spellcharges_1` = '-1';
                    
                
-- Steamvault - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91111);
                INSERT INTO `spell_target_position`
                SET `ID` = 91111,
                    `EffectIndex` = '0',
                    `MapID` = 545,
                    `PositionX` = -13.8,
                    `PositionY` = 6.8,
                    `PositionZ` = -4.2,
                    `Orientation` = 0,
                    `VerifiedBuild` = '0';
                    
                -- Steamvault - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901957);
                INSERT INTO `item_template`
                SET `entry` = 901957,
                    `name` = 'Orb of Teleport Steamvault',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91111,
                    `spellcharges_1` = '-1';
                    
                
-- The Underbog - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91112);
                INSERT INTO `spell_target_position`
                SET `ID` = 91112,
                    `EffectIndex` = '0',
                    `MapID` = 546,
                    `PositionX` = 13.7,
                    `PositionY` = -19.3,
                    `PositionZ` = -2.7,
                    `Orientation` = 5.6,
                    `VerifiedBuild` = '0';
                    
                -- The Underbog - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901958);
                INSERT INTO `item_template`
                SET `entry` = 901958,
                    `name` = 'Orb of Teleport The Underbog',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91112,
                    `spellcharges_1` = '-1';
                    
                
-- Trial of the Champion - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91113);
                INSERT INTO `spell_target_position`
                SET `ID` = 91113,
                    `EffectIndex` = '0',
                    `MapID` = 650,
                    `PositionX` = 805.2,
                    `PositionY` = 618,
                    `PositionZ` = 412.4,
                    `Orientation` = 3.1,
                    `VerifiedBuild` = '0';
                    
                -- Trial of the Champion - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901959);
                INSERT INTO `item_template`
                SET `entry` = 901959,
                    `name` = 'Orb of Teleport Trial of the Champion',
                    `class` = 12,
                    `displayid` = '141022',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91113,
                    `spellcharges_1` = '-1';
                    
                
-- Utgarde Keep - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91114);
                INSERT INTO `spell_target_position`
                SET `ID` = 91114,
                    `EffectIndex` = '0',
                    `MapID` = 574,
                    `PositionX` = 160,
                    `PositionY` = -84.6,
                    `PositionZ` = 12.6,
                    `Orientation` = 0.3,
                    `VerifiedBuild` = '0';
                    
                -- Utgarde Keep - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901960);
                INSERT INTO `item_template`
                SET `entry` = 901960,
                    `name` = 'Orb of Teleport Utgarde Keep',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91114,
                    `spellcharges_1` = '-1';
                    
                
-- Utgarde Pinnacle - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91115);
                INSERT INTO `spell_target_position`
                SET `ID` = 91115,
                    `EffectIndex` = '0',
                    `MapID` = 575,
                    `PositionX` = 574.8,
                    `PositionY` = -327.8,
                    `PositionZ` = 110.1,
                    `Orientation` = 3.1,
                    `VerifiedBuild` = '0';
                    
                -- Utgarde Pinnacle - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901961);
                INSERT INTO `item_template`
                SET `entry` = 901961,
                    `name` = 'Orb of Teleport Utgarde Pinnacle',
                    `class` = 12,
                    `displayid` = '141025',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91115,
                    `spellcharges_1` = '-1';
                    
                
-- Violet Hold - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = 91116);
                INSERT INTO `spell_target_position`
                SET `ID` = 91116,
                    `EffectIndex` = '0',
                    `MapID` = 608,
                    `PositionX` = 1842.3,
                    `PositionY` = 804.1,
                    `PositionZ` = 44.2,
                    `Orientation` = 6.3,
                    `VerifiedBuild` = '0';
                    
                -- Violet Hold - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = 901962);
                INSERT INTO `item_template`
                SET `entry` = 901962,
                    `name` = 'Orb of Teleport Violet Hold',
                    `class` = 12,
                    `displayid` = '141023',
                    `Quality` = '1',
                    `bonding` = '4', 
                    `spellid_1` = 91116,
                    `spellcharges_1` = '-1';
                    
                
