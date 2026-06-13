-- =============================================================================
-- F-001: Fishing Rods - Reclassification to Profession Tool Standard
-- =============================================================================
-- Converts all 13 player-obtainable fishing rods to match the profession tool
-- item template: class=5 (Reagent), subclass=1 (Tool), Quality=6 (Artifact),
-- bonding=1 (BoP), spelltrigger=5 (passive in inventory).
--
-- Tier system with spell group 2029 ensures only the highest fishing skill
-- bonus applies when multiple rods are in bags:
--   Basic (no bonus): Fishing Pole, Basic Fishing Pole
--   Tier 1 (+3):  Blump Family Fishing Pole
--   Tier 2 (+5):  Strong Fishing Pole
--   Tier 3 (+15): Darkwood Fishing Pole
--   Tier 4 (+20): Big Iron, Nat Pagle's FC-5000, Seth's Graphite
--   Tier 5 (+25): Nat's Lucky Fishing Pole
--   Tier 6 (+30): Mastercraft Kalu'ak, Bone, Jeweled
--   Tier 7 (+40): Arcanite Fishing Pole
-- =============================================================================

-- All rods: Reagent/Tool, Artifact quality, BoP, non-equippable, passive trigger
UPDATE `item_template` SET
    `class` = 5,            -- Reagent
    `subclass` = 1,         -- Tool
    `Quality` = 6,          -- Artifact
    `InventoryType` = 0,    -- Non-equippable
    `TotemCategory` = 221,  -- Fishing tool
    `bonding` = 1,          -- Binds on pickup
    `spelltrigger_1` = 5,   -- ON_NO_DELAY_USE (passive in inventory)
    `dmg_min1` = 0,
    `dmg_max1` = 0,
    `dmg_type1` = 0,
    `delay` = 0,
    `sheath` = 0,
    `armor` = 0,
    -- Strip equippable stats: rods are bag tools now, stats can't apply (F-157)
    -- e.g. Seth's Graphite Fishing Pole (25978) had +52 Stamina
    `stat_type1` = 0, `stat_value1` = 0,
    `stat_type2` = 0, `stat_value2` = 0,
    `stat_type3` = 0, `stat_value3` = 0,
    `stat_type4` = 0, `stat_value4` = 0,
    `stat_type5` = 0, `stat_value5` = 0,
    `stat_type6` = 0, `stat_value6` = 0,
    `stat_type7` = 0, `stat_value7` = 0,
    `stat_type8` = 0, `stat_value8` = 0,
    `stat_type9` = 0, `stat_value9` = 0,
    `stat_type10` = 0, `stat_value10` = 0,
    `ScalingStatDistribution` = 0,
    `ScalingStatValue` = 0
WHERE `entry` IN (
    6256,   -- Fishing Pole (basic, no spell)
    6365,   -- Strong Fishing Pole (+5)
    6366,   -- Darkwood Fishing Pole (+15)
    6367,   -- Big Iron Fishing Pole (+20)
    12225,  -- Blump Family Fishing Pole (+3)
    19022,  -- Nat Pagle's Extreme Angler FC-5000 (+20)
    19970,  -- Arcanite Fishing Pole (+40)
    25978,  -- Seth's Graphite Fishing Pole (+20)
    44050,  -- Mastercraft Kalu'ak Fishing Pole (+30 + Underwater Breathing)
    45120,  -- Basic Fishing Pole (basic, no spell)
    45858,  -- Nat's Lucky Fishing Pole (+25)
    45991,  -- Bone Fishing Pole (+30)
    45992   -- Jeweled Fishing Pole (+30)
);

-- Kalu'ak Fishing Pole: also fix second spell trigger (Underwater Breathing)
UPDATE `item_template` SET `spelltrigger_2` = 5 WHERE `entry` = 44050;

-- =============================================================================
-- SPELL GROUP 2029 - Fishing Rod exclusivity (EXCLUSIVE + rank-aware)
-- =============================================================================
-- Only the highest-tier fishing skill bonus applies when multiple rods are
-- in bags. Basic rods (6256, 45120) have no spell and are not in the group.
-- =============================================================================

DELETE FROM `spell_group` WHERE `id` = 2029;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 2029;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 15956;

-- Only first rank needed; AC auto-includes higher ranks via spell_ranks
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
(2029, 15956);  -- Blump Family (+3, first rank)

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(2029, 1, 'Fishing Rods - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(15956, 15956, 1),  -- Tier 1: +3 fishing
(15956, 7823, 2),   -- Tier 2: +5 fishing
(15956, 7825, 3),   -- Tier 3: +15 fishing
(15956, 7826, 4),   -- Tier 4: +20 fishing
(15956, 8082, 5),   -- Tier 5: +25 fishing
(15956, 59731, 6),  -- Tier 6: +30 fishing
(15956, 24301, 7);  -- Tier 7: +40 fishing
