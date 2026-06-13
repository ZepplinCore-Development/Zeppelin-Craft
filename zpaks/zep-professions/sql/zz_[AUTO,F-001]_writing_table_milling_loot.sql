-- Found 45 unique milling loot tables

-- =====================================================
-- WRITING TABLE BONUS YIELD SYSTEM (milling)
-- =====================================================
-- Reference loot tables that duplicate milling loot
-- Provides a bonus 'second roll' when milling with a Writing Table
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 100000 AND 100999;
DELETE FROM milling_loot_template WHERE Reference BETWEEN 100000 AND 100999;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 100000 AND 100999;

-- Silverleaf (Entry: 765)
-- Silverleaf - Journeyman Writing Table Bonus (Ref 100000)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100000, 90000000, 96000, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100000, 90000001, 96001, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100000, 90000002, 96002, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100000, 90000003, 96003, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100000, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Silverleaf - Artisan Writing Table Bonus (Ref 100001)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100001, 90000000, 96000, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100001, 90000001, 96001, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100001, 90000002, 96002, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100001, 90000003, 96003, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100001, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Silverleaf - Master Writing Table Bonus (Ref 100002)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100002, 90000000, 96000, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100002, 90000001, 96001, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100002, 90000002, 96002, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100002, 90000003, 96003, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100002, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Silverleaf - Grand Master Writing Table Bonus (Ref 100003)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100003, 90000000, 96000, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100003, 90000001, 96001, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100003, 90000002, 96002, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100003, 90000003, 96003, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100003, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Mageroyal (Entry: 785)
-- Mageroyal - Journeyman Writing Table Bonus (Ref 100004)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100004, 90000000, 96004, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100004, 90000001, 96005, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100004, 90000002, 96006, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100004, 90000003, 96007, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100004, 90000004, 11901, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Mageroyal - Artisan Writing Table Bonus (Ref 100005)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100005, 90000000, 96004, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100005, 90000001, 96005, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100005, 90000002, 96006, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100005, 90000003, 96007, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100005, 90000004, 11901, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Mageroyal - Master Writing Table Bonus (Ref 100006)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100006, 90000000, 96004, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100006, 90000001, 96005, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100006, 90000002, 96006, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100006, 90000003, 96007, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100006, 90000004, 11901, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Mageroyal - Grand Master Writing Table Bonus (Ref 100007)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100007, 90000000, 96004, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100007, 90000001, 96005, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100007, 90000002, 96006, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100007, 90000003, 96007, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100007, 90000004, 11901, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Peacebloom (Entry: 2447)
-- Peacebloom - Journeyman Writing Table Bonus (Ref 100008)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100008, 90000000, 96008, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100008, 90000001, 96009, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100008, 90000002, 96010, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100008, 90000003, 96011, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100008, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Peacebloom - Artisan Writing Table Bonus (Ref 100009)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100009, 90000000, 96008, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100009, 90000001, 96009, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100009, 90000002, 96010, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100009, 90000003, 96011, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100009, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Peacebloom - Master Writing Table Bonus (Ref 100010)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100010, 90000000, 96008, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100010, 90000001, 96009, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100010, 90000002, 96010, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100010, 90000003, 96011, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100010, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Peacebloom - Grand Master Writing Table Bonus (Ref 100011)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100011, 90000000, 96008, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100011, 90000001, 96009, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100011, 90000002, 96010, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100011, 90000003, 96011, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100011, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Earthroot (Entry: 2449)
-- Earthroot - Journeyman Writing Table Bonus (Ref 100012)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100012, 90000000, 96012, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100012, 90000001, 96013, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100012, 90000002, 96014, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100012, 90000003, 96015, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100012, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Earthroot - Artisan Writing Table Bonus (Ref 100013)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100013, 90000000, 96012, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100013, 90000001, 96013, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100013, 90000002, 96014, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100013, 90000003, 96015, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100013, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Earthroot - Master Writing Table Bonus (Ref 100014)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100014, 90000000, 96012, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100014, 90000001, 96013, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100014, 90000002, 96014, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100014, 90000003, 96015, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100014, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Earthroot - Grand Master Writing Table Bonus (Ref 100015)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100015, 90000000, 96012, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100015, 90000001, 96013, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100015, 90000002, 96014, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100015, 90000003, 96015, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100015, 90000004, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Briarthorn (Entry: 2450)
-- Briarthorn - Journeyman Writing Table Bonus (Ref 100016)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100016, 90000000, 96016, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100016, 90000001, 96017, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100016, 90000002, 96018, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100016, 90000003, 96019, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100016, 90000004, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Briarthorn - Artisan Writing Table Bonus (Ref 100017)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100017, 90000000, 96016, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100017, 90000001, 96017, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100017, 90000002, 96018, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100017, 90000003, 96019, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100017, 90000004, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Briarthorn - Master Writing Table Bonus (Ref 100018)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100018, 90000000, 96016, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100018, 90000001, 96017, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100018, 90000002, 96018, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100018, 90000003, 96019, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100018, 90000004, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Briarthorn - Grand Master Writing Table Bonus (Ref 100019)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100019, 90000000, 96016, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100019, 90000001, 96017, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100019, 90000002, 96018, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100019, 90000003, 96019, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100019, 90000004, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Swiftthistle (Entry: 2452)
-- Swiftthistle - Journeyman Writing Table Bonus (Ref 100020)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100020, 90000000, 96020, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100020, 90000001, 96021, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100020, 90000002, 96022, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100020, 90000003, 96023, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100020, 90000004, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Swiftthistle - Artisan Writing Table Bonus (Ref 100021)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100021, 90000000, 96020, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100021, 90000001, 96021, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100021, 90000002, 96022, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100021, 90000003, 96023, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100021, 90000004, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Swiftthistle - Master Writing Table Bonus (Ref 100022)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100022, 90000000, 96020, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100022, 90000001, 96021, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100022, 90000002, 96022, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100022, 90000003, 96023, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100022, 90000004, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Swiftthistle - Grand Master Writing Table Bonus (Ref 100023)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100023, 90000000, 96020, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100023, 90000001, 96021, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100023, 90000002, 96022, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100023, 90000003, 96023, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100023, 90000004, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Bruiseweed (Entry: 2453)
-- Bruiseweed - Journeyman Writing Table Bonus (Ref 100024)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100024, 90000000, 96024, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100024, 90000001, 96025, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100024, 90000002, 96026, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100024, 90000003, 96027, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100024, 90000004, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Bruiseweed - Artisan Writing Table Bonus (Ref 100025)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100025, 90000000, 96024, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100025, 90000001, 96025, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100025, 90000002, 96026, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100025, 90000003, 96027, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100025, 90000004, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Bruiseweed - Master Writing Table Bonus (Ref 100026)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100026, 90000000, 96024, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100026, 90000001, 96025, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100026, 90000002, 96026, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100026, 90000003, 96027, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100026, 90000004, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Bruiseweed - Grand Master Writing Table Bonus (Ref 100027)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100027, 90000000, 96024, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100027, 90000001, 96025, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100027, 90000002, 96026, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100027, 90000003, 96027, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100027, 90000004, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Wild Steelbloom (Entry: 3355)
-- Wild Steelbloom - Journeyman Writing Table Bonus (Ref 100028)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100028, 90000000, 96028, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100028, 90000001, 96029, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100028, 90000002, 96030, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100028, 90000003, 96031, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100028, 90000004, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Wild Steelbloom - Artisan Writing Table Bonus (Ref 100029)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100029, 90000000, 96028, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100029, 90000001, 96029, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100029, 90000002, 96030, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100029, 90000003, 96031, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100029, 90000004, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Wild Steelbloom - Master Writing Table Bonus (Ref 100030)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100030, 90000000, 96028, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100030, 90000001, 96029, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100030, 90000002, 96030, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100030, 90000003, 96031, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100030, 90000004, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Wild Steelbloom - Grand Master Writing Table Bonus (Ref 100031)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100031, 90000000, 96028, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100031, 90000001, 96029, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100031, 90000002, 96030, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100031, 90000003, 96031, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100031, 90000004, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Kingsblood (Entry: 3356)
-- Kingsblood - Journeyman Writing Table Bonus (Ref 100032)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100032, 90000000, 96032, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100032, 90000001, 96033, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100032, 90000002, 96034, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100032, 90000003, 96035, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100032, 90000004, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Kingsblood - Artisan Writing Table Bonus (Ref 100033)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100033, 90000000, 96032, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100033, 90000001, 96033, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100033, 90000002, 96034, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100033, 90000003, 96035, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100033, 90000004, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Kingsblood - Master Writing Table Bonus (Ref 100034)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100034, 90000000, 96032, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100034, 90000001, 96033, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100034, 90000002, 96034, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100034, 90000003, 96035, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100034, 90000004, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Kingsblood - Grand Master Writing Table Bonus (Ref 100035)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100035, 90000000, 96032, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100035, 90000001, 96033, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100035, 90000002, 96034, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100035, 90000003, 96035, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100035, 90000004, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Liferoot (Entry: 3357)
-- Liferoot - Journeyman Writing Table Bonus (Ref 100036)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100036, 90000000, 96036, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100036, 90000001, 96037, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100036, 90000002, 96038, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100036, 90000003, 96039, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100036, 90000004, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Liferoot - Artisan Writing Table Bonus (Ref 100037)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100037, 90000000, 96036, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100037, 90000001, 96037, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100037, 90000002, 96038, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100037, 90000003, 96039, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100037, 90000004, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Liferoot - Master Writing Table Bonus (Ref 100038)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100038, 90000000, 96036, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100038, 90000001, 96037, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100038, 90000002, 96038, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100038, 90000003, 96039, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100038, 90000004, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Liferoot - Grand Master Writing Table Bonus (Ref 100039)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100039, 90000000, 96036, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100039, 90000001, 96037, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100039, 90000002, 96038, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100039, 90000003, 96039, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100039, 90000004, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Khadgar's Whisker (Entry: 3358)
-- Khadgar's Whisker - Journeyman Writing Table Bonus (Ref 100040)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100040, 90000000, 96040, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100040, 90000001, 96041, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100040, 90000002, 96042, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100040, 90000003, 96043, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100040, 90000004, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Khadgar's Whisker - Artisan Writing Table Bonus (Ref 100041)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100041, 90000000, 96040, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100041, 90000001, 96041, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100041, 90000002, 96042, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100041, 90000003, 96043, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100041, 90000004, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Khadgar's Whisker - Master Writing Table Bonus (Ref 100042)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100042, 90000000, 96040, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100042, 90000001, 96041, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100042, 90000002, 96042, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100042, 90000003, 96043, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100042, 90000004, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Khadgar's Whisker - Grand Master Writing Table Bonus (Ref 100043)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100043, 90000000, 96040, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100043, 90000001, 96041, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100043, 90000002, 96042, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100043, 90000003, 96043, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100043, 90000004, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Grave Moss (Entry: 3369)
-- Grave Moss - Journeyman Writing Table Bonus (Ref 100044)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100044, 90000000, 96044, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100044, 90000001, 96045, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100044, 90000002, 96046, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100044, 90000003, 96047, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100044, 90000004, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Grave Moss - Artisan Writing Table Bonus (Ref 100045)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100045, 90000000, 96044, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100045, 90000001, 96045, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100045, 90000002, 96046, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100045, 90000003, 96047, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100045, 90000004, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Grave Moss - Master Writing Table Bonus (Ref 100046)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100046, 90000000, 96044, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100046, 90000001, 96045, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100046, 90000002, 96046, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100046, 90000003, 96047, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100046, 90000004, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Grave Moss - Grand Master Writing Table Bonus (Ref 100047)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100047, 90000000, 96044, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100047, 90000001, 96045, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100047, 90000002, 96046, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100047, 90000003, 96047, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100047, 90000004, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Fadeleaf (Entry: 3818)
-- Fadeleaf - Journeyman Writing Table Bonus (Ref 100048)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100048, 90000000, 96048, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100048, 90000001, 96049, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100048, 90000002, 96050, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100048, 90000003, 96051, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100048, 90000004, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Fadeleaf - Artisan Writing Table Bonus (Ref 100049)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100049, 90000000, 96048, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100049, 90000001, 96049, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100049, 90000002, 96050, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100049, 90000003, 96051, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100049, 90000004, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Fadeleaf - Master Writing Table Bonus (Ref 100050)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100050, 90000000, 96048, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100050, 90000001, 96049, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100050, 90000002, 96050, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100050, 90000003, 96051, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100050, 90000004, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Fadeleaf - Grand Master Writing Table Bonus (Ref 100051)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100051, 90000000, 96048, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100051, 90000001, 96049, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100051, 90000002, 96050, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100051, 90000003, 96051, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100051, 90000004, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Wintersbite (Entry: 3819)
-- Wintersbite - Journeyman Writing Table Bonus (Ref 100052)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100052, 90000000, 96052, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100052, 90000001, 96053, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100052, 90000002, 96054, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100052, 90000003, 96055, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100052, 90000004, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Wintersbite - Artisan Writing Table Bonus (Ref 100053)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100053, 90000000, 96052, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100053, 90000001, 96053, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100053, 90000002, 96054, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100053, 90000003, 96055, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100053, 90000004, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Wintersbite - Master Writing Table Bonus (Ref 100054)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100054, 90000000, 96052, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100054, 90000001, 96053, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100054, 90000002, 96054, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100054, 90000003, 96055, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100054, 90000004, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Wintersbite - Grand Master Writing Table Bonus (Ref 100055)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100055, 90000000, 96052, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100055, 90000001, 96053, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100055, 90000002, 96054, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100055, 90000003, 96055, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100055, 90000004, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Stranglekelp (Entry: 3820)
-- Stranglekelp - Journeyman Writing Table Bonus (Ref 100056)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100056, 90000000, 96056, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100056, 90000001, 96057, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100056, 90000002, 96058, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100056, 90000003, 96059, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100056, 90000004, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Stranglekelp - Artisan Writing Table Bonus (Ref 100057)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100057, 90000000, 96056, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100057, 90000001, 96057, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100057, 90000002, 96058, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100057, 90000003, 96059, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100057, 90000004, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Stranglekelp - Master Writing Table Bonus (Ref 100058)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100058, 90000000, 96056, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100058, 90000001, 96057, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100058, 90000002, 96058, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100058, 90000003, 96059, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100058, 90000004, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Stranglekelp - Grand Master Writing Table Bonus (Ref 100059)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100059, 90000000, 96056, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100059, 90000001, 96057, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100059, 90000002, 96058, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100059, 90000003, 96059, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100059, 90000004, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Goldthorn (Entry: 3821)
-- Goldthorn - Journeyman Writing Table Bonus (Ref 100060)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100060, 90000000, 96060, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100060, 90000001, 96061, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100060, 90000002, 96062, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100060, 90000003, 96063, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100060, 90000004, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Goldthorn - Artisan Writing Table Bonus (Ref 100061)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100061, 90000000, 96060, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100061, 90000001, 96061, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100061, 90000002, 96062, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100061, 90000003, 96063, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100061, 90000004, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Goldthorn - Master Writing Table Bonus (Ref 100062)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100062, 90000000, 96060, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100062, 90000001, 96061, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100062, 90000002, 96062, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100062, 90000003, 96063, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100062, 90000004, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Goldthorn - Grand Master Writing Table Bonus (Ref 100063)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100063, 90000000, 96060, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100063, 90000001, 96061, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100063, 90000002, 96062, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100063, 90000003, 96063, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100063, 90000004, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Firebloom (Entry: 4625)
-- Firebloom - Journeyman Writing Table Bonus (Ref 100064)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100064, 90000000, 96064, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100064, 90000001, 96065, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100064, 90000002, 96066, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100064, 90000003, 96067, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100064, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Firebloom - Artisan Writing Table Bonus (Ref 100065)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100065, 90000000, 96064, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100065, 90000001, 96065, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100065, 90000002, 96066, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100065, 90000003, 96067, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100065, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Firebloom - Master Writing Table Bonus (Ref 100066)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100066, 90000000, 96064, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100066, 90000001, 96065, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100066, 90000002, 96066, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100066, 90000003, 96067, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100066, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Firebloom - Grand Master Writing Table Bonus (Ref 100067)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100067, 90000000, 96064, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100067, 90000001, 96065, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100067, 90000002, 96066, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100067, 90000003, 96067, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100067, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Purple Lotus (Entry: 8831)
-- Purple Lotus - Journeyman Writing Table Bonus (Ref 100068)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100068, 90000000, 96068, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100068, 90000001, 96069, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100068, 90000002, 96070, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100068, 90000003, 96071, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100068, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Purple Lotus - Artisan Writing Table Bonus (Ref 100069)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100069, 90000000, 96068, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100069, 90000001, 96069, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100069, 90000002, 96070, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100069, 90000003, 96071, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100069, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Purple Lotus - Master Writing Table Bonus (Ref 100070)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100070, 90000000, 96068, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100070, 90000001, 96069, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100070, 90000002, 96070, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100070, 90000003, 96071, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100070, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Purple Lotus - Grand Master Writing Table Bonus (Ref 100071)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100071, 90000000, 96068, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100071, 90000001, 96069, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100071, 90000002, 96070, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100071, 90000003, 96071, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100071, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Arthas' Tears (Entry: 8836)
-- Arthas' Tears - Journeyman Writing Table Bonus (Ref 100072)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100072, 90000000, 96072, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100072, 90000001, 96073, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100072, 90000002, 96074, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100072, 90000003, 96075, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100072, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Arthas' Tears - Artisan Writing Table Bonus (Ref 100073)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100073, 90000000, 96072, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100073, 90000001, 96073, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100073, 90000002, 96074, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100073, 90000003, 96075, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100073, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Arthas' Tears - Master Writing Table Bonus (Ref 100074)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100074, 90000000, 96072, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100074, 90000001, 96073, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100074, 90000002, 96074, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100074, 90000003, 96075, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100074, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Arthas' Tears - Grand Master Writing Table Bonus (Ref 100075)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100075, 90000000, 96072, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100075, 90000001, 96073, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100075, 90000002, 96074, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100075, 90000003, 96075, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100075, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Sungrass (Entry: 8838)
-- Sungrass - Journeyman Writing Table Bonus (Ref 100076)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100076, 90000000, 96076, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100076, 90000001, 96077, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100076, 90000002, 96078, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100076, 90000003, 96079, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100076, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Sungrass - Artisan Writing Table Bonus (Ref 100077)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100077, 90000000, 96076, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100077, 90000001, 96077, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100077, 90000002, 96078, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100077, 90000003, 96079, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100077, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Sungrass - Master Writing Table Bonus (Ref 100078)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100078, 90000000, 96076, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100078, 90000001, 96077, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100078, 90000002, 96078, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100078, 90000003, 96079, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100078, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Sungrass - Grand Master Writing Table Bonus (Ref 100079)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100079, 90000000, 96076, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100079, 90000001, 96077, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100079, 90000002, 96078, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100079, 90000003, 96079, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100079, 90000004, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Blindweed (Entry: 8839)
-- Blindweed - Journeyman Writing Table Bonus (Ref 100080)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100080, 90000000, 96080, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100080, 90000001, 96081, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100080, 90000002, 96082, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100080, 90000003, 96083, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100080, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Blindweed - Artisan Writing Table Bonus (Ref 100081)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100081, 90000000, 96080, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100081, 90000001, 96081, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100081, 90000002, 96082, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100081, 90000003, 96083, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100081, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Blindweed - Master Writing Table Bonus (Ref 100082)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100082, 90000000, 96080, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100082, 90000001, 96081, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100082, 90000002, 96082, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100082, 90000003, 96083, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100082, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Blindweed - Grand Master Writing Table Bonus (Ref 100083)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100083, 90000000, 96080, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100083, 90000001, 96081, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100083, 90000002, 96082, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100083, 90000003, 96083, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100083, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Ghost Mushroom (Entry: 8845)
-- Ghost Mushroom - Journeyman Writing Table Bonus (Ref 100084)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100084, 90000000, 96084, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100084, 90000001, 96085, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100084, 90000002, 96086, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100084, 90000003, 96087, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100084, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Ghost Mushroom - Artisan Writing Table Bonus (Ref 100085)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100085, 90000000, 96084, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100085, 90000001, 96085, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100085, 90000002, 96086, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100085, 90000003, 96087, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100085, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Ghost Mushroom - Master Writing Table Bonus (Ref 100086)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100086, 90000000, 96084, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100086, 90000001, 96085, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100086, 90000002, 96086, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100086, 90000003, 96087, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100086, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Ghost Mushroom - Grand Master Writing Table Bonus (Ref 100087)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100087, 90000000, 96084, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100087, 90000001, 96085, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100087, 90000002, 96086, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100087, 90000003, 96087, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100087, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Gromsblood (Entry: 8846)
-- Gromsblood - Journeyman Writing Table Bonus (Ref 100088)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100088, 90000000, 96088, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100088, 90000001, 96089, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100088, 90000002, 96090, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100088, 90000003, 96091, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100088, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Gromsblood - Artisan Writing Table Bonus (Ref 100089)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100089, 90000000, 96088, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100089, 90000001, 96089, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100089, 90000002, 96090, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100089, 90000003, 96091, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100089, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Gromsblood - Master Writing Table Bonus (Ref 100090)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100090, 90000000, 96088, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100090, 90000001, 96089, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100090, 90000002, 96090, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100090, 90000003, 96091, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100090, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Gromsblood - Grand Master Writing Table Bonus (Ref 100091)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100091, 90000000, 96088, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100091, 90000001, 96089, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100091, 90000002, 96090, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100091, 90000003, 96091, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100091, 90000004, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Dreamfoil (Entry: 13463)
-- Dreamfoil - Journeyman Writing Table Bonus (Ref 100092)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100092, 90000000, 96092, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100092, 90000001, 96093, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100092, 90000002, 96094, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100092, 90000003, 96095, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100092, 90000004, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Dreamfoil - Artisan Writing Table Bonus (Ref 100093)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100093, 90000000, 96092, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100093, 90000001, 96093, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100093, 90000002, 96094, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100093, 90000003, 96095, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100093, 90000004, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Dreamfoil - Master Writing Table Bonus (Ref 100094)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100094, 90000000, 96092, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100094, 90000001, 96093, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100094, 90000002, 96094, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100094, 90000003, 96095, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100094, 90000004, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Dreamfoil - Grand Master Writing Table Bonus (Ref 100095)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100095, 90000000, 96092, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100095, 90000001, 96093, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100095, 90000002, 96094, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100095, 90000003, 96095, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100095, 90000004, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Golden Sansam (Entry: 13464)
-- Golden Sansam - Journeyman Writing Table Bonus (Ref 100096)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100096, 90000000, 96096, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100096, 90000001, 96097, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100096, 90000002, 96098, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100096, 90000003, 96099, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100096, 90000004, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Golden Sansam - Artisan Writing Table Bonus (Ref 100097)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100097, 90000000, 96096, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100097, 90000001, 96097, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100097, 90000002, 96098, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100097, 90000003, 96099, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100097, 90000004, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Golden Sansam - Master Writing Table Bonus (Ref 100098)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100098, 90000000, 96096, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100098, 90000001, 96097, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100098, 90000002, 96098, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100098, 90000003, 96099, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100098, 90000004, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Golden Sansam - Grand Master Writing Table Bonus (Ref 100099)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100099, 90000000, 96096, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100099, 90000001, 96097, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100099, 90000002, 96098, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100099, 90000003, 96099, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100099, 90000004, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Mountain Silversage (Entry: 13465)
-- Mountain Silversage - Journeyman Writing Table Bonus (Ref 100100)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100100, 90000000, 96100, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100100, 90000001, 96101, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100100, 90000002, 96102, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100100, 90000003, 96103, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100100, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Mountain Silversage - Artisan Writing Table Bonus (Ref 100101)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100101, 90000000, 96100, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100101, 90000001, 96101, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100101, 90000002, 96102, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100101, 90000003, 96103, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100101, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Mountain Silversage - Master Writing Table Bonus (Ref 100102)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100102, 90000000, 96100, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100102, 90000001, 96101, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100102, 90000002, 96102, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100102, 90000003, 96103, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100102, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Mountain Silversage - Grand Master Writing Table Bonus (Ref 100103)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100103, 90000000, 96100, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100103, 90000001, 96101, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100103, 90000002, 96102, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100103, 90000003, 96103, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100103, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Plaguebloom (Entry: 13466)
-- Plaguebloom - Journeyman Writing Table Bonus (Ref 100104)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100104, 90000000, 96104, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100104, 90000001, 96105, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100104, 90000002, 96106, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100104, 90000003, 96107, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100104, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Plaguebloom - Artisan Writing Table Bonus (Ref 100105)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100105, 90000000, 96104, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100105, 90000001, 96105, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100105, 90000002, 96106, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100105, 90000003, 96107, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100105, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Plaguebloom - Master Writing Table Bonus (Ref 100106)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100106, 90000000, 96104, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100106, 90000001, 96105, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100106, 90000002, 96106, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100106, 90000003, 96107, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100106, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Plaguebloom - Grand Master Writing Table Bonus (Ref 100107)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100107, 90000000, 96104, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100107, 90000001, 96105, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100107, 90000002, 96106, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100107, 90000003, 96107, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100107, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Icecap (Entry: 13467)
-- Icecap - Journeyman Writing Table Bonus (Ref 100108)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100108, 90000000, 96108, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100108, 90000001, 96109, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100108, 90000002, 96110, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100108, 90000003, 96111, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100108, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Icecap - Artisan Writing Table Bonus (Ref 100109)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100109, 90000000, 96108, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100109, 90000001, 96109, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100109, 90000002, 96110, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100109, 90000003, 96111, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100109, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Icecap - Master Writing Table Bonus (Ref 100110)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100110, 90000000, 96108, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100110, 90000001, 96109, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100110, 90000002, 96110, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100110, 90000003, 96111, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100110, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Icecap - Grand Master Writing Table Bonus (Ref 100111)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100111, 90000000, 96108, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100111, 90000001, 96109, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100111, 90000002, 96110, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100111, 90000003, 96111, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100111, 90000004, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Felweed (Entry: 22785)
-- Felweed - Journeyman Writing Table Bonus (Ref 100112)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100112, 90000000, 96112, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100112, 90000001, 96113, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100112, 90000002, 96114, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100112, 90000003, 96115, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100112, 90000004, 11913, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Felweed - Artisan Writing Table Bonus (Ref 100113)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100113, 90000000, 96112, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100113, 90000001, 96113, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100113, 90000002, 96114, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100113, 90000003, 96115, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100113, 90000004, 11913, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Felweed - Master Writing Table Bonus (Ref 100114)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100114, 90000000, 96112, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100114, 90000001, 96113, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100114, 90000002, 96114, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100114, 90000003, 96115, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100114, 90000004, 11913, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Felweed - Grand Master Writing Table Bonus (Ref 100115)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100115, 90000000, 96112, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100115, 90000001, 96113, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100115, 90000002, 96114, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100115, 90000003, 96115, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100115, 90000004, 11913, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Dreaming Glory (Entry: 22786)
-- Dreaming Glory - Journeyman Writing Table Bonus (Ref 100116)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100116, 90000000, 96116, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100116, 90000001, 96117, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100116, 90000002, 96118, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100116, 90000003, 96119, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100116, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Dreaming Glory - Artisan Writing Table Bonus (Ref 100117)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100117, 90000000, 96116, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100117, 90000001, 96117, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100117, 90000002, 96118, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100117, 90000003, 96119, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100117, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Dreaming Glory - Master Writing Table Bonus (Ref 100118)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100118, 90000000, 96116, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100118, 90000001, 96117, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100118, 90000002, 96118, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100118, 90000003, 96119, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100118, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Dreaming Glory - Grand Master Writing Table Bonus (Ref 100119)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100119, 90000000, 96116, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100119, 90000001, 96117, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100119, 90000002, 96118, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100119, 90000003, 96119, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100119, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Ragveil (Entry: 22787)
-- Ragveil - Journeyman Writing Table Bonus (Ref 100120)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100120, 90000000, 96120, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100120, 90000001, 96121, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100120, 90000002, 96122, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100120, 90000003, 96123, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100120, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Ragveil - Artisan Writing Table Bonus (Ref 100121)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100121, 90000000, 96120, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100121, 90000001, 96121, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100121, 90000002, 96122, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100121, 90000003, 96123, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100121, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Ragveil - Master Writing Table Bonus (Ref 100122)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100122, 90000000, 96120, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100122, 90000001, 96121, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100122, 90000002, 96122, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100122, 90000003, 96123, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100122, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Ragveil - Grand Master Writing Table Bonus (Ref 100123)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100123, 90000000, 96120, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100123, 90000001, 96121, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100123, 90000002, 96122, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100123, 90000003, 96123, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100123, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Terocone (Entry: 22789)
-- Terocone - Journeyman Writing Table Bonus (Ref 100124)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100124, 90000000, 96124, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100124, 90000001, 96125, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100124, 90000002, 96126, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100124, 90000003, 96127, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100124, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Terocone - Artisan Writing Table Bonus (Ref 100125)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100125, 90000000, 96124, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100125, 90000001, 96125, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100125, 90000002, 96126, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100125, 90000003, 96127, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100125, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Terocone - Master Writing Table Bonus (Ref 100126)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100126, 90000000, 96124, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100126, 90000001, 96125, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100126, 90000002, 96126, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100126, 90000003, 96127, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100126, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Terocone - Grand Master Writing Table Bonus (Ref 100127)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100127, 90000000, 96124, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100127, 90000001, 96125, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100127, 90000002, 96126, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100127, 90000003, 96127, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100127, 90000004, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Ancient Lichen (Entry: 22790)
-- Ancient Lichen - Journeyman Writing Table Bonus (Ref 100128)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100128, 90000000, 96128, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100128, 90000001, 96129, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100128, 90000002, 96130, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100128, 90000003, 96131, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100128, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Ancient Lichen - Artisan Writing Table Bonus (Ref 100129)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100129, 90000000, 96128, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100129, 90000001, 96129, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100129, 90000002, 96130, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100129, 90000003, 96131, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100129, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Ancient Lichen - Master Writing Table Bonus (Ref 100130)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100130, 90000000, 96128, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100130, 90000001, 96129, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100130, 90000002, 96130, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100130, 90000003, 96131, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100130, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Ancient Lichen - Grand Master Writing Table Bonus (Ref 100131)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100131, 90000000, 96128, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100131, 90000001, 96129, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100131, 90000002, 96130, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100131, 90000003, 96131, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100131, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Netherbloom (Entry: 22791)
-- Netherbloom - Journeyman Writing Table Bonus (Ref 100132)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100132, 90000000, 96132, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100132, 90000001, 96133, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100132, 90000002, 96134, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100132, 90000003, 96135, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100132, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Netherbloom - Artisan Writing Table Bonus (Ref 100133)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100133, 90000000, 96132, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100133, 90000001, 96133, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100133, 90000002, 96134, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100133, 90000003, 96135, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100133, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Netherbloom - Master Writing Table Bonus (Ref 100134)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100134, 90000000, 96132, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100134, 90000001, 96133, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100134, 90000002, 96134, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100134, 90000003, 96135, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100134, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Netherbloom - Grand Master Writing Table Bonus (Ref 100135)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100135, 90000000, 96132, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100135, 90000001, 96133, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100135, 90000002, 96134, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100135, 90000003, 96135, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100135, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Nightmare Vine (Entry: 22792)
-- Nightmare Vine - Journeyman Writing Table Bonus (Ref 100136)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100136, 90000000, 96136, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100136, 90000001, 96137, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100136, 90000002, 96138, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100136, 90000003, 96139, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100136, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Nightmare Vine - Artisan Writing Table Bonus (Ref 100137)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100137, 90000000, 96136, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100137, 90000001, 96137, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100137, 90000002, 96138, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100137, 90000003, 96139, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100137, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Nightmare Vine - Master Writing Table Bonus (Ref 100138)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100138, 90000000, 96136, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100138, 90000001, 96137, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100138, 90000002, 96138, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100138, 90000003, 96139, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100138, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Nightmare Vine - Grand Master Writing Table Bonus (Ref 100139)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100139, 90000000, 96136, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100139, 90000001, 96137, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100139, 90000002, 96138, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100139, 90000003, 96139, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100139, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Mana Thistle (Entry: 22793)
-- Mana Thistle - Journeyman Writing Table Bonus (Ref 100140)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100140, 90000000, 96140, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100140, 90000001, 96141, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100140, 90000002, 96142, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100140, 90000003, 96143, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100140, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Mana Thistle - Artisan Writing Table Bonus (Ref 100141)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100141, 90000000, 96140, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100141, 90000001, 96141, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100141, 90000002, 96142, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100141, 90000003, 96143, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100141, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Mana Thistle - Master Writing Table Bonus (Ref 100142)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100142, 90000000, 96140, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100142, 90000001, 96141, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100142, 90000002, 96142, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100142, 90000003, 96143, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100142, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Mana Thistle - Grand Master Writing Table Bonus (Ref 100143)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100143, 90000000, 96140, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100143, 90000001, 96141, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100143, 90000002, 96142, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100143, 90000003, 96143, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100143, 90000004, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Goldclover (Entry: 36901)
-- Goldclover - Journeyman Writing Table Bonus (Ref 100144)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100144, 90000000, 96144, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100144, 90000001, 96145, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100144, 90000002, 96146, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100144, 90000003, 96147, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100144, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Goldclover - Artisan Writing Table Bonus (Ref 100145)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100145, 90000000, 96144, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100145, 90000001, 96145, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100145, 90000002, 96146, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100145, 90000003, 96147, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100145, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Goldclover - Master Writing Table Bonus (Ref 100146)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100146, 90000000, 96144, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100146, 90000001, 96145, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100146, 90000002, 96146, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100146, 90000003, 96147, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100146, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Goldclover - Grand Master Writing Table Bonus (Ref 100147)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100147, 90000000, 96144, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100147, 90000001, 96145, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100147, 90000002, 96146, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100147, 90000003, 96147, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100147, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Adder's Tongue (Entry: 36903)
-- Adder's Tongue - Journeyman Writing Table Bonus (Ref 100148)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100148, 90000000, 96148, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100148, 90000001, 96149, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100148, 90000002, 96150, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100148, 90000003, 96151, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100148, 90000004, 11918, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Adder's Tongue - Artisan Writing Table Bonus (Ref 100149)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100149, 90000000, 96148, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100149, 90000001, 96149, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100149, 90000002, 96150, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100149, 90000003, 96151, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100149, 90000004, 11918, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Adder's Tongue - Master Writing Table Bonus (Ref 100150)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100150, 90000000, 96148, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100150, 90000001, 96149, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100150, 90000002, 96150, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100150, 90000003, 96151, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100150, 90000004, 11918, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Adder's Tongue - Grand Master Writing Table Bonus (Ref 100151)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100151, 90000000, 96148, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100151, 90000001, 96149, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100151, 90000002, 96150, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100151, 90000003, 96151, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100151, 90000004, 11918, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Tiger Lily (Entry: 36904)
-- Tiger Lily - Journeyman Writing Table Bonus (Ref 100152)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100152, 90000000, 96152, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100152, 90000001, 96153, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100152, 90000002, 96154, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100152, 90000003, 96155, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100152, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Tiger Lily - Artisan Writing Table Bonus (Ref 100153)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100153, 90000000, 96152, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100153, 90000001, 96153, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100153, 90000002, 96154, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100153, 90000003, 96155, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100153, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Tiger Lily - Master Writing Table Bonus (Ref 100154)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100154, 90000000, 96152, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100154, 90000001, 96153, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100154, 90000002, 96154, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100154, 90000003, 96155, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100154, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Tiger Lily - Grand Master Writing Table Bonus (Ref 100155)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100155, 90000000, 96152, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100155, 90000001, 96153, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100155, 90000002, 96154, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100155, 90000003, 96155, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100155, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Lichbloom (Entry: 36905)
-- Lichbloom - Journeyman Writing Table Bonus (Ref 100156)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100156, 90000000, 96156, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100156, 90000001, 96157, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100156, 90000002, 96158, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100156, 90000003, 96159, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100156, 90000004, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Lichbloom - Artisan Writing Table Bonus (Ref 100157)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100157, 90000000, 96156, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100157, 90000001, 96157, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100157, 90000002, 96158, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100157, 90000003, 96159, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100157, 90000004, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Lichbloom - Master Writing Table Bonus (Ref 100158)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100158, 90000000, 96156, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100158, 90000001, 96157, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100158, 90000002, 96158, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100158, 90000003, 96159, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100158, 90000004, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Lichbloom - Grand Master Writing Table Bonus (Ref 100159)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100159, 90000000, 96156, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100159, 90000001, 96157, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100159, 90000002, 96158, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100159, 90000003, 96159, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100159, 90000004, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Icethorn (Entry: 36906)
-- Icethorn - Journeyman Writing Table Bonus (Ref 100160)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100160, 90000000, 96160, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100160, 90000001, 96161, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100160, 90000002, 96162, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100160, 90000003, 96163, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100160, 90000004, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Icethorn - Artisan Writing Table Bonus (Ref 100161)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100161, 90000000, 96160, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100161, 90000001, 96161, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100161, 90000002, 96162, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100161, 90000003, 96163, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100161, 90000004, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Icethorn - Master Writing Table Bonus (Ref 100162)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100162, 90000000, 96160, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100162, 90000001, 96161, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100162, 90000002, 96162, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100162, 90000003, 96163, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100162, 90000004, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Icethorn - Grand Master Writing Table Bonus (Ref 100163)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100163, 90000000, 96160, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100163, 90000001, 96161, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100163, 90000002, 96162, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100163, 90000003, 96163, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100163, 90000004, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Talandra's Rose (Entry: 36907)
-- Talandra's Rose - Journeyman Writing Table Bonus (Ref 100164)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100164, 90000000, 96164, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100164, 90000001, 96165, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100164, 90000002, 96166, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100164, 90000003, 96167, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100164, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Talandra's Rose - Artisan Writing Table Bonus (Ref 100165)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100165, 90000000, 96164, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100165, 90000001, 96165, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100165, 90000002, 96166, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100165, 90000003, 96167, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100165, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Talandra's Rose - Master Writing Table Bonus (Ref 100166)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100166, 90000000, 96164, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100166, 90000001, 96165, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100166, 90000002, 96166, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100166, 90000003, 96167, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100166, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Talandra's Rose - Grand Master Writing Table Bonus (Ref 100167)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100167, 90000000, 96164, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100167, 90000001, 96165, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100167, 90000002, 96166, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100167, 90000003, 96167, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100167, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Deadnettle (Entry: 37921)
-- Deadnettle - Journeyman Writing Table Bonus (Ref 100168)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100168, 90000000, 96168, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100168, 90000001, 96169, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100168, 90000002, 96170, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100168, 90000003, 96171, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100168, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Deadnettle - Artisan Writing Table Bonus (Ref 100169)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100169, 90000000, 96168, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100169, 90000001, 96169, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100169, 90000002, 96170, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100169, 90000003, 96171, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100169, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Deadnettle - Master Writing Table Bonus (Ref 100170)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100170, 90000000, 96168, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100170, 90000001, 96169, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100170, 90000002, 96170, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100170, 90000003, 96171, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100170, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Deadnettle - Grand Master Writing Table Bonus (Ref 100171)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100171, 90000000, 96168, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100171, 90000001, 96169, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100171, 90000002, 96170, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100171, 90000003, 96171, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100171, 90000004, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Fire Seed (Entry: 39969)
-- Fire Seed - Journeyman Writing Table Bonus (Ref 100172)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100172, 90000000, 96172, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100172, 90000001, 96173, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100172, 90000002, 96174, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100172, 90000003, 96175, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100172, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Fire Seed - Artisan Writing Table Bonus (Ref 100173)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100173, 90000000, 96172, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100173, 90000001, 96173, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100173, 90000002, 96174, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100173, 90000003, 96175, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100173, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Fire Seed - Master Writing Table Bonus (Ref 100174)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100174, 90000000, 96172, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100174, 90000001, 96173, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100174, 90000002, 96174, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100174, 90000003, 96175, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100174, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Fire Seed - Grand Master Writing Table Bonus (Ref 100175)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100175, 90000000, 96172, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100175, 90000001, 96173, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100175, 90000002, 96174, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100175, 90000003, 96175, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100175, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Fire Leaf (Entry: 39970)
-- Fire Leaf - Journeyman Writing Table Bonus (Ref 100176)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100176, 90000000, 96176, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100176, 90000001, 96177, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100176, 90000002, 96178, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100176, 90000003, 96179, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100176, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Fire Leaf - Artisan Writing Table Bonus (Ref 100177)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100177, 90000000, 96176, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100177, 90000001, 96177, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100177, 90000002, 96178, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100177, 90000003, 96179, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100177, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Fire Leaf - Master Writing Table Bonus (Ref 100178)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100178, 90000000, 96176, 10.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100178, 90000001, 96177, 20.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100178, 90000002, 96178, 30.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100178, 90000003, 96179, 40.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100178, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Fire Leaf - Grand Master Writing Table Bonus (Ref 100179)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100179, 90000000, 96176, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100179, 90000001, 96177, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100179, 90000002, 96178, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100179, 90000003, 96179, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (100179, 90000004, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


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
-- =====================================================

-- Silverleaf - Journeyman Writing Table conditions (Ref 100000)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100000, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');

-- Silverleaf - Artisan Writing Table conditions (Ref 100001)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100001, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');

-- Silverleaf - Master Writing Table conditions (Ref 100002)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100002, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');

-- Silverleaf - Grand Master Writing Table conditions (Ref 100003)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100003, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100003, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100003, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100003, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100003, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Silverleaf');


-- Mageroyal - Journeyman Writing Table conditions (Ref 100004)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100004, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');

-- Mageroyal - Artisan Writing Table conditions (Ref 100005)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100005, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');

-- Mageroyal - Master Writing Table conditions (Ref 100006)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100006, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');

-- Mageroyal - Grand Master Writing Table conditions (Ref 100007)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100007, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100007, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100007, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100007, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100007, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mageroyal');


-- Peacebloom - Journeyman Writing Table conditions (Ref 100008)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100008, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');

-- Peacebloom - Artisan Writing Table conditions (Ref 100009)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100009, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');

-- Peacebloom - Master Writing Table conditions (Ref 100010)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100010, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');

-- Peacebloom - Grand Master Writing Table conditions (Ref 100011)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100011, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100011, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100011, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100011, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100011, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Peacebloom');


-- Earthroot - Journeyman Writing Table conditions (Ref 100012)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100012, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');

-- Earthroot - Artisan Writing Table conditions (Ref 100013)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100013, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');

-- Earthroot - Master Writing Table conditions (Ref 100014)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100014, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');

-- Earthroot - Grand Master Writing Table conditions (Ref 100015)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100015, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100015, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100015, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100015, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100015, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Earthroot');


-- Briarthorn - Journeyman Writing Table conditions (Ref 100016)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100016, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');

-- Briarthorn - Artisan Writing Table conditions (Ref 100017)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100017, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');

-- Briarthorn - Master Writing Table conditions (Ref 100018)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100018, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');

-- Briarthorn - Grand Master Writing Table conditions (Ref 100019)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100019, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100019, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100019, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100019, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100019, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Briarthorn');


-- Swiftthistle - Journeyman Writing Table conditions (Ref 100020)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100020, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Swiftthistle');

-- Swiftthistle - Artisan Writing Table conditions (Ref 100021)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100021, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Swiftthistle');

-- Swiftthistle - Master Writing Table conditions (Ref 100022)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100022, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Swiftthistle');

-- Swiftthistle - Grand Master Writing Table conditions (Ref 100023)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100023, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100023, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100023, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100023, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100023, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Swiftthistle');


-- Bruiseweed - Journeyman Writing Table conditions (Ref 100024)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100024, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');

-- Bruiseweed - Artisan Writing Table conditions (Ref 100025)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100025, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');

-- Bruiseweed - Master Writing Table conditions (Ref 100026)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100026, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');

-- Bruiseweed - Grand Master Writing Table conditions (Ref 100027)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100027, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100027, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100027, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100027, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100027, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Bruiseweed');


-- Wild Steelbloom - Journeyman Writing Table conditions (Ref 100028)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100028, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Artisan Writing Table conditions (Ref 100029)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100029, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Master Writing Table conditions (Ref 100030)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100030, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Grand Master Writing Table conditions (Ref 100031)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100031, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100031, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100031, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100031, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100031, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wild Steelbloom');


-- Kingsblood - Journeyman Writing Table conditions (Ref 100032)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100032, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');

-- Kingsblood - Artisan Writing Table conditions (Ref 100033)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100033, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');

-- Kingsblood - Master Writing Table conditions (Ref 100034)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100034, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');

-- Kingsblood - Grand Master Writing Table conditions (Ref 100035)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100035, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100035, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100035, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100035, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100035, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Kingsblood');


-- Liferoot - Journeyman Writing Table conditions (Ref 100036)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100036, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');

-- Liferoot - Artisan Writing Table conditions (Ref 100037)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100037, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');

-- Liferoot - Master Writing Table conditions (Ref 100038)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100038, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');

-- Liferoot - Grand Master Writing Table conditions (Ref 100039)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100039, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100039, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100039, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100039, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100039, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Liferoot');


-- Khadgar's Whisker - Journeyman Writing Table conditions (Ref 100040)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100040, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Artisan Writing Table conditions (Ref 100041)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100041, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Master Writing Table conditions (Ref 100042)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100042, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Grand Master Writing Table conditions (Ref 100043)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100043, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100043, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100043, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100043, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100043, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Khadgar''s Whisker');


