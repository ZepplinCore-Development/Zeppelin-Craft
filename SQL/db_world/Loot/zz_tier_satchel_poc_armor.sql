-- =============================================================================
-- F-025 Tier Satchel POC - ARMOR TYPE VERSION
-- Groups by armor type like Satchel of Helpful Goods (4 refs instead of 9)
--
-- This tests if the issue is with single-class masks vs armor-type masks
-- =============================================================================

-- Cleanup
DELETE FROM reference_loot_template WHERE Entry BETWEEN 900101 AND 900109;
DELETE FROM item_loot_template WHERE Entry = 900100;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 900101 AND 900109;

-- =============================================================================
-- ARMOR TYPE MASKS (matching SOHG exactly)
-- =============================================================================
-- Cloth (Priest+Mage+Lock): 16 + 128 + 256 = 400
-- Leather (Rogue+Druid): 8 + 1024 = 1032
-- Mail (Hunter+Shaman): 4 + 64 = 68
-- Plate (War+Pala): 1 + 2 = 3  (no DK for T1)

-- =============================================================================
-- REFERENCE TABLES - 4 armor types
-- =============================================================================
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
-- CLOTH (ref 900101) - Priest, Mage, Warlock helms
(900101, 16813, 0, 0, 0, 1, 1, 1, 1, 'Circlet of Prophecy - Priest'),
(900101, 16795, 0, 0, 0, 1, 1, 1, 1, 'Arcanist Crown - Mage'),
(900101, 16808, 0, 0, 0, 1, 1, 1, 1, 'Felheart Horns - Warlock'),
-- LEATHER (ref 900102) - Rogue, Druid helms
(900102, 16821, 0, 0, 0, 1, 1, 1, 1, 'Nightslayer Cover - Rogue'),
(900102, 16834, 0, 0, 0, 1, 1, 1, 1, 'Cenarion Helm - Druid'),
-- MAIL (ref 900103) - Hunter, Shaman helms
(900103, 16846, 0, 0, 0, 1, 1, 1, 1, 'Giantstalker Helmet - Hunter'),
(900103, 16842, 0, 0, 0, 1, 1, 1, 1, 'Earthfury Helmet - Shaman'),
-- PLATE (ref 900104) - Warrior, Paladin helms
(900104, 16866, 0, 0, 0, 1, 1, 1, 1, 'Helm of Might - Warrior'),
(900104, 16854, 0, 0, 0, 1, 1, 1, 1, 'Lawbringer Helm - Paladin');

-- =============================================================================
-- ITEM LOOT TABLE - 4 references
-- =============================================================================
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(900100, 1, 900101, 100, 0, 1, 1, 1, 1, 'Ref: Cloth'),
(900100, 2, 900102, 100, 0, 1, 2, 1, 1, 'Ref: Leather'),
(900100, 3, 900103, 100, 0, 1, 3, 1, 1, 'Ref: Mail'),
(900100, 4, 900104, 100, 0, 1, 4, 1, 1, 'Ref: Plate');

-- =============================================================================
-- CONDITIONS - Armor type masks (exactly like SOHG)
-- =============================================================================
-- ALL items in each reference get the SAME armor-type mask
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
-- CLOTH ref (900101) - mask 400
(10, 900101, 16813, 0, 0, 15, 0, 400, 0, 0, 0, 0, 0, '', 'Cloth: Circlet of Prophecy'),
(10, 900101, 16795, 0, 0, 15, 0, 400, 0, 0, 0, 0, 0, '', 'Cloth: Arcanist Crown'),
(10, 900101, 16808, 0, 0, 15, 0, 400, 0, 0, 0, 0, 0, '', 'Cloth: Felheart Horns'),
-- LEATHER ref (900102) - mask 1032
(10, 900102, 16821, 0, 0, 15, 0, 1032, 0, 0, 0, 0, 0, '', 'Leather: Nightslayer Cover'),
(10, 900102, 16834, 0, 0, 15, 0, 1032, 0, 0, 0, 0, 0, '', 'Leather: Cenarion Helm'),
-- MAIL ref (900103) - mask 68
(10, 900103, 16846, 0, 0, 15, 0, 68, 0, 0, 0, 0, 0, '', 'Mail: Giantstalker Helmet'),
(10, 900103, 16842, 0, 0, 15, 0, 68, 0, 0, 0, 0, 0, '', 'Mail: Earthfury Helmet'),
-- PLATE ref (900104) - mask 3
(10, 900104, 16866, 0, 0, 15, 0, 3, 0, 0, 0, 0, 0, '', 'Plate: Helm of Might'),
(10, 900104, 16854, 0, 0, 15, 0, 3, 0, 0, 0, 0, 0, '', 'Plate: Lawbringer Helm');

SELECT 'Applied armor-type version - matches SOHG structure exactly';
SELECT 'Cloth classes get random cloth helm, Plate classes get random plate helm, etc';
