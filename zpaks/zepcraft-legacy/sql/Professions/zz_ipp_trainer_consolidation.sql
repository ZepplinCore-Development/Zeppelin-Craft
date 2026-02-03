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
