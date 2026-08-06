-- Found 45 unique milling loot tables

-- =====================================================
-- WRITING TABLE BONUS YIELD SYSTEM (milling)
-- =====================================================
-- Reference loot tables that duplicate milling loot
-- Provides a bonus 'second roll' when milling with a Writing Table
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
--
-- Aura conditions are attached to PLAIN ITEM rows only -- AzerothCore
-- never evaluates conditions on rows with Reference <> 0, so a mirrored
-- reference row gets a sub-mirror and the gate lives one level down.
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 100000 AND 100999;
DELETE FROM milling_loot_template WHERE Reference BETWEEN 100000 AND 100999;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 100000 AND 100999;

-- Silverleaf (Entry: 765)
-- Silverleaf - Journeyman Writing Table Bonus (Ref 100000)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100000, 90000000, 100999, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100999, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');

-- Silverleaf - Artisan Writing Table Bonus (Ref 100001)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100001, 90000000, 100998, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100998, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');

-- Silverleaf - Master Writing Table Bonus (Ref 100002)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100002, 90000000, 100997, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100997, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');

-- Silverleaf - Grand Master Writing Table Bonus (Ref 100003)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100003, 90000000, 100996, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100996, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');


-- Mageroyal (Entry: 785)
-- Mageroyal - Journeyman Writing Table Bonus (Ref 100004)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100004, 90000000, 100995, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11901)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100995, 39334, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100995, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Mageroyal - Artisan Writing Table Bonus (Ref 100005)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100005, 90000000, 100994, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11901)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100994, 39334, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100994, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Mageroyal - Master Writing Table Bonus (Ref 100006)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100006, 90000000, 100993, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11901)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100993, 39334, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100993, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Mageroyal - Grand Master Writing Table Bonus (Ref 100007)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100007, 90000000, 100992, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11901)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100992, 39334, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100992, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Peacebloom (Entry: 2447)
-- Peacebloom - Journeyman Writing Table Bonus (Ref 100008)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100008, 90000000, 100991, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100991, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');

-- Peacebloom - Artisan Writing Table Bonus (Ref 100009)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100009, 90000000, 100990, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100990, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');

-- Peacebloom - Master Writing Table Bonus (Ref 100010)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100010, 90000000, 100989, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100989, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');

-- Peacebloom - Grand Master Writing Table Bonus (Ref 100011)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100011, 90000000, 100988, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100988, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');


-- Earthroot (Entry: 2449)
-- Earthroot - Journeyman Writing Table Bonus (Ref 100012)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100012, 90000000, 100987, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100987, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');

-- Earthroot - Artisan Writing Table Bonus (Ref 100013)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100013, 90000000, 100986, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100986, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');

-- Earthroot - Master Writing Table Bonus (Ref 100014)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100014, 90000000, 100985, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100985, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');

-- Earthroot - Grand Master Writing Table Bonus (Ref 100015)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100015, 90000000, 100984, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11900)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100984, 39151, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');


