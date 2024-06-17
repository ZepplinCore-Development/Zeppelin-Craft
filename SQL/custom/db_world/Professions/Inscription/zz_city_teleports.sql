-- Scroll of Teleport Ironforge
                DELETE FROM `item_template` WHERE (`entry` = 58500);
                INSERT INTO `item_template`
                SET `entry` = 58500,
                    `name` = 'Scroll of Teleport Ironforge',
                    `displayid` = 137642,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3562,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Ironforge
                DELETE FROM `item_template` WHERE (`entry` = 58550);
                INSERT INTO `item_template`
                SET `entry` = 58550,
                    `name` = 'Technique: Scroll of Teleport Ironforge', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 100, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91014, 
                    `spelltrigger_2` = 6;

                -- Barim Jurgenstaad - Scroll of Teleport Ironforge
                DELETE FROM `npc_vendor` WHERE (`item` = 58550);
                INSERT INTO `npc_vendor`
                SET `entry` = 5110,
                    `item` = 58550; 


                
-- Scroll of Teleport Darnassus
                DELETE FROM `item_template` WHERE (`entry` = 58501);
                INSERT INTO `item_template`
                SET `entry` = 58501,
                    `name` = 'Scroll of Teleport Darnassus',
                    `displayid` = 140307,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3565,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Darnassus
                DELETE FROM `item_template` WHERE (`entry` = 58551);
                INSERT INTO `item_template`
                SET `entry` = 58551,
                    `name` = 'Technique: Scroll of Teleport Darnassus', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 100, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91015, 
                    `spelltrigger_2` = 6;

                -- Alaindia - Scroll of Teleport Darnassus
                DELETE FROM `npc_vendor` WHERE (`item` = 58551);
                INSERT INTO `npc_vendor`
                SET `entry` = 3562,
                    `item` = 58551; 


                
-- Scroll of Teleport Undercity
                DELETE FROM `item_template` WHERE (`entry` = 58502);
                INSERT INTO `item_template`
                SET `entry` = 58502,
                    `name` = 'Scroll of Teleport Undercity',
                    `displayid` = 140306,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3563,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Undercity
                DELETE FROM `item_template` WHERE (`entry` = 58552);
                INSERT INTO `item_template`
                SET `entry` = 58552,
                    `name` = 'Technique: Scroll of Teleport Undercity', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 100, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91013, 
                    `spelltrigger_2` = 6;

                -- Hannah Akeley - Scroll of Teleport Undercity
                DELETE FROM `npc_vendor` WHERE (`item` = 58552);
                INSERT INTO `npc_vendor`
                SET `entry` = 4575,
                    `item` = 58552; 


                
-- Scroll of Teleport Thunder Bluff
                DELETE FROM `item_template` WHERE (`entry` = 58503);
                INSERT INTO `item_template`
                SET `entry` = 58503,
                    `name` = 'Scroll of Teleport Thunder Bluff',
                    `displayid` = 140303,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3566,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Thunder Bluff
                DELETE FROM `item_template` WHERE (`entry` = 58553);
                INSERT INTO `item_template`
                SET `entry` = 58553,
                    `name` = 'Technique: Scroll of Teleport Thunder Bluff', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 100, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91012, 
                    `spelltrigger_2` = 6;

                -- Chepi - Scroll of Teleport Thunder Bluff
                DELETE FROM `npc_vendor` WHERE (`item` = 58553);
                INSERT INTO `npc_vendor`
                SET `entry` = 8361,
                    `item` = 58553; 


                
-- Scroll of Teleport Stormwind
                DELETE FROM `item_template` WHERE (`entry` = 58504);
                INSERT INTO `item_template`
                SET `entry` = 58504,
                    `name` = 'Scroll of Teleport Stormwind',
                    `displayid` = 136822,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3561,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Stormwind
                DELETE FROM `item_template` WHERE (`entry` = 58554);
                INSERT INTO `item_template`
                SET `entry` = 58554,
                    `name` = 'Technique: Scroll of Teleport Stormwind', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 100, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91010, 
                    `spelltrigger_2` = 6;

                -- Charys Yserian - Scroll of Teleport Stormwind
                DELETE FROM `npc_vendor` WHERE (`item` = 58554);
                INSERT INTO `npc_vendor`
                SET `entry` = 1307,
                    `item` = 58554; 


                
