-- =============================================================================
-- IPP Loot GroupId Fix
-- =============================================================================
-- tbc_loot_fixes.sql puts multiple 100% chance reference items in GroupId=1
-- when comments indicate they should be in separate groups. This causes
-- "total chance > 100%" errors and incorrect loot behavior.
-- =============================================================================

-- Black Temple bosses (2 items each, Group 1 + Group 2)
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 22948 AND `Item` = 36130 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 22947 AND `Item` = 36134 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 22898 AND `Item` = 36124 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 22887 AND `Item` = 36122 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 22871 AND `Item` = 36128 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 22841 AND `Item` = 36126 AND `GroupId` = 1;

-- Hyjal bosses (2-3 items each)
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 17767 AND `Item` = 36102 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 17808 AND `Item` = 36104 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 17842 AND `Item` = 36108 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 17888 AND `Item` = 36106 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 17968 AND `Item` = 36110 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 3 WHERE `Entry` = 17968 AND `Item` = 36111 AND `GroupId` = 1;

-- Tempest Keep bosses
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 19516 AND `Item` = 36004 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 18805 AND `Item` = 36006 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 3 WHERE `Entry` = 18805 AND `Item` = 36007 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 19622 AND `Item` = 36009 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 3 WHERE `Entry` = 19622 AND `Item` = 36010 AND `GroupId` = 1;

-- Lord Kazzak - main reference should be independent (GroupId 0)
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 12397 AND `Item` = 1 AND `Reference` = 60000 AND `GroupId` = 1;

-- Serpentshrine Cavern bosses
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 21214 AND `Item` = 36023 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 21215 AND `Item` = 36021 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 21216 AND `Item` = 36012 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 3 WHERE `Entry` = 21216 AND `Item` = 36013 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 21217 AND `Item` = 36015 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 3 WHERE `Entry` = 21217 AND `Item` = 36016 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 21213 AND `Item` = 36018 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 3 WHERE `Entry` = 21213 AND `Item` = 36019 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 2 WHERE `Entry` = 21212 AND `Item` = 36025 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 3 WHERE `Entry` = 21212 AND `Item` = 36026 AND `GroupId` = 1;

-- =============================================================================
-- Independent drops (cloth, patterns) incorrectly grouped with 100% references
-- These should be GroupId 0 (independent) not GroupId 1 (competing)
-- =============================================================================

-- Hyjal: Archimonde - gem patterns and formula refs are independent drops
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 17968 AND `Item` = 34063 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 17968 AND `Item` = 50501 AND `GroupId` = 1;

-- Tempest Keep: High Astromancer Solarian - cloth and formula refs
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 18805 AND `Item` = 21877 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 18805 AND `Item` = 50501 AND `GroupId` = 1;

-- Tempest Keep: Kael'thas Sunstrider - cloth and formula refs
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 19622 AND `Item` = 21877 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 19622 AND `Item` = 50501 AND `GroupId` = 1;

-- Serpentshrine Cavern: Fathom-Lord Karathress - cloth and formula refs
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 21214 AND `Item` = 21877 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 21214 AND `Item` = 50501 AND `GroupId` = 1;

-- Serpentshrine Cavern: Leotheras the Blind - cloth and formula refs
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 21215 AND `Item` = 21877 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 21215 AND `Item` = 50501 AND `GroupId` = 1;

-- Serpentshrine Cavern: Morogrim Tidewalker - cloth and formula refs
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 21213 AND `Item` = 21877 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 21213 AND `Item` = 50501 AND `GroupId` = 1;

-- Serpentshrine Cavern: Lady Vashj - cloth and formula refs
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 21212 AND `Item` = 21877 AND `GroupId` = 1;
UPDATE `creature_loot_template` SET `GroupId` = 0 WHERE `Entry` = 21212 AND `Item` = 50501 AND `GroupId` = 1;
