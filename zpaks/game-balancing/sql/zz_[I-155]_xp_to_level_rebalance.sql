-- I-155: XP-to-level rebalance (QuestXPFix removal compensation)
--
-- The IPP QuestXPFix reduced quest XP to pre-2.3 vanilla values, causing
-- the quest journal to show ~1.5x more XP than players actually received
-- (levels 35-60). Disabling QuestXPFix restores accurate journal display.
--
-- To maintain similar leveling difficulty, XP-to-level is bumped by the
-- average quest XP boost ratio at each level. Side effect: raw kill XP
-- becomes slightly less efficient (~30% at peak, levels 47-58).
--
-- Step 1: Reset to stock WotLK values
-- Step 2: Apply per-level multipliers
--
-- To tune: just change the multiplier in the UPDATE lines below.

-- Reset levels 1-69 to stock values
DELETE FROM player_xp_for_level WHERE Level BETWEEN 1 AND 69;
INSERT INTO player_xp_for_level (Level, Experience) VALUES
(1, 400),    (2, 900),    (3, 1400),   (4, 2100),   (5, 2800),
(6, 3600),   (7, 4500),   (8, 5400),   (9, 6500),   (10, 7600),
(11, 8800),  (12, 10100), (13, 11400), (14, 12900), (15, 14400),
(16, 16000), (17, 17700), (18, 19400), (19, 21300), (20, 23200),
(21, 25200), (22, 27300), (23, 29400), (24, 31700), (25, 34000),
(26, 36400), (27, 38900), (28, 41400), (29, 44300), (30, 47400),
(31, 50800), (32, 54500), (33, 58600), (34, 62800), (35, 67100),
(36, 71600), (37, 76100), (38, 80800), (39, 85700), (40, 90700),
(41, 95800), (42, 101000),(43, 106300),(44, 111800),(45, 117500),
(46, 123200),(47, 129100),(48, 135100),(49, 141200),(50, 147500),
(51, 153900),(52, 160400),(53, 167100),(54, 173900),(55, 180800),
(56, 187900),(57, 195000),(58, 202300),(59, 209800),(60, 494000),
(61, 574700),(62, 614400),(63, 650300),(64, 682300),(65, 710200),
(66, 734100),(67, 753700),(68, 768900),(69, 779700);

-- Apply multipliers per level
-- Levels 1-6: 1.00 (no change, vanilla = WotLK)
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.02) WHERE Level BETWEEN 7 AND 10;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.01) WHERE Level BETWEEN 11 AND 21;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.02) WHERE Level BETWEEN 22 AND 29;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.03) WHERE Level = 30;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.04) WHERE Level = 31;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.06) WHERE Level = 32;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.08) WHERE Level = 33;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.11) WHERE Level = 34;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.14) WHERE Level = 35;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.17) WHERE Level = 36;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.21) WHERE Level = 37;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.24) WHERE Level = 38;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.27) WHERE Level = 39;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.30) WHERE Level = 40;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.33) WHERE Level = 41;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.36) WHERE Level = 42;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.39) WHERE Level = 43;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.42) WHERE Level = 44;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.44) WHERE Level = 45;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.45) WHERE Level = 46;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.46) WHERE Level = 47;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.46) WHERE Level = 48;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.47) WHERE Level = 49;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.47) WHERE Level = 50;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.47) WHERE Level = 51;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.47) WHERE Level = 52;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.47) WHERE Level = 53;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.48) WHERE Level = 54;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.49) WHERE Level = 55;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.50) WHERE Level = 56;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.51) WHERE Level = 57;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.50) WHERE Level = 58;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.48) WHERE Level = 59;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.44) WHERE Level = 60;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.40) WHERE Level = 61;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.37) WHERE Level = 62;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.35) WHERE Level = 63;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.34) WHERE Level = 64;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.32) WHERE Level = 65;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.31) WHERE Level = 66;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.30) WHERE Level = 67;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.30) WHERE Level = 68;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * 1.29) WHERE Level = 69;
-- Levels 70-79: unchanged (QuestXPFix barely touched WotLK quests)