-- Briarthorn (Entry: 2450)
-- Briarthorn - Journeyman Writing Table Bonus (Ref 100016)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100016, 90000000, 100983, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11902)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100983, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100983, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Briarthorn - Artisan Writing Table Bonus (Ref 100017)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100017, 90000000, 100982, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11902)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100982, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100982, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Briarthorn - Master Writing Table Bonus (Ref 100018)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100018, 90000000, 100981, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11902)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100981, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100981, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Briarthorn - Grand Master Writing Table Bonus (Ref 100019)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100019, 90000000, 100980, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11902)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100980, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100980, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Swiftthistle (Entry: 2452)
-- Swiftthistle - Journeyman Writing Table Bonus (Ref 100020)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100020, 90000000, 100979, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11902)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100979, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100979, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Swiftthistle - Artisan Writing Table Bonus (Ref 100021)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100021, 90000000, 100978, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11902)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100978, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100978, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Swiftthistle - Master Writing Table Bonus (Ref 100022)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100022, 90000000, 100977, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11902)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100977, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100977, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Swiftthistle - Grand Master Writing Table Bonus (Ref 100023)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100023, 90000000, 100976, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11902)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100976, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100976, 43103, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Bruiseweed (Entry: 2453)
-- Bruiseweed - Journeyman Writing Table Bonus (Ref 100024)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100024, 90000000, 100975, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11903)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100975, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100975, 43103, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Bruiseweed - Artisan Writing Table Bonus (Ref 100025)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100025, 90000000, 100974, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11903)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100974, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100974, 43103, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Bruiseweed - Master Writing Table Bonus (Ref 100026)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100026, 90000000, 100973, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11903)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100973, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100973, 43103, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Bruiseweed - Grand Master Writing Table Bonus (Ref 100027)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100027, 90000000, 100972, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11903)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100972, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100972, 43103, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Wild Steelbloom (Entry: 3355)
-- Wild Steelbloom - Journeyman Writing Table Bonus (Ref 100028)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100028, 90000000, 100971, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11904)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100971, 39338, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100971, 43104, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Wild Steelbloom - Artisan Writing Table Bonus (Ref 100029)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100029, 90000000, 100970, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11904)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100970, 39338, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100970, 43104, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Wild Steelbloom - Master Writing Table Bonus (Ref 100030)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100030, 90000000, 100969, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11904)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100969, 39338, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100969, 43104, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Wild Steelbloom - Grand Master Writing Table Bonus (Ref 100031)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100031, 90000000, 100968, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11904)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100968, 39338, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100968, 43104, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Kingsblood (Entry: 3356)
-- Kingsblood - Journeyman Writing Table Bonus (Ref 100032)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100032, 90000000, 100967, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11905)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100967, 39338, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100967, 43104, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Kingsblood - Artisan Writing Table Bonus (Ref 100033)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100033, 90000000, 100966, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11905)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100966, 39338, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100966, 43104, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Kingsblood - Master Writing Table Bonus (Ref 100034)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100034, 90000000, 100965, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11905)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100965, 39338, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100965, 43104, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Kingsblood - Grand Master Writing Table Bonus (Ref 100035)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100035, 90000000, 100964, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11905)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100964, 39338, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100964, 43104, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Liferoot (Entry: 3357)
-- Liferoot - Journeyman Writing Table Bonus (Ref 100036)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100036, 90000000, 100963, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11905)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100963, 39338, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100963, 43104, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Liferoot - Artisan Writing Table Bonus (Ref 100037)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100037, 90000000, 100962, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11905)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100962, 39338, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100962, 43104, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Liferoot - Master Writing Table Bonus (Ref 100038)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100038, 90000000, 100961, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11905)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100961, 39338, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100961, 43104, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Liferoot - Grand Master Writing Table Bonus (Ref 100039)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100039, 90000000, 100960, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11905)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100960, 39338, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100960, 43104, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Khadgar's Whisker (Entry: 3358)
-- Khadgar's Whisker - Journeyman Writing Table Bonus (Ref 100040)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100040, 90000000, 100959, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11907)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100959, 39339, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100959, 43105, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Khadgar's Whisker - Artisan Writing Table Bonus (Ref 100041)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100041, 90000000, 100958, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11907)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100958, 39339, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100958, 43105, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Khadgar's Whisker - Master Writing Table Bonus (Ref 100042)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100042, 90000000, 100957, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11907)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100957, 39339, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100957, 43105, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Khadgar's Whisker - Grand Master Writing Table Bonus (Ref 100043)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100043, 90000000, 100956, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11907)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100956, 39339, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100956, 43105, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Grave Moss (Entry: 3369)
-- Grave Moss - Journeyman Writing Table Bonus (Ref 100044)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100044, 90000000, 100955, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11904)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100955, 39338, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100955, 43104, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Grave Moss - Artisan Writing Table Bonus (Ref 100045)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100045, 90000000, 100954, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11904)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100954, 39338, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100954, 43104, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Grave Moss - Master Writing Table Bonus (Ref 100046)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100046, 90000000, 100953, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11904)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100953, 39338, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100953, 43104, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Grave Moss - Grand Master Writing Table Bonus (Ref 100047)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100047, 90000000, 100952, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11904)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100952, 39338, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100952, 43104, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Fadeleaf (Entry: 3818)
-- Fadeleaf - Journeyman Writing Table Bonus (Ref 100048)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100048, 90000000, 100951, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11906)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100951, 39339, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100951, 43105, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Fadeleaf - Artisan Writing Table Bonus (Ref 100049)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100049, 90000000, 100950, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11906)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100950, 39339, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100950, 43105, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Fadeleaf - Master Writing Table Bonus (Ref 100050)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100050, 90000000, 100949, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11906)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100949, 39339, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100949, 43105, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Fadeleaf - Grand Master Writing Table Bonus (Ref 100051)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100051, 90000000, 100948, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11906)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100948, 39339, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100948, 43105, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Wintersbite (Entry: 3819)
-- Wintersbite - Journeyman Writing Table Bonus (Ref 100052)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100052, 90000000, 100947, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11907)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100947, 39339, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100947, 43105, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Wintersbite - Artisan Writing Table Bonus (Ref 100053)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100053, 90000000, 100946, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11907)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100946, 39339, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100946, 43105, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Wintersbite - Master Writing Table Bonus (Ref 100054)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100054, 90000000, 100945, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11907)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100945, 39339, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100945, 43105, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Wintersbite - Grand Master Writing Table Bonus (Ref 100055)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100055, 90000000, 100944, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11907)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100944, 39339, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100944, 43105, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Stranglekelp (Entry: 3820)
-- Stranglekelp - Journeyman Writing Table Bonus (Ref 100056)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100056, 90000000, 100943, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11903)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100943, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100943, 43103, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Stranglekelp - Artisan Writing Table Bonus (Ref 100057)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100057, 90000000, 100942, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11903)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100942, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100942, 43103, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Stranglekelp - Master Writing Table Bonus (Ref 100058)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100058, 90000000, 100941, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11903)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100941, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100941, 43103, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Stranglekelp - Grand Master Writing Table Bonus (Ref 100059)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100059, 90000000, 100940, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11903)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100940, 39334, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100940, 43103, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Goldthorn (Entry: 3821)
-- Goldthorn - Journeyman Writing Table Bonus (Ref 100060)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100060, 90000000, 100939, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11906)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100939, 39339, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100939, 43105, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Goldthorn - Artisan Writing Table Bonus (Ref 100061)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100061, 90000000, 100938, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11906)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100938, 39339, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100938, 43105, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Goldthorn - Master Writing Table Bonus (Ref 100062)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100062, 90000000, 100937, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11906)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100937, 39339, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100937, 43105, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Goldthorn - Grand Master Writing Table Bonus (Ref 100063)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100063, 90000000, 100936, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11906)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100936, 39339, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100936, 43105, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Firebloom (Entry: 4625)
-- Firebloom - Journeyman Writing Table Bonus (Ref 100064)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100064, 90000000, 100935, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100935, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100935, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Firebloom - Artisan Writing Table Bonus (Ref 100065)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100065, 90000000, 100934, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100934, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100934, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Firebloom - Master Writing Table Bonus (Ref 100066)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100066, 90000000, 100933, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100933, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100933, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Firebloom - Grand Master Writing Table Bonus (Ref 100067)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100067, 90000000, 100932, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100932, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100932, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Purple Lotus (Entry: 8831)
-- Purple Lotus - Journeyman Writing Table Bonus (Ref 100068)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100068, 90000000, 100931, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100931, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100931, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Purple Lotus - Artisan Writing Table Bonus (Ref 100069)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100069, 90000000, 100930, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100930, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100930, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Purple Lotus - Master Writing Table Bonus (Ref 100070)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100070, 90000000, 100929, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100929, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100929, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Purple Lotus - Grand Master Writing Table Bonus (Ref 100071)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100071, 90000000, 100928, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100928, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100928, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Arthas' Tears (Entry: 8836)
-- Arthas' Tears - Journeyman Writing Table Bonus (Ref 100072)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100072, 90000000, 100927, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100927, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100927, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Arthas' Tears - Artisan Writing Table Bonus (Ref 100073)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100073, 90000000, 100926, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100926, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100926, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Arthas' Tears - Master Writing Table Bonus (Ref 100074)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100074, 90000000, 100925, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100925, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100925, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Arthas' Tears - Grand Master Writing Table Bonus (Ref 100075)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100075, 90000000, 100924, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100924, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100924, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Sungrass (Entry: 8838)
-- Sungrass - Journeyman Writing Table Bonus (Ref 100076)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100076, 90000000, 100923, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100923, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100923, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Sungrass - Artisan Writing Table Bonus (Ref 100077)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100077, 90000000, 100922, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100922, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100922, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Sungrass - Master Writing Table Bonus (Ref 100078)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100078, 90000000, 100921, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100921, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100921, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Sungrass - Grand Master Writing Table Bonus (Ref 100079)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100079, 90000000, 100920, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11908)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100920, 39340, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100920, 43106, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Blindweed (Entry: 8839)
-- Blindweed - Journeyman Writing Table Bonus (Ref 100080)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100080, 90000000, 100919, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100919, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100919, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Blindweed - Artisan Writing Table Bonus (Ref 100081)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100081, 90000000, 100918, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100918, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100918, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Blindweed - Master Writing Table Bonus (Ref 100082)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100082, 90000000, 100917, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100917, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100917, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Blindweed - Grand Master Writing Table Bonus (Ref 100083)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100083, 90000000, 100916, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100916, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100916, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Ghost Mushroom (Entry: 8845)
-- Ghost Mushroom - Journeyman Writing Table Bonus (Ref 100084)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100084, 90000000, 100915, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100915, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100915, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Ghost Mushroom - Artisan Writing Table Bonus (Ref 100085)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100085, 90000000, 100914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100914, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100914, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Ghost Mushroom - Master Writing Table Bonus (Ref 100086)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100086, 90000000, 100913, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100913, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100913, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Ghost Mushroom - Grand Master Writing Table Bonus (Ref 100087)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100087, 90000000, 100912, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100912, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100912, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Gromsblood (Entry: 8846)
-- Gromsblood - Journeyman Writing Table Bonus (Ref 100088)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100088, 90000000, 100911, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100911, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100911, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Gromsblood - Artisan Writing Table Bonus (Ref 100089)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100089, 90000000, 100910, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100910, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100910, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Gromsblood - Master Writing Table Bonus (Ref 100090)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100090, 90000000, 100909, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100909, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100909, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Gromsblood - Grand Master Writing Table Bonus (Ref 100091)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100091, 90000000, 100908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11909)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100908, 39340, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100908, 43106, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Dreamfoil (Entry: 13463)
-- Dreamfoil - Journeyman Writing Table Bonus (Ref 100092)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100092, 90000000, 100907, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11910)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100907, 39341, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100907, 43107, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Dreamfoil - Artisan Writing Table Bonus (Ref 100093)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100093, 90000000, 100906, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11910)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100906, 39341, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100906, 43107, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Dreamfoil - Master Writing Table Bonus (Ref 100094)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100094, 90000000, 100905, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11910)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100905, 39341, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100905, 43107, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Dreamfoil - Grand Master Writing Table Bonus (Ref 100095)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100095, 90000000, 100904, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11910)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100904, 39341, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100904, 43107, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Golden Sansam (Entry: 13464)
-- Golden Sansam - Journeyman Writing Table Bonus (Ref 100096)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100096, 90000000, 100903, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11910)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100903, 39341, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100903, 43107, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Golden Sansam - Artisan Writing Table Bonus (Ref 100097)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100097, 90000000, 100902, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11910)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100902, 39341, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100902, 43107, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Golden Sansam - Master Writing Table Bonus (Ref 100098)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100098, 90000000, 100901, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11910)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100901, 39341, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100901, 43107, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Golden Sansam - Grand Master Writing Table Bonus (Ref 100099)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100099, 90000000, 100900, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11910)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100900, 39341, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100900, 43107, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Mountain Silversage (Entry: 13465)
-- Mountain Silversage - Journeyman Writing Table Bonus (Ref 100100)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100100, 90000000, 100899, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100899, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100899, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Mountain Silversage - Artisan Writing Table Bonus (Ref 100101)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100101, 90000000, 100898, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100898, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100898, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Mountain Silversage - Master Writing Table Bonus (Ref 100102)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100102, 90000000, 100897, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100897, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100897, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Mountain Silversage - Grand Master Writing Table Bonus (Ref 100103)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100103, 90000000, 100896, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100896, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100896, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Plaguebloom (Entry: 13466)
-- Plaguebloom - Journeyman Writing Table Bonus (Ref 100104)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100104, 90000000, 100895, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100895, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100895, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Plaguebloom - Artisan Writing Table Bonus (Ref 100105)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100105, 90000000, 100894, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100894, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100894, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Plaguebloom - Master Writing Table Bonus (Ref 100106)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100106, 90000000, 100893, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100893, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100893, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Plaguebloom - Grand Master Writing Table Bonus (Ref 100107)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100107, 90000000, 100892, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100892, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100892, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Icecap (Entry: 13467)
-- Icecap - Journeyman Writing Table Bonus (Ref 100108)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100108, 90000000, 100891, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100891, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100891, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Icecap - Artisan Writing Table Bonus (Ref 100109)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100109, 90000000, 100890, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100890, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100890, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Icecap - Master Writing Table Bonus (Ref 100110)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100110, 90000000, 100889, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100889, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100889, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Icecap - Grand Master Writing Table Bonus (Ref 100111)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100111, 90000000, 100888, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11911)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100888, 39341, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100888, 43107, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Felweed (Entry: 22785)
-- Felweed - Journeyman Writing Table Bonus (Ref 100112)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100112, 90000000, 100887, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11913)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100887, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100887, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Felweed - Artisan Writing Table Bonus (Ref 100113)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100113, 90000000, 100886, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11913)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100886, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100886, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Felweed - Master Writing Table Bonus (Ref 100114)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100114, 90000000, 100885, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11913)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100885, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100885, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Felweed - Grand Master Writing Table Bonus (Ref 100115)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100115, 90000000, 100884, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11913)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100884, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100884, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Dreaming Glory (Entry: 22786)
-- Dreaming Glory - Journeyman Writing Table Bonus (Ref 100116)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100116, 90000000, 100883, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100883, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100883, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Dreaming Glory - Artisan Writing Table Bonus (Ref 100117)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100117, 90000000, 100882, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100882, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100882, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Dreaming Glory - Master Writing Table Bonus (Ref 100118)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100118, 90000000, 100881, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100881, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100881, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Dreaming Glory - Grand Master Writing Table Bonus (Ref 100119)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100119, 90000000, 100880, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100880, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100880, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Ragveil (Entry: 22787)
-- Ragveil - Journeyman Writing Table Bonus (Ref 100120)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100120, 90000000, 100879, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100879, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100879, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Ragveil - Artisan Writing Table Bonus (Ref 100121)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100121, 90000000, 100878, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100878, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100878, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Ragveil - Master Writing Table Bonus (Ref 100122)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100122, 90000000, 100877, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100877, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100877, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Ragveil - Grand Master Writing Table Bonus (Ref 100123)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100123, 90000000, 100876, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100876, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100876, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Terocone (Entry: 22789)
-- Terocone - Journeyman Writing Table Bonus (Ref 100124)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100124, 90000000, 100875, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100875, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100875, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Terocone - Artisan Writing Table Bonus (Ref 100125)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100125, 90000000, 100874, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100874, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100874, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Terocone - Master Writing Table Bonus (Ref 100126)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100126, 90000000, 100873, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100873, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100873, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Terocone - Grand Master Writing Table Bonus (Ref 100127)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100127, 90000000, 100872, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11912)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100872, 39342, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100872, 43108, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Ancient Lichen (Entry: 22790)
-- Ancient Lichen - Journeyman Writing Table Bonus (Ref 100128)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100128, 90000000, 100871, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100871, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100871, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Ancient Lichen - Artisan Writing Table Bonus (Ref 100129)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100129, 90000000, 100870, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100870, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100870, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Ancient Lichen - Master Writing Table Bonus (Ref 100130)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100130, 90000000, 100869, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100869, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100869, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Ancient Lichen - Grand Master Writing Table Bonus (Ref 100131)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100131, 90000000, 100868, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100868, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100868, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Netherbloom (Entry: 22791)
-- Netherbloom - Journeyman Writing Table Bonus (Ref 100132)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100132, 90000000, 100867, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100867, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100867, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Netherbloom - Artisan Writing Table Bonus (Ref 100133)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100133, 90000000, 100866, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100866, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100866, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Netherbloom - Master Writing Table Bonus (Ref 100134)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100134, 90000000, 100865, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100865, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100865, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Netherbloom - Grand Master Writing Table Bonus (Ref 100135)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100135, 90000000, 100864, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100864, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100864, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Nightmare Vine (Entry: 22792)
-- Nightmare Vine - Journeyman Writing Table Bonus (Ref 100136)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100136, 90000000, 100863, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100863, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100863, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Nightmare Vine - Artisan Writing Table Bonus (Ref 100137)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100137, 90000000, 100862, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100862, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100862, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Nightmare Vine - Master Writing Table Bonus (Ref 100138)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100138, 90000000, 100861, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100861, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100861, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Nightmare Vine - Grand Master Writing Table Bonus (Ref 100139)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100139, 90000000, 100860, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100860, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100860, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Mana Thistle (Entry: 22793)
-- Mana Thistle - Journeyman Writing Table Bonus (Ref 100140)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100140, 90000000, 100859, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100859, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100859, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Mana Thistle - Artisan Writing Table Bonus (Ref 100141)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100141, 90000000, 100858, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100858, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100858, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Mana Thistle - Master Writing Table Bonus (Ref 100142)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100142, 90000000, 100857, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100857, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100857, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Mana Thistle - Grand Master Writing Table Bonus (Ref 100143)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100143, 90000000, 100856, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11914)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100856, 39342, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100856, 43108, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Goldclover (Entry: 36901)
-- Goldclover - Journeyman Writing Table Bonus (Ref 100144)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100144, 90000000, 100855, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100855, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100855, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Goldclover - Artisan Writing Table Bonus (Ref 100145)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100145, 90000000, 100854, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100854, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100854, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Goldclover - Master Writing Table Bonus (Ref 100146)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100146, 90000000, 100853, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100853, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100853, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Goldclover - Grand Master Writing Table Bonus (Ref 100147)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100147, 90000000, 100852, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100852, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100852, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Adder's Tongue (Entry: 36903)
-- Adder's Tongue - Journeyman Writing Table Bonus (Ref 100148)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100148, 90000000, 100851, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11918)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100851, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100851, 43109, 0, 50.0, 0, 0, 1, 4, 'Bonus from Journeyman Writing Table');

