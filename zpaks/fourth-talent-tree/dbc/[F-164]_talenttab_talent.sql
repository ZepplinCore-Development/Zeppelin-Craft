-- [F-164] fourth-talent-tree: talenttab and talent
-- Guardian spec (4th Shaman tree) - duplicated from Enhancement with new IDs

-- ============================================================================
-- TalentTab: Guardian (id=900)
-- ============================================================================
INSERT INTO `talenttab` (
    `id`, `name_enus`,
    `name_kokr`, `name_frfr`, `name_dede`, `name_zhcn`, `name_zhtw`,
    `name_eses`, `name_esmx`, `name_ruru`, `name_jajp`, `name_ptpt`,
    `name_itit`, `name_unused_1`, `name_unused_2`, `name_unused_3`, `name_unused_4`,
    `name_flags`, `spell_icon`, `race_mask`, `class_mask`,
    `creature_family`, `order_index`, `background_file`
) VALUES (
    900, 'Guardian',
    '', '', '', '', '',
    '', '', '', '', '',
    '', '', '', '', '',
    16712190, 19, 4095, 64,
    0, 3, 'ShamanEnhancement'
);

-- ============================================================================
-- Talent entries (29 rows) - duplicated from Enhancement
-- New IDs 2900-2928, all pointing to spec_id=900
--
-- ID mapping (old Enhancement → new Guardian):
--   610→2900, 2101→2901, 614→2902, 609→2903, 613→2904, 605→2905, 607→2906
--   611→2907, 617→2908, 601→2909, 602→2910, 615→2911, 1647→2912, 616→2913
--   2083→2914, 1689→2915, 1643→2916, 2263→2917, 1692→2918, 1690→2919, 901→2920
--   2055→2921, 2249→2922, 2054→2923, 1691→2924, 1693→2925, 2056→2926, 2057→2927, 2058→2928
--
-- Prereq remapping:
--   613→2904 (talent 602/2910 prereq)
--   616→2913 (talent 1690/2919 prereq)
--   1690→2919 (talents 1692/2918 and 2249/2922 prereqs)
--   901→2920 (talent 2054/2923 prereq)
-- ============================================================================

-- 2900 (was 610) - tier 0, col 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2900, 900, 0, 0,
    16259, 16295, 52456, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2901 (was 2101) - tier 0, col 1
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2901, 900, 0, 1,
    16043, 16130, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2902 (was 614) - tier 0, col 2
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2902, 900, 0, 2,
    17485, 17486, 17487, 17488, 17489,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2903 (was 609) - tier 1, col 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2903, 900, 1, 0,
    16258, 16293, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2904 (was 613) - tier 1, col 1
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2904, 900, 1, 1,
    16255, 16302, 16303, 16304, 16305,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2905 (was 605) - tier 1, col 2
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2905, 900, 1, 2,
    900109, 900110, 900111, 900112, 900113,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2906 (was 607) - tier 1, col 3
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2906, 900, 1, 3,
    16261, 16290, 51881, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2907 (was 611) - tier 2, col 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2907, 900, 2, 0,
    16266, 29079, 29080, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2908 (was 617) - tier 2, col 2
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2908, 900, 2, 2,
    43338, 0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    1, 0, 0, 0
);

-- 2909 (was 601) - tier 2, col 3
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2909, 900, 2, 3,
    16254, 16271, 16272, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2910 (was 602) - tier 3, col 1 - prereq: 613→2904 rank 4
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2910, 900, 3, 1,
    16256, 16281, 16282, 16283, 16284,
    0, 0, 0, 0,
    2904, 0, 0,
    4, 0, 0,
    0, 0, 0, 0
);

-- 2911 (was 615) - tier 3, col 2
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2911, 900, 3, 2,
    16252, 16306, 16307, 16308, 16309,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2912 (was 1647) - tier 4, col 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2912, 900, 4, 0,
    29192, 29193, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2913 (was 616) - tier 4, col 1
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2913, 900, 4, 1,
    16268, 0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2914 (was 2083) - tier 4, col 2
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2914, 900, 4, 2,
    51883, 51884, 51885, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2915 (was 1689) - tier 5, col 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2915, 900, 5, 0,
    30802, 30808, 30809, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2916 (was 1643) - tier 5, col 2
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2916, 900, 5, 2,
    29082, 29084, 29086, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2917 (was 2263) - tier 5, col 3
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2917, 900, 5, 3,
    63373, 63374, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2918 (was 1692) - tier 6, col 0 - prereq: 1690→2919 rank 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2918, 900, 6, 0,
    30816, 30818, 30819, 0, 0,
    0, 0, 0, 0,
    2919, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2919 (was 1690) - tier 6, col 1 - prereq: 616→2913 rank 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2919, 900, 6, 1,
    30798, 0, 0, 0, 0,
    0, 0, 0, 0,
    2913, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2920 (was 901) - tier 6, col 2
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2920, 900, 6, 2,
    17364, 0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    1, 0, 0, 0
);

-- 2921 (was 2055) - tier 7, col 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2921, 900, 7, 0,
    51525, 51526, 51527, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2922 (was 2249) - tier 7, col 1 - prereq: 1690→2919 rank 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2922, 900, 7, 1,
    60103, 0, 0, 0, 0,
    0, 0, 0, 0,
    2919, 0, 0,
    0, 0, 0,
    1, 0, 0, 0
);

-- 2923 (was 2054) - tier 7, col 2 - prereq: 901→2920 rank 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2923, 900, 7, 2,
    51521, 51522, 0, 0, 0,
    0, 0, 0, 0,
    2920, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2924 (was 1691) - tier 8, col 0
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2924, 900, 8, 0,
    30812, 30813, 30814, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2925 (was 1693) - tier 8, col 1
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2925, 900, 8, 1,
    30823, 0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    1, 0, 0, 0
);

-- 2926 (was 2056) - tier 8, col 2
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2926, 900, 8, 2,
    51523, 51524, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2927 (was 2057) - tier 9, col 1
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2927, 900, 9, 1,
    51528, 51529, 51530, 51531, 51532,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0, 0
);

-- 2928 (was 2058) - tier 10, col 1
INSERT INTO `talent` (
    `id`, `spec_id`, `tier_id`, `column_index`,
    `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`,
    `rank_6`, `rank_7`, `rank_8`, `rank_9`,
    `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`,
    `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`,
    `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`
) VALUES (
    2928, 900, 10, 1,
    51533, 0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    1, 0, 0, 0
);
