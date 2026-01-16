-- Prayer of Fortitude

    -- Codex: Prayer of Fortitude I
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17413);



        DELETE FROM `spell_dbc` WHERE (`ID` = 21562);




    -- Codex: Prayer of Fortitude II
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17414);



        DELETE FROM `spell_dbc` WHERE (`ID` = 21564);




    -- Codex: Prayer of Fortitude III
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 29549);



        DELETE FROM `spell_dbc` WHERE (`ID` = 25392);




    -- Codex: Prayer of Fortitude IV
        -- Create book item (Icon: INV_Misc_Book_09 - displayid 1143)
        DELETE FROM `item_template` WHERE (`entry` = 100001);



INSERT INTO `item_template` SET
    `entry` = 100001,
    `class` = 9,
    `name` = 'Codex: Prayer of Fortitude IV',
    `displayid` = 1143,
    `Quality` = 3,
    `BuyPrice` = 600000,
    `SellPrice` = 150000,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 48162,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you Prayer of Fortitude rank 4.',
    `RequiredLevel` = 80;







        -- Remove from priest trainer
        DELETE FROM `npc_trainer` WHERE (`ID` = 200012 AND `SpellID` = 48162);




        -- Add to Trial of the Champion bosses
        DELETE FROM `creature_loot_template` WHERE (`Item` = 100001);



INSERT INTO `creature_loot_template` SET
    `Entry` = 33546,
    `Item` = 100001,
    `Chance` = 10.0,
    `Comment` = 'The Black Knight (Normal) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 33759,
    `Item` = 100001,
    `Chance` = 10.0,
    `Comment` = 'Eadric the Pure (Normal) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 34102,
    `Item` = 100001,
    `Chance` = 10.0,
    `Comment` = 'Argent Confessor Paletress (Normal) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 34928,
    `Item` = 100001,
    `Chance` = 20.0,
    `Comment` = 'Argent Confessor Paletress (Heroic) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 35119,
    `Item` = 100001,
    `Chance` = 20.0,
    `Comment` = 'Eadric the Pure (Heroic) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 35451,
    `Item` = 100001,
    `Chance` = 20.0,
    `Comment` = 'The Black Knight (Heroic) - Codex: Prayer of Fortitude IV';







        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 48162);





-- Gift of the Wild

    -- Book: Gift of the Wild I
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17682);



        DELETE FROM `spell_dbc` WHERE (`ID` = 21849);




    -- Book: Gift of the Wild II
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 17683);



        DELETE FROM `spell_dbc` WHERE (`ID` = 21850);




    -- Book: Gift of the Wild III
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 22146);



        DELETE FROM `spell_dbc` WHERE (`ID` = 26991);




-- Arcane Brilliance

    -- Book: Arcane Brilliance I
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 18600);



        DELETE FROM `spell_dbc` WHERE (`ID` = 23028);




    -- Book: Arcane Brilliance II
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 22153);



        DELETE FROM `spell_dbc` WHERE (`ID` = 27127);




    -- Book: Arcane Brilliance III
        UPDATE `item_template` SET `AllowableClass` = -1 WHERE (`entry` = 33316);



        DELETE FROM `spell_dbc` WHERE (`ID` = 43002);



-- Greater Blessing of Kings

    -- Tome: Greater Blessing of Kings
        -- Create book item (Icon: AO_BookMasters2 - displayid 135042)
        DELETE FROM `item_template` WHERE (`entry` = 100002);



INSERT INTO `item_template` SET
    `entry` = 100002,
    `class` = 9,
    `name` = 'Tome: Greater Blessing of Kings',
    `displayid` = 23314,
    `Quality` = 3,
    `BuyPrice` = 400000,
    `SellPrice` = 100000,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 25898,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you Greater Blessing of Kings.',
    `RequiredLevel` = 60;









        -- Remove from paladin trainer
        DELETE FROM `npc_trainer` WHERE (`ID` = 200004 AND `SpellID` = 25898);





        -- Add to BWL/MC/Kazzak bosses (royalty theme)
        DELETE FROM `creature_loot_template` WHERE (`Item` = 100002);




INSERT INTO `creature_loot_template` SET
    `Entry` = 11583,
    `Item` = 100002,
    `Chance` = 15.0,
    `Comment` = 'Nefarian (BWL) - Tome: Greater Blessing of Kings';







INSERT INTO `creature_loot_template` SET
    `Entry` = 12017,
    `Item` = 100002,
    `Chance` = 12.0,
    `Comment` = 'Broodlord Lashlayer (BWL) - Tome: Greater Blessing of Kings';







INSERT INTO `creature_loot_template` SET
    `Entry` = 12056,
    `Item` = 100002,
    `Chance` = 12.0,
    `Comment` = 'Baron Geddon (MC) - Tome: Greater Blessing of Kings';







