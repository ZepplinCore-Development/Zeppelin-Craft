-- ============================================================================
-- IPP Trainer Consolidation: Expert → Artisan
-- ============================================================================
-- Consolidates 3-tier vanilla profession trainers into 2 tiers.
-- Expert trainers now use Artisan spell lists (0-300 skill cap).
--
-- Result:
--   Journeyman (0-75)   - Starting area trainers
--   Artisan (0-300)     - Any Expert OR Artisan NPC
--   Master (0-350)      - TBC trainers
--   Grand Master (0-440) - WotLK trainers
-- ============================================================================

-- Alchemy: Expert (612) → Artisan (613)
UPDATE `creature_default_trainer` SET `TrainerId` = 613 WHERE `TrainerId` = 612;

-- Blacksmithing: Expert (617) → Artisan (618)
UPDATE `creature_default_trainer` SET `TrainerId` = 618 WHERE `TrainerId` = 617;

-- Enchanting: Expert (622) → Artisan (623)
UPDATE `creature_default_trainer` SET `TrainerId` = 623 WHERE `TrainerId` = 622;

-- Engineering: Expert (627) → Artisan (628)
UPDATE `creature_default_trainer` SET `TrainerId` = 628 WHERE `TrainerId` = 627;

-- Leatherworking: Expert (632) → Artisan (633)
UPDATE `creature_default_trainer` SET `TrainerId` = 633 WHERE `TrainerId` = 632;

-- Tailoring: Expert (637) → Artisan (638)
UPDATE `creature_default_trainer` SET `TrainerId` = 638 WHERE `TrainerId` = 637;

-- ============================================================================
-- Missing Artisan rank-up spells & trainer-only recipes
-- ============================================================================
-- IPP Artisan trainers were missing the Artisan rank-up spells (225→300 cap)
-- and several trainer-only recipes that exist on stock trainers but not IPP.
-- Values sourced from stock Artisan trainers (58-96 range).
-- ============================================================================

-- --------------------------------------------------------------------------
-- Alchemy (TrainerId 613)
-- --------------------------------------------------------------------------
-- Artisan rank-up
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(613, 11612, 50000, 171, 200, 3464, 0, 0, 35);
-- Missing trainer-only recipes
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(613, 11460,  5000, 171, 230, 0, 0, 0, 0), -- Elixir of Detect Undead
(613, 15833, 10000, 171, 230, 0, 0, 0, 0), -- Dreamless Sleep Potion
(613, 11461, 10000, 171, 235, 0, 0, 0, 0), -- Arcane Elixir
(613, 11465, 12000, 171, 235, 0, 0, 0, 0), -- Elixir of Greater Intellect
(613, 11467, 12000, 171, 240, 0, 0, 0, 0), -- Elixir of Greater Agility
(613, 11478, 14000, 171, 250, 0, 0, 0, 0), -- Elixir of Detect Demon
(613, 17551, 15000, 171, 250, 0, 0, 0, 0); -- Stonescale Oil

-- --------------------------------------------------------------------------
-- Blacksmithing (TrainerId 618)
-- --------------------------------------------------------------------------
-- Artisan rank-up
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(618, 9786, 50000, 164, 200, 3538, 0, 0, 35);
-- Missing trainer-only recipes
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(618, 34979,   600, 164, 100, 0, 0, 0, 0), -- Thick Bronze Darts
(618, 34981,  7500, 164, 200, 0, 0, 0, 0), -- Whirling Steel Axes
(618,  9959, 15000, 164, 230, 0, 0, 0, 0), -- Heavy Mithril Breastplate
(618,  9961, 15000, 164, 230, 0, 0, 0, 0), -- Mithril Coif
(618, 10001, 15000, 164, 230, 0, 0, 0, 0), -- Big Black Mace
(618,  9968, 20000, 164, 235, 0, 0, 0, 0), -- Heavy Mithril Boots
(618, 16639, 10000, 164, 250, 0, 0, 0, 0), -- Dense Grinding Stone
(618, 16640, 10000, 164, 250, 0, 0, 0, 0), -- Dense Weightstone
(618, 16641, 10000, 164, 250, 0, 0, 0, 0), -- Dense Sharpening Stone
(618, 19669, 10000, 164, 275, 0, 0, 0, 0), -- Arcanite Skeleton Key
(618, 20201, 10000, 164, 275, 0, 0, 0, 0), -- Arcanite Rod
(618, 34982, 10000, 164, 300, 0, 0, 0, 0); -- Enchanted Thorium Blades

