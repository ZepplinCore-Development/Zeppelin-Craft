-- =============================================================================
-- Smithing Hammers - Custom Blacksmithing Tools
-- =============================================================================
-- Tiered trainer support for IPP progression:
--   616 = Journeyman (0-75)
--   617 = Expert (0-150)
--   618 = Artisan (0-300)
--   58  = Master (0-350, TBC)
--   59  = Grand Master (0-440, WotLK)
-- =============================================================================

-- Basic Smithing Hammer (existing item modification)
UPDATE `item_template`
SET `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `name` = 'Basic Smithing Hammer',
    `description` = 'Required for blacksmithing.',
    `InventoryType` = 0,
    `Quality` = 6, -- Artifact
    `dmg_min1` = 0,
    `dmg_max1` = 0,
    `delay` = 0
WHERE (`entry` = 5956);

-- =============================================================================
-- BRONZE SMITHING HAMMER (Skill 75)
-- Available from: Journeyman, Expert, Artisan, Master, Grand Master
-- =============================================================================
DELETE FROM `item_template` WHERE (`entry` = 57003);
INSERT INTO `item_template`
SET `entry` = 57003,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `SellPrice` = 30,
    `ItemLevel` = 20,
    `name` = 'Bronze Smithing Hammer',
    `description` = 'Required for blacksmithing.',
    `displayid` = 142061, -- RoM_durability_hammer_07
    `Quality` = 6, -- Artifact
    `BagFamily` = 1152, -- Mining + Engineering
    `TotemCategory` = 192,
    `spellid_1` = 91120,
    `spelltrigger_1` = 5,
    `bonding` = 1;

DELETE FROM `trainer_spell` WHERE `SpellId` = 91121;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(616, 91121, 500, 164, 75, 0, 0, 0, 0),
(617, 91121, 500, 164, 75, 0, 0, 0, 0),
(618, 91121, 500, 164, 75, 0, 0, 0, 0),
(58,  91121, 500, 164, 75, 0, 0, 0, 0),
(59,  91121, 500, 164, 75, 0, 0, 0, 0);

-- =============================================================================
-- IRON SMITHING HAMMER (Skill 150)
-- Available from: Expert, Artisan, Master, Grand Master
-- =============================================================================
DELETE FROM `item_template` WHERE (`entry` = 57004);
INSERT INTO `item_template`
SET `entry` = 57004,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `SellPrice` = 30,
    `ItemLevel` = 20,
    `name` = 'Iron Smithing Hammer',
    `description` = 'Required for blacksmithing.',
    `displayid` = 137284, -- AO_Hammer02
    `Quality` = 6, -- Artifact
    `BagFamily` = 1152, -- Mining + Engineering
    `TotemCategory` = 193,
    `spellid_1` = 91122,
    `spelltrigger_1` = 5,
    `bonding` = 1;

DELETE FROM `trainer_spell` WHERE `SpellId` = 91123;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(617, 91123, 500, 164, 150, 0, 0, 0, 0),
(618, 91123, 500, 164, 150, 0, 0, 0, 0),
(58,  91123, 500, 164, 150, 0, 0, 0, 0),
(59,  91123, 500, 164, 150, 0, 0, 0, 0);

-- =============================================================================
-- MITHRIL SMITHING HAMMER (Skill 225)
-- Available from: Artisan, Master, Grand Master
-- =============================================================================
DELETE FROM `item_template` WHERE (`entry` = 57005);
INSERT INTO `item_template`
SET `entry` = 57005,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `SellPrice` = 30,
    `ItemLevel` = 20,
    `name` = 'Mithril Smithing Hammer',
    `description` = 'Required for blacksmithing.',
    `displayid` = 148461, -- RoM_quest_hammer05
    `Quality` = 6, -- Artifact
    `BagFamily` = 1152, -- Mining + Engineering
    `TotemCategory` = 193,
    `spellid_1` = 91124,
    `spelltrigger_1` = 5,
    `bonding` = 1;

DELETE FROM `trainer_spell` WHERE `SpellId` = 91125;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(618, 91125, 500, 164, 225, 0, 0, 0, 0),
(58,  91125, 500, 164, 225, 0, 0, 0, 0),
(59,  91125, 500, 164, 225, 0, 0, 0, 0);

-- =============================================================================
-- THORIUM SMITHING HAMMER (Skill 300)
-- Available from: Artisan, Master, Grand Master
-- =============================================================================
DELETE FROM `item_template` WHERE (`entry` = 57006);
INSERT INTO `item_template`
SET `entry` = 57006,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `SellPrice` = 30,
    `ItemLevel` = 20,
    `name` = 'Thorium Smithing Hammer',
    `description` = 'Required for blacksmithing.',
    `displayid` = 137288, -- AO_HammerT1
    `Quality` = 6, -- Artifact
    `BagFamily` = 1152, -- Mining + Engineering
    `TotemCategory` = 193,
    `spellid_1` = 91126,
    `spelltrigger_1` = 5,
    `bonding` = 1;

DELETE FROM `trainer_spell` WHERE `SpellId` = 91127;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(618, 91127, 500, 164, 300, 0, 0, 0, 0),
(58,  91127, 500, 164, 300, 0, 0, 0, 0),
(59,  91127, 500, 164, 300, 0, 0, 0, 0);

-- =============================================================================
-- FELSTEEL SMITHING HAMMER (Skill 375)
-- Available from: Master, Grand Master (TBC+)
-- =============================================================================
DELETE FROM `item_template` WHERE (`entry` = 57007);
INSERT INTO `item_template`
SET `entry` = 57007,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `SellPrice` = 30,
    `ItemLevel` = 20,
    `name` = 'Felsteel Smithing Hammer',
    `description` = 'Required for blacksmithing.',
    `displayid` = 142058, -- RoM_durability_hammer_04
    `Quality` = 6, -- Artifact
    `BagFamily` = 1152, -- Mining + Engineering
    `TotemCategory` = 193,
    `spellid_1` = 91128,
    `spelltrigger_1` = 5,
    `bonding` = 1;

DELETE FROM `trainer_spell` WHERE `SpellId` = 91129;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(58, 91129, 500, 164, 375, 0, 0, 0, 0),
(59, 91129, 500, 164, 375, 0, 0, 0, 0);

-- =============================================================================
-- TITANIUM SMITHING HAMMER (Skill 450)
-- Available from: Grand Master only (WotLK)
-- =============================================================================
DELETE FROM `item_template` WHERE (`entry` = 57008);
INSERT INTO `item_template`
SET `entry` = 57008,
    `class` = 5, -- Reagent
    `subclass` = 1, -- Tool
    `SellPrice` = 30,
    `ItemLevel` = 20,
    `name` = 'Titanium Smithing Hammer',
    `description` = 'Required for blacksmithing.',
    `displayid` = 137287, -- AO_Hammer05
    `Quality` = 6, -- Artifact
    `BagFamily` = 1152, -- Mining + Engineering
    `TotemCategory` = 193,
    `spellid_1` = 91130,
    `spelltrigger_1` = 5,
    `bonding` = 1;

DELETE FROM `trainer_spell` WHERE `SpellId` = 91131;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(59, 91131, 500, 164, 450, 0, 0, 0, 0);

-- =============================================================================
-- SPELL GROUP - Hammer exclusivity (EXCLUSIVE + rank-aware patch)
-- =============================================================================
DELETE FROM `spell_group` WHERE `id` = 1114;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1114;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91120;

-- Only first rank needed; AC auto-includes higher ranks via spell_ranks
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
(1114, 91120); -- Bronze (first rank)

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(1114, 1, 'Smithing Hammers - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91120, 91120, 1),
(91120, 91122, 2),
(91120, 91124, 3),
(91120, 91126, 4),
(91120, 91128, 5),
(91120, 91130, 6);
