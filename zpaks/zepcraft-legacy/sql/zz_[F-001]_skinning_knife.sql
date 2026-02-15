-- =====================================================
-- F-001: SKINNING KNIVES
-- Extra yield (loot conditions) + skinning time reduction (aura 108)
-- SpellFamily 14, mask 8 (Skinning)
-- =====================================================

-- Basic Skinning Knife (starter item, no quest required, no bonus)
    UPDATE `item_template`
    SET `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `name` = 'Basic Skinning Knife',
        `description` = 'Allows you to skin beasts.',
        `displayid` = 136156, -- AO_DaggerLynxClaw
        `Quality` = 6, -- Artifact
        `BagFamily` = 8, -- Leatherworking
        `TotemCategory` = 166, -- Skinning tool
        `bonding` = 1, -- BOP
        `InventoryType` = 0,
        `dmg_min1` = 0,
        `dmg_max1` = 0,
        `delay` = 0
    WHERE (`entry` = 7005);

-- Journeyman Skinning Knife ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57802);
    INSERT INTO `item_template`
    SET `entry` = 57802,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Journeyman Skinning Knife',
        `description` = 'Allows you to skin beasts.',
        `displayid` = 136157, -- AO_DaggerNewbie
        `Quality` = 6, -- Artifact
        `BagFamily` = 8, -- Leatherworking
        `TotemCategory` = 166, -- Skinning tool
        `spellid_1` = 91240,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Artisan Skinning Knife ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57803);
    INSERT INTO `item_template`
    SET `entry` = 57803,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 90, -- 90C
        `ItemLevel` = 60,
        `name` = 'Artisan Skinning Knife',
        `description` = 'Allows you to skin beasts.',
        `displayid` = 136154, -- AO_DaggerCrude
        `Quality` = 6, -- Artifact
        `BagFamily` = 8, -- Leatherworking
        `TotemCategory` = 166, -- Skinning tool
        `spellid_1` = 91241,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Master Skinning Knife ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57804);
    INSERT INTO `item_template`
    SET `entry` = 57804,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 900, -- 9S
        `ItemLevel` = 70,
        `name` = 'Master Skinning Knife',
        `description` = 'Allows you to skin beasts.',
        `displayid` = 136160, -- AO_DaggerVendor
        `Quality` = 6, -- Artifact
        `BagFamily` = 8, -- Leatherworking
        `TotemCategory` = 166, -- Skinning tool
        `spellid_1` = 91242,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Grand Master Skinning Knife ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57805);
    INSERT INTO `item_template`
    SET `entry` = 57805,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 9000, -- 90S
        `ItemLevel` = 80,
        `name` = 'Grand Master Skinning Knife',
        `description` = 'Allows you to skin beasts.',
        `displayid` = 136158, -- AO_DaggerPirateKing
        `Quality` = 6, -- Artifact
        `BagFamily` = 8, -- Leatherworking
        `TotemCategory` = 166, -- Skinning tool
        `spellid_1` = 91243,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Spell group + ranks: Skinning Knives (EXCLUSIVE + rank-aware patch)
DELETE FROM `spell_group` WHERE `id` = 1128;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1128;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91240;

INSERT INTO `spell_group` SET `id` = 1128, `spell_id` = 91243; -- Grand Master
INSERT INTO `spell_group` SET `id` = 1128, `spell_id` = 91242; -- Master
INSERT INTO `spell_group` SET `id` = 1128, `spell_id` = 91241; -- Artisan
INSERT INTO `spell_group` SET `id` = 1128, `spell_id` = 91240; -- Journeyman

INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,`description`) VALUES
    (1128, 1, 'Skinning Knives - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91240, 91240, 1),
(91240, 91241, 2),
(91240, 91242, 3),
(91240, 91243, 4);

-- Remove spell_dbc overrides for skinning ability spells
-- spell_dbc had SpellClassSet=3 (Mage) which overrode our DBC SpellClassSet=14 (Professions)
-- Without this, the cast time reduction aura cannot match skinning spells
-- Mining and Herbalism have no spell_dbc entries, so skinning should match that pattern
DELETE FROM `spell_dbc` WHERE `ID` IN (8613, 8617, 8618, 10768, 32678, 50305);

-- NPC Questgiver flag updates (add QUESTGIVER flag where missing)
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = 1292 AND (`npcflag` & 2) = 0;  -- Maris Granger (Stormwind)
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = 6291 AND (`npcflag` & 2) = 0;  -- Balthus Stoneflayer (Ironforge)
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = 16692 AND (`npcflag` & 2) = 0; -- Tyn (Silvermoon)
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = 18755 AND (`npcflag` & 2) = 0; -- Moorutu (Thrallmar)
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = 18777 AND (`npcflag` & 2) = 0; -- Jelena Nightsky (Honor Hold)
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = 19180 AND (`npcflag` & 2) = 0; -- Seymour (Shattrath)
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = 28696 AND (`npcflag` & 2) = 0; -- Derik Marks (Dalaran)
