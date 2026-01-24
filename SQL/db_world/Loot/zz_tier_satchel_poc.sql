-- =============================================================================
-- F-025 Tier Satchel Proof of Concept
-- Tests class-conditional container loot with T1 Helms
--
-- KEY REQUIREMENT: GroupIds in reference_loot must MATCH the parent GroupId
-- in item_loot_template. This is what makes class-specific drops work.
--
-- STATUS: ✅ WORKING (tested 2026-01-24)
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
    0, 0,            -- Buy/Sell Price
    0,               -- InventoryType (0 = non-equippable)
    66, 60,          -- ItemLevel, RequiredLevel
    1,               -- bonding (1 = BoP)
    0, 1, 1,         -- Material, MaxCount, stackable
    0,               -- ContainerSlots
    0, 0, 0, 0, 0    -- no combat stats
);

-- -----------------------------------------------------------------------------
-- 2. CLEANUP ALL OLD STRUCTURES
-- -----------------------------------------------------------------------------
DELETE FROM reference_loot_template WHERE Entry BETWEEN 900100 AND 900109;
DELETE FROM item_loot_template WHERE Entry = 900100;
DELETE FROM conditions WHERE SourceTypeOrReferenceId IN (4, 5, 10) AND SourceGroup BETWEEN 900100 AND 900109;

-- -----------------------------------------------------------------------------
-- 3. REFERENCE TABLES - One per class, GroupId MATCHES parent!
-- -----------------------------------------------------------------------------
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(900101, 16866, 0, 0, 0, 1, 1, 1, 1, 'Helm of Might - Warrior'),
(900102, 16854, 0, 0, 0, 1, 2, 1, 1, 'Lawbringer Helm - Paladin'),
(900103, 16846, 0, 0, 0, 1, 3, 1, 1, 'Giantstalker Helmet - Hunter'),
(900104, 16821, 0, 0, 0, 1, 4, 1, 1, 'Nightslayer Cover - Rogue'),
(900105, 16813, 0, 0, 0, 1, 5, 1, 1, 'Circlet of Prophecy - Priest'),
(900106, 16842, 0, 0, 0, 1, 6, 1, 1, 'Earthfury Helmet - Shaman'),
(900107, 16795, 0, 0, 0, 1, 7, 1, 1, 'Arcanist Crown - Mage'),
(900108, 16808, 0, 0, 0, 1, 8, 1, 1, 'Felheart Horns - Warlock'),
(900109, 16834, 0, 0, 0, 1, 9, 1, 1, 'Cenarion Helm - Druid');

-- -----------------------------------------------------------------------------
-- 4. ITEM LOOT TABLE - References with matching GroupIds
-- -----------------------------------------------------------------------------
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(900100, 1, 900101, 100, 0, 1, 1, 1, 1, 'Ref: Warrior'),
(900100, 2, 900102, 100, 0, 1, 2, 1, 1, 'Ref: Paladin'),
(900100, 3, 900103, 100, 0, 1, 3, 1, 1, 'Ref: Hunter'),
(900100, 4, 900104, 100, 0, 1, 4, 1, 1, 'Ref: Rogue'),
(900100, 5, 900105, 100, 0, 1, 5, 1, 1, 'Ref: Priest'),
(900100, 6, 900106, 100, 0, 1, 6, 1, 1, 'Ref: Shaman'),
(900100, 7, 900107, 100, 0, 1, 7, 1, 1, 'Ref: Mage'),
(900100, 8, 900108, 100, 0, 1, 8, 1, 1, 'Ref: Warlock'),
(900100, 9, 900109, 100, 0, 1, 9, 1, 1, 'Ref: Druid');

-- -----------------------------------------------------------------------------
-- 5. CONDITIONS - Single-class masks (SourceType=10, ConditionType=15)
-- -----------------------------------------------------------------------------
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 900101, 16866, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'Warrior: Helm of Might'),
(10, 900102, 16854, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'Paladin: Lawbringer Helm'),
(10, 900103, 16846, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'Hunter: Giantstalker Helmet'),
(10, 900104, 16821, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'Rogue: Nightslayer Cover'),
(10, 900105, 16813, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'Priest: Circlet of Prophecy'),
(10, 900106, 16842, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'Shaman: Earthfury Helmet'),
(10, 900107, 16795, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'Mage: Arcanist Crown'),
(10, 900108, 16808, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'Warlock: Felheart Horns'),
(10, 900109, 16834, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'Druid: Cenarion Helm');

-- -----------------------------------------------------------------------------
-- 6. CLEANUP TEST CREATURE (if exists from earlier testing)
-- -----------------------------------------------------------------------------
DELETE FROM creature_template WHERE entry = 900100;
DELETE FROM creature_template_model WHERE CreatureID = 900100;
DELETE FROM creature_loot_template WHERE Entry = 900100;