-- Grave Moss - Journeyman Writing Table conditions (Ref 100044)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100044, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');

-- Grave Moss - Artisan Writing Table conditions (Ref 100045)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100045, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');

-- Grave Moss - Master Writing Table conditions (Ref 100046)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100046, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');

-- Grave Moss - Grand Master Writing Table conditions (Ref 100047)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100047, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100047, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100047, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100047, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100047, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Grave Moss');


-- Fadeleaf - Journeyman Writing Table conditions (Ref 100048)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100048, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');

-- Fadeleaf - Artisan Writing Table conditions (Ref 100049)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100049, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');

-- Fadeleaf - Master Writing Table conditions (Ref 100050)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100050, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');

-- Fadeleaf - Grand Master Writing Table conditions (Ref 100051)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100051, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100051, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100051, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100051, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100051, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fadeleaf');


-- Wintersbite - Journeyman Writing Table conditions (Ref 100052)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100052, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');

-- Wintersbite - Artisan Writing Table conditions (Ref 100053)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100053, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');

-- Wintersbite - Master Writing Table conditions (Ref 100054)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100054, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');

-- Wintersbite - Grand Master Writing Table conditions (Ref 100055)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100055, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100055, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100055, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100055, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100055, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wintersbite');


-- Stranglekelp - Journeyman Writing Table conditions (Ref 100056)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100056, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');