-- --------------------------------------------------------------------------
-- Enchanting (TrainerId 623)
-- --------------------------------------------------------------------------
-- Artisan rank-up
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(623, 13921, 50000, 333, 200, 7413, 0, 0, 35);
-- Missing trainer-only recipes
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(623,  7428,   100, 333,  20, 0, 0, 0, 0), -- Enchant Bracer - Minor Deflection
(623, 63746,  5000, 333, 225, 0, 0, 0, 0), -- Enchant Boots - Lesser Accuracy
(623, 13905,  5400, 333, 230, 0, 0, 0, 0), -- Enchant Shield - Greater Spirit
(623, 13917,  5400, 333, 230, 0, 0, 0, 0), -- Enchant Chest - Superior Mana
(623, 13935,  5800, 333, 235, 0, 0, 0, 0), -- Enchant Boots - Agility
(623, 13937,  6200, 333, 240, 0, 0, 0, 0), -- Enchant 2H Weapon - Greater Impact
(623, 13939,  6200, 333, 240, 0, 0, 0, 0), -- Enchant Bracer - Greater Strength
(623, 13941,  6200, 333, 245, 0, 0, 0, 0), -- Enchant Chest - Stats
(623, 13943,  6200, 333, 245, 0, 0, 0, 0), -- Enchant Weapon - Greater Striking
(623, 13948,  6500, 333, 250, 0, 0, 0, 0), -- Enchant Gloves - Minor Haste
(623, 17180, 10000, 333, 250, 0, 0, 0, 0), -- Enchanted Thorium
(623, 17181, 10000, 333, 250, 0, 0, 0, 0); -- Enchanted Leather

-- --------------------------------------------------------------------------
-- Engineering (TrainerId 628)
-- --------------------------------------------------------------------------
-- Artisan rank-up
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(628, 12657, 50000, 202, 200, 4038, 0, 0, 35);
-- Missing trainer-only recipes
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(628, 91219, 5000, 202, 225, 0, 0, 0, 0), -- Artisan Tinkering Tools
(628, 12618, 2200, 202, 230, 0, 0, 0, 0), -- Rose Colored Goggles
(628, 12619, 2400, 202, 235, 0, 0, 0, 0), -- Hi-Explosive Bomb
(628, 12621, 2800, 202, 245, 0, 0, 0, 0), -- Mithril Gyro-Shot
(628, 12622, 2800, 202, 245, 0, 0, 0, 0), -- Green Lens
(628, 19567, 4000, 202, 250, 0, 0, 0, 0), -- Salt Shaker
(628, 19788, 4000, 202, 250, 0, 0, 0, 0), -- Dense Blasting Powder
(628, 23070, 5000, 202, 250, 0, 0, 0, 0), -- Dense Dynamite
(628, 63750, 5000, 202, 250, 0, 0, 0, 0); -- High-powered Flashlight

-- --------------------------------------------------------------------------
-- Leatherworking (TrainerId 633)
-- --------------------------------------------------------------------------
-- Artisan rank-up only (no missing Artisan-range recipes)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(633, 10663, 50000, 165, 200, 3811, 0, 0, 35);

-- --------------------------------------------------------------------------
-- Tailoring (TrainerId 638)
-- --------------------------------------------------------------------------
-- Artisan rank-up
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(638, 12181, 50000, 197, 200, 3910, 0, 0, 35);
-- Missing trainer-only recipes
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(638, 63742,   750, 197, 125, 0, 0, 0, 0), -- Spidersilk Drape
(638, 12072,  6000, 197, 230, 0, 0, 0, 0), -- Black Mageweave Headband
(638, 12073,  6000, 197, 230, 0, 0, 0, 0), -- Black Mageweave Boots
(638, 12074,  6000, 197, 230, 0, 0, 0, 0), -- Black Mageweave Shoulders
(638, 12077,  5000, 197, 235, 0, 0, 0, 0), -- Simple Black Dress
(638, 12079,  6500, 197, 235, 0, 0, 0, 0), -- Red Mageweave Bag
(638, 12088,  7500, 197, 245, 0, 0, 0, 0), -- Cindercloth Boots
(638, 12092,  7500, 197, 250, 0, 0, 0, 0), -- Dreamweave Circlet
(638, 18401, 10000, 197, 250, 0, 0, 0, 0), -- Bolt of Runecloth
(638, 18402, 10000, 197, 255, 0, 0, 0, 0); -- Runecloth Belt
