-- =============================================================================
-- F-025 Tier Satchel Proof of Concept
-- Tests class-conditional container loot with T1 Helms
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. SATCHEL ITEM (Entry 900100)
-- -----------------------------------------------------------------------------
DELETE FROM item_template WHERE entry = 900100;
INSERT INTO item_template (
    entry, class, subclass, name, displayid, Quality, Flags, BuyPrice, SellPrice,
    InventoryType, ItemLevel, RequiredLevel, bonding, Material, MaxCount,
    stackable, ContainerSlots, dmg_min1, dmg_max1, armor, delay, MaxDurability
) VALUES (
    900100,          -- entry
    15,              -- class (15 = Miscellaneous - enables right-click open)
    0,               -- subclass
    'Satchel of Molten Core - Helm (TEST)',
    1585,            -- displayid (bag icon)
    4,               -- Quality (4 = Epic)
    4,               -- Flags (4 = BoP)
    0,               -- BuyPrice
    0,               -- SellPrice
    0,               -- InventoryType (0 = non-equippable)
    66,              -- ItemLevel
    60,              -- RequiredLevel
    1,               -- bonding (1 = BoP)
    0,               -- Material
    1,               -- MaxCount
    1,               -- stackable
    0,               -- ContainerSlots (0 = not a bag, just openable)
    0, 0, 0, 0, 0    -- no combat stats
);

-- -----------------------------------------------------------------------------
-- 2. REFERENCE LOOT TABLE (Entry 900100) - All T1 Helms
-- -----------------------------------------------------------------------------
-- Chance=0 with GroupId=1 means exactly one item is selected from the group
-- The conditions table will filter to only the opener's class
DELETE FROM reference_loot_template WHERE Entry = 900100;
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, MinCount, MaxCount) VALUES
(900100, 16866, 0, 1, 1, 1),  -- Helm of Might (Warrior)
(900100, 16854, 0, 1, 1, 1),  -- Lawbringer Helm (Paladin)
(900100, 16846, 0, 1, 1, 1),  -- Giantstalker's Helmet (Hunter)
(900100, 16821, 0, 1, 1, 1),  -- Nightslayer Cover (Rogue)
(900100, 16813, 0, 1, 1, 1),  -- Circlet of Prophecy (Priest)
(900100, 16842, 0, 1, 1, 1),  -- Earthfury Helmet (Shaman)
(900100, 16795, 0, 1, 1, 1),  -- Arcanist Crown (Mage)
(900100, 16808, 0, 1, 1, 1),  -- Felheart Horns (Warlock)
(900100, 16834, 0, 1, 1, 1);  -- Cenarion Helm (Druid)

-- -----------------------------------------------------------------------------
-- 3. ITEM LOOT TABLE - Link satchel to reference
-- -----------------------------------------------------------------------------
DELETE FROM item_loot_template WHERE Entry = 900100;
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, GroupId, MinCount, MaxCount) VALUES
(900100, 900100, 900100, 100, 1, 1, 1);
-- Item=Reference entry (placeholder), Reference points to ref table, 100% chance

-- -----------------------------------------------------------------------------
-- 4. CLASS CONDITIONS - Filter each helm to its class
-- -----------------------------------------------------------------------------
-- SourceTypeOrReferenceId = 10 (reference_loot_template condition)
-- SourceGroup = Reference Entry (900100)
-- SourceEntry = Item ID being conditioned
-- ConditionTypeOrReference = 15 (CLASS condition)
-- ConditionValue1 = Class mask
--
-- Class Masks: Warrior=1, Paladin=2, Hunter=4, Rogue=8, Priest=16,
--              Shaman=64, Mage=128, Warlock=256, Druid=1024
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup = 900100;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 900100, 16866, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Helm of Might (Warrior)'),
(10, 900100, 16854, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Lawbringer Helm (Paladin)'),
(10, 900100, 16846, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Giantstalker Helmet (Hunter)'),
(10, 900100, 16821, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Nightslayer Cover (Rogue)'),
(10, 900100, 16813, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Circlet of Prophecy (Priest)'),
(10, 900100, 16842, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Earthfury Helmet (Shaman)'),
(10, 900100, 16795, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Arcanist Crown (Mage)'),
(10, 900100, 16808, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Felheart Horns (Warlock)'),
(10, 900100, 16834, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T1 Helm Satchel - Cenarion Helm (Druid)');

-- -----------------------------------------------------------------------------
-- 5. TEST CREATURE (Entry 900100) - Level 1 for easy testing
-- -----------------------------------------------------------------------------
DELETE FROM creature_template WHERE entry = 900100;
DELETE FROM creature_template_model WHERE CreatureID = 900100;

INSERT INTO creature_template (
    entry, name, subname, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run,
    unit_class, unit_flags, type, type_flags, HealthModifier, ManaModifier, ArmorModifier,
    ExperienceModifier, RacialLeader, RegenHealth, mechanic_immune_mask, AIName
) VALUES (
    900100,
    'Satchel Test Dummy',
    'F-025 POC',
    1,                -- minlevel
    1,                -- maxlevel
    35,               -- faction (Friendly to all for easy interaction)
    0,                -- npcflag (none - just killable)
    1,                -- speed_walk
    1.14286,          -- speed_run
    1,                -- unit_class (Warrior)
    0,                -- unit_flags
    10,               -- type (Humanoid)
    0,                -- type_flags
    0.01,             -- HealthModifier (very low HP for instant kill)
    1,                -- ManaModifier
    1,                -- ArmorModifier
    0,                -- ExperienceModifier (no XP)
    0,                -- RacialLeader
    1,                -- RegenHealth
    0,                -- mechanic_immune_mask
    ''                -- AIName
);

-- Model entry required for creature to render in-game
INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild) VALUES
(900100, 0, 7937, 1, 1, 12340);  -- Training Dummy model

-- -----------------------------------------------------------------------------
-- 6. CREATURE LOOT TABLE - 100% satchel drop
-- -----------------------------------------------------------------------------
DELETE FROM creature_loot_template WHERE Entry = 900100;
INSERT INTO creature_loot_template (Entry, Item, Chance, GroupId, MinCount, MaxCount) VALUES
(900100, 900100, 100, 0, 1, 1);  -- 100% chance to drop satchel

-- Link creature to loot table
UPDATE creature_template SET lootid = 900100 WHERE entry = 900100;
