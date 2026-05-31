-- Prayer of Fortitude
-- Compliance migration (I-186, May 2026): renumbered 100001-100005 → 58335-58339 (Inscription reservation row 57400-57499).
-- Re-renumber (May 2026, post-F-001 collision): 58335-58339 → 58335-58339 (Miscellaneous row 58300-58399).
--   F-001 Writing Tables claim 58335-58338 (Inscription is for craftable items, codexes are not). Player items
--   currently at 58335-58338 will naturally become Writing Tables once F-001 wins — intentionally no
--   defunct_item_replacement mapping for those IDs. 58339 is mapped (orphan Codex V from ToC drops).
-- Idempotent cleanup of stale rows — NO-OP after first apply.
DELETE FROM `item_template` WHERE `entry` BETWEEN 100001 AND 100005;
DELETE FROM `creature_loot_template` WHERE `Item` BETWEEN 100001 AND 100005;

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
        DELETE FROM `item_template` WHERE (`entry` = 58335);



INSERT INTO `item_template` SET
    `entry` = 58335,
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
        DELETE FROM `trainer_spell` WHERE (`TrainerId` = 11 AND `SpellId` = 48162);




        -- Add to Trial of the Champion bosses
        DELETE FROM `creature_loot_template` WHERE (`Item` = 58335);



INSERT INTO `creature_loot_template` SET
    `Entry` = 33546,
    `Item` = 58335,
    `Chance` = 10.0,
    `Comment` = 'The Black Knight (Normal) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 33759,
    `Item` = 58335,
    `Chance` = 10.0,
    `Comment` = 'Eadric the Pure (Normal) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 34102,
    `Item` = 58335,
    `Chance` = 10.0,
    `Comment` = 'Argent Confessor Paletress (Normal) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 34928,
    `Item` = 58335,
    `Chance` = 20.0,
    `Comment` = 'Argent Confessor Paletress (Heroic) - Codex: Prayer of Fortitude IV';





INSERT INTO `creature_loot_template` SET
    `Entry` = 35119,
    `Item` = 58335,
    `Chance` = 20.0,
    `Comment` = 'Eadric the Pure (Heroic) - Codex: Prayer of Fortitude IV';

-- Set lootid on ToC bosses so creature_loot_template is actually used
-- (These bosses normally use chest-based loot only)
UPDATE `creature_template` SET `lootid` = 18478 WHERE `entry` = 18478 AND `lootid` = 0;
UPDATE `creature_template` SET `lootid` = 33546 WHERE `entry` = 33546 AND `lootid` = 0;
UPDATE `creature_template` SET `lootid` = 33759 WHERE `entry` = 33759 AND `lootid` = 0;
UPDATE `creature_template` SET `lootid` = 34102 WHERE `entry` = 34102 AND `lootid` = 0;
UPDATE `creature_template` SET `lootid` = 34928 WHERE `entry` = 34928 AND `lootid` = 0;
UPDATE `creature_template` SET `lootid` = 35119 WHERE `entry` = 35119 AND `lootid` = 0;





INSERT INTO `creature_loot_template` SET
    `Entry` = 35451,
    `Item` = 58335,
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
        DELETE FROM `item_template` WHERE (`entry` = 58336);



INSERT INTO `item_template` SET
    `entry` = 58336,
    `class` = 9,
    `name` = 'Tome: Greater Blessing of Kings',
    `displayid` = 135042,  -- Icon: AO_BookMasters2
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
        DELETE FROM `trainer_spell` WHERE (`TrainerId` = 3 AND `SpellId` = 25898);





        -- Add to BWL/MC/Kazzak bosses (royalty theme)
        DELETE FROM `creature_loot_template` WHERE (`Item` = 58336);




INSERT INTO `creature_loot_template` SET
    `Entry` = 11583,
    `Item` = 58336,
    `Chance` = 15.0,
    `Comment` = 'Nefarian (BWL) - Tome: Greater Blessing of Kings';







INSERT INTO `creature_loot_template` SET
    `Entry` = 12017,
    `Item` = 58336,
    `Chance` = 12.0,
    `Comment` = 'Broodlord Lashlayer (BWL) - Tome: Greater Blessing of Kings';







INSERT INTO `creature_loot_template` SET
    `Entry` = 12056,
    `Item` = 58336,
    `Chance` = 12.0,
    `Comment` = 'Baron Geddon (MC) - Tome: Greater Blessing of Kings';







INSERT INTO `creature_loot_template` SET
    `Entry` = 12397,
    `Item` = 58336,
    `Chance` = 20.0,
    `Comment` = 'Lord Kazzak - Tome: Greater Blessing of Kings';









        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 25898);





-- Prayer of Spirit

    -- Codex: Prayer of Spirit I
        -- Create book item (Icon: AO_Page03 - displayid 139289)
        DELETE FROM `item_template` WHERE (`entry` = 58337);



INSERT INTO `item_template` SET
    `entry` = 58337,
    `class` = 9,
    `name` = 'Codex: Prayer of Spirit',
    `displayid` = 139289,  -- Icon: AO_Page03
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
        DELETE FROM `trainer_spell` WHERE (`TrainerId` = 11 AND `SpellId` = 27681);




        -- Add to Stratholme bosses (undead/death theme)
        DELETE FROM `creature_loot_template` WHERE (`Item` = 58337);



INSERT INTO `creature_loot_template` SET
    `Entry` = 10440,
    `Item` = 58337,
    `Chance` = 15.0,
    `Comment` = 'Baron Rivendare - Codex: Prayer of Spirit';





