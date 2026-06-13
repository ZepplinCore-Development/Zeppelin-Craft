-- Found 45 unique milling loot tables

-- =====================================================
-- WRITING TABLE BONUS YIELD SYSTEM (milling)
-- =====================================================
-- Reference loot tables that duplicate milling loot
-- Provides a bonus 'second roll' when milling with a Writing Table
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 96000 AND 96999;
DELETE FROM milling_loot_template WHERE Reference BETWEEN 96000 AND 96999;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 96000 AND 96999;

-- Silverleaf (Entry: 765)
-- Silverleaf - Journeyman Writing Table Bonus (Ref 96000)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Silverleaf - Artisan Writing Table Bonus (Ref 96001)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Silverleaf - Master Writing Table Bonus (Ref 96002)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Silverleaf - Grand Master Writing Table Bonus (Ref 96003)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Mageroyal (Entry: 785)
-- Mageroyal - Journeyman Writing Table Bonus (Ref 96004)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96004, 90000000, 11901, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Mageroyal - Artisan Writing Table Bonus (Ref 96005)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96005, 90000000, 11901, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Mageroyal - Master Writing Table Bonus (Ref 96006)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96006, 90000000, 11901, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Mageroyal - Grand Master Writing Table Bonus (Ref 96007)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96007, 90000000, 11901, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Peacebloom (Entry: 2447)
-- Peacebloom - Journeyman Writing Table Bonus (Ref 96008)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Peacebloom - Artisan Writing Table Bonus (Ref 96009)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Peacebloom - Master Writing Table Bonus (Ref 96010)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Peacebloom - Grand Master Writing Table Bonus (Ref 96011)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Earthroot (Entry: 2449)
-- Earthroot - Journeyman Writing Table Bonus (Ref 96012)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96012, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Earthroot - Artisan Writing Table Bonus (Ref 96013)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96013, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Earthroot - Master Writing Table Bonus (Ref 96014)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96014, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Earthroot - Grand Master Writing Table Bonus (Ref 96015)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96015, 90000000, 11900, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Briarthorn (Entry: 2450)
-- Briarthorn - Journeyman Writing Table Bonus (Ref 96016)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 90000000, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Briarthorn - Artisan Writing Table Bonus (Ref 96017)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 90000000, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Briarthorn - Master Writing Table Bonus (Ref 96018)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 90000000, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Briarthorn - Grand Master Writing Table Bonus (Ref 96019)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 90000000, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Swiftthistle (Entry: 2452)
-- Swiftthistle - Journeyman Writing Table Bonus (Ref 96020)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 90000000, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Swiftthistle - Artisan Writing Table Bonus (Ref 96021)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 90000000, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Swiftthistle - Master Writing Table Bonus (Ref 96022)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 90000000, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Swiftthistle - Grand Master Writing Table Bonus (Ref 96023)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 90000000, 11902, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Bruiseweed (Entry: 2453)
-- Bruiseweed - Journeyman Writing Table Bonus (Ref 96024)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96024, 90000000, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Bruiseweed - Artisan Writing Table Bonus (Ref 96025)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96025, 90000000, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Bruiseweed - Master Writing Table Bonus (Ref 96026)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96026, 90000000, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Bruiseweed - Grand Master Writing Table Bonus (Ref 96027)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96027, 90000000, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Wild Steelbloom (Entry: 3355)
-- Wild Steelbloom - Journeyman Writing Table Bonus (Ref 96028)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 90000000, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Wild Steelbloom - Artisan Writing Table Bonus (Ref 96029)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 90000000, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Wild Steelbloom - Master Writing Table Bonus (Ref 96030)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 90000000, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Wild Steelbloom - Grand Master Writing Table Bonus (Ref 96031)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 90000000, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Kingsblood (Entry: 3356)
-- Kingsblood - Journeyman Writing Table Bonus (Ref 96032)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 90000000, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Kingsblood - Artisan Writing Table Bonus (Ref 96033)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 90000000, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Kingsblood - Master Writing Table Bonus (Ref 96034)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 90000000, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Kingsblood - Grand Master Writing Table Bonus (Ref 96035)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 90000000, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Liferoot (Entry: 3357)
-- Liferoot - Journeyman Writing Table Bonus (Ref 96036)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96036, 90000000, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Liferoot - Artisan Writing Table Bonus (Ref 96037)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96037, 90000000, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Liferoot - Master Writing Table Bonus (Ref 96038)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96038, 90000000, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Liferoot - Grand Master Writing Table Bonus (Ref 96039)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96039, 90000000, 11905, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Khadgar's Whisker (Entry: 3358)
-- Khadgar's Whisker - Journeyman Writing Table Bonus (Ref 96040)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96040, 90000000, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Khadgar's Whisker - Artisan Writing Table Bonus (Ref 96041)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96041, 90000000, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Khadgar's Whisker - Master Writing Table Bonus (Ref 96042)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96042, 90000000, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Khadgar's Whisker - Grand Master Writing Table Bonus (Ref 96043)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96043, 90000000, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Grave Moss (Entry: 3369)
-- Grave Moss - Journeyman Writing Table Bonus (Ref 96044)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96044, 90000000, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Grave Moss - Artisan Writing Table Bonus (Ref 96045)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96045, 90000000, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Grave Moss - Master Writing Table Bonus (Ref 96046)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96046, 90000000, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Grave Moss - Grand Master Writing Table Bonus (Ref 96047)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96047, 90000000, 11904, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Fadeleaf (Entry: 3818)
-- Fadeleaf - Journeyman Writing Table Bonus (Ref 96048)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96048, 90000000, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Fadeleaf - Artisan Writing Table Bonus (Ref 96049)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96049, 90000000, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Fadeleaf - Master Writing Table Bonus (Ref 96050)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96050, 90000000, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Fadeleaf - Grand Master Writing Table Bonus (Ref 96051)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96051, 90000000, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Wintersbite (Entry: 3819)
-- Wintersbite - Journeyman Writing Table Bonus (Ref 96052)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96052, 90000000, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Wintersbite - Artisan Writing Table Bonus (Ref 96053)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96053, 90000000, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Wintersbite - Master Writing Table Bonus (Ref 96054)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96054, 90000000, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Wintersbite - Grand Master Writing Table Bonus (Ref 96055)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96055, 90000000, 11907, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Stranglekelp (Entry: 3820)
-- Stranglekelp - Journeyman Writing Table Bonus (Ref 96056)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96056, 90000000, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Stranglekelp - Artisan Writing Table Bonus (Ref 96057)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96057, 90000000, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Stranglekelp - Master Writing Table Bonus (Ref 96058)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96058, 90000000, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Stranglekelp - Grand Master Writing Table Bonus (Ref 96059)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96059, 90000000, 11903, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Goldthorn (Entry: 3821)
-- Goldthorn - Journeyman Writing Table Bonus (Ref 96060)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96060, 90000000, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Goldthorn - Artisan Writing Table Bonus (Ref 96061)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96061, 90000000, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Goldthorn - Master Writing Table Bonus (Ref 96062)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96062, 90000000, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Goldthorn - Grand Master Writing Table Bonus (Ref 96063)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96063, 90000000, 11906, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Firebloom (Entry: 4625)
-- Firebloom - Journeyman Writing Table Bonus (Ref 96064)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96064, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Firebloom - Artisan Writing Table Bonus (Ref 96065)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96065, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Firebloom - Master Writing Table Bonus (Ref 96066)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96066, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Firebloom - Grand Master Writing Table Bonus (Ref 96067)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96067, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Purple Lotus (Entry: 8831)
-- Purple Lotus - Journeyman Writing Table Bonus (Ref 96068)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96068, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Purple Lotus - Artisan Writing Table Bonus (Ref 96069)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96069, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Purple Lotus - Master Writing Table Bonus (Ref 96070)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96070, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Purple Lotus - Grand Master Writing Table Bonus (Ref 96071)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96071, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Arthas' Tears (Entry: 8836)
-- Arthas' Tears - Journeyman Writing Table Bonus (Ref 96072)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96072, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Arthas' Tears - Artisan Writing Table Bonus (Ref 96073)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96073, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Arthas' Tears - Master Writing Table Bonus (Ref 96074)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96074, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Arthas' Tears - Grand Master Writing Table Bonus (Ref 96075)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96075, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Sungrass (Entry: 8838)
-- Sungrass - Journeyman Writing Table Bonus (Ref 96076)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96076, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Sungrass - Artisan Writing Table Bonus (Ref 96077)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96077, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Sungrass - Master Writing Table Bonus (Ref 96078)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96078, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Sungrass - Grand Master Writing Table Bonus (Ref 96079)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96079, 90000000, 11908, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Blindweed (Entry: 8839)
-- Blindweed - Journeyman Writing Table Bonus (Ref 96080)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96080, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Blindweed - Artisan Writing Table Bonus (Ref 96081)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96081, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Blindweed - Master Writing Table Bonus (Ref 96082)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96082, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Blindweed - Grand Master Writing Table Bonus (Ref 96083)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96083, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Ghost Mushroom (Entry: 8845)
-- Ghost Mushroom - Journeyman Writing Table Bonus (Ref 96084)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96084, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Ghost Mushroom - Artisan Writing Table Bonus (Ref 96085)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96085, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Ghost Mushroom - Master Writing Table Bonus (Ref 96086)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96086, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Ghost Mushroom - Grand Master Writing Table Bonus (Ref 96087)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96087, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Gromsblood (Entry: 8846)
-- Gromsblood - Journeyman Writing Table Bonus (Ref 96088)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96088, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Gromsblood - Artisan Writing Table Bonus (Ref 96089)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96089, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Gromsblood - Master Writing Table Bonus (Ref 96090)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96090, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Gromsblood - Grand Master Writing Table Bonus (Ref 96091)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96091, 90000000, 11909, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Dreamfoil (Entry: 13463)
-- Dreamfoil - Journeyman Writing Table Bonus (Ref 96092)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96092, 90000000, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Dreamfoil - Artisan Writing Table Bonus (Ref 96093)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96093, 90000000, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Dreamfoil - Master Writing Table Bonus (Ref 96094)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96094, 90000000, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Dreamfoil - Grand Master Writing Table Bonus (Ref 96095)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96095, 90000000, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Golden Sansam (Entry: 13464)
-- Golden Sansam - Journeyman Writing Table Bonus (Ref 96096)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96096, 90000000, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Golden Sansam - Artisan Writing Table Bonus (Ref 96097)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96097, 90000000, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Golden Sansam - Master Writing Table Bonus (Ref 96098)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96098, 90000000, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Golden Sansam - Grand Master Writing Table Bonus (Ref 96099)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96099, 90000000, 11910, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Mountain Silversage (Entry: 13465)
-- Mountain Silversage - Journeyman Writing Table Bonus (Ref 96100)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96100, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Mountain Silversage - Artisan Writing Table Bonus (Ref 96101)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96101, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Mountain Silversage - Master Writing Table Bonus (Ref 96102)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96102, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Mountain Silversage - Grand Master Writing Table Bonus (Ref 96103)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96103, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Plaguebloom (Entry: 13466)
-- Plaguebloom - Journeyman Writing Table Bonus (Ref 96104)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96104, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Plaguebloom - Artisan Writing Table Bonus (Ref 96105)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96105, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Plaguebloom - Master Writing Table Bonus (Ref 96106)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96106, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Plaguebloom - Grand Master Writing Table Bonus (Ref 96107)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96107, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Icecap (Entry: 13467)
-- Icecap - Journeyman Writing Table Bonus (Ref 96108)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96108, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Icecap - Artisan Writing Table Bonus (Ref 96109)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96109, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Icecap - Master Writing Table Bonus (Ref 96110)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96110, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Icecap - Grand Master Writing Table Bonus (Ref 96111)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96111, 90000000, 11911, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Felweed (Entry: 22785)
-- Felweed - Journeyman Writing Table Bonus (Ref 96112)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96112, 90000000, 11913, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Felweed - Artisan Writing Table Bonus (Ref 96113)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96113, 90000000, 11913, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Felweed - Master Writing Table Bonus (Ref 96114)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96114, 90000000, 11913, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Felweed - Grand Master Writing Table Bonus (Ref 96115)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96115, 90000000, 11913, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Dreaming Glory (Entry: 22786)
-- Dreaming Glory - Journeyman Writing Table Bonus (Ref 96116)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96116, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Dreaming Glory - Artisan Writing Table Bonus (Ref 96117)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96117, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Dreaming Glory - Master Writing Table Bonus (Ref 96118)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96118, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Dreaming Glory - Grand Master Writing Table Bonus (Ref 96119)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96119, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Ragveil (Entry: 22787)
-- Ragveil - Journeyman Writing Table Bonus (Ref 96120)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96120, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Ragveil - Artisan Writing Table Bonus (Ref 96121)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96121, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Ragveil - Master Writing Table Bonus (Ref 96122)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96122, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Ragveil - Grand Master Writing Table Bonus (Ref 96123)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96123, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Terocone (Entry: 22789)
-- Terocone - Journeyman Writing Table Bonus (Ref 96124)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96124, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Terocone - Artisan Writing Table Bonus (Ref 96125)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96125, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Terocone - Master Writing Table Bonus (Ref 96126)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96126, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Terocone - Grand Master Writing Table Bonus (Ref 96127)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96127, 90000000, 11912, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Ancient Lichen (Entry: 22790)
-- Ancient Lichen - Journeyman Writing Table Bonus (Ref 96128)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96128, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Ancient Lichen - Artisan Writing Table Bonus (Ref 96129)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96129, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Ancient Lichen - Master Writing Table Bonus (Ref 96130)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96130, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Ancient Lichen - Grand Master Writing Table Bonus (Ref 96131)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96131, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Netherbloom (Entry: 22791)
-- Netherbloom - Journeyman Writing Table Bonus (Ref 96132)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96132, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Netherbloom - Artisan Writing Table Bonus (Ref 96133)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96133, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Netherbloom - Master Writing Table Bonus (Ref 96134)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96134, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Netherbloom - Grand Master Writing Table Bonus (Ref 96135)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96135, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Nightmare Vine (Entry: 22792)
-- Nightmare Vine - Journeyman Writing Table Bonus (Ref 96136)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96136, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Nightmare Vine - Artisan Writing Table Bonus (Ref 96137)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96137, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Nightmare Vine - Master Writing Table Bonus (Ref 96138)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96138, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Nightmare Vine - Grand Master Writing Table Bonus (Ref 96139)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96139, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Mana Thistle (Entry: 22793)
-- Mana Thistle - Journeyman Writing Table Bonus (Ref 96140)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96140, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Mana Thistle - Artisan Writing Table Bonus (Ref 96141)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96141, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Mana Thistle - Master Writing Table Bonus (Ref 96142)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96142, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Mana Thistle - Grand Master Writing Table Bonus (Ref 96143)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96143, 90000000, 11914, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Goldclover (Entry: 36901)
-- Goldclover - Journeyman Writing Table Bonus (Ref 96144)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96144, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Goldclover - Artisan Writing Table Bonus (Ref 96145)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96145, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Goldclover - Master Writing Table Bonus (Ref 96146)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96146, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Goldclover - Grand Master Writing Table Bonus (Ref 96147)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96147, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Adder's Tongue (Entry: 36903)
-- Adder's Tongue - Journeyman Writing Table Bonus (Ref 96148)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96148, 90000000, 11918, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Adder's Tongue - Artisan Writing Table Bonus (Ref 96149)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96149, 90000000, 11918, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Adder's Tongue - Master Writing Table Bonus (Ref 96150)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96150, 90000000, 11918, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Adder's Tongue - Grand Master Writing Table Bonus (Ref 96151)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96151, 90000000, 11918, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Tiger Lily (Entry: 36904)
-- Tiger Lily - Journeyman Writing Table Bonus (Ref 96152)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96152, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Tiger Lily - Artisan Writing Table Bonus (Ref 96153)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96153, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Tiger Lily - Master Writing Table Bonus (Ref 96154)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96154, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Tiger Lily - Grand Master Writing Table Bonus (Ref 96155)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96155, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Lichbloom (Entry: 36905)
-- Lichbloom - Journeyman Writing Table Bonus (Ref 96156)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96156, 90000000, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Lichbloom - Artisan Writing Table Bonus (Ref 96157)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96157, 90000000, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Lichbloom - Master Writing Table Bonus (Ref 96158)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96158, 90000000, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Lichbloom - Grand Master Writing Table Bonus (Ref 96159)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96159, 90000000, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Icethorn (Entry: 36906)
-- Icethorn - Journeyman Writing Table Bonus (Ref 96160)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96160, 90000000, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Icethorn - Artisan Writing Table Bonus (Ref 96161)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96161, 90000000, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Icethorn - Master Writing Table Bonus (Ref 96162)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96162, 90000000, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Icethorn - Grand Master Writing Table Bonus (Ref 96163)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96163, 90000000, 11917, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Talandra's Rose (Entry: 36907)
-- Talandra's Rose - Journeyman Writing Table Bonus (Ref 96164)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96164, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Talandra's Rose - Artisan Writing Table Bonus (Ref 96165)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96165, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Talandra's Rose - Master Writing Table Bonus (Ref 96166)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96166, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Talandra's Rose - Grand Master Writing Table Bonus (Ref 96167)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96167, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Deadnettle (Entry: 37921)
-- Deadnettle - Journeyman Writing Table Bonus (Ref 96168)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96168, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Deadnettle - Artisan Writing Table Bonus (Ref 96169)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96169, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Deadnettle - Master Writing Table Bonus (Ref 96170)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96170, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Deadnettle - Grand Master Writing Table Bonus (Ref 96171)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96171, 90000000, 11916, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Fire Seed (Entry: 39969)
-- Fire Seed - Journeyman Writing Table Bonus (Ref 96172)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96172, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Fire Seed - Artisan Writing Table Bonus (Ref 96173)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96173, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Fire Seed - Master Writing Table Bonus (Ref 96174)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96174, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Fire Seed - Grand Master Writing Table Bonus (Ref 96175)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96175, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- Fire Leaf (Entry: 39970)
-- Fire Leaf - Journeyman Writing Table Bonus (Ref 96176)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96176, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Writing Table');