-- Stranglekelp - Artisan Writing Table conditions (Ref 100057)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100057, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');

-- Stranglekelp - Master Writing Table conditions (Ref 100058)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100058, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');

-- Stranglekelp - Grand Master Writing Table conditions (Ref 100059)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100059, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100059, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100059, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100059, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100059, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Stranglekelp');


-- Goldthorn - Journeyman Writing Table conditions (Ref 100060)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100060, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');

-- Goldthorn - Artisan Writing Table conditions (Ref 100061)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100061, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');

-- Goldthorn - Master Writing Table conditions (Ref 100062)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100062, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');

-- Goldthorn - Grand Master Writing Table conditions (Ref 100063)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100063, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100063, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100063, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100063, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100063, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldthorn');


-- Firebloom - Journeyman Writing Table conditions (Ref 100064)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100064, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');

-- Firebloom - Artisan Writing Table conditions (Ref 100065)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100065, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');

-- Firebloom - Master Writing Table conditions (Ref 100066)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100066, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');

-- Firebloom - Grand Master Writing Table conditions (Ref 100067)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100067, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100067, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100067, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100067, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100067, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Firebloom');


-- Purple Lotus - Journeyman Writing Table conditions (Ref 100068)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100068, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');

-- Purple Lotus - Artisan Writing Table conditions (Ref 100069)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100069, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');