-- Scroll of Teleport Orgrimmar
                DELETE FROM `item_template` WHERE (`entry` = 58505);
                INSERT INTO `item_template`
                SET `entry` = 58505,
                    `name` = 'Scroll of Teleport Orgrimmar',
                    `displayid` = 136820,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3567,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Orgrimmar
                DELETE FROM `item_template` WHERE (`entry` = 58555);
                INSERT INTO `item_template`
                SET `entry` = 58555,
                    `name` = 'Technique: Scroll of Teleport Orgrimmar', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 100, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91009, 
                    `spelltrigger_2` = 6;

                -- Horthus - Scroll of Teleport Orgrimmar
                DELETE FROM `npc_vendor` WHERE (`item` = 58555);
                INSERT INTO `npc_vendor`
                SET `entry` = 3323,
                    `item` = 58555; 


                
-- Scroll of Teleport Silvermoon City
                DELETE FROM `item_template` WHERE (`entry` = 58506);
                INSERT INTO `item_template`
                SET `entry` = 58506,
                    `name` = 'Scroll of Teleport Silvermoon City',
                    `displayid` = 140301,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 32272,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Silvermoon City
                DELETE FROM `item_template` WHERE (`entry` = 58556);
                INSERT INTO `item_template`
                SET `entry` = 58556,
                    `name` = 'Technique: Scroll of Teleport Silvermoon City', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 100, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91016, 
                    `spelltrigger_2` = 6;

                -- Zalle - Scroll of Teleport Silvermoon City
                DELETE FROM `npc_vendor` WHERE (`item` = 58556);
                INSERT INTO `npc_vendor`
                SET `entry` = 16611,
                    `item` = 58556; 


                
-- Scroll of Teleport Exodar
                DELETE FROM `item_template` WHERE (`entry` = 58507);
                INSERT INTO `item_template`
                SET `entry` = 58507,
                    `name` = 'Scroll of Teleport Exodar',
                    `displayid` = 138484,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 32271,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Exodar
                DELETE FROM `item_template` WHERE (`entry` = 58557);
                INSERT INTO `item_template`
                SET `entry` = 58557,
                    `name` = 'Technique: Scroll of Teleport Exodar', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 100, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91017, 
                    `spelltrigger_2` = 6;

                -- Bildine - Scroll of Teleport Exodar
                DELETE FROM `npc_vendor` WHERE (`item` = 58557);
                INSERT INTO `npc_vendor`
                SET `entry` = 16757,
                    `item` = 58557; 


                
-- Scroll of Teleport Shattrath
                DELETE FROM `item_template` WHERE (`entry` = 58508);
                INSERT INTO `item_template`
                SET `entry` = 58508,
                    `name` = 'Scroll of Teleport Shattrath',
                    `displayid` = 136822,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 300,
                    `spellid_1` = 33690,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Shattrath
                DELETE FROM `item_template` WHERE (`entry` = 58558);
                INSERT INTO `item_template`
                SET `entry` = 58558,
                    `name` = 'Technique: Scroll of Teleport Shattrath', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 300, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91080, 
                    `spelltrigger_2` = 6;

                -- Fantei - Scroll of Teleport Shattrath
                DELETE FROM `npc_vendor` WHERE (`item` = 58558);
                INSERT INTO `npc_vendor`
                SET `entry` = 19678,
                    `item` = 58558; 


                
-- Scroll of Teleport Dalaran
                DELETE FROM `item_template` WHERE (`entry` = 58509);
                INSERT INTO `item_template`
                SET `entry` = 58509,
                    `name` = 'Scroll of Teleport Dalaran',
                    `displayid` = 140606,
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 375,
                    `spellid_1` = 53140,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Dalaran
                DELETE FROM `item_template` WHERE (`entry` = 58559);
                INSERT INTO `item_template`
                SET `entry` = 58559,
                    `name` = 'Technique: Scroll of Teleport Dalaran', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = 375, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = 91011, 
                    `spelltrigger_2` = 6;

                -- Hagatha Moorehead - Scroll of Teleport Dalaran
                DELETE FROM `npc_vendor` WHERE (`item` = 58559);
                INSERT INTO `npc_vendor`
                SET `entry` = 29636,
                    `item` = 58559; 


                
