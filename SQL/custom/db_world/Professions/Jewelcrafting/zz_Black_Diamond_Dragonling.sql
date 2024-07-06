-- Design: Black Diamond Dragonling
    DELETE FROM `item_template` WHERE (`entry` = 57502);
    INSERT INTO `item_template`
    SET `entry` = 57502,
        `class` = 9, -- Recipe
        `subclass` = 10, -- Jewelcrafting
        `name` = 'Design: Black Diamond Dragonling',
        `displayid` = 6270,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- Rare
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 755, -- Jewelcrafting
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91085,
        `spelltrigger_2` = 6;

-- Black Diamond Dragonling
    DELETE FROM `item_template` WHERE (`entry` = 57503);
    INSERT INTO `item_template`
    SET `entry` = 57503,
        `class` = 4, -- Armor
        `InventoryType` = 12, -- Trinket
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Black Diamond Dragonling',
        `displayid` = 136390,
        `Quality` = 3, -- Rare
        `Flags` = 524352, -- PLAYERCAST + UNIQUE EQUIPPED
        `ItemLevel` = 60,
        `RequiredLevel` = 50,
        `bonding` = 2, -- BOE
        `RequiredSkill` = 755, -- Jewelcrafting
        `RequiredSkillRank` = 300,
        `stat_type1` = 38, -- Attack Power
        `stat_value1` = 48,
        `spellid_1` = 91008,
        `spellcooldown_1` = 300000;

DELETE FROM `creature_template` WHERE (`entry` = 1979);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(1979, 0, 0, 0, 0, 0, 19295, 0, 0, 0, 'Black Diamond Dragonling', '', NULL, 0, 60, 60, 0, 35, 0, 1.11111, 0.857143, 1, 1, 18, 1, 0, 0, 3, 2000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 1, 1, 1, 1.1, 0.5, 0, 100, 1, 8405008, 0, 0, 'npc_arcanite_dragonling', 12340);