-- Purple Lotus - Master Writing Table conditions (Ref 100070)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100070, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');

-- Purple Lotus - Grand Master Writing Table conditions (Ref 100071)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100071, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100071, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100071, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100071, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100071, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Purple Lotus');


-- Arthas' Tears - Journeyman Writing Table conditions (Ref 100072)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100072, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Artisan Writing Table conditions (Ref 100073)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100073, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Master Writing Table conditions (Ref 100074)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100074, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Grand Master Writing Table conditions (Ref 100075)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100075, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100075, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100075, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100075, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100075, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Arthas'' Tears');


-- Sungrass - Journeyman Writing Table conditions (Ref 100076)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100076, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');

-- Sungrass - Artisan Writing Table conditions (Ref 100077)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100077, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');

-- Sungrass - Master Writing Table conditions (Ref 100078)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100078, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');

-- Sungrass - Grand Master Writing Table conditions (Ref 100079)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100079, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100079, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100079, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100079, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100079, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Sungrass');


-- Blindweed - Journeyman Writing Table conditions (Ref 100080)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100080, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');

-- Blindweed - Artisan Writing Table conditions (Ref 100081)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100081, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');

-- Blindweed - Master Writing Table conditions (Ref 100082)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100082, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');

-- Blindweed - Grand Master Writing Table conditions (Ref 100083)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100083, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100083, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100083, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100083, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100083, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Blindweed');