-- Fire Leaf - Artisan Writing Table Bonus (Ref 96177)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96177, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Writing Table');

-- Fire Leaf - Master Writing Table Bonus (Ref 96178)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96178, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Master Writing Table');

-- Fire Leaf - Grand Master Writing Table Bonus (Ref 96179)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96179, 90000000, 11915, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Writing Table');


-- =====================================================
-- LINK REFERENCES TO MILLING_LOOT_TEMPLATE
-- =====================================================

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (765, 10000, 96000, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (765, 10001, 96001, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (765, 10002, 96002, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (765, 10003, 96003, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (785, 10004, 96004, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (785, 10005, 96005, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (785, 10006, 96006, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (785, 10007, 96007, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2447, 10008, 96008, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2447, 10009, 96009, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2447, 10010, 96010, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2447, 10011, 96011, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2449, 10012, 96012, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2449, 10013, 96013, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2449, 10014, 96014, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2449, 10015, 96015, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2450, 10016, 96016, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2450, 10017, 96017, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2450, 10018, 96018, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2450, 10019, 96019, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2452, 10020, 96020, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2452, 10021, 96021, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2452, 10022, 96022, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2452, 10023, 96023, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2453, 10024, 96024, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2453, 10025, 96025, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2453, 10026, 96026, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2453, 10027, 96027, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3355, 10028, 96028, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3355, 10029, 96029, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3355, 10030, 96030, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3355, 10031, 96031, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3356, 10032, 96032, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3356, 10033, 96033, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3356, 10034, 96034, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3356, 10035, 96035, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3357, 10036, 96036, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3357, 10037, 96037, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3357, 10038, 96038, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3357, 10039, 96039, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3358, 10040, 96040, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3358, 10041, 96041, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3358, 10042, 96042, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3358, 10043, 96043, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3369, 10044, 96044, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3369, 10045, 96045, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3369, 10046, 96046, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3369, 10047, 96047, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3818, 10048, 96048, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3818, 10049, 96049, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3818, 10050, 96050, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3818, 10051, 96051, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3819, 10052, 96052, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3819, 10053, 96053, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3819, 10054, 96054, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3819, 10055, 96055, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3820, 10056, 96056, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3820, 10057, 96057, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3820, 10058, 96058, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3820, 10059, 96059, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3821, 10060, 96060, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3821, 10061, 96061, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3821, 10062, 96062, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3821, 10063, 96063, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (4625, 10064, 96064, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (4625, 10065, 96065, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (4625, 10066, 96066, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (4625, 10067, 96067, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8831, 10068, 96068, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8831, 10069, 96069, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8831, 10070, 96070, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8831, 10071, 96071, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8836, 10072, 96072, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8836, 10073, 96073, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8836, 10074, 96074, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8836, 10075, 96075, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8838, 10076, 96076, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8838, 10077, 96077, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8838, 10078, 96078, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8838, 10079, 96079, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8839, 10080, 96080, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8839, 10081, 96081, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8839, 10082, 96082, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8839, 10083, 96083, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8845, 10084, 96084, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8845, 10085, 96085, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8845, 10086, 96086, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8845, 10087, 96087, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8846, 10088, 96088, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8846, 10089, 96089, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8846, 10090, 96090, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (8846, 10091, 96091, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13463, 10092, 96092, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13463, 10093, 96093, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13463, 10094, 96094, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13463, 10095, 96095, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13464, 10096, 96096, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13464, 10097, 96097, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13464, 10098, 96098, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13464, 10099, 96099, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13465, 10100, 96100, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13465, 10101, 96101, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13465, 10102, 96102, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13465, 10103, 96103, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13466, 10104, 96104, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13466, 10105, 96105, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13466, 10106, 96106, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13466, 10107, 96107, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13467, 10108, 96108, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13467, 10109, 96109, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13467, 10110, 96110, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (13467, 10111, 96111, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22785, 10112, 96112, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22785, 10113, 96113, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22785, 10114, 96114, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22785, 10115, 96115, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22786, 10116, 96116, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22786, 10117, 96117, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22786, 10118, 96118, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22786, 10119, 96119, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22787, 10120, 96120, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22787, 10121, 96121, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22787, 10122, 96122, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22787, 10123, 96123, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22789, 10124, 96124, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22789, 10125, 96125, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22789, 10126, 96126, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22789, 10127, 96127, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22790, 10128, 96128, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22790, 10129, 96129, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22790, 10130, 96130, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22790, 10131, 96131, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22791, 10132, 96132, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22791, 10133, 96133, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22791, 10134, 96134, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22791, 10135, 96135, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22792, 10136, 96136, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22792, 10137, 96137, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22792, 10138, 96138, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22792, 10139, 96139, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22793, 10140, 96140, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22793, 10141, 96141, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22793, 10142, 96142, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (22793, 10143, 96143, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36901, 10144, 96144, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36901, 10145, 96145, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36901, 10146, 96146, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36901, 10147, 96147, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36903, 10148, 96148, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36903, 10149, 96149, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36903, 10150, 96150, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36903, 10151, 96151, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36904, 10152, 96152, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36904, 10153, 96153, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36904, 10154, 96154, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36904, 10155, 96155, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36905, 10156, 96156, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36905, 10157, 96157, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36905, 10158, 96158, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36905, 10159, 96159, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36906, 10160, 96160, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36906, 10161, 96161, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36906, 10162, 96162, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36906, 10163, 96163, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36907, 10164, 96164, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36907, 10165, 96165, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36907, 10166, 96166, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36907, 10167, 96167, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (37921, 10168, 96168, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (37921, 10169, 96169, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (37921, 10170, 96170, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (37921, 10171, 96171, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39969, 10172, 96172, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39969, 10173, 96173, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39969, 10174, 96174, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39969, 10175, 96175, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39970, 10176, 96176, 10, 0, 1, 0, 1, 1, 'Journeyman Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39970, 10177, 96177, 20, 0, 1, 0, 1, 1, 'Artisan Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39970, 10178, 96178, 30, 0, 1, 0, 1, 1, 'Master Writing Table Bonus');
INSERT INTO milling_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (39970, 10179, 96179, 40, 0, 1, 0, 1, 1, 'Grand Master Writing Table Bonus');

-- =====================================================
-- CONDITIONS (Check for active Writing Table auras)
-- Mutually exclusive: a tier bonus rolls only if that tier
-- is active AND no higher tier is active (no stacking).
-- =====================================================

-- Silverleaf - Journeyman Writing Table conditions (Ref 96000)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');

-- Silverleaf - Artisan Writing Table conditions (Ref 96001)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');

-- Silverleaf - Master Writing Table conditions (Ref 96002)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');

-- Silverleaf - Grand Master Writing Table conditions (Ref 96003)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Silverleaf');


-- Mageroyal - Journeyman Writing Table conditions (Ref 96004)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');

-- Mageroyal - Artisan Writing Table conditions (Ref 96005)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');

-- Mageroyal - Master Writing Table conditions (Ref 96006)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');

-- Mageroyal - Grand Master Writing Table conditions (Ref 96007)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96007, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mageroyal');


-- Peacebloom - Journeyman Writing Table conditions (Ref 96008)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');

-- Peacebloom - Artisan Writing Table conditions (Ref 96009)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');

-- Peacebloom - Master Writing Table conditions (Ref 96010)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');

-- Peacebloom - Grand Master Writing Table conditions (Ref 96011)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Peacebloom');


-- Earthroot - Journeyman Writing Table conditions (Ref 96012)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');

-- Earthroot - Artisan Writing Table conditions (Ref 96013)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');

-- Earthroot - Master Writing Table conditions (Ref 96014)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');

-- Earthroot - Grand Master Writing Table conditions (Ref 96015)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96015, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Earthroot');


-- Briarthorn - Journeyman Writing Table conditions (Ref 96016)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');

-- Briarthorn - Artisan Writing Table conditions (Ref 96017)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');

-- Briarthorn - Master Writing Table conditions (Ref 96018)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');

-- Briarthorn - Grand Master Writing Table conditions (Ref 96019)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Briarthorn');


-- Swiftthistle - Journeyman Writing Table conditions (Ref 96020)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Swiftthistle');

-- Swiftthistle - Artisan Writing Table conditions (Ref 96021)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Swiftthistle');

-- Swiftthistle - Master Writing Table conditions (Ref 96022)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Swiftthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Swiftthistle');

-- Swiftthistle - Grand Master Writing Table conditions (Ref 96023)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Swiftthistle');


-- Bruiseweed - Journeyman Writing Table conditions (Ref 96024)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');

-- Bruiseweed - Artisan Writing Table conditions (Ref 96025)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');

-- Bruiseweed - Master Writing Table conditions (Ref 96026)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');

-- Bruiseweed - Grand Master Writing Table conditions (Ref 96027)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96027, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Bruiseweed');


-- Wild Steelbloom - Journeyman Writing Table conditions (Ref 96028)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Artisan Writing Table conditions (Ref 96029)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Master Writing Table conditions (Ref 96030)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Grand Master Writing Table conditions (Ref 96031)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wild Steelbloom');


-- Kingsblood - Journeyman Writing Table conditions (Ref 96032)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');

-- Kingsblood - Artisan Writing Table conditions (Ref 96033)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');

-- Kingsblood - Master Writing Table conditions (Ref 96034)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');

-- Kingsblood - Grand Master Writing Table conditions (Ref 96035)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Kingsblood');


-- Liferoot - Journeyman Writing Table conditions (Ref 96036)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96036, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96036, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96036, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96036, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');

-- Liferoot - Artisan Writing Table conditions (Ref 96037)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96037, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96037, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96037, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');

-- Liferoot - Master Writing Table conditions (Ref 96038)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96038, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96038, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');

-- Liferoot - Grand Master Writing Table conditions (Ref 96039)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96039, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Liferoot');


-- Khadgar's Whisker - Journeyman Writing Table conditions (Ref 96040)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96040, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96040, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96040, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96040, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Artisan Writing Table conditions (Ref 96041)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96041, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96041, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96041, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Master Writing Table conditions (Ref 96042)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96042, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96042, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Grand Master Writing Table conditions (Ref 96043)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96043, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Khadgar''s Whisker');


-- Grave Moss - Journeyman Writing Table conditions (Ref 96044)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96044, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96044, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96044, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96044, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');

-- Grave Moss - Artisan Writing Table conditions (Ref 96045)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96045, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96045, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96045, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');

-- Grave Moss - Master Writing Table conditions (Ref 96046)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96046, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96046, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');

-- Grave Moss - Grand Master Writing Table conditions (Ref 96047)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96047, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Grave Moss');


-- Fadeleaf - Journeyman Writing Table conditions (Ref 96048)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96048, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96048, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96048, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96048, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');

-- Fadeleaf - Artisan Writing Table conditions (Ref 96049)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96049, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96049, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96049, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');

-- Fadeleaf - Master Writing Table conditions (Ref 96050)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96050, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96050, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');

-- Fadeleaf - Grand Master Writing Table conditions (Ref 96051)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96051, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fadeleaf');


-- Wintersbite - Journeyman Writing Table conditions (Ref 96052)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96052, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96052, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96052, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96052, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');

-- Wintersbite - Artisan Writing Table conditions (Ref 96053)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96053, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96053, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96053, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');

-- Wintersbite - Master Writing Table conditions (Ref 96054)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96054, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96054, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');

-- Wintersbite - Grand Master Writing Table conditions (Ref 96055)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96055, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Wintersbite');


-- Stranglekelp - Journeyman Writing Table conditions (Ref 96056)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96056, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96056, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96056, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96056, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');

-- Stranglekelp - Artisan Writing Table conditions (Ref 96057)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96057, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96057, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96057, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');

-- Stranglekelp - Master Writing Table conditions (Ref 96058)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96058, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96058, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');

-- Stranglekelp - Grand Master Writing Table conditions (Ref 96059)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96059, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Stranglekelp');


-- Goldthorn - Journeyman Writing Table conditions (Ref 96060)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96060, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96060, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96060, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96060, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');

-- Goldthorn - Artisan Writing Table conditions (Ref 96061)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96061, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96061, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96061, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');

-- Goldthorn - Master Writing Table conditions (Ref 96062)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96062, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96062, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');

-- Goldthorn - Grand Master Writing Table conditions (Ref 96063)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96063, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldthorn');


-- Firebloom - Journeyman Writing Table conditions (Ref 96064)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96064, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96064, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96064, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96064, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');

-- Firebloom - Artisan Writing Table conditions (Ref 96065)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96065, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96065, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96065, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');

-- Firebloom - Master Writing Table conditions (Ref 96066)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96066, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96066, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');

-- Firebloom - Grand Master Writing Table conditions (Ref 96067)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96067, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Firebloom');


-- Purple Lotus - Journeyman Writing Table conditions (Ref 96068)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96068, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96068, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96068, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96068, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');

-- Purple Lotus - Artisan Writing Table conditions (Ref 96069)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96069, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96069, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96069, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');

-- Purple Lotus - Master Writing Table conditions (Ref 96070)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96070, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96070, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');

-- Purple Lotus - Grand Master Writing Table conditions (Ref 96071)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96071, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Purple Lotus');


-- Arthas' Tears - Journeyman Writing Table conditions (Ref 96072)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96072, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96072, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96072, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96072, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Artisan Writing Table conditions (Ref 96073)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96073, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96073, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96073, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Master Writing Table conditions (Ref 96074)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96074, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96074, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Grand Master Writing Table conditions (Ref 96075)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96075, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Arthas'' Tears');


-- Sungrass - Journeyman Writing Table conditions (Ref 96076)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96076, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96076, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96076, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96076, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');

-- Sungrass - Artisan Writing Table conditions (Ref 96077)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96077, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96077, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96077, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');

-- Sungrass - Master Writing Table conditions (Ref 96078)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96078, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96078, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');

-- Sungrass - Grand Master Writing Table conditions (Ref 96079)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96079, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Sungrass');


-- Blindweed - Journeyman Writing Table conditions (Ref 96080)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96080, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96080, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96080, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96080, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');

-- Blindweed - Artisan Writing Table conditions (Ref 96081)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96081, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96081, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96081, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');

-- Blindweed - Master Writing Table conditions (Ref 96082)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96082, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96082, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');

-- Blindweed - Grand Master Writing Table conditions (Ref 96083)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96083, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Blindweed');


-- Ghost Mushroom - Journeyman Writing Table conditions (Ref 96084)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96084, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96084, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96084, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96084, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Artisan Writing Table conditions (Ref 96085)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96085, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96085, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96085, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Master Writing Table conditions (Ref 96086)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96086, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96086, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Grand Master Writing Table conditions (Ref 96087)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96087, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ghost Mushroom');


-- Gromsblood - Journeyman Writing Table conditions (Ref 96088)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96088, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96088, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96088, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96088, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');

-- Gromsblood - Artisan Writing Table conditions (Ref 96089)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96089, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96089, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96089, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');

-- Gromsblood - Master Writing Table conditions (Ref 96090)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96090, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96090, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');

-- Gromsblood - Grand Master Writing Table conditions (Ref 96091)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96091, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Gromsblood');


-- Dreamfoil - Journeyman Writing Table conditions (Ref 96092)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96092, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96092, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96092, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96092, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');

-- Dreamfoil - Artisan Writing Table conditions (Ref 96093)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96093, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96093, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96093, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');

-- Dreamfoil - Master Writing Table conditions (Ref 96094)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96094, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96094, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');

-- Dreamfoil - Grand Master Writing Table conditions (Ref 96095)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96095, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreamfoil');


-- Golden Sansam - Journeyman Writing Table conditions (Ref 96096)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96096, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96096, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96096, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96096, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');

-- Golden Sansam - Artisan Writing Table conditions (Ref 96097)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96097, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96097, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96097, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');

-- Golden Sansam - Master Writing Table conditions (Ref 96098)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96098, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96098, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');

-- Golden Sansam - Grand Master Writing Table conditions (Ref 96099)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96099, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Golden Sansam');


-- Mountain Silversage - Journeyman Writing Table conditions (Ref 96100)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96100, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96100, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96100, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96100, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Artisan Writing Table conditions (Ref 96101)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96101, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96101, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96101, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Master Writing Table conditions (Ref 96102)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96102, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96102, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Grand Master Writing Table conditions (Ref 96103)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96103, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mountain Silversage');


-- Plaguebloom - Journeyman Writing Table conditions (Ref 96104)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96104, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96104, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96104, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96104, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');

-- Plaguebloom - Artisan Writing Table conditions (Ref 96105)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96105, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96105, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96105, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');

-- Plaguebloom - Master Writing Table conditions (Ref 96106)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96106, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96106, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');

-- Plaguebloom - Grand Master Writing Table conditions (Ref 96107)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96107, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Plaguebloom');


-- Icecap - Journeyman Writing Table conditions (Ref 96108)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96108, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96108, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96108, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96108, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');

-- Icecap - Artisan Writing Table conditions (Ref 96109)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96109, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96109, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96109, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');

-- Icecap - Master Writing Table conditions (Ref 96110)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96110, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96110, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icecap');

-- Icecap - Grand Master Writing Table conditions (Ref 96111)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96111, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icecap');


-- Felweed - Journeyman Writing Table conditions (Ref 96112)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96112, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96112, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96112, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96112, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');

-- Felweed - Artisan Writing Table conditions (Ref 96113)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96113, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96113, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96113, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');

-- Felweed - Master Writing Table conditions (Ref 96114)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96114, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96114, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Felweed');

-- Felweed - Grand Master Writing Table conditions (Ref 96115)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96115, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Felweed');


-- Dreaming Glory - Journeyman Writing Table conditions (Ref 96116)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96116, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96116, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96116, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96116, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Artisan Writing Table conditions (Ref 96117)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96117, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96117, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96117, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Master Writing Table conditions (Ref 96118)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96118, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96118, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Grand Master Writing Table conditions (Ref 96119)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96119, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Dreaming Glory');


-- Ragveil - Journeyman Writing Table conditions (Ref 96120)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96120, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96120, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96120, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96120, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');

-- Ragveil - Artisan Writing Table conditions (Ref 96121)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96121, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96121, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96121, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');

-- Ragveil - Master Writing Table conditions (Ref 96122)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96122, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96122, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');

-- Ragveil - Grand Master Writing Table conditions (Ref 96123)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96123, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ragveil');


-- Terocone - Journeyman Writing Table conditions (Ref 96124)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96124, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96124, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96124, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96124, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');

-- Terocone - Artisan Writing Table conditions (Ref 96125)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96125, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96125, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96125, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');

-- Terocone - Master Writing Table conditions (Ref 96126)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96126, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96126, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Terocone');

-- Terocone - Grand Master Writing Table conditions (Ref 96127)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96127, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Terocone');


-- Ancient Lichen - Journeyman Writing Table conditions (Ref 96128)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96128, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96128, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96128, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96128, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Artisan Writing Table conditions (Ref 96129)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96129, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96129, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96129, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Master Writing Table conditions (Ref 96130)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96130, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96130, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Grand Master Writing Table conditions (Ref 96131)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96131, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Ancient Lichen');


-- Netherbloom - Journeyman Writing Table conditions (Ref 96132)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96132, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96132, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96132, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96132, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');

-- Netherbloom - Artisan Writing Table conditions (Ref 96133)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96133, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96133, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96133, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');

-- Netherbloom - Master Writing Table conditions (Ref 96134)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96134, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96134, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');

-- Netherbloom - Grand Master Writing Table conditions (Ref 96135)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96135, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Netherbloom');


-- Nightmare Vine - Journeyman Writing Table conditions (Ref 96136)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96136, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96136, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96136, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96136, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Artisan Writing Table conditions (Ref 96137)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96137, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96137, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96137, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Master Writing Table conditions (Ref 96138)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96138, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96138, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Grand Master Writing Table conditions (Ref 96139)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96139, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Nightmare Vine');


-- Mana Thistle - Journeyman Writing Table conditions (Ref 96140)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96140, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96140, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96140, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96140, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');

-- Mana Thistle - Artisan Writing Table conditions (Ref 96141)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96141, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96141, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96141, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');

-- Mana Thistle - Master Writing Table conditions (Ref 96142)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96142, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96142, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');

-- Mana Thistle - Grand Master Writing Table conditions (Ref 96143)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96143, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Mana Thistle');


-- Goldclover - Journeyman Writing Table conditions (Ref 96144)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96144, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96144, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96144, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96144, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');

-- Goldclover - Artisan Writing Table conditions (Ref 96145)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96145, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96145, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96145, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');

-- Goldclover - Master Writing Table conditions (Ref 96146)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96146, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96146, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');

-- Goldclover - Grand Master Writing Table conditions (Ref 96147)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96147, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Goldclover');


-- Adder's Tongue - Journeyman Writing Table conditions (Ref 96148)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96148, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96148, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96148, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96148, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Artisan Writing Table conditions (Ref 96149)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96149, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96149, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96149, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Master Writing Table conditions (Ref 96150)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96150, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96150, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Grand Master Writing Table conditions (Ref 96151)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96151, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Adder''s Tongue');


-- Tiger Lily - Journeyman Writing Table conditions (Ref 96152)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96152, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96152, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96152, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96152, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');

-- Tiger Lily - Artisan Writing Table conditions (Ref 96153)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96153, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96153, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96153, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');

-- Tiger Lily - Master Writing Table conditions (Ref 96154)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96154, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96154, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');

-- Tiger Lily - Grand Master Writing Table conditions (Ref 96155)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96155, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Tiger Lily');


-- Lichbloom - Journeyman Writing Table conditions (Ref 96156)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96156, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96156, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96156, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96156, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');

-- Lichbloom - Artisan Writing Table conditions (Ref 96157)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96157, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96157, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96157, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');

-- Lichbloom - Master Writing Table conditions (Ref 96158)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96158, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96158, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');

-- Lichbloom - Grand Master Writing Table conditions (Ref 96159)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96159, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Lichbloom');


-- Icethorn - Journeyman Writing Table conditions (Ref 96160)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96160, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96160, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96160, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96160, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');

-- Icethorn - Artisan Writing Table conditions (Ref 96161)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96161, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96161, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96161, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');

-- Icethorn - Master Writing Table conditions (Ref 96162)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96162, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96162, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');

-- Icethorn - Grand Master Writing Table conditions (Ref 96163)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96163, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Icethorn');


-- Talandra's Rose - Journeyman Writing Table conditions (Ref 96164)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96164, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96164, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96164, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96164, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Artisan Writing Table conditions (Ref 96165)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96165, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96165, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96165, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Master Writing Table conditions (Ref 96166)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96166, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Talandra''s Rose');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96166, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Talandra''s Rose');

-- Talandra's Rose - Grand Master Writing Table conditions (Ref 96167)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96167, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Talandra''s Rose');


-- Deadnettle - Journeyman Writing Table conditions (Ref 96168)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96168, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96168, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96168, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96168, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Deadnettle');

-- Deadnettle - Artisan Writing Table conditions (Ref 96169)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96169, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96169, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96169, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Deadnettle');

-- Deadnettle - Master Writing Table conditions (Ref 96170)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96170, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Deadnettle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96170, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Deadnettle');

-- Deadnettle - Grand Master Writing Table conditions (Ref 96171)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96171, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Deadnettle');


-- Fire Seed - Journeyman Writing Table conditions (Ref 96172)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96172, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96172, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96172, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96172, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Seed');

-- Fire Seed - Artisan Writing Table conditions (Ref 96173)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96173, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96173, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96173, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Seed');

-- Fire Seed - Master Writing Table conditions (Ref 96174)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96174, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Seed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96174, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Seed');

-- Fire Seed - Grand Master Writing Table conditions (Ref 96175)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96175, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Seed');


-- Fire Leaf - Journeyman Writing Table conditions (Ref 96176)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96176, 90000000, 0, 0, 1, 0, 91248, 0, 0, 0, 'Journeyman Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96176, 90000000, 0, 0, 1, 0, 91249, 0, 0, 1, 'Block Journeyman if Artisan active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96176, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Journeyman if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96176, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Journeyman if Grand Master active - Fire Leaf');

-- Fire Leaf - Artisan Writing Table conditions (Ref 96177)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96177, 90000000, 0, 0, 1, 0, 91249, 0, 0, 0, 'Artisan Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96177, 90000000, 0, 0, 1, 0, 91250, 0, 0, 1, 'Block Artisan if Master active - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96177, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Artisan if Grand Master active - Fire Leaf');

-- Fire Leaf - Master Writing Table conditions (Ref 96178)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96178, 90000000, 0, 0, 1, 0, 91250, 0, 0, 0, 'Master Writing Table - Fire Leaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96178, 90000000, 0, 0, 1, 0, 91251, 0, 0, 1, 'Block Master if Grand Master active - Fire Leaf');

-- Fire Leaf - Grand Master Writing Table conditions (Ref 96179)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96179, 90000000, 0, 0, 1, 0, 91251, 0, 0, 0, 'Grand Master Writing Table - Fire Leaf');


-- Done!