-- Adder's Tongue - Artisan Writing Table Bonus (Ref 100149)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100149, 90000000, 100850, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11918)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100850, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100850, 43109, 0, 50.0, 0, 0, 1, 4, 'Bonus from Artisan Writing Table');

-- Adder's Tongue - Master Writing Table Bonus (Ref 100150)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100150, 90000000, 100849, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11918)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100849, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100849, 43109, 0, 50.0, 0, 0, 1, 4, 'Bonus from Master Writing Table');

-- Adder's Tongue - Grand Master Writing Table Bonus (Ref 100151)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100151, 90000000, 100848, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11918)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100848, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100848, 43109, 0, 50.0, 0, 0, 1, 4, 'Bonus from Grand Master Writing Table');


-- Tiger Lily (Entry: 36904)
-- Tiger Lily - Journeyman Writing Table Bonus (Ref 100152)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100152, 90000000, 100847, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100847, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100847, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Tiger Lily - Artisan Writing Table Bonus (Ref 100153)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100153, 90000000, 100846, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100846, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100846, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Tiger Lily - Master Writing Table Bonus (Ref 100154)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100154, 90000000, 100845, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100845, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100845, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Tiger Lily - Grand Master Writing Table Bonus (Ref 100155)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100155, 90000000, 100844, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100844, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100844, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Lichbloom (Entry: 36905)
-- Lichbloom - Journeyman Writing Table Bonus (Ref 100156)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100156, 90000000, 100843, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11917)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100843, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100843, 43109, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Lichbloom - Artisan Writing Table Bonus (Ref 100157)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100157, 90000000, 100842, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11917)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100842, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100842, 43109, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Lichbloom - Master Writing Table Bonus (Ref 100158)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100158, 90000000, 100841, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11917)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100841, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100841, 43109, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Lichbloom - Grand Master Writing Table Bonus (Ref 100159)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100159, 90000000, 100840, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11917)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100840, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100840, 43109, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Icethorn (Entry: 36906)
-- Icethorn - Journeyman Writing Table Bonus (Ref 100160)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100160, 90000000, 100839, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11917)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100839, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100839, 43109, 0, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Icethorn - Artisan Writing Table Bonus (Ref 100161)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100161, 90000000, 100838, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11917)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100838, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100838, 43109, 0, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Icethorn - Master Writing Table Bonus (Ref 100162)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100162, 90000000, 100837, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11917)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100837, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100837, 43109, 0, 50.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Icethorn - Grand Master Writing Table Bonus (Ref 100163)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100163, 90000000, 100836, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11917)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100836, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100836, 43109, 0, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Talandra's Rose (Entry: 36907)
-- Talandra's Rose - Journeyman Writing Table Bonus (Ref 100164)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100164, 90000000, 100835, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100835, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100835, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Talandra's Rose - Artisan Writing Table Bonus (Ref 100165)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100165, 90000000, 100834, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100834, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100834, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Talandra's Rose - Master Writing Table Bonus (Ref 100166)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100166, 90000000, 100833, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100833, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100833, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Talandra's Rose - Grand Master Writing Table Bonus (Ref 100167)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100167, 90000000, 100832, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100832, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100832, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Deadnettle (Entry: 37921)
-- Deadnettle - Journeyman Writing Table Bonus (Ref 100168)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100168, 90000000, 100831, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100831, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100831, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Deadnettle - Artisan Writing Table Bonus (Ref 100169)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100169, 90000000, 100830, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100830, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100830, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Deadnettle - Master Writing Table Bonus (Ref 100170)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100170, 90000000, 100829, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100829, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100829, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Deadnettle - Grand Master Writing Table Bonus (Ref 100171)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100171, 90000000, 100828, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11916)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100828, 39343, 0, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100828, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Fire Seed (Entry: 39969)
-- Fire Seed - Journeyman Writing Table Bonus (Ref 100172)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100172, 90000000, 100827, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100827, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100827, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Fire Seed - Artisan Writing Table Bonus (Ref 100173)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100173, 90000000, 100826, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100826, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100826, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Fire Seed - Master Writing Table Bonus (Ref 100174)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100174, 90000000, 100825, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100825, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100825, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Fire Seed - Grand Master Writing Table Bonus (Ref 100175)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100175, 90000000, 100824, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100824, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100824, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- Fire Leaf (Entry: 39970)
-- Fire Leaf - Journeyman Writing Table Bonus (Ref 100176)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100176, 90000000, 100823, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100823, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100823, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Writing Table');

