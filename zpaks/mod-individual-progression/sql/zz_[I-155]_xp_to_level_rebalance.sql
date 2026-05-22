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
-- ----------------------------------------------------------------
-- Three baselines exist for player_xp_for_level:
--   1. AC stock  — shipped by AzerothCore's base DB dump; lower
--                  requirements (e.g. L60 = 290,000).
--   2. IPP       — `vanilla_xp_tables.sql` REPLACEs AC stock with the
--                  higher original-expac curve (L60 = 494,000). This
--                  is what runs on our server by default because IPP
--                  is installed.
--   3. This file — re-asserts the IPP baseline and, when @enable = 1,
--                  applies per-level multipliers on top to compensate
--                  for the removed QuestXPFix nerf.
--
-- With @enable = 0 this file inserts the IPP baseline verbatim, so it
-- is a no-op against whatever IPP already put in the DB. Flipping to
-- @enable = 1 layers the compensation multipliers on top.
--
-- Playtesting note: when tested with @enable = 1, Hellfire Peninsula
-- ran dry on quests before players out-levelled the zone (a fresh 58
-- finished every HFP quest before hitting 61). The multipliers
-- over-compensated for zones already tuned around IPP's baseline, so
-- the toggle ships at 0. See Joplin note I-155 for full context.
--
-- Toggle: set @enable = 1 to apply multipliers, 0 for IPP baseline.
-- To tune: change the multiplier values in the UPDATE lines below.

-- ============================================================
-- Toggle switch: 1 = compensate for QuestXPFix removal, 0 = IPP baseline
-- ============================================================
SET @enable = 0;

-- Reset levels 1-69 to the IPP baseline (original-expac curve)
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

-- Apply multipliers per level (halved — quest XP is only part of total XP income)
-- Formula: Experience * (1 + @enable * adjustment)
--   @enable = 1 → multiplier applied
--   @enable = 0 → multiplier = 1.0 (IPP baseline preserved)
-- Levels 1-29: 1.00 (no meaningful difference, vanilla ≈ WotLK)
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.02)) WHERE Level = 30;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.02)) WHERE Level = 31;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.03)) WHERE Level = 32;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.04)) WHERE Level = 33;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.06)) WHERE Level = 34;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.07)) WHERE Level = 35;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.09)) WHERE Level = 36;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.11)) WHERE Level = 37;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.12)) WHERE Level = 38;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.14)) WHERE Level = 39;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.15)) WHERE Level = 40;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.17)) WHERE Level = 41;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.18)) WHERE Level = 42;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.20)) WHERE Level = 43;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.21)) WHERE Level = 44;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.22)) WHERE Level = 45;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.23)) WHERE Level = 46;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.23)) WHERE Level = 47;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.23)) WHERE Level = 48;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.24)) WHERE Level = 49;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.24)) WHERE Level = 50;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.24)) WHERE Level = 51;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.24)) WHERE Level = 52;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.24)) WHERE Level = 53;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.24)) WHERE Level = 54;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.25)) WHERE Level = 55;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.25)) WHERE Level = 56;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.26)) WHERE Level = 57;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.25)) WHERE Level = 58;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.24)) WHERE Level = 59;
UPDATE player_xp_for_level SET Experience = ROUND(Experience * (1 + @enable * 0.22)) WHERE Level = 60;
-- Levels 61-69: IPP baseline (TBC quest XP matches WotLK, no compensation needed)
-- Levels 70-79: untouched by this file (QuestXPFix barely affected WotLK quests;
--              IPP's baseline rows for 70-79 remain as IPP set them)