INSERT INTO `creature_loot_template` SET
    `Entry` = 10436,
    `Item` = 58337,
    `Chance` = 12.0,
    `Comment` = 'Baroness Anastari - Codex: Prayer of Spirit';





INSERT INTO `creature_loot_template` SET
    `Entry` = 10438,
    `Item` = 58337,
    `Chance` = 10.0,
    `Comment` = 'Maleki the Pallid - Codex: Prayer of Spirit';







        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 27681);





    -- Codex: Prayer of Spirit II
        -- Create book item (Icon: AO_Page03 - displayid 139289)
        DELETE FROM `item_template` WHERE (`entry` = 58338);



INSERT INTO `item_template` SET
    `entry` = 58338,
    `class` = 9,
    `name` = 'Codex: Prayer of Spirit II',
    `displayid` = 139289,  -- Icon: AO_Page03
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
        DELETE FROM `trainer_spell` WHERE (`TrainerId` = 11 AND `SpellId` = 32999);




        -- Add to Auchenai/Shadow Labyrinth bosses (spirit/death priest theme)
        DELETE FROM `creature_loot_template` WHERE (`Item` = 58338);



INSERT INTO `creature_loot_template` SET
    `Entry` = 18373,
    `Item` = 58338,
    `Chance` = 15.0,
    `Comment` = 'Exarch Maladaar - Codex: Prayer of Spirit II';





INSERT INTO `creature_loot_template` SET
    `Entry` = 18732,
    `Item` = 58338,
    `Chance` = 12.0,
    `Comment` = 'Grandmaster Vorpil - Codex: Prayer of Spirit II';





INSERT INTO `creature_loot_template` SET
    `Entry` = 18708,
    `Item` = 58338,
    `Chance` = 10.0,
    `Comment` = 'Murmur - Codex: Prayer of Spirit II';

INSERT INTO `creature_loot_template` SET
    `Entry` = 20306,
    `Item` = 58338,
    `Chance` = 25.0,
    `Comment` = 'Exarch Maladaar (Heroic) - Codex: Prayer of Spirit II';

INSERT INTO `creature_loot_template` SET
    `Entry` = 20653,
    `Item` = 58338,
    `Chance` = 25.0,
    `Comment` = 'Grandmaster Vorpil (Heroic) - Codex: Prayer of Spirit II';

INSERT INTO `creature_loot_template` SET
    `Entry` = 20657,
    `Item` = 58338,
    `Chance` = 25.0,
    `Comment` = 'Murmur (Heroic) - Codex: Prayer of Spirit II';







        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 32999);





    -- Codex: Prayer of Spirit III
        -- Create book item (Icon: AO_Page03 - displayid 139289)
        DELETE FROM `item_template` WHERE (`entry` = 58339);



INSERT INTO `item_template` SET
    `entry` = 58339,
    `class` = 9,
    `name` = 'Codex: Prayer of Spirit III',
    `displayid` = 139289,  -- Icon: AO_Page03
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
        DELETE FROM `trainer_spell` WHERE (`TrainerId` = 11 AND `SpellId` = 48074);




        -- Add to Ahn'kahet bosses (void/shadow cult theme)
        DELETE FROM `creature_loot_template` WHERE (`Item` = 58339);



INSERT INTO `creature_loot_template` SET
    `Entry` = 29311,
    `Item` = 58339,
    `Chance` = 15.0,
    `Comment` = 'Herald Volazj - Codex: Prayer of Spirit III';





INSERT INTO `creature_loot_template` SET
    `Entry` = 29310,
    `Item` = 58339,
    `Chance` = 12.0,
    `Comment` = 'Jedoga Shadowseeker - Codex: Prayer of Spirit III';

INSERT INTO `creature_loot_template` SET
    `Entry` = 31464,
    `Item` = 58339,
    `Chance` = 25.0,
    `Comment` = 'Herald Volazj (Heroic) - Codex: Prayer of Spirit III';

INSERT INTO `creature_loot_template` SET
    `Entry` = 31465,
    `Item` = 58339,
    `Chance` = 25.0,
    `Comment` = 'Jedoga Shadowseeker (Heroic) - Codex: Prayer of Spirit III';







        -- DBC modification (done externally in DBC database)
        DELETE FROM `spell_dbc` WHERE (`ID` = 48074);



-- =============================================================================
-- CLASS BUFF MASTERY PASSIVES
-- Original classes get free casting (no Azerite Shard cost) via Aura 256
-- Spells are defined in DBC database, this adds them to character creation
-- =============================================================================

-- Priest Buff Mastery (104000) - Free Prayer of Fortitude & Prayer of Spirit
-- Druid Buff Mastery (104001) - Free Gift of the Wild
-- Mage Buff Mastery (104002) - Free Arcane Brilliance
-- Paladin Buff Mastery (104003) - Free Greater Blessing of Kings
DELETE FROM `playercreateinfo_spell_custom` WHERE (`Spell` IN (104000, 104001, 104002, 104003));
INSERT INTO `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`) VALUES
(0, 16, 104000, 'F-004 Priest Buff Mastery - No reagent for Fortitude/Spirit'),
(0, 1024, 104001, 'F-004 Druid Buff Mastery - No reagent for Gift of the Wild'),
(0, 128, 104002, 'F-004 Mage Buff Mastery - No reagent for Arcane Brilliance'),
(0, 2, 104003, 'F-004 Paladin Buff Mastery - No reagent for Greater Blessing of Kings');


