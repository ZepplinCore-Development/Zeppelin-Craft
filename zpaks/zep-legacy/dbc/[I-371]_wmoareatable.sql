-- ============================================================
-- I-371  Orgrimmar minimap - per-row: WMO tiles where we have them, terrain where we don't
-- ============================================================
-- Minimap tiles sit on a fixed 133.33 yd grid (533.33/4); a group needs
-- ceil(w/133.33) x ceil(h/133.33) of them. Rows are set from actual coverage:
--   * group fully covered by the tiles in [I-371]_md5translate.sql -> STOCK flags
--     (the WMO tile renders - this is what makes the enclosed buildings work)
--   * group with incomplete coverage -> 32, exterior/terrain instead
-- The top-level row (-1) stays 32 so anything without a row falls back to terrain.
--
-- Blanket flags=32 across the whole WMO was tried and reverted: it threw away the
-- building interiors that were rendering correctly.
-- ============================================================

UPDATE wmoareatable SET flags = 32 WHERE id IN (13762);

-- 107 rows at stock flags = 0 (tiles fully cover these groups)
UPDATE wmoareatable SET flags = 0 WHERE id IN (13768, 13769, 13782, 13783, 13784, 13785, 13786, 13787, 13788, 13789, 13790, 13791, 13792, 13795, 13796, 13797, 13809, 13811, 13812, 13813, 13814, 13815, 13816, 13817, 13818, 13819, 13822, 13823, 13824, 13830, 13831, 13832, 13836, 13837, 13838, 13839, 13840, 13841, 13842, 13843);
UPDATE wmoareatable SET flags = 0 WHERE id IN (13844, 13845, 13846, 13847, 13848, 13849, 13850, 13851, 13852, 13853, 13854, 13855, 13856, 13858, 13859, 13871, 13872, 13873, 13874, 13875, 13876, 13877, 13883, 13884, 13885, 13886, 13887, 13888, 13889, 13890, 13891, 13892, 13893, 13894, 13895, 13896, 13900, 13901, 13902, 13903);
UPDATE wmoareatable SET flags = 0 WHERE id IN (13904, 13905, 13906, 13907, 13908, 13909, 13910, 13911, 13915, 13918, 13929, 13935, 13947, 13948, 13956, 13957, 13958, 13959, 13960, 20622, 20726, 31603, 32228, 34548, 34549, 34550, 35757);

-- 33 rows at stock flags = 4 (tiles fully cover these groups)
UPDATE wmoareatable SET flags = 4 WHERE id IN (13763, 13764, 13766, 13767, 13770, 13772, 13773, 13774, 13775, 13776, 13777, 13778, 13779, 13781, 13801, 13802, 13803, 13804, 13805, 13806, 13820, 13821, 13834, 13860, 13861, 13862, 13863, 13864, 13865, 13866, 13867, 13955, 17497);

-- 70 rows without full tile coverage -> exterior/terrain
UPDATE wmoareatable SET flags = 32 WHERE id IN (13765, 13771, 13780, 13793, 13794, 13798, 13799, 13800, 13807, 13808, 13810, 13825, 13826, 13827, 13828, 13829, 13833, 13835, 13857, 13868, 13869, 13870, 13878, 13879, 13880, 13881, 13882, 13897, 13898, 13899, 13912, 13913, 13914, 13916, 13917, 13919, 13920, 13921, 13922, 13923);
UPDATE wmoareatable SET flags = 32 WHERE id IN (13924, 13925, 13926, 13927, 13928, 13930, 13931, 13932, 13933, 13934, 13936, 13937, 13938, 13939, 13940, 13941, 13942, 13943, 13944, 13945, 13946, 13949, 13950, 13951, 13952, 13953, 13954, 19104, 19105, 19106);
