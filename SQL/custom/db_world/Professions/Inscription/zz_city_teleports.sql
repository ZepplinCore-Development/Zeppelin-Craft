-- Scroll of Teleport Ironforge
                DELETE FROM `item_template` WHERE (`entry` = 901500);
                INSERT INTO `item_template`
                SET `entry` = 901500,
                    `name` = 'Scroll of Teleport Ironforge',
                    `displayid` = 58830,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3562,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Ironforge
                DELETE FROM `item_template` WHERE (`entry` = 901600);
                INSERT INTO `item_template`
                SET `entry` = 901600,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901500);
                INSERT INTO `npc_vendor`
                SET `entry` = 5110,
                    `item` = '901600'; 


                
-- Scroll of Teleport Darnassus
                DELETE FROM `item_template` WHERE (`entry` = 901501);
                INSERT INTO `item_template`
                SET `entry` = 901501,
                    `name` = 'Scroll of Teleport Darnassus',
                    `displayid` = 58841,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3565,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Darnassus
                DELETE FROM `item_template` WHERE (`entry` = 901601);
                INSERT INTO `item_template`
                SET `entry` = 901601,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901501);
                INSERT INTO `npc_vendor`
                SET `entry` = 3562,
                    `item` = '901601'; 


                
-- Scroll of Teleport Undercity
                DELETE FROM `item_template` WHERE (`entry` = 901502);
                INSERT INTO `item_template`
                SET `entry` = 901502,
                    `name` = 'Scroll of Teleport Undercity',
                    `displayid` = 58836,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3563,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Undercity
                DELETE FROM `item_template` WHERE (`entry` = 901602);
                INSERT INTO `item_template`
                SET `entry` = 901602,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901502);
                INSERT INTO `npc_vendor`
                SET `entry` = 4575,
                    `item` = '901602'; 


                
-- Scroll of Teleport Thunder Bluff
                DELETE FROM `item_template` WHERE (`entry` = 901503);
                INSERT INTO `item_template`
                SET `entry` = 901503,
                    `name` = 'Scroll of Teleport Thunder Bluff',
                    `displayid` = 58828,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3566,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Thunder Bluff
                DELETE FROM `item_template` WHERE (`entry` = 901603);
                INSERT INTO `item_template`
                SET `entry` = 901603,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901503);
                INSERT INTO `npc_vendor`
                SET `entry` = 8361,
                    `item` = '901603'; 


                
-- Scroll of Teleport Stormwind
                DELETE FROM `item_template` WHERE (`entry` = 901504);
                INSERT INTO `item_template`
                SET `entry` = 901504,
                    `name` = 'Scroll of Teleport Stormwind',
                    `displayid` = 58839,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3561,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Stormwind
                DELETE FROM `item_template` WHERE (`entry` = 901604);
                INSERT INTO `item_template`
                SET `entry` = 901604,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901504);
                INSERT INTO `npc_vendor`
                SET `entry` = 1307,
                    `item` = '901604'; 


                
-- Scroll of Teleport Orgrimmar
                DELETE FROM `item_template` WHERE (`entry` = 901505);
                INSERT INTO `item_template`
                SET `entry` = 901505,
                    `name` = 'Scroll of Teleport Orgrimmar',
                    `displayid` = 58825,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 3567,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Orgrimmar
                DELETE FROM `item_template` WHERE (`entry` = 901605);
                INSERT INTO `item_template`
                SET `entry` = 901605,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901505);
                INSERT INTO `npc_vendor`
                SET `entry` = 3323,
                    `item` = '901605'; 


                
-- Scroll of Teleport Silvermoon City
                DELETE FROM `item_template` WHERE (`entry` = 901506);
                INSERT INTO `item_template`
                SET `entry` = 901506,
                    `name` = 'Scroll of Teleport Silvermoon City',
                    `displayid` = 58829,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 32272,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Silvermoon City
                DELETE FROM `item_template` WHERE (`entry` = 901606);
                INSERT INTO `item_template`
                SET `entry` = 901606,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901506);
                INSERT INTO `npc_vendor`
                SET `entry` = 16611,
                    `item` = '901606'; 


                
-- Scroll of Teleport Exodar
                DELETE FROM `item_template` WHERE (`entry` = 901507);
                INSERT INTO `item_template`
                SET `entry` = 901507,
                    `name` = 'Scroll of Teleport Exodar',
                    `displayid` = 58834,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 100,
                    `spellid_1` = 32271,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Exodar
                DELETE FROM `item_template` WHERE (`entry` = 901607);
                INSERT INTO `item_template`
                SET `entry` = 901607,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901507);
                INSERT INTO `npc_vendor`
                SET `entry` = 16757,
                    `item` = '901607'; 


                
-- Scroll of Teleport Shattrath
                DELETE FROM `item_template` WHERE (`entry` = 901508);
                INSERT INTO `item_template`
                SET `entry` = 901508,
                    `name` = 'Scroll of Teleport Shattrath',
                    `displayid` = 58835,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 300,
                    `spellid_1` = 33690,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Shattrath
                DELETE FROM `item_template` WHERE (`entry` = 901608);
                INSERT INTO `item_template`
                SET `entry` = 901608,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901508);
                INSERT INTO `npc_vendor`
                SET `entry` = 19678,
                    `item` = '901608'; 


                
-- Scroll of Teleport Dalaran
                DELETE FROM `item_template` WHERE (`entry` = 901509);
                INSERT INTO `item_template`
                SET `entry` = 901509,
                    `name` = 'Scroll of Teleport Dalaran',
                    `displayid` = 58833,
                    `Quality` = 2,
                    `bonding` = 1,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = 375,
                    `spellid_1` = 53140,
                    `spellcharges_1` = -1;

                -- Technique: Scroll of Teleport Dalaran
                DELETE FROM `item_template` WHERE (`entry` = 901609);
                INSERT INTO `item_template`
                SET `entry` = 901609,
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
                DELETE FROM `npc_vendor` WHERE (`entry` = 901509);
                INSERT INTO `npc_vendor`
                SET `entry` = 29636,
                    `item` = '901609'; 


                