-- Ghost Mushroom - Journeyman Writing Table conditions (Ref 100084)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100084, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Artisan Writing Table conditions (Ref 100085)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100085, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Master Writing Table conditions (Ref 100086)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100086, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Grand Master Writing Table conditions (Ref 100087)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100087, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100087, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100087, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100087, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100087, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ghost Mushroom');


-- Gromsblood - Journeyman Writing Table conditions (Ref 100088)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100088, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');

-- Gromsblood - Artisan Writing Table conditions (Ref 100089)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100089, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');

-- Gromsblood - Master Writing Table conditions (Ref 100090)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100090, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');

-- Gromsblood - Grand Master Writing Table conditions (Ref 100091)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100091, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100091, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100091, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100091, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100091, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Gromsblood');


-- Dreamfoil - Journeyman Writing Table conditions (Ref 100092)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100092, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');

-- Dreamfoil - Artisan Writing Table conditions (Ref 100093)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100093, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');

-- Dreamfoil - Master Writing Table conditions (Ref 100094)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100094, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');

-- Dreamfoil - Grand Master Writing Table conditions (Ref 100095)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100095, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100095, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100095, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100095, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100095, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreamfoil');


-- Golden Sansam - Journeyman Writing Table conditions (Ref 100096)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100096, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');

-- Golden Sansam - Artisan Writing Table conditions (Ref 100097)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100097, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');

