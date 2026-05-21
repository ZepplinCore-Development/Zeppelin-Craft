-- [F-164] Enhancement spec talent tree restructure
-- Replaces 3 stock talents with new Enhancement-specific designs:
--   T0 C1: Earth's Grasp (16043)       -> Shock and Awe       (900210-900212)
--   T1 C0: Guardian Totems (16258)     -> Wolf's Hunger        (900216)
--   T8 C1: Shamanistic Rage (30823)    -> Improved Lava Lash   (900217-900219)
--   T8 C2: Earthen Power (51523)       -> Shamanistic Rage moved here
--
-- Earthen Power stays in the Earthwarden tree (talent 2925) — only the
-- Enhancement copy (talent 2056) is removed.
-- ============================================================================

-- Step 1: Remove Earthen Power from Enhancement (frees T8 C2 slot)
DELETE FROM `talent` WHERE `id` = 2056;

-- Step 2: Move Shamanistic Rage from T8 C1 -> T8 C2
UPDATE `talent` SET `column_index` = 2 WHERE `id` = 1693;

-- Step 3: Replace Earth's Grasp at T0 C1 with Shock and Awe (3 ranks)
-- flags=0 (passive talent)
UPDATE `talent` SET
    `rank_1` = 900210,
    `rank_2` = 900211,
    `rank_3` = 900212,
    `rank_4` = 0,
    `rank_5` = 0,
    `rank_6` = 0,
    `rank_7` = 0,
    `rank_8` = 0,
    `rank_9` = 0,
    `pre_req_talent_1` = 0,
    `pre_req_talent_2` = 0,
    `pre_req_talent_3` = 0,
    `pre_req_rank_1` = 0,
    `pre_req_rank_2` = 0,
    `pre_req_rank_3` = 0,
    `flags` = 0
WHERE `id` = 2101;

-- Step 4: Replace Guardian Totems at T1 C0 with Wolf's Hunger (1 rank, active)
-- flags=1 (active spell, taught when talented)
UPDATE `talent` SET
    `rank_1` = 900216,
    `rank_2` = 0,
    `rank_3` = 0,
    `rank_4` = 0,
    `rank_5` = 0,
    `rank_6` = 0,
    `rank_7` = 0,
    `rank_8` = 0,
    `rank_9` = 0,
    `pre_req_talent_1` = 0,
    `pre_req_talent_2` = 0,
    `pre_req_talent_3` = 0,
    `pre_req_rank_1` = 0,
    `pre_req_rank_2` = 0,
    `pre_req_rank_3` = 0,
    `flags` = 1
WHERE `id` = 609;

-- Step 5: Insert Improved Lava Lash at T8 C1 (3 ranks, prereq Lava Lash talent)
-- prereq talent 2249 (Lava Lash, T7 C1), rank 1
DELETE FROM `talent` WHERE `id` = 2960;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES
(2960, 263, 8, 1, 900217, 900218, 900219, 0, 0, 0, 0, 0, 0, 2249, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Step 6: Restore Improved Ghost Wolf at T1 C2 (Enhancement, 2 ranks, passive)
-- Uses stock spells 16262 (R1, -1.0s cast) and 16287 (R2, -2.0s cast). With
-- base Ghost Wolf at 3.0s cast, max rank brings it to 1.0s — not instant, so
-- compatible with riding crop (F-005) which makes GW instant via the cape slot.
DELETE FROM `talent` WHERE `id` = 2961;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES
(2961, 263, 1, 2, 16262, 16287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