-- Fire Leaf - Artisan Writing Table Bonus (Ref 100177)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100177, 90000000, 100822, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100822, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100822, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Writing Table');

-- Fire Leaf - Master Writing Table Bonus (Ref 100178)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100178, 90000000, 100821, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100821, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100821, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Master Writing Table');

-- Fire Leaf - Grand Master Writing Table Bonus (Ref 100179)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100179, 90000000, 100820, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table (ref 11915)');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100820, 39343, 0, 100.0, 0, 0, 2, 3, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100820, 43109, 0, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Writing Table');


-- =====================================================
-- LINK REFERENCES TO MILLING_LOOT_TEMPLATE
-- =====================================================

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (765, 10000, 100000, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (765, 10001, 100001, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (765, 10002, 100002, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (765, 10003, 100003, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (785, 10004, 100004, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (785, 10005, 100005, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (785, 10006, 100006, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (785, 10007, 100007, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2447, 10008, 100008, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2447, 10009, 100009, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2447, 10010, 100010, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2447, 10011, 100011, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2449, 10012, 100012, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2449, 10013, 100013, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2449, 10014, 100014, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2449, 10015, 100015, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2450, 10016, 100016, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2450, 10017, 100017, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2450, 10018, 100018, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2450, 10019, 100019, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2452, 10020, 100020, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2452, 10021, 100021, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2452, 10022, 100022, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2452, 10023, 100023, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2453, 10024, 100024, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2453, 10025, 100025, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2453, 10026, 100026, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2453, 10027, 100027, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3355, 10028, 100028, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3355, 10029, 100029, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3355, 10030, 100030, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3355, 10031, 100031, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3356, 10032, 100032, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3356, 10033, 100033, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3356, 10034, 100034, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3356, 10035, 100035, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3357, 10036, 100036, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3357, 10037, 100037, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3357, 10038, 100038, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3357, 10039, 100039, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3358, 10040, 100040, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3358, 10041, 100041, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3358, 10042, 100042, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3358, 10043, 100043, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3369, 10044, 100044, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3369, 10045, 100045, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3369, 10046, 100046, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3369, 10047, 100047, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3818, 10048, 100048, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3818, 10049, 100049, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3818, 10050, 100050, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3818, 10051, 100051, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3819, 10052, 100052, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3819, 10053, 100053, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3819, 10054, 100054, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3819, 10055, 100055, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3820, 10056, 100056, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3820, 10057, 100057, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3820, 10058, 100058, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3820, 10059, 100059, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3821, 10060, 100060, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3821, 10061, 100061, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3821, 10062, 100062, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3821, 10063, 100063, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (4625, 10064, 100064, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (4625, 10065, 100065, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (4625, 10066, 100066, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (4625, 10067, 100067, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8831, 10068, 100068, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8831, 10069, 100069, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8831, 10070, 100070, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8831, 10071, 100071, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8836, 10072, 100072, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8836, 10073, 100073, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8836, 10074, 100074, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8836, 10075, 100075, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8838, 10076, 100076, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8838, 10077, 100077, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8838, 10078, 100078, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8838, 10079, 100079, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8839, 10080, 100080, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8839, 10081, 100081, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8839, 10082, 100082, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8839, 10083, 100083, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8845, 10084, 100084, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8845, 10085, 100085, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8845, 10086, 100086, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8845, 10087, 100087, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8846, 10088, 100088, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8846, 10089, 100089, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8846, 10090, 100090, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8846, 10091, 100091, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13463, 10092, 100092, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13463, 10093, 100093, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13463, 10094, 100094, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13463, 10095, 100095, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13464, 10096, 100096, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13464, 10097, 100097, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13464, 10098, 100098, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13464, 10099, 100099, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13465, 10100, 100100, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13465, 10101, 100101, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13465, 10102, 100102, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13465, 10103, 100103, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13466, 10104, 100104, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13466, 10105, 100105, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13466, 10106, 100106, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13466, 10107, 100107, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13467, 10108, 100108, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13467, 10109, 100109, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13467, 10110, 100110, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13467, 10111, 100111, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22785, 10112, 100112, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22785, 10113, 100113, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22785, 10114, 100114, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22785, 10115, 100115, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22786, 10116, 100116, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22786, 10117, 100117, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22786, 10118, 100118, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22786, 10119, 100119, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22787, 10120, 100120, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22787, 10121, 100121, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22787, 10122, 100122, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22787, 10123, 100123, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22789, 10124, 100124, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22789, 10125, 100125, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22789, 10126, 100126, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22789, 10127, 100127, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22790, 10128, 100128, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22790, 10129, 100129, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22790, 10130, 100130, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22790, 10131, 100131, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22791, 10132, 100132, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22791, 10133, 100133, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22791, 10134, 100134, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22791, 10135, 100135, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22792, 10136, 100136, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22792, 10137, 100137, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22792, 10138, 100138, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22792, 10139, 100139, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22793, 10140, 100140, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22793, 10141, 100141, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22793, 10142, 100142, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22793, 10143, 100143, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36901, 10144, 100144, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36901, 10145, 100145, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36901, 10146, 100146, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36901, 10147, 100147, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36903, 10148, 100148, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36903, 10149, 100149, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36903, 10150, 100150, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36903, 10151, 100151, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36904, 10152, 100152, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36904, 10153, 100153, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36904, 10154, 100154, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36904, 10155, 100155, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36905, 10156, 100156, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36905, 10157, 100157, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36905, 10158, 100158, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36905, 10159, 100159, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36906, 10160, 100160, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36906, 10161, 100161, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36906, 10162, 100162, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36906, 10163, 100163, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36907, 10164, 100164, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36907, 10165, 100165, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36907, 10166, 100166, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36907, 10167, 100167, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (37921, 10168, 100168, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (37921, 10169, 100169, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (37921, 10170, 100170, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (37921, 10171, 100171, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39969, 10172, 100172, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39969, 10173, 100173, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39969, 10174, 100174, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39969, 10175, 100175, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39970, 10176, 100176, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39970, 10177, 100177, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39970, 10178, 100178, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39970, 10179, 100179, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

-- =====================================================
-- CONDITIONS (Check for active Writing Table auras)
-- Mutually exclusive: a tier bonus rolls only if that tier
-- is active AND no higher tier is active (no stacking).
--
-- SourceGroup is the template that actually holds the item row --
-- a sub-mirror when the source drop sat behind a reference.
-- =====================================================

-- Silverleaf - Journeyman Writing Table conditions (Ref 100000)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100999, 39151, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100999, 39151, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100999, 39151, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100999, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');

-- Silverleaf - Artisan Writing Table conditions (Ref 100001)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100998, 39151, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100998, 39151, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100998, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');

-- Silverleaf - Master Writing Table conditions (Ref 100002)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100997, 39151, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100997, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');

-- Silverleaf - Grand Master Writing Table conditions (Ref 100003)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100996, 39151, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Silverleaf');


-- Mageroyal - Journeyman Writing Table conditions (Ref 100004)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100995, 39334, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100995, 39334, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100995, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100995, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100995, 43103, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100995, 43103, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100995, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100995, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');

-- Mageroyal - Artisan Writing Table conditions (Ref 100005)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100994, 39334, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100994, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100994, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100994, 43103, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100994, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100994, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');

-- Mageroyal - Master Writing Table conditions (Ref 100006)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100993, 39334, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100993, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100993, 43103, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100993, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');

-- Mageroyal - Grand Master Writing Table conditions (Ref 100007)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100992, 39334, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100992, 43103, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mageroyal');


-- Peacebloom - Journeyman Writing Table conditions (Ref 100008)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100991, 39151, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100991, 39151, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100991, 39151, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100991, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');

-- Peacebloom - Artisan Writing Table conditions (Ref 100009)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100990, 39151, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100990, 39151, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100990, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');

-- Peacebloom - Master Writing Table conditions (Ref 100010)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100989, 39151, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100989, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');

-- Peacebloom - Grand Master Writing Table conditions (Ref 100011)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100988, 39151, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Peacebloom');


-- Earthroot - Journeyman Writing Table conditions (Ref 100012)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100987, 39151, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100987, 39151, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100987, 39151, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100987, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');

-- Earthroot - Artisan Writing Table conditions (Ref 100013)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100986, 39151, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100986, 39151, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100986, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');

-- Earthroot - Master Writing Table conditions (Ref 100014)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100985, 39151, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100985, 39151, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');

-- Earthroot - Grand Master Writing Table conditions (Ref 100015)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100984, 39151, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Earthroot');


-- Briarthorn - Journeyman Writing Table conditions (Ref 100016)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100983, 39334, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100983, 39334, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100983, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100983, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100983, 43103, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100983, 43103, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100983, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100983, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');

-- Briarthorn - Artisan Writing Table conditions (Ref 100017)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100982, 39334, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100982, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100982, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100982, 43103, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100982, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100982, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');

-- Briarthorn - Master Writing Table conditions (Ref 100018)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100981, 39334, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100981, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100981, 43103, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100981, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');

-- Briarthorn - Grand Master Writing Table conditions (Ref 100019)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100980, 39334, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100980, 43103, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Briarthorn');


-- Swiftthistle - Journeyman Writing Table conditions (Ref 100020)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100979, 39334, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100979, 39334, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100979, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100979, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100979, 43103, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100979, 43103, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100979, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100979, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Swiftthistle');

-- Swiftthistle - Artisan Writing Table conditions (Ref 100021)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100978, 39334, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100978, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100978, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100978, 43103, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100978, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100978, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Swiftthistle');

-- Swiftthistle - Master Writing Table conditions (Ref 100022)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100977, 39334, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100977, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100977, 43103, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100977, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Swiftthistle');

-- Swiftthistle - Grand Master Writing Table conditions (Ref 100023)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100976, 39334, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100976, 43103, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Swiftthistle');


-- Bruiseweed - Journeyman Writing Table conditions (Ref 100024)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100975, 39334, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100975, 39334, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100975, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100975, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100975, 43103, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100975, 43103, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100975, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100975, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');

-- Bruiseweed - Artisan Writing Table conditions (Ref 100025)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100974, 39334, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100974, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100974, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100974, 43103, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100974, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100974, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');

-- Bruiseweed - Master Writing Table conditions (Ref 100026)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100973, 39334, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100973, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100973, 43103, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100973, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');

-- Bruiseweed - Grand Master Writing Table conditions (Ref 100027)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100972, 39334, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100972, 43103, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Bruiseweed');


-- Wild Steelbloom - Journeyman Writing Table conditions (Ref 100028)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100971, 39338, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100971, 39338, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100971, 39338, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100971, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100971, 43104, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100971, 43104, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100971, 43104, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100971, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Artisan Writing Table conditions (Ref 100029)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100970, 39338, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100970, 39338, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100970, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100970, 43104, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100970, 43104, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100970, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Master Writing Table conditions (Ref 100030)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100969, 39338, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100969, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100969, 43104, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100969, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Grand Master Writing Table conditions (Ref 100031)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100968, 39338, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100968, 43104, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wild Steelbloom');


-- Kingsblood - Journeyman Writing Table conditions (Ref 100032)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100967, 39338, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100967, 39338, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100967, 39338, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100967, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100967, 43104, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100967, 43104, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100967, 43104, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100967, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');

-- Kingsblood - Artisan Writing Table conditions (Ref 100033)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100966, 39338, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100966, 39338, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100966, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100966, 43104, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100966, 43104, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100966, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');

-- Kingsblood - Master Writing Table conditions (Ref 100034)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100965, 39338, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100965, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100965, 43104, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100965, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');

-- Kingsblood - Grand Master Writing Table conditions (Ref 100035)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100964, 39338, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100964, 43104, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Kingsblood');


-- Liferoot - Journeyman Writing Table conditions (Ref 100036)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100963, 39338, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100963, 39338, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100963, 39338, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100963, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100963, 43104, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100963, 43104, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100963, 43104, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100963, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');

-- Liferoot - Artisan Writing Table conditions (Ref 100037)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100962, 39338, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100962, 39338, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100962, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100962, 43104, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100962, 43104, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100962, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');

-- Liferoot - Master Writing Table conditions (Ref 100038)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100961, 39338, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100961, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100961, 43104, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100961, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');

-- Liferoot - Grand Master Writing Table conditions (Ref 100039)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100960, 39338, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100960, 43104, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Liferoot');


-- Khadgar's Whisker - Journeyman Writing Table conditions (Ref 100040)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100959, 39339, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100959, 39339, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100959, 39339, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100959, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100959, 43105, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100959, 43105, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100959, 43105, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100959, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Artisan Writing Table conditions (Ref 100041)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100958, 39339, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100958, 39339, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100958, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100958, 43105, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100958, 43105, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100958, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Master Writing Table conditions (Ref 100042)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100957, 39339, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100957, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100957, 43105, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100957, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Grand Master Writing Table conditions (Ref 100043)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100956, 39339, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100956, 43105, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Khadgar''s Whisker');


-- Grave Moss - Journeyman Writing Table conditions (Ref 100044)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100955, 39338, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100955, 39338, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100955, 39338, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100955, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100955, 43104, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100955, 43104, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100955, 43104, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100955, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');

-- Grave Moss - Artisan Writing Table conditions (Ref 100045)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100954, 39338, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100954, 39338, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100954, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100954, 43104, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100954, 43104, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100954, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');

-- Grave Moss - Master Writing Table conditions (Ref 100046)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100953, 39338, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100953, 39338, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100953, 43104, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100953, 43104, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');

-- Grave Moss - Grand Master Writing Table conditions (Ref 100047)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100952, 39338, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100952, 43104, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Grave Moss');


-- Fadeleaf - Journeyman Writing Table conditions (Ref 100048)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100951, 39339, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100951, 39339, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100951, 39339, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100951, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100951, 43105, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100951, 43105, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100951, 43105, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100951, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');

-- Fadeleaf - Artisan Writing Table conditions (Ref 100049)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100950, 39339, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100950, 39339, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100950, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100950, 43105, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100950, 43105, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100950, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');

-- Fadeleaf - Master Writing Table conditions (Ref 100050)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100949, 39339, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100949, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100949, 43105, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100949, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');

-- Fadeleaf - Grand Master Writing Table conditions (Ref 100051)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100948, 39339, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100948, 43105, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fadeleaf');


-- Wintersbite - Journeyman Writing Table conditions (Ref 100052)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100947, 39339, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100947, 39339, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100947, 39339, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100947, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100947, 43105, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100947, 43105, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100947, 43105, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100947, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');

-- Wintersbite - Artisan Writing Table conditions (Ref 100053)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100946, 39339, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100946, 39339, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100946, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100946, 43105, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100946, 43105, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100946, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');

-- Wintersbite - Master Writing Table conditions (Ref 100054)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100945, 39339, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100945, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100945, 43105, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100945, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');

-- Wintersbite - Grand Master Writing Table conditions (Ref 100055)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100944, 39339, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100944, 43105, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wintersbite');


-- Stranglekelp - Journeyman Writing Table conditions (Ref 100056)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100943, 39334, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100943, 39334, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100943, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100943, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100943, 43103, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100943, 43103, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100943, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100943, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');

-- Stranglekelp - Artisan Writing Table conditions (Ref 100057)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100942, 39334, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100942, 39334, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100942, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100942, 43103, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100942, 43103, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100942, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');

-- Stranglekelp - Master Writing Table conditions (Ref 100058)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100941, 39334, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100941, 39334, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100941, 43103, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100941, 43103, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');

-- Stranglekelp - Grand Master Writing Table conditions (Ref 100059)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100940, 39334, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100940, 43103, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Stranglekelp');


-- Goldthorn - Journeyman Writing Table conditions (Ref 100060)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100939, 39339, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100939, 39339, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100939, 39339, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100939, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100939, 43105, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100939, 43105, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100939, 43105, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100939, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');

-- Goldthorn - Artisan Writing Table conditions (Ref 100061)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100938, 39339, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100938, 39339, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100938, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100938, 43105, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100938, 43105, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100938, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');

-- Goldthorn - Master Writing Table conditions (Ref 100062)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100937, 39339, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100937, 39339, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100937, 43105, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100937, 43105, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');

-- Goldthorn - Grand Master Writing Table conditions (Ref 100063)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100936, 39339, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100936, 43105, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldthorn');


-- Firebloom - Journeyman Writing Table conditions (Ref 100064)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100935, 39340, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100935, 39340, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100935, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100935, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100935, 43106, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100935, 43106, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100935, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100935, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');

-- Firebloom - Artisan Writing Table conditions (Ref 100065)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100934, 39340, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100934, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100934, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100934, 43106, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100934, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100934, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');

-- Firebloom - Master Writing Table conditions (Ref 100066)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100933, 39340, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100933, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100933, 43106, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100933, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');

-- Firebloom - Grand Master Writing Table conditions (Ref 100067)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100932, 39340, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100932, 43106, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Firebloom');


-- Purple Lotus - Journeyman Writing Table conditions (Ref 100068)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100931, 39340, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100931, 39340, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100931, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100931, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100931, 43106, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100931, 43106, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100931, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100931, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');

-- Purple Lotus - Artisan Writing Table conditions (Ref 100069)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100930, 39340, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100930, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100930, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100930, 43106, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100930, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100930, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');

-- Purple Lotus - Master Writing Table conditions (Ref 100070)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100929, 39340, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100929, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100929, 43106, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100929, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');

-- Purple Lotus - Grand Master Writing Table conditions (Ref 100071)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100928, 39340, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100928, 43106, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Purple Lotus');


-- Arthas' Tears - Journeyman Writing Table conditions (Ref 100072)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100927, 39340, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100927, 39340, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100927, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100927, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100927, 43106, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100927, 43106, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100927, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100927, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Artisan Writing Table conditions (Ref 100073)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100926, 39340, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100926, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100926, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100926, 43106, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100926, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100926, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Master Writing Table conditions (Ref 100074)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100925, 39340, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100925, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100925, 43106, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100925, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Grand Master Writing Table conditions (Ref 100075)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100924, 39340, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100924, 43106, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Arthas'' Tears');


-- Sungrass - Journeyman Writing Table conditions (Ref 100076)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100923, 39340, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100923, 39340, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100923, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100923, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100923, 43106, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100923, 43106, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100923, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100923, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');

-- Sungrass - Artisan Writing Table conditions (Ref 100077)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100922, 39340, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100922, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100922, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100922, 43106, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100922, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100922, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');

-- Sungrass - Master Writing Table conditions (Ref 100078)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100921, 39340, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100921, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100921, 43106, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100921, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');

-- Sungrass - Grand Master Writing Table conditions (Ref 100079)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100920, 39340, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100920, 43106, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Sungrass');


-- Blindweed - Journeyman Writing Table conditions (Ref 100080)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100919, 39340, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100919, 39340, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100919, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100919, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100919, 43106, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100919, 43106, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100919, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100919, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');

-- Blindweed - Artisan Writing Table conditions (Ref 100081)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100918, 39340, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100918, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100918, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100918, 43106, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100918, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100918, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');

-- Blindweed - Master Writing Table conditions (Ref 100082)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100917, 39340, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100917, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100917, 43106, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100917, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');

-- Blindweed - Grand Master Writing Table conditions (Ref 100083)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100916, 39340, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100916, 43106, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Blindweed');


-- Ghost Mushroom - Journeyman Writing Table conditions (Ref 100084)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100915, 39340, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100915, 39340, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100915, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100915, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100915, 43106, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100915, 43106, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100915, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100915, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Artisan Writing Table conditions (Ref 100085)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100914, 39340, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100914, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100914, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100914, 43106, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100914, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100914, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Master Writing Table conditions (Ref 100086)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100913, 39340, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100913, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100913, 43106, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100913, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Grand Master Writing Table conditions (Ref 100087)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100912, 39340, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100912, 43106, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ghost Mushroom');


-- Gromsblood - Journeyman Writing Table conditions (Ref 100088)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100911, 39340, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100911, 39340, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100911, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100911, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100911, 43106, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100911, 43106, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100911, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100911, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');

-- Gromsblood - Artisan Writing Table conditions (Ref 100089)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100910, 39340, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100910, 39340, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100910, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100910, 43106, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100910, 43106, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100910, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');

-- Gromsblood - Master Writing Table conditions (Ref 100090)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100909, 39340, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100909, 39340, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100909, 43106, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100909, 43106, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');

-- Gromsblood - Grand Master Writing Table conditions (Ref 100091)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100908, 39340, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100908, 43106, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Gromsblood');


-- Dreamfoil - Journeyman Writing Table conditions (Ref 100092)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100907, 39341, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100907, 39341, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100907, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100907, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100907, 43107, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100907, 43107, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100907, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100907, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');

-- Dreamfoil - Artisan Writing Table conditions (Ref 100093)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100906, 39341, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100906, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100906, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100906, 43107, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100906, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100906, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');

-- Dreamfoil - Master Writing Table conditions (Ref 100094)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100905, 39341, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100905, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100905, 43107, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100905, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');

-- Dreamfoil - Grand Master Writing Table conditions (Ref 100095)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100904, 39341, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100904, 43107, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreamfoil');


-- Golden Sansam - Journeyman Writing Table conditions (Ref 100096)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100903, 39341, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100903, 39341, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100903, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100903, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100903, 43107, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100903, 43107, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100903, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100903, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');

-- Golden Sansam - Artisan Writing Table conditions (Ref 100097)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100902, 39341, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100902, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100902, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100902, 43107, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100902, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100902, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');

-- Golden Sansam - Master Writing Table conditions (Ref 100098)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100901, 39341, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100901, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100901, 43107, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100901, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');

-- Golden Sansam - Grand Master Writing Table conditions (Ref 100099)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100900, 39341, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100900, 43107, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Golden Sansam');


-- Mountain Silversage - Journeyman Writing Table conditions (Ref 100100)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100899, 39341, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100899, 39341, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100899, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100899, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100899, 43107, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100899, 43107, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100899, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100899, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Artisan Writing Table conditions (Ref 100101)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100898, 39341, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100898, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100898, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100898, 43107, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100898, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100898, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Master Writing Table conditions (Ref 100102)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100897, 39341, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100897, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100897, 43107, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100897, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Grand Master Writing Table conditions (Ref 100103)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100896, 39341, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100896, 43107, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mountain Silversage');


-- Plaguebloom - Journeyman Writing Table conditions (Ref 100104)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100895, 39341, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100895, 39341, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100895, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100895, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100895, 43107, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100895, 43107, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100895, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100895, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');

-- Plaguebloom - Artisan Writing Table conditions (Ref 100105)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100894, 39341, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100894, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100894, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100894, 43107, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100894, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100894, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');

-- Plaguebloom - Master Writing Table conditions (Ref 100106)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100893, 39341, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100893, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100893, 43107, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100893, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');

-- Plaguebloom - Grand Master Writing Table conditions (Ref 100107)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100892, 39341, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100892, 43107, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Plaguebloom');


-- Icecap - Journeyman Writing Table conditions (Ref 100108)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100891, 39341, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100891, 39341, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100891, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100891, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100891, 43107, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100891, 43107, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100891, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100891, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');

-- Icecap - Artisan Writing Table conditions (Ref 100109)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100890, 39341, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100890, 39341, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100890, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100890, 43107, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100890, 43107, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100890, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');

-- Icecap - Master Writing Table conditions (Ref 100110)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100889, 39341, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100889, 39341, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100889, 43107, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100889, 43107, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icecap');

-- Icecap - Grand Master Writing Table conditions (Ref 100111)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100888, 39341, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100888, 43107, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icecap');


-- Felweed - Journeyman Writing Table conditions (Ref 100112)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100887, 39342, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100887, 39342, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100887, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100887, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100887, 43108, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100887, 43108, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100887, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100887, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');

-- Felweed - Artisan Writing Table conditions (Ref 100113)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100886, 39342, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100886, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100886, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100886, 43108, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100886, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100886, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');

-- Felweed - Master Writing Table conditions (Ref 100114)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100885, 39342, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100885, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100885, 43108, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100885, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Felweed');

-- Felweed - Grand Master Writing Table conditions (Ref 100115)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100884, 39342, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100884, 43108, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Felweed');


-- Dreaming Glory - Journeyman Writing Table conditions (Ref 100116)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100883, 39342, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100883, 39342, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100883, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100883, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100883, 43108, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100883, 43108, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100883, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100883, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Artisan Writing Table conditions (Ref 100117)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100882, 39342, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100882, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100882, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100882, 43108, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100882, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100882, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Master Writing Table conditions (Ref 100118)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100881, 39342, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100881, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100881, 43108, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100881, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Grand Master Writing Table conditions (Ref 100119)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100880, 39342, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100880, 43108, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreaming Glory');


-- Ragveil - Journeyman Writing Table conditions (Ref 100120)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100879, 39342, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100879, 39342, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100879, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100879, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100879, 43108, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100879, 43108, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100879, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100879, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');

-- Ragveil - Artisan Writing Table conditions (Ref 100121)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100878, 39342, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100878, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100878, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100878, 43108, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100878, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100878, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');

-- Ragveil - Master Writing Table conditions (Ref 100122)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100877, 39342, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100877, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100877, 43108, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100877, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');

-- Ragveil - Grand Master Writing Table conditions (Ref 100123)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100876, 39342, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100876, 43108, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ragveil');


-- Terocone - Journeyman Writing Table conditions (Ref 100124)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100875, 39342, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100875, 39342, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100875, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100875, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100875, 43108, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100875, 43108, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100875, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100875, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');

-- Terocone - Artisan Writing Table conditions (Ref 100125)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100874, 39342, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100874, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100874, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100874, 43108, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100874, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100874, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');

-- Terocone - Master Writing Table conditions (Ref 100126)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100873, 39342, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100873, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100873, 43108, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100873, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Terocone');

-- Terocone - Grand Master Writing Table conditions (Ref 100127)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100872, 39342, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100872, 43108, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Terocone');


-- Ancient Lichen - Journeyman Writing Table conditions (Ref 100128)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100871, 39342, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100871, 39342, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100871, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100871, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100871, 43108, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100871, 43108, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100871, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100871, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Artisan Writing Table conditions (Ref 100129)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100870, 39342, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100870, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100870, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100870, 43108, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100870, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100870, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Master Writing Table conditions (Ref 100130)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100869, 39342, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100869, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100869, 43108, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100869, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Grand Master Writing Table conditions (Ref 100131)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100868, 39342, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100868, 43108, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ancient Lichen');


-- Netherbloom - Journeyman Writing Table conditions (Ref 100132)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100867, 39342, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100867, 39342, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100867, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100867, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100867, 43108, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100867, 43108, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100867, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100867, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');

-- Netherbloom - Artisan Writing Table conditions (Ref 100133)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100866, 39342, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100866, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100866, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100866, 43108, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100866, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100866, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');

-- Netherbloom - Master Writing Table conditions (Ref 100134)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100865, 39342, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100865, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100865, 43108, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100865, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');

-- Netherbloom - Grand Master Writing Table conditions (Ref 100135)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100864, 39342, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100864, 43108, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Netherbloom');


-- Nightmare Vine - Journeyman Writing Table conditions (Ref 100136)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100863, 39342, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100863, 39342, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100863, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100863, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100863, 43108, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100863, 43108, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100863, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100863, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Artisan Writing Table conditions (Ref 100137)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100862, 39342, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100862, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100862, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100862, 43108, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100862, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100862, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Master Writing Table conditions (Ref 100138)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100861, 39342, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100861, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100861, 43108, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100861, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Grand Master Writing Table conditions (Ref 100139)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100860, 39342, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100860, 43108, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Nightmare Vine');


-- Mana Thistle - Journeyman Writing Table conditions (Ref 100140)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100859, 39342, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100859, 39342, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100859, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100859, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100859, 43108, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100859, 43108, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100859, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100859, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');

-- Mana Thistle - Artisan Writing Table conditions (Ref 100141)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100858, 39342, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100858, 39342, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100858, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100858, 43108, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100858, 43108, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100858, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');

-- Mana Thistle - Master Writing Table conditions (Ref 100142)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100857, 39342, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100857, 39342, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100857, 43108, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100857, 43108, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');

-- Mana Thistle - Grand Master Writing Table conditions (Ref 100143)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100856, 39342, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100856, 43108, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mana Thistle');


-- Goldclover - Journeyman Writing Table conditions (Ref 100144)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100855, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100855, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100855, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100855, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100855, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100855, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100855, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100855, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');

-- Goldclover - Artisan Writing Table conditions (Ref 100145)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100854, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100854, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100854, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100854, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100854, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100854, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');

-- Goldclover - Master Writing Table conditions (Ref 100146)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100853, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100853, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100853, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100853, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');

-- Goldclover - Grand Master Writing Table conditions (Ref 100147)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100852, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100852, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldclover');


-- Adder's Tongue - Journeyman Writing Table conditions (Ref 100148)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100851, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100851, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100851, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100851, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100851, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100851, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100851, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100851, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Artisan Writing Table conditions (Ref 100149)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100850, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100850, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100850, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100850, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100850, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100850, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Master Writing Table conditions (Ref 100150)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100849, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100849, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100849, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100849, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Grand Master Writing Table conditions (Ref 100151)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100848, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100848, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Adder''s Tongue');


-- Tiger Lily - Journeyman Writing Table conditions (Ref 100152)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100847, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100847, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100847, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100847, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100847, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100847, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100847, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100847, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');

-- Tiger Lily - Artisan Writing Table conditions (Ref 100153)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100846, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100846, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100846, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100846, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100846, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100846, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');

-- Tiger Lily - Master Writing Table conditions (Ref 100154)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100845, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100845, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100845, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100845, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');

-- Tiger Lily - Grand Master Writing Table conditions (Ref 100155)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100844, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100844, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Tiger Lily');


-- Lichbloom - Journeyman Writing Table conditions (Ref 100156)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100843, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100843, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100843, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100843, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100843, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100843, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100843, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100843, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');

-- Lichbloom - Artisan Writing Table conditions (Ref 100157)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100842, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100842, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100842, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100842, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100842, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100842, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');

-- Lichbloom - Master Writing Table conditions (Ref 100158)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100841, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100841, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100841, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100841, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');

-- Lichbloom - Grand Master Writing Table conditions (Ref 100159)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100840, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100840, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Lichbloom');


-- Icethorn - Journeyman Writing Table conditions (Ref 100160)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100839, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100839, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100839, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100839, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100839, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100839, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100839, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100839, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');

-- Icethorn - Artisan Writing Table conditions (Ref 100161)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100838, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100838, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100838, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100838, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100838, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100838, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');

-- Icethorn - Master Writing Table conditions (Ref 100162)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100837, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100837, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100837, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100837, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');

-- Icethorn - Grand Master Writing Table conditions (Ref 100163)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100836, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100836, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icethorn');


-- Talandra's Rose - Journeyman Writing Table conditions (Ref 100164)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100835, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100835, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100835, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100835, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100835, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100835, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100835, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100835, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Artisan Writing Table conditions (Ref 100165)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100834, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100834, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100834, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100834, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100834, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100834, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Master Writing Table conditions (Ref 100166)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100833, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100833, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100833, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100833, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Grand Master Writing Table conditions (Ref 100167)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100832, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100832, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Talandra''s Rose');


-- Deadnettle - Journeyman Writing Table conditions (Ref 100168)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100831, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100831, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100831, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100831, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100831, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100831, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100831, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100831, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Deadnettle');

-- Deadnettle - Artisan Writing Table conditions (Ref 100169)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100830, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100830, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100830, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100830, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100830, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100830, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Deadnettle');

-- Deadnettle - Master Writing Table conditions (Ref 100170)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100829, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100829, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100829, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100829, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Deadnettle');

-- Deadnettle - Grand Master Writing Table conditions (Ref 100171)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100828, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100828, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Deadnettle');


-- Fire Seed - Journeyman Writing Table conditions (Ref 100172)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100827, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100827, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100827, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100827, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100827, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100827, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100827, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100827, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Seed');

-- Fire Seed - Artisan Writing Table conditions (Ref 100173)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100826, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100826, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100826, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100826, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100826, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100826, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Seed');

-- Fire Seed - Master Writing Table conditions (Ref 100174)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100825, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100825, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100825, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100825, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Seed');

-- Fire Seed - Grand Master Writing Table conditions (Ref 100175)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100824, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100824, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Seed');


-- Fire Leaf - Journeyman Writing Table conditions (Ref 100176)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100823, 39343, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100823, 39343, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100823, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100823, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100823, 43109, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100823, 43109, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100823, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100823, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Leaf');

-- Fire Leaf - Artisan Writing Table conditions (Ref 100177)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100822, 39343, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100822, 39343, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100822, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100822, 43109, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100822, 43109, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100822, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Leaf');

-- Fire Leaf - Master Writing Table conditions (Ref 100178)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100821, 39343, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100821, 39343, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100821, 43109, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100821, 43109, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Leaf');

-- Fire Leaf - Grand Master Writing Table conditions (Ref 100179)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100820, 39343, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100820, 43109, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Leaf');


-- Done!