-- Golden Sansam - Master Writing Table conditions (Ref 100098)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100098, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');

-- Golden Sansam - Grand Master Writing Table conditions (Ref 100099)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100099, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100099, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100099, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100099, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100099, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Golden Sansam');


-- Mountain Silversage - Journeyman Writing Table conditions (Ref 100100)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100100, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Artisan Writing Table conditions (Ref 100101)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100101, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Master Writing Table conditions (Ref 100102)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100102, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Grand Master Writing Table conditions (Ref 100103)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100103, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100103, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100103, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100103, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100103, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mountain Silversage');


-- Plaguebloom - Journeyman Writing Table conditions (Ref 100104)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100104, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');

-- Plaguebloom - Artisan Writing Table conditions (Ref 100105)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100105, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');

-- Plaguebloom - Master Writing Table conditions (Ref 100106)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100106, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');

-- Plaguebloom - Grand Master Writing Table conditions (Ref 100107)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100107, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100107, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100107, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100107, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100107, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Plaguebloom');


-- Icecap - Journeyman Writing Table conditions (Ref 100108)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100108, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');

-- Icecap - Artisan Writing Table conditions (Ref 100109)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100109, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');

-- Icecap - Master Writing Table conditions (Ref 100110)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100110, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icecap');

-- Icecap - Grand Master Writing Table conditions (Ref 100111)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100111, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100111, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100111, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100111, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100111, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icecap');