INSERT INTO `creature_loot_template` SET
    `Entry` = 12397,
    `Item` = 100002,
    `Chance` = 20.0,
    `Comment` = 'Lord Kazzak - Tome: Greater Blessing of Kings';









        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 25898);





-- Prayer of Spirit

    -- Codex: Prayer of Spirit I
        -- Create book item (Icon: AO_Page03 - displayid 139289)
        DELETE FROM `item_template` WHERE (`entry` = 100003);



INSERT INTO `item_template` SET
    `entry` = 100003,
    `class` = 9,
    `name` = 'Codex: Prayer of Spirit',
    `displayid` = 23314,
    `Quality` = 3,
    `BuyPrice` = 310000,
    `SellPrice` = 77500,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 27681,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you Prayer of Spirit.',
    `RequiredLevel` = 60;







        -- Remove from priest trainer
        DELETE FROM `npc_trainer` WHERE (`ID` = 200012 AND `SpellID` = 27681);




        -- Add to Stratholme bosses (undead/death theme)
        DELETE FROM `creature_loot_template` WHERE (`Item` = 100003);



INSERT INTO `creature_loot_template` SET
    `Entry` = 10440,
    `Item` = 100003,
    `Chance` = 15.0,
    `Comment` = 'Baron Rivendare - Codex: Prayer of Spirit';





INSERT INTO `creature_loot_template` SET
    `Entry` = 10436,
    `Item` = 100003,
    `Chance` = 12.0,
    `Comment` = 'Baroness Anastari - Codex: Prayer of Spirit';





INSERT INTO `creature_loot_template` SET
    `Entry` = 10438,
    `Item` = 100003,
    `Chance` = 10.0,
    `Comment` = 'Maleki the Pallid - Codex: Prayer of Spirit';







        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 27681);





    -- Codex: Prayer of Spirit II
        -- Create book item (Icon: AO_Page03 - displayid 139289)
        DELETE FROM `item_template` WHERE (`entry` = 100004);



INSERT INTO `item_template` SET
    `entry` = 100004,
    `class` = 9,
    `name` = 'Codex: Prayer of Spirit II',
    `displayid` = 23314,
    `Quality` = 3,
    `BuyPrice` = 500000,
    `SellPrice` = 125000,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 32999,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you Prayer of Spirit rank 2.',
    `RequiredLevel` = 70;







        -- Remove from priest trainer
        DELETE FROM `npc_trainer` WHERE (`ID` = 200012 AND `SpellID` = 32999);




        -- Add to Auchenai/Shadow Labyrinth bosses (spirit/death priest theme)
        DELETE FROM `creature_loot_template` WHERE (`Item` = 100004);



INSERT INTO `creature_loot_template` SET
    `Entry` = 18373,
    `Item` = 100004,
    `Chance` = 15.0,
    `Comment` = 'Exarch Maladaar - Codex: Prayer of Spirit II';





INSERT INTO `creature_loot_template` SET
    `Entry` = 18732,
    `Item` = 100004,
    `Chance` = 12.0,
    `Comment` = 'Grandmaster Vorpil - Codex: Prayer of Spirit II';





INSERT INTO `creature_loot_template` SET
    `Entry` = 18708,
    `Item` = 100004,
    `Chance` = 10.0,
    `Comment` = 'Murmur - Codex: Prayer of Spirit II';







        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 32999);





    -- Codex: Prayer of Spirit III
        -- Create book item (Icon: AO_Page03 - displayid 139289)
        DELETE FROM `item_template` WHERE (`entry` = 100005);



INSERT INTO `item_template` SET
    `entry` = 100005,
    `class` = 9,
    `name` = 'Codex: Prayer of Spirit III',
    `displayid` = 23314,
    `Quality` = 3,
    `BuyPrice` = 900000,
    `SellPrice` = 225000,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 48074,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you Prayer of Spirit rank 3.',
    `RequiredLevel` = 80;







        -- Remove from priest trainer
        DELETE FROM `npc_trainer` WHERE (`ID` = 200012 AND `SpellID` = 48074);




        -- Add to Ahn'kahet bosses (void/shadow cult theme)
        DELETE FROM `creature_loot_template` WHERE (`Item` = 100005);



INSERT INTO `creature_loot_template` SET
    `Entry` = 29311,
    `Item` = 100005,
    `Chance` = 15.0,
    `Comment` = 'Herald Volazj - Codex: Prayer of Spirit III';





INSERT INTO `creature_loot_template` SET
    `Entry` = 29310,
    `Item` = 100005,
    `Chance` = 12.0,
    `Comment` = 'Jedoga Shadowseeker - Codex: Prayer of Spirit III';







        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 48074);