-- Felweed - Journeyman Writing Table conditions (Ref 100112)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100112, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');

-- Felweed - Artisan Writing Table conditions (Ref 100113)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100113, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');

-- Felweed - Master Writing Table conditions (Ref 100114)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100114, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Felweed');

-- Felweed - Grand Master Writing Table conditions (Ref 100115)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100115, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100115, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100115, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100115, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100115, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Felweed');


-- Dreaming Glory - Journeyman Writing Table conditions (Ref 100116)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100116, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Artisan Writing Table conditions (Ref 100117)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100117, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Master Writing Table conditions (Ref 100118)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100118, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Grand Master Writing Table conditions (Ref 100119)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100119, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100119, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100119, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100119, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100119, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreaming Glory');


-- Ragveil - Journeyman Writing Table conditions (Ref 100120)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100120, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');

-- Ragveil - Artisan Writing Table conditions (Ref 100121)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100121, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');

-- Ragveil - Master Writing Table conditions (Ref 100122)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100122, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');

-- Ragveil - Grand Master Writing Table conditions (Ref 100123)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100123, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100123, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100123, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100123, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100123, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ragveil');


-- Terocone - Journeyman Writing Table conditions (Ref 100124)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100124, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');

-- Terocone - Artisan Writing Table conditions (Ref 100125)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100125, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');

-- Terocone - Master Writing Table conditions (Ref 100126)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100126, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Terocone');

-- Terocone - Grand Master Writing Table conditions (Ref 100127)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100127, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100127, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100127, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100127, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100127, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Terocone');


-- Ancient Lichen - Journeyman Writing Table conditions (Ref 100128)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100128, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Artisan Writing Table conditions (Ref 100129)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100129, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Master Writing Table conditions (Ref 100130)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100130, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Grand Master Writing Table conditions (Ref 100131)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100131, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100131, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100131, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100131, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100131, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ancient Lichen');


-- Netherbloom - Journeyman Writing Table conditions (Ref 100132)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100132, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');

-- Netherbloom - Artisan Writing Table conditions (Ref 100133)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100133, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');

-- Netherbloom - Master Writing Table conditions (Ref 100134)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100134, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');

-- Netherbloom - Grand Master Writing Table conditions (Ref 100135)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100135, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100135, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100135, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100135, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100135, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Netherbloom');


-- Nightmare Vine - Journeyman Writing Table conditions (Ref 100136)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100136, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Artisan Writing Table conditions (Ref 100137)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100137, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Master Writing Table conditions (Ref 100138)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100138, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Grand Master Writing Table conditions (Ref 100139)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100139, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100139, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100139, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100139, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100139, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Nightmare Vine');


-- Mana Thistle - Journeyman Writing Table conditions (Ref 100140)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100140, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');

-- Mana Thistle - Artisan Writing Table conditions (Ref 100141)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100141, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');

-- Mana Thistle - Master Writing Table conditions (Ref 100142)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100142, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');

-- Mana Thistle - Grand Master Writing Table conditions (Ref 100143)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100143, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100143, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100143, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100143, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100143, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mana Thistle');


-- Goldclover - Journeyman Writing Table conditions (Ref 100144)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100144, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');

-- Goldclover - Artisan Writing Table conditions (Ref 100145)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100145, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');

-- Goldclover - Master Writing Table conditions (Ref 100146)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100146, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');

-- Goldclover - Grand Master Writing Table conditions (Ref 100147)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100147, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100147, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100147, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100147, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100147, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldclover');


-- Adder's Tongue - Journeyman Writing Table conditions (Ref 100148)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100148, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Artisan Writing Table conditions (Ref 100149)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100149, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Master Writing Table conditions (Ref 100150)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100150, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Grand Master Writing Table conditions (Ref 100151)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100151, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100151, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100151, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100151, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100151, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Adder''s Tongue');


-- Tiger Lily - Journeyman Writing Table conditions (Ref 100152)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100152, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');

-- Tiger Lily - Artisan Writing Table conditions (Ref 100153)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100153, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');

-- Tiger Lily - Master Writing Table conditions (Ref 100154)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100154, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');

-- Tiger Lily - Grand Master Writing Table conditions (Ref 100155)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100155, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100155, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100155, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100155, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100155, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Tiger Lily');


-- Lichbloom - Journeyman Writing Table conditions (Ref 100156)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100156, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');

-- Lichbloom - Artisan Writing Table conditions (Ref 100157)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100157, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');

-- Lichbloom - Master Writing Table conditions (Ref 100158)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100158, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');

-- Lichbloom - Grand Master Writing Table conditions (Ref 100159)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100159, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100159, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100159, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100159, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100159, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Lichbloom');


-- Icethorn - Journeyman Writing Table conditions (Ref 100160)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100160, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');

-- Icethorn - Artisan Writing Table conditions (Ref 100161)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100161, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');

-- Icethorn - Master Writing Table conditions (Ref 100162)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100162, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');

-- Icethorn - Grand Master Writing Table conditions (Ref 100163)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100163, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100163, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100163, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100163, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100163, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icethorn');


-- Talandra's Rose - Journeyman Writing Table conditions (Ref 100164)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100164, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Artisan Writing Table conditions (Ref 100165)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100165, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Master Writing Table conditions (Ref 100166)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100166, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Grand Master Writing Table conditions (Ref 100167)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100167, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100167, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100167, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100167, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100167, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Talandra''s Rose');


-- Deadnettle - Journeyman Writing Table conditions (Ref 100168)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100168, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Deadnettle');

-- Deadnettle - Artisan Writing Table conditions (Ref 100169)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100169, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Deadnettle');

-- Deadnettle - Master Writing Table conditions (Ref 100170)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100170, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Deadnettle');

-- Deadnettle - Grand Master Writing Table conditions (Ref 100171)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100171, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100171, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100171, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100171, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100171, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Deadnettle');


-- Fire Seed - Journeyman Writing Table conditions (Ref 100172)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100172, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Seed');

-- Fire Seed - Artisan Writing Table conditions (Ref 100173)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100173, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Seed');

-- Fire Seed - Master Writing Table conditions (Ref 100174)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100174, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Seed');

-- Fire Seed - Grand Master Writing Table conditions (Ref 100175)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100175, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100175, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100175, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100175, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100175, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Seed');


-- Fire Leaf - Journeyman Writing Table conditions (Ref 100176)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000001, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000001, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000002, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000002, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000003, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000003, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000004, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000004, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100176, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Leaf');

-- Fire Leaf - Artisan Writing Table conditions (Ref 100177)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000001, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000001, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000002, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000002, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000003, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000003, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000004, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000004, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100177, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Leaf');

-- Fire Leaf - Master Writing Table conditions (Ref 100178)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000001, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000001, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000002, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000002, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000003, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000003, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000004, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100178, 90000004, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Leaf');

-- Fire Leaf - Grand Master Writing Table conditions (Ref 100179)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100179, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100179, 90000001, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100179, 90000002, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100179, 90000003, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 100179, 90000004, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Leaf');


-- Done!
