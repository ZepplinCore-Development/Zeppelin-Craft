-- Found 68 unique herbalism loot tables

-- =====================================================
-- GAMEOBJECT LIST (for review)
-- =====================================================
-- Silverleaf (Loot ID: 1414)
-- Peacebloom (Loot ID: 1415)
-- Earthroot (Loot ID: 1416)
-- Mageroyal (Loot ID: 1417)
-- Briarthorn (Loot ID: 1418)
-- Bruiseweed (Loot ID: 1419)
-- Wild Steelbloom (Loot ID: 1420)
-- Kingsblood (Loot ID: 1421)
-- Khadgar's Whisker (Loot ID: 1423)
-- Grave Moss (Loot ID: 1424)
-- Liferoot (Loot ID: 1730)
-- Fadeleaf (Loot ID: 1731)
-- Wintersbite (Loot ID: 1732)
-- Stranglekelp (Loot ID: 1733)
-- Goldthorn (Loot ID: 1734)
-- Firebloom (Loot ID: 2292)
-- Silverleaf (Loot ID: 2511)
-- Peacebloom (Loot ID: 2512)
-- Earthroot (Loot ID: 2513)
-- Mageroyal (Loot ID: 2514)
-- Briarthorn (Loot ID: 2515)
-- Bruiseweed (Loot ID: 2516)
-- Purple Lotus (Loot ID: 6142)
-- Arthas' Tears (Loot ID: 6150)
-- Sungrass (Loot ID: 6151)
-- Blindweed (Loot ID: 6152)
-- Ghost Mushroom (Loot ID: 6312)
-- Gromsblood (Loot ID: 6313)
-- Golden Sansam (Loot ID: 13945)
-- Dreamfoil (Loot ID: 13946)
-- Mountain Silversage (Loot ID: 13947)
-- Plaguebloom (Loot ID: 13948)
-- Icecap (Loot ID: 13949)
-- Black Lotus (Loot ID: 13950)
-- Sungrass (Loot ID: 13965)
-- Gromsblood (Loot ID: 13966)
-- Golden Sansam (Loot ID: 13967)
-- Dreamfoil (Loot ID: 13968)
-- Mountain Silversage (Loot ID: 13969)
-- Arthas' Tears (Loot ID: 13970)
-- Plaguebloom (Loot ID: 13971)
-- Purple Lotus (Loot ID: 17200)
-- Sungrass (Loot ID: 17201)
-- Golden Sansam (Loot ID: 17202)
-- Dreamfoil (Loot ID: 17203)
-- Mountain Silversage (Loot ID: 17204)
-- Bloodthistle (Loot ID: 18009)
-- Felweed (Loot ID: 18111)
-- Dreaming Glory (Loot ID: 18112)
-- Ragveil (Loot ID: 18113)
-- Flame Cap (Loot ID: 18114)
-- Terocone (Loot ID: 18115)
-- Ancient Lichen (Loot ID: 18116)
-- Netherbloom (Loot ID: 18117)
-- Nightmare Vine (Loot ID: 18118)
-- Mana Thistle (Loot ID: 18119)
-- Ragveil (Loot ID: 19627)
-- Felweed (Loot ID: 19628)
-- Dreaming Glory (Loot ID: 19629)
-- Blindweed (Loot ID: 19630)
-- Goldclover (Loot ID: 24093)
-- Tiger Lily (Loot ID: 24224)
-- Lichbloom (Loot ID: 24226)
-- Icethorn (Loot ID: 24227)
-- Adder's Tongue (Loot ID: 25093)
-- Frozen Herb (Loot ID: 25094)
-- Frozen Herb (Loot ID: 25095)
-- Frozen Herb (Loot ID: 25096)
-- =====================================================

-- =====================================================
-- PRUNING SHEARS BONUS YIELD SYSTEM
-- =====================================================
-- Reference loot tables that duplicate herb node loot
-- Provides bonus 'second roll' when gathering with shears
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 91200 AND 91799;
DELETE FROM gameobject_loot_template WHERE Reference BETWEEN 91200 AND 91799;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 91200 AND 91799;

-- Silverleaf (Loot ID: 1414)
-- Silverleaf - Journeyman Shears Bonus (Ref 91200)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91200, 765, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Silverleaf - Artisan Shears Bonus (Ref 91201)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91201, 765, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Silverleaf - Master Shears Bonus (Ref 91202)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91202, 765, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Silverleaf - Grand Master Shears Bonus (Ref 91203)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91203, 765, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Peacebloom (Loot ID: 1415)
-- Peacebloom - Journeyman Shears Bonus (Ref 91204)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91204, 2447, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Peacebloom - Artisan Shears Bonus (Ref 91205)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91205, 2447, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Peacebloom - Master Shears Bonus (Ref 91206)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91206, 2447, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Peacebloom - Grand Master Shears Bonus (Ref 91207)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91207, 2447, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Earthroot (Loot ID: 1416)
-- Earthroot - Journeyman Shears Bonus (Ref 91208)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91208, 2449, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Earthroot - Artisan Shears Bonus (Ref 91209)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91209, 2449, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Earthroot - Master Shears Bonus (Ref 91210)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91210, 2449, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Earthroot - Grand Master Shears Bonus (Ref 91211)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91211, 2449, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Mageroyal (Loot ID: 1417)
-- Mageroyal - Journeyman Shears Bonus (Ref 91212)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91212, 785, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91212, 2452, 20.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');

-- Mageroyal - Artisan Shears Bonus (Ref 91213)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91213, 785, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91213, 2452, 20.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');

-- Mageroyal - Master Shears Bonus (Ref 91214)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91214, 785, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91214, 2452, 20.0, 0, 0, 1, 2, 'Bonus from Master Shears');

-- Mageroyal - Grand Master Shears Bonus (Ref 91215)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91215, 785, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91215, 2452, 20.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');


-- Briarthorn (Loot ID: 1418)
-- Briarthorn - Journeyman Shears Bonus (Ref 91216)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91216, 2450, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91216, 2452, 40.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');

-- Briarthorn - Artisan Shears Bonus (Ref 91217)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91217, 2450, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91217, 2452, 40.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');

-- Briarthorn - Master Shears Bonus (Ref 91218)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91218, 2450, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91218, 2452, 40.0, 0, 0, 1, 2, 'Bonus from Master Shears');

-- Briarthorn - Grand Master Shears Bonus (Ref 91219)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91219, 2450, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91219, 2452, 40.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');


-- Bruiseweed (Loot ID: 1419)
-- Bruiseweed - Journeyman Shears Bonus (Ref 91220)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91220, 2453, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Bruiseweed - Artisan Shears Bonus (Ref 91221)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91221, 2453, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Bruiseweed - Master Shears Bonus (Ref 91222)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91222, 2453, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Bruiseweed - Grand Master Shears Bonus (Ref 91223)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91223, 2453, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Wild Steelbloom (Loot ID: 1420)
-- Wild Steelbloom - Journeyman Shears Bonus (Ref 91224)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91224, 3355, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Wild Steelbloom - Artisan Shears Bonus (Ref 91225)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91225, 3355, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Wild Steelbloom - Master Shears Bonus (Ref 91226)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91226, 3355, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Wild Steelbloom - Grand Master Shears Bonus (Ref 91227)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91227, 3355, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Kingsblood (Loot ID: 1421)
-- Kingsblood - Journeyman Shears Bonus (Ref 91228)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91228, 3356, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Kingsblood - Artisan Shears Bonus (Ref 91229)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91229, 3356, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Kingsblood - Master Shears Bonus (Ref 91230)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91230, 3356, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Kingsblood - Grand Master Shears Bonus (Ref 91231)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91231, 3356, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Khadgar's Whisker (Loot ID: 1423)
-- Khadgar's Whisker - Journeyman Shears Bonus (Ref 91232)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91232, 3358, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Khadgar's Whisker - Artisan Shears Bonus (Ref 91233)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91233, 3358, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Khadgar's Whisker - Master Shears Bonus (Ref 91234)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91234, 3358, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Khadgar's Whisker - Grand Master Shears Bonus (Ref 91235)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91235, 3358, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Grave Moss (Loot ID: 1424)
-- Grave Moss - Journeyman Shears Bonus (Ref 91236)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91236, 3369, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Grave Moss - Artisan Shears Bonus (Ref 91237)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91237, 3369, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Grave Moss - Master Shears Bonus (Ref 91238)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91238, 3369, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Grave Moss - Grand Master Shears Bonus (Ref 91239)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91239, 3369, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Liferoot (Loot ID: 1730)
-- Liferoot - Journeyman Shears Bonus (Ref 91240)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91240, 3357, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Liferoot - Artisan Shears Bonus (Ref 91241)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91241, 3357, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Liferoot - Master Shears Bonus (Ref 91242)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91242, 3357, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Liferoot - Grand Master Shears Bonus (Ref 91243)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91243, 3357, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Fadeleaf (Loot ID: 1731)
-- Fadeleaf - Journeyman Shears Bonus (Ref 91244)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91244, 3818, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Fadeleaf - Artisan Shears Bonus (Ref 91245)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91245, 3818, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Fadeleaf - Master Shears Bonus (Ref 91246)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91246, 3818, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Fadeleaf - Grand Master Shears Bonus (Ref 91247)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91247, 3818, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Wintersbite (Loot ID: 1732)
-- Wintersbite - Journeyman Shears Bonus (Ref 91248)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91248, 3819, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Wintersbite - Artisan Shears Bonus (Ref 91249)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91249, 3819, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Wintersbite - Master Shears Bonus (Ref 91250)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91250, 3819, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Wintersbite - Grand Master Shears Bonus (Ref 91251)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91251, 3819, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Stranglekelp (Loot ID: 1733)
-- Stranglekelp - Journeyman Shears Bonus (Ref 91252)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91252, 3820, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Stranglekelp - Artisan Shears Bonus (Ref 91253)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91253, 3820, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Stranglekelp - Master Shears Bonus (Ref 91254)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91254, 3820, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Stranglekelp - Grand Master Shears Bonus (Ref 91255)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91255, 3820, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Goldthorn (Loot ID: 1734)
-- Goldthorn - Journeyman Shears Bonus (Ref 91256)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91256, 3821, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Goldthorn - Artisan Shears Bonus (Ref 91257)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91257, 3821, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Goldthorn - Master Shears Bonus (Ref 91258)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91258, 3821, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Goldthorn - Grand Master Shears Bonus (Ref 91259)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91259, 3821, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Firebloom (Loot ID: 2292)
-- Firebloom - Journeyman Shears Bonus (Ref 91260)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91260, 4625, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Firebloom - Artisan Shears Bonus (Ref 91261)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91261, 4625, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Firebloom - Master Shears Bonus (Ref 91262)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91262, 4625, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Firebloom - Grand Master Shears Bonus (Ref 91263)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91263, 4625, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Silverleaf (Loot ID: 2511)
-- Silverleaf - Journeyman Shears Bonus (Ref 91264)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91264, 765, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91264, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Silverleaf - Artisan Shears Bonus (Ref 91265)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91265, 765, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91265, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Silverleaf - Master Shears Bonus (Ref 91266)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91266, 765, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91266, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Silverleaf - Grand Master Shears Bonus (Ref 91267)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91267, 765, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91267, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Peacebloom (Loot ID: 2512)
-- Peacebloom - Journeyman Shears Bonus (Ref 91268)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91268, 2447, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91268, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Peacebloom - Artisan Shears Bonus (Ref 91269)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91269, 2447, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91269, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Peacebloom - Master Shears Bonus (Ref 91270)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91270, 2447, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91270, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Peacebloom - Grand Master Shears Bonus (Ref 91271)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91271, 2447, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91271, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Earthroot (Loot ID: 2513)
-- Earthroot - Journeyman Shears Bonus (Ref 91272)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91272, 2449, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91272, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Earthroot - Artisan Shears Bonus (Ref 91273)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91273, 2449, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91273, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Earthroot - Master Shears Bonus (Ref 91274)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91274, 2449, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91274, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Earthroot - Grand Master Shears Bonus (Ref 91275)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91275, 2449, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91275, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Mageroyal (Loot ID: 2514)
-- Mageroyal - Journeyman Shears Bonus (Ref 91276)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91276, 785, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91276, 2452, 20.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91276, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Mageroyal - Artisan Shears Bonus (Ref 91277)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91277, 785, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91277, 2452, 20.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91277, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Mageroyal - Master Shears Bonus (Ref 91278)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91278, 785, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91278, 2452, 20.0, 0, 0, 1, 2, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91278, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Mageroyal - Grand Master Shears Bonus (Ref 91279)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91279, 785, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91279, 2452, 20.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91279, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Briarthorn (Loot ID: 2515)
-- Briarthorn - Journeyman Shears Bonus (Ref 91280)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91280, 2450, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91280, 2452, 40.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91280, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Briarthorn - Artisan Shears Bonus (Ref 91281)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91281, 2450, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91281, 2452, 40.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91281, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Briarthorn - Master Shears Bonus (Ref 91282)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91282, 2450, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91282, 2452, 40.0, 0, 0, 1, 2, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91282, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Briarthorn - Grand Master Shears Bonus (Ref 91283)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91283, 2450, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91283, 2452, 40.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91283, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Bruiseweed (Loot ID: 2516)
-- Bruiseweed - Journeyman Shears Bonus (Ref 91284)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91284, 2453, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91284, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Bruiseweed - Artisan Shears Bonus (Ref 91285)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91285, 2453, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91285, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Bruiseweed - Master Shears Bonus (Ref 91286)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91286, 2453, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91286, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Bruiseweed - Grand Master Shears Bonus (Ref 91287)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91287, 2453, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91287, 5056, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Purple Lotus (Loot ID: 6142)
-- Purple Lotus - Journeyman Shears Bonus (Ref 91288)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91288, 8153, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91288, 8831, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Purple Lotus - Artisan Shears Bonus (Ref 91289)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91289, 8153, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91289, 8831, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Purple Lotus - Master Shears Bonus (Ref 91290)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91290, 8153, 10.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91290, 8831, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Purple Lotus - Grand Master Shears Bonus (Ref 91291)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91291, 8153, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91291, 8831, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Arthas' Tears (Loot ID: 6150)
-- Arthas' Tears - Journeyman Shears Bonus (Ref 91292)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91292, 8836, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Arthas' Tears - Artisan Shears Bonus (Ref 91293)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91293, 8836, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Arthas' Tears - Master Shears Bonus (Ref 91294)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91294, 8836, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Arthas' Tears - Grand Master Shears Bonus (Ref 91295)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91295, 8836, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Sungrass (Loot ID: 6151)
-- Sungrass - Journeyman Shears Bonus (Ref 91296)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91296, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Sungrass - Artisan Shears Bonus (Ref 91297)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91297, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Sungrass - Master Shears Bonus (Ref 91298)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91298, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Sungrass - Grand Master Shears Bonus (Ref 91299)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91299, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Blindweed (Loot ID: 6152)
-- Blindweed - Journeyman Shears Bonus (Ref 91300)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91300, 8839, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Blindweed - Artisan Shears Bonus (Ref 91301)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91301, 8839, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Blindweed - Master Shears Bonus (Ref 91302)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91302, 8839, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Blindweed - Grand Master Shears Bonus (Ref 91303)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91303, 8839, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Ghost Mushroom (Loot ID: 6312)
-- Ghost Mushroom - Journeyman Shears Bonus (Ref 91304)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91304, 8845, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Ghost Mushroom - Artisan Shears Bonus (Ref 91305)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91305, 8845, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Ghost Mushroom - Master Shears Bonus (Ref 91306)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91306, 8845, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Ghost Mushroom - Grand Master Shears Bonus (Ref 91307)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91307, 8845, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Gromsblood (Loot ID: 6313)
-- Gromsblood - Journeyman Shears Bonus (Ref 91308)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91308, 8846, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Gromsblood - Artisan Shears Bonus (Ref 91309)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91309, 8846, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Gromsblood - Master Shears Bonus (Ref 91310)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91310, 8846, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Gromsblood - Grand Master Shears Bonus (Ref 91311)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91311, 8846, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Golden Sansam (Loot ID: 13945)
-- Golden Sansam - Journeyman Shears Bonus (Ref 91312)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91312, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Golden Sansam - Artisan Shears Bonus (Ref 91313)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91313, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Golden Sansam - Master Shears Bonus (Ref 91314)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91314, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Golden Sansam - Grand Master Shears Bonus (Ref 91315)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91315, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Dreamfoil (Loot ID: 13946)
-- Dreamfoil - Journeyman Shears Bonus (Ref 91316)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91316, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Dreamfoil - Artisan Shears Bonus (Ref 91317)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91317, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Dreamfoil - Master Shears Bonus (Ref 91318)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91318, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Dreamfoil - Grand Master Shears Bonus (Ref 91319)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91319, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Mountain Silversage (Loot ID: 13947)
-- Mountain Silversage - Journeyman Shears Bonus (Ref 91320)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91320, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Mountain Silversage - Artisan Shears Bonus (Ref 91321)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91321, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Mountain Silversage - Master Shears Bonus (Ref 91322)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91322, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Mountain Silversage - Grand Master Shears Bonus (Ref 91323)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91323, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Plaguebloom (Loot ID: 13948)
-- Plaguebloom - Journeyman Shears Bonus (Ref 91324)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91324, 13466, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Plaguebloom - Artisan Shears Bonus (Ref 91325)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91325, 13466, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Plaguebloom - Master Shears Bonus (Ref 91326)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91326, 13466, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Plaguebloom - Grand Master Shears Bonus (Ref 91327)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91327, 13466, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Icecap (Loot ID: 13949)
-- Icecap - Journeyman Shears Bonus (Ref 91328)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91328, 13467, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Icecap - Artisan Shears Bonus (Ref 91329)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91329, 13467, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Icecap - Master Shears Bonus (Ref 91330)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91330, 13467, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Icecap - Grand Master Shears Bonus (Ref 91331)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91331, 13467, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Black Lotus (Loot ID: 13950)
-- Black Lotus - Journeyman Shears Bonus (Ref 91332)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91332, 13468, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Black Lotus - Artisan Shears Bonus (Ref 91333)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91333, 13468, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Black Lotus - Master Shears Bonus (Ref 91334)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91334, 13468, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Black Lotus - Grand Master Shears Bonus (Ref 91335)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91335, 13468, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Sungrass (Loot ID: 13965)
-- Sungrass - Journeyman Shears Bonus (Ref 91336)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91336, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91336, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');

-- Sungrass - Artisan Shears Bonus (Ref 91337)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91337, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91337, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');

-- Sungrass - Master Shears Bonus (Ref 91338)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91338, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91338, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Master Shears');

-- Sungrass - Grand Master Shears Bonus (Ref 91339)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91339, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91339, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');


-- Gromsblood (Loot ID: 13966)
-- Gromsblood - Journeyman Shears Bonus (Ref 91340)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91340, 8846, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91340, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');

-- Gromsblood - Artisan Shears Bonus (Ref 91341)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91341, 8846, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91341, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');

-- Gromsblood - Master Shears Bonus (Ref 91342)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91342, 8846, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91342, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Master Shears');

-- Gromsblood - Grand Master Shears Bonus (Ref 91343)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91343, 8846, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91343, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');


-- Golden Sansam (Loot ID: 13967)
-- Golden Sansam - Journeyman Shears Bonus (Ref 91344)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91344, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91344, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Golden Sansam - Artisan Shears Bonus (Ref 91345)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91345, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91345, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Golden Sansam - Master Shears Bonus (Ref 91346)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91346, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91346, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Golden Sansam - Grand Master Shears Bonus (Ref 91347)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91347, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91347, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Dreamfoil (Loot ID: 13968)
-- Dreamfoil - Journeyman Shears Bonus (Ref 91348)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91348, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91348, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Dreamfoil - Artisan Shears Bonus (Ref 91349)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91349, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91349, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Dreamfoil - Master Shears Bonus (Ref 91350)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91350, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91350, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Dreamfoil - Grand Master Shears Bonus (Ref 91351)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91351, 11514, 50.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91351, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Mountain Silversage (Loot ID: 13969)
-- Mountain Silversage - Journeyman Shears Bonus (Ref 91352)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91352, 11514, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91352, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Mountain Silversage - Artisan Shears Bonus (Ref 91353)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91353, 11514, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91353, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Mountain Silversage - Master Shears Bonus (Ref 91354)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91354, 11514, 10.0, 0, 0, 1, 2, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91354, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Mountain Silversage - Grand Master Shears Bonus (Ref 91355)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91355, 11514, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91355, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Arthas' Tears (Loot ID: 13970)
-- Arthas' Tears - Journeyman Shears Bonus (Ref 91356)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91356, 8836, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91356, 11514, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Arthas' Tears - Artisan Shears Bonus (Ref 91357)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91357, 8836, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91357, 11514, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Arthas' Tears - Master Shears Bonus (Ref 91358)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91358, 8836, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91358, 11514, 50.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Arthas' Tears - Grand Master Shears Bonus (Ref 91359)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91359, 8836, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91359, 11514, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Plaguebloom (Loot ID: 13971)
-- Plaguebloom - Journeyman Shears Bonus (Ref 91360)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91360, 11514, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91360, 13466, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Plaguebloom - Artisan Shears Bonus (Ref 91361)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91361, 11514, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91361, 13466, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Plaguebloom - Master Shears Bonus (Ref 91362)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91362, 11514, 50.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91362, 13466, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Plaguebloom - Grand Master Shears Bonus (Ref 91363)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91363, 11514, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91363, 13466, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Purple Lotus (Loot ID: 17200)
-- Purple Lotus - Journeyman Shears Bonus (Ref 91364)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91364, 8153, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91364, 8831, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91364, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Purple Lotus - Artisan Shears Bonus (Ref 91365)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91365, 8153, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91365, 8831, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91365, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Purple Lotus - Master Shears Bonus (Ref 91366)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91366, 8153, 10.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91366, 8831, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91366, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Purple Lotus - Grand Master Shears Bonus (Ref 91367)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91367, 8153, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91367, 8831, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91367, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Sungrass (Loot ID: 17201)
-- Sungrass - Journeyman Shears Bonus (Ref 91368)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91368, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91368, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Sungrass - Artisan Shears Bonus (Ref 91369)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91369, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91369, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Sungrass - Master Shears Bonus (Ref 91370)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91370, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91370, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Sungrass - Grand Master Shears Bonus (Ref 91371)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91371, 8838, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91371, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Golden Sansam (Loot ID: 17202)
-- Golden Sansam - Journeyman Shears Bonus (Ref 91372)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91372, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91372, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Golden Sansam - Artisan Shears Bonus (Ref 91373)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91373, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91373, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Golden Sansam - Master Shears Bonus (Ref 91374)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91374, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91374, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Golden Sansam - Grand Master Shears Bonus (Ref 91375)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91375, 13464, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91375, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Dreamfoil (Loot ID: 17203)
-- Dreamfoil - Journeyman Shears Bonus (Ref 91376)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91376, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91376, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Dreamfoil - Artisan Shears Bonus (Ref 91377)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91377, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91377, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Dreamfoil - Master Shears Bonus (Ref 91378)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91378, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91378, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Dreamfoil - Grand Master Shears Bonus (Ref 91379)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91379, 13463, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91379, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Mountain Silversage (Loot ID: 17204)
-- Mountain Silversage - Journeyman Shears Bonus (Ref 91380)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91380, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91380, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Mountain Silversage - Artisan Shears Bonus (Ref 91381)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91381, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91381, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Mountain Silversage - Master Shears Bonus (Ref 91382)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91382, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91382, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Mountain Silversage - Grand Master Shears Bonus (Ref 91383)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91383, 13465, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91383, 19726, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Bloodthistle (Loot ID: 18009)
-- Bloodthistle - Journeyman Shears Bonus (Ref 91384)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91384, 22710, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Bloodthistle - Artisan Shears Bonus (Ref 91385)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91385, 22710, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Bloodthistle - Master Shears Bonus (Ref 91386)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91386, 22710, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Bloodthistle - Grand Master Shears Bonus (Ref 91387)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91387, 22710, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Felweed (Loot ID: 18111)
-- Felweed - Journeyman Shears Bonus (Ref 91388)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91388, 22575, 15.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91388, 22785, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91388, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91388, 22795, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Felweed - Artisan Shears Bonus (Ref 91389)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91389, 22575, 15.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91389, 22785, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91389, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91389, 22795, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Felweed - Master Shears Bonus (Ref 91390)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91390, 22575, 15.0, 0, 0, 1, 2, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91390, 22785, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91390, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91390, 22795, 10.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Felweed - Grand Master Shears Bonus (Ref 91391)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91391, 22575, 15.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91391, 22785, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91391, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91391, 22795, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Dreaming Glory (Loot ID: 18112)
-- Dreaming Glory - Journeyman Shears Bonus (Ref 91392)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91392, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91392, 22786, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91392, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Dreaming Glory - Artisan Shears Bonus (Ref 91393)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91393, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91393, 22786, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91393, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Dreaming Glory - Master Shears Bonus (Ref 91394)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91394, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91394, 22786, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91394, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Dreaming Glory - Grand Master Shears Bonus (Ref 91395)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91395, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91395, 22786, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91395, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Ragveil (Loot ID: 18113)
-- Ragveil - Journeyman Shears Bonus (Ref 91396)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91396, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91396, 22787, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91396, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Ragveil - Artisan Shears Bonus (Ref 91397)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91397, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91397, 22787, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91397, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Ragveil - Master Shears Bonus (Ref 91398)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91398, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91398, 22787, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91398, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Ragveil - Grand Master Shears Bonus (Ref 91399)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91399, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91399, 22787, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91399, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Flame Cap (Loot ID: 18114)
-- Flame Cap - Journeyman Shears Bonus (Ref 91400)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91400, 22788, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91400, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91400, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Flame Cap - Artisan Shears Bonus (Ref 91401)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91401, 22788, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91401, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91401, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Flame Cap - Master Shears Bonus (Ref 91402)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91402, 22788, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91402, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91402, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Flame Cap - Grand Master Shears Bonus (Ref 91403)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91403, 22788, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91403, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91403, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Terocone (Loot ID: 18115)
-- Terocone - Journeyman Shears Bonus (Ref 91404)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91404, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91404, 22789, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91404, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91404, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Terocone - Artisan Shears Bonus (Ref 91405)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91405, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91405, 22789, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91405, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91405, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Terocone - Master Shears Bonus (Ref 91406)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91406, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91406, 22789, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91406, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91406, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Terocone - Grand Master Shears Bonus (Ref 91407)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91407, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91407, 22789, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91407, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91407, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Ancient Lichen (Loot ID: 18116)
-- Ancient Lichen - Journeyman Shears Bonus (Ref 91408)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91408, 22790, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91408, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91408, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Ancient Lichen - Artisan Shears Bonus (Ref 91409)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91409, 22790, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91409, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91409, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Ancient Lichen - Master Shears Bonus (Ref 91410)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91410, 22790, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91410, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91410, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Ancient Lichen - Grand Master Shears Bonus (Ref 91411)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91411, 22790, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91411, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91411, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Netherbloom (Loot ID: 18117)
-- Netherbloom - Journeyman Shears Bonus (Ref 91412)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91412, 22576, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91412, 22791, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91412, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91412, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Netherbloom - Artisan Shears Bonus (Ref 91413)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91413, 22576, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91413, 22791, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91413, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91413, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Netherbloom - Master Shears Bonus (Ref 91414)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91414, 22576, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91414, 22791, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91414, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91414, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Netherbloom - Grand Master Shears Bonus (Ref 91415)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91415, 22576, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91415, 22791, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91415, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91415, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Nightmare Vine (Loot ID: 18118)
-- Nightmare Vine - Journeyman Shears Bonus (Ref 91416)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 22575, 10.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 22792, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 22797, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Nightmare Vine - Artisan Shears Bonus (Ref 91417)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 22575, 10.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 22792, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 22797, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Nightmare Vine - Master Shears Bonus (Ref 91418)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 22575, 10.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 22792, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 22797, 10.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Nightmare Vine - Grand Master Shears Bonus (Ref 91419)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 22575, 10.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 22792, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 22797, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Mana Thistle (Loot ID: 18119)
-- Mana Thistle - Journeyman Shears Bonus (Ref 91420)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91420, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91420, 22793, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91420, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91420, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');

-- Mana Thistle - Artisan Shears Bonus (Ref 91421)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91421, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91421, 22793, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91421, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91421, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');

-- Mana Thistle - Master Shears Bonus (Ref 91422)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91422, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91422, 22793, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91422, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91422, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Shears');

-- Mana Thistle - Grand Master Shears Bonus (Ref 91423)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91423, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91423, 22793, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91423, 22794, 3.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91423, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');


-- Ragveil (Loot ID: 19627)
-- Ragveil - Journeyman Shears Bonus (Ref 91424)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91424, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91424, 22787, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91424, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91424, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Ragveil - Artisan Shears Bonus (Ref 91425)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91425, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91425, 22787, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91425, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91425, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Ragveil - Master Shears Bonus (Ref 91426)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91426, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91426, 22787, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91426, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91426, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Ragveil - Grand Master Shears Bonus (Ref 91427)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91427, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91427, 22787, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91427, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91427, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Felweed (Loot ID: 19628)
-- Felweed - Journeyman Shears Bonus (Ref 91428)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91428, 22575, 15.0, 0, 0, 1, 2, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91428, 22785, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91428, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91428, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Felweed - Artisan Shears Bonus (Ref 91429)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91429, 22575, 15.0, 0, 0, 1, 2, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91429, 22785, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91429, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91429, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Felweed - Master Shears Bonus (Ref 91430)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91430, 22575, 15.0, 0, 0, 1, 2, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91430, 22785, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91430, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91430, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Felweed - Grand Master Shears Bonus (Ref 91431)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91431, 22575, 15.0, 0, 0, 1, 2, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91431, 22785, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91431, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91431, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Dreaming Glory (Loot ID: 19629)
-- Dreaming Glory - Journeyman Shears Bonus (Ref 91432)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91432, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91432, 22786, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91432, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91432, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Dreaming Glory - Artisan Shears Bonus (Ref 91433)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91433, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91433, 22786, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91433, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91433, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Dreaming Glory - Master Shears Bonus (Ref 91434)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91434, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91434, 22786, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91434, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91434, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Dreaming Glory - Grand Master Shears Bonus (Ref 91435)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91435, 22575, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91435, 22786, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91435, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91435, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Blindweed (Loot ID: 19630)
-- Blindweed - Journeyman Shears Bonus (Ref 91436)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91436, 8839, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91436, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Blindweed - Artisan Shears Bonus (Ref 91437)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91437, 8839, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91437, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Blindweed - Master Shears Bonus (Ref 91438)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91438, 8839, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91438, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Blindweed - Grand Master Shears Bonus (Ref 91439)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91439, 8839, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91439, 24401, 10.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Goldclover (Loot ID: 24093)
-- Goldclover - Journeyman Shears Bonus (Ref 91440)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91440, 36901, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91440, 37704, 20.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91440, 37921, 35.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Goldclover - Artisan Shears Bonus (Ref 91441)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91441, 36901, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91441, 37704, 20.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91441, 37921, 35.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Goldclover - Master Shears Bonus (Ref 91442)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91442, 36901, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91442, 37704, 20.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91442, 37921, 35.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Goldclover - Grand Master Shears Bonus (Ref 91443)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91443, 36901, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91443, 37704, 20.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91443, 37921, 35.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Tiger Lily (Loot ID: 24224)
-- Tiger Lily - Journeyman Shears Bonus (Ref 91444)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91444, 36904, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91444, 37704, 20.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91444, 37921, 35.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Tiger Lily - Artisan Shears Bonus (Ref 91445)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91445, 36904, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91445, 37704, 20.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91445, 37921, 35.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Tiger Lily - Master Shears Bonus (Ref 91446)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91446, 36904, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91446, 37704, 20.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91446, 37921, 35.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Tiger Lily - Grand Master Shears Bonus (Ref 91447)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91447, 36904, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91447, 37704, 20.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91447, 37921, 35.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Lichbloom (Loot ID: 24226)
-- Lichbloom - Journeyman Shears Bonus (Ref 91448)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91448, 36905, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91448, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Lichbloom - Artisan Shears Bonus (Ref 91449)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91449, 36905, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91449, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Lichbloom - Master Shears Bonus (Ref 91450)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91450, 36905, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91450, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Lichbloom - Grand Master Shears Bonus (Ref 91451)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91451, 36905, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91451, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Icethorn (Loot ID: 24227)
-- Icethorn - Journeyman Shears Bonus (Ref 91452)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91452, 36906, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91452, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Icethorn - Artisan Shears Bonus (Ref 91453)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91453, 36906, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91453, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Icethorn - Master Shears Bonus (Ref 91454)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91454, 36906, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91454, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Icethorn - Grand Master Shears Bonus (Ref 91455)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91455, 36906, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91455, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Adder's Tongue (Loot ID: 25093)
-- Adder's Tongue - Journeyman Shears Bonus (Ref 91456)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91456, 36903, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91456, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Journeyman Shears');

-- Adder's Tongue - Artisan Shears Bonus (Ref 91457)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91457, 36903, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91457, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Artisan Shears');

-- Adder's Tongue - Master Shears Bonus (Ref 91458)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91458, 36903, 100.0, 0, 0, 1, 3, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91458, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Master Shears');

-- Adder's Tongue - Grand Master Shears Bonus (Ref 91459)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91459, 36903, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91459, 37704, 25.0, 0, 0, 1, 3, 'Bonus from Grand Master Shears');


-- Frozen Herb (Loot ID: 25094)
-- Frozen Herb - Journeyman Shears Bonus (Ref 91460)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91460, 36901, 0.0, 1, 0, 1, 4, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91460, 36904, 0.0, 1, 0, 1, 4, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91460, 36907, 0.0, 1, 0, 1, 4, 'Bonus from Journeyman Shears');

-- Frozen Herb - Artisan Shears Bonus (Ref 91461)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91461, 36901, 0.0, 1, 0, 1, 4, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91461, 36904, 0.0, 1, 0, 1, 4, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91461, 36907, 0.0, 1, 0, 1, 4, 'Bonus from Artisan Shears');

-- Frozen Herb - Master Shears Bonus (Ref 91462)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91462, 36901, 0.0, 1, 0, 1, 4, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91462, 36904, 0.0, 1, 0, 1, 4, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91462, 36907, 0.0, 1, 0, 1, 4, 'Bonus from Master Shears');

-- Frozen Herb - Grand Master Shears Bonus (Ref 91463)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91463, 36901, 0.0, 1, 0, 1, 4, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91463, 36904, 0.0, 1, 0, 1, 4, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91463, 36907, 0.0, 1, 0, 1, 4, 'Bonus from Grand Master Shears');


-- Frozen Herb (Loot ID: 25095)
-- Frozen Herb - Journeyman Shears Bonus (Ref 91464)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91464, 36901, 0.0, 1, 0, 1, 4, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91464, 36904, 0.0, 1, 0, 1, 4, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91464, 36907, 0.0, 1, 0, 1, 4, 'Bonus from Journeyman Shears');

-- Frozen Herb - Artisan Shears Bonus (Ref 91465)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91465, 36901, 0.0, 1, 0, 1, 4, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91465, 36904, 0.0, 1, 0, 1, 4, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91465, 36907, 0.0, 1, 0, 1, 4, 'Bonus from Artisan Shears');

-- Frozen Herb - Master Shears Bonus (Ref 91466)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91466, 36901, 0.0, 1, 0, 1, 4, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91466, 36904, 0.0, 1, 0, 1, 4, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91466, 36907, 0.0, 1, 0, 1, 4, 'Bonus from Master Shears');

-- Frozen Herb - Grand Master Shears Bonus (Ref 91467)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91467, 36901, 0.0, 1, 0, 1, 4, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91467, 36904, 0.0, 1, 0, 1, 4, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91467, 36907, 0.0, 1, 0, 1, 4, 'Bonus from Grand Master Shears');


-- Frozen Herb (Loot ID: 25096)
-- Frozen Herb - Journeyman Shears Bonus (Ref 91468)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91468, 36901, 60.0, 0, 0, 2, 6, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91468, 36904, 20.0, 0, 0, 2, 6, 'Bonus from Journeyman Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91468, 36907, 20.0, 0, 0, 2, 6, 'Bonus from Journeyman Shears');

-- Frozen Herb - Artisan Shears Bonus (Ref 91469)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91469, 36901, 60.0, 0, 0, 2, 6, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91469, 36904, 20.0, 0, 0, 2, 6, 'Bonus from Artisan Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91469, 36907, 20.0, 0, 0, 2, 6, 'Bonus from Artisan Shears');

-- Frozen Herb - Master Shears Bonus (Ref 91470)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91470, 36901, 60.0, 0, 0, 2, 6, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91470, 36904, 20.0, 0, 0, 2, 6, 'Bonus from Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91470, 36907, 20.0, 0, 0, 2, 6, 'Bonus from Master Shears');

-- Frozen Herb - Grand Master Shears Bonus (Ref 91471)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91471, 36901, 60.0, 0, 0, 2, 6, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91471, 36904, 20.0, 0, 0, 2, 6, 'Bonus from Grand Master Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91471, 36907, 20.0, 0, 0, 2, 6, 'Bonus from Grand Master Shears');


-- =====================================================
-- LINK REFERENCES TO GAMEOBJECTS
-- =====================================================

-- Journeyman bonus for GO 1617
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1617, 9000, 91200, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1617
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1617, 9001, 91201, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1617
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1617, 9002, 91202, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1617
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1617, 9003, 91203, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 1618
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1618, 9004, 91204, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1618
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1618, 9005, 91205, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1618
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1618, 9006, 91206, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1618
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1618, 9007, 91207, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 1619
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1619, 9008, 91208, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1619
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1619, 9009, 91209, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1619
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1619, 9010, 91210, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1619
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1619, 9011, 91211, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 1620
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1620, 9012, 91212, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1620
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1620, 9013, 91213, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1620
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1620, 9014, 91214, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1620
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1620, 9015, 91215, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 1621
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1621, 9016, 91216, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1621
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1621, 9017, 91217, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1621
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1621, 9018, 91218, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1621
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1621, 9019, 91219, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 1622
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1622, 9020, 91220, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1622
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1622, 9021, 91221, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1622
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1622, 9022, 91222, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1622
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1622, 9023, 91223, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 1623
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1623, 9024, 91224, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1623
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1623, 9025, 91225, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1623
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1623, 9026, 91226, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1623
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1623, 9027, 91227, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 1624
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1624, 9028, 91228, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1624
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1624, 9029, 91229, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1624
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1624, 9030, 91230, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1624
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1624, 9031, 91231, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 2043
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2043, 9032, 91232, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 2043
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2043, 9033, 91233, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 2043
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2043, 9034, 91234, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 2043
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2043, 9035, 91235, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 1628
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1628, 9036, 91236, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 1628
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1628, 9037, 91237, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 1628
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1628, 9038, 91238, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 1628
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1628, 9039, 91239, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 2041
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2041, 9040, 91240, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 2041
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2041, 9041, 91241, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 2041
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2041, 9042, 91242, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 2041
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2041, 9043, 91243, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 2042
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2042, 9044, 91244, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 2042
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2042, 9045, 91245, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 2042
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2042, 9046, 91246, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 2042
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2042, 9047, 91247, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 2044
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2044, 9048, 91248, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 2044
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2044, 9049, 91249, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 2044
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2044, 9050, 91250, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 2044
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2044, 9051, 91251, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 2045
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2045, 9052, 91252, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 2045
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2045, 9053, 91253, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 2045
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2045, 9054, 91254, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 2045
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2045, 9055, 91255, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 2046
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2046, 9056, 91256, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 2046
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2046, 9057, 91257, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 2046
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2046, 9058, 91258, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 2046
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2046, 9059, 91259, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 2866
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2866, 9060, 91260, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 2866
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2866, 9061, 91261, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 2866
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2866, 9062, 91262, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 2866
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2866, 9063, 91263, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 3725
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3725, 9064, 91264, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 3725
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3725, 9065, 91265, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 3725
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3725, 9066, 91266, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 3725
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3725, 9067, 91267, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 3724
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3724, 9068, 91268, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 3724
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3724, 9069, 91269, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 3724
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3724, 9070, 91270, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 3724
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3724, 9071, 91271, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 3726
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3726, 9072, 91272, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 3726
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3726, 9073, 91273, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 3726
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3726, 9074, 91274, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 3726
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3726, 9075, 91275, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 3727
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3727, 9076, 91276, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 3727
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3727, 9077, 91277, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 3727
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3727, 9078, 91278, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 3727
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3727, 9079, 91279, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 3729
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3729, 9080, 91280, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 3729
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3729, 9081, 91281, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 3729
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3729, 9082, 91282, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 3729
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3729, 9083, 91283, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 3730
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3730, 9084, 91284, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 3730
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3730, 9085, 91285, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 3730
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3730, 9086, 91286, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 3730
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3730, 9087, 91287, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 142140
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142140, 9088, 91288, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 142140
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142140, 9089, 91289, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 142140
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142140, 9090, 91290, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 142140
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142140, 9091, 91291, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 142141
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142141, 9092, 91292, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 142141
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142141, 9093, 91293, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 142141
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142141, 9094, 91294, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 142141
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142141, 9095, 91295, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 142142
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142142, 9096, 91296, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 142142
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142142, 9097, 91297, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 142142
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142142, 9098, 91298, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 142142
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142142, 9099, 91299, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 142143
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142143, 9100, 91300, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 142143
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142143, 9101, 91301, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 142143
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142143, 9102, 91302, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 142143
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142143, 9103, 91303, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 142144
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142144, 9104, 91304, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 142144
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142144, 9105, 91305, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 142144
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142144, 9106, 91306, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 142144
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142144, 9107, 91307, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 142145
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142145, 9108, 91308, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 142145
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142145, 9109, 91309, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 142145
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142145, 9110, 91310, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 142145
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (142145, 9111, 91311, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176583
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176583, 9112, 91312, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176583
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176583, 9113, 91313, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176583
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176583, 9114, 91314, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176583
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176583, 9115, 91315, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176584
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176584, 9116, 91316, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176584
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176584, 9117, 91317, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176584
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176584, 9118, 91318, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176584
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176584, 9119, 91319, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176586
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176586, 9120, 91320, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176586
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176586, 9121, 91321, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176586
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176586, 9122, 91322, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176586
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176586, 9123, 91323, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176587
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176587, 9124, 91324, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176587
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176587, 9125, 91325, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176587
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176587, 9126, 91326, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176587
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176587, 9127, 91327, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176588
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176588, 9128, 91328, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176588
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176588, 9129, 91329, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176588
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176588, 9130, 91330, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176588
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176588, 9131, 91331, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176589
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176589, 9132, 91332, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176589
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176589, 9133, 91333, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176589
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176589, 9134, 91334, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176589
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176589, 9135, 91335, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176636
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176636, 9136, 91336, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176636
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176636, 9137, 91337, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176636
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176636, 9138, 91338, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176636
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176636, 9139, 91339, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176637
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176637, 9140, 91340, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176637
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176637, 9141, 91341, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176637
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176637, 9142, 91342, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176637
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176637, 9143, 91343, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176638
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176638, 9144, 91344, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176638
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176638, 9145, 91345, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176638
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176638, 9146, 91346, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176638
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176638, 9147, 91347, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176639
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176639, 9148, 91348, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176639
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176639, 9149, 91349, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176639
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176639, 9150, 91350, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176639
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176639, 9151, 91351, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176640
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176640, 9152, 91352, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176640
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176640, 9153, 91353, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176640
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176640, 9154, 91354, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176640
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176640, 9155, 91355, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176642
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176642, 9156, 91356, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176642
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176642, 9157, 91357, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176642
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176642, 9158, 91358, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176642
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176642, 9159, 91359, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 176641
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176641, 9160, 91360, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 176641
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176641, 9161, 91361, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 176641
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176641, 9162, 91362, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 176641
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176641, 9163, 91363, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 180165
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180165, 9164, 91364, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 180165
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180165, 9165, 91365, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 180165
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180165, 9166, 91366, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 180165
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180165, 9167, 91367, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 180164
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180164, 9168, 91368, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 180164
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180164, 9169, 91369, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 180164
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180164, 9170, 91370, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 180164
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180164, 9171, 91371, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 180167
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180167, 9172, 91372, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 180167
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180167, 9173, 91373, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 180167
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180167, 9174, 91374, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 180167
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180167, 9175, 91375, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 180168
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180168, 9176, 91376, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 180168
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180168, 9177, 91377, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 180168
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180168, 9178, 91378, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 180168
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180168, 9179, 91379, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 180166
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180166, 9180, 91380, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 180166
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180166, 9181, 91381, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 180166
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180166, 9182, 91382, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 180166
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180166, 9183, 91383, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181166
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181166, 9184, 91384, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181166
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181166, 9185, 91385, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181166
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181166, 9186, 91386, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181166
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181166, 9187, 91387, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181270
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181270, 9188, 91388, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181270
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181270, 9189, 91389, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181270
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181270, 9190, 91390, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181270
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181270, 9191, 91391, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181271
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181271, 9192, 91392, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181271
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181271, 9193, 91393, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181271
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181271, 9194, 91394, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181271
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181271, 9195, 91395, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181275
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181275, 9196, 91396, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181275
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181275, 9197, 91397, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181275
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181275, 9198, 91398, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181275
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181275, 9199, 91399, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181276
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181276, 9200, 91400, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181276
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181276, 9201, 91401, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181276
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181276, 9202, 91402, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181276
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181276, 9203, 91403, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181277
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181277, 9204, 91404, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181277
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181277, 9205, 91405, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181277
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181277, 9206, 91406, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181277
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181277, 9207, 91407, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181278
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181278, 9208, 91408, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181278
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181278, 9209, 91409, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181278
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181278, 9210, 91410, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181278
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181278, 9211, 91411, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181279
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181279, 9212, 91412, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181279
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181279, 9213, 91413, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181279
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181279, 9214, 91414, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181279
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181279, 9215, 91415, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181280
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181280, 9216, 91416, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181280
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181280, 9217, 91417, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181280
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181280, 9218, 91418, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181280
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181280, 9219, 91419, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 181281
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181281, 9220, 91420, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 181281
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181281, 9221, 91421, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 181281
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181281, 9222, 91422, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 181281
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181281, 9223, 91423, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 183043
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183043, 9224, 91424, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 183043
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183043, 9225, 91425, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 183043
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183043, 9226, 91426, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 183043
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183043, 9227, 91427, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 183044
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183044, 9228, 91428, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 183044
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183044, 9229, 91429, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 183044
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183044, 9230, 91430, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 183044
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183044, 9231, 91431, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 183045
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183045, 9232, 91432, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 183045
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183045, 9233, 91433, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 183045
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183045, 9234, 91434, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 183045
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183045, 9235, 91435, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 183046
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183046, 9236, 91436, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 183046
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183046, 9237, 91437, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 183046
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183046, 9238, 91438, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 183046
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (183046, 9239, 91439, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 189973
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189973, 9240, 91440, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 189973
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189973, 9241, 91441, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 189973
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189973, 9242, 91442, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 189973
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189973, 9243, 91443, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 190169
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190169, 9244, 91444, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 190169
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190169, 9245, 91445, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 190169
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190169, 9246, 91446, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 190169
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190169, 9247, 91447, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 190171
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190171, 9248, 91448, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 190171
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190171, 9249, 91449, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 190171
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190171, 9250, 91450, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 190171
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190171, 9251, 91451, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 190172
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190172, 9252, 91452, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 190172
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190172, 9253, 91453, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 190172
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190172, 9254, 91454, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 190172
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190172, 9255, 91455, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 191019
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (191019, 9256, 91456, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 191019
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (191019, 9257, 91457, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 191019
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (191019, 9258, 91458, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 191019
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (191019, 9259, 91459, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 190173
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190173, 9260, 91460, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 190173
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190173, 9261, 91461, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 190173
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190173, 9262, 91462, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 190173
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190173, 9263, 91463, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 190175
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190175, 9264, 91464, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 190175
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190175, 9265, 91465, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 190175
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190175, 9266, 91466, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 190175
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190175, 9267, 91467, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- Journeyman bonus for GO 190174
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190174, 9268, 91468, 10, 0, 1, 1, 'Journeyman Shears Bonus');
-- Artisan bonus for GO 190174
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190174, 9269, 91469, 20, 0, 1, 1, 'Artisan Shears Bonus');
-- Master bonus for GO 190174
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190174, 9270, 91470, 30, 0, 1, 1, 'Master Shears Bonus');
-- Grand Master bonus for GO 190174
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (190174, 9271, 91471, 40, 0, 1, 1, 'Grand Master Shears Bonus');

-- =====================================================
-- CONDITIONS (Check for active shear auras)
-- =====================================================

-- Silverleaf - Journeyman Shears condition (Ref 91200)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91200, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Silverleaf - Artisan Shears condition (Ref 91201)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91201, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Silverleaf - Master Shears condition (Ref 91202)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91202, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Silverleaf - Grand Master Shears condition (Ref 91203)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91203, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Peacebloom - Journeyman Shears condition (Ref 91204)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91204, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Peacebloom - Artisan Shears condition (Ref 91205)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91205, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Peacebloom - Master Shears condition (Ref 91206)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91206, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Peacebloom - Grand Master Shears condition (Ref 91207)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91207, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Earthroot - Journeyman Shears condition (Ref 91208)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91208, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Earthroot - Artisan Shears condition (Ref 91209)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91209, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Earthroot - Master Shears condition (Ref 91210)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91210, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Earthroot - Grand Master Shears condition (Ref 91211)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91211, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Mageroyal - Journeyman Shears condition (Ref 91212)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91212, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Mageroyal - Artisan Shears condition (Ref 91213)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91213, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Mageroyal - Master Shears condition (Ref 91214)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91214, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Mageroyal - Grand Master Shears condition (Ref 91215)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91215, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Briarthorn - Journeyman Shears condition (Ref 91216)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91216, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Briarthorn - Artisan Shears condition (Ref 91217)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91217, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Briarthorn - Master Shears condition (Ref 91218)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91218, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Briarthorn - Grand Master Shears condition (Ref 91219)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91219, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Bruiseweed - Journeyman Shears condition (Ref 91220)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91220, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Bruiseweed - Artisan Shears condition (Ref 91221)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91221, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Bruiseweed - Master Shears condition (Ref 91222)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91222, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Bruiseweed - Grand Master Shears condition (Ref 91223)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91223, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Wild Steelbloom - Journeyman Shears condition (Ref 91224)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91224, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Wild Steelbloom - Artisan Shears condition (Ref 91225)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91225, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Wild Steelbloom - Master Shears condition (Ref 91226)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91226, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Wild Steelbloom - Grand Master Shears condition (Ref 91227)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91227, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Kingsblood - Journeyman Shears condition (Ref 91228)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91228, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Kingsblood - Artisan Shears condition (Ref 91229)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91229, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Kingsblood - Master Shears condition (Ref 91230)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91230, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Kingsblood - Grand Master Shears condition (Ref 91231)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91231, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Khadgar's Whisker - Journeyman Shears condition (Ref 91232)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91232, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Khadgar's Whisker - Artisan Shears condition (Ref 91233)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91233, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Khadgar's Whisker - Master Shears condition (Ref 91234)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91234, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Khadgar's Whisker - Grand Master Shears condition (Ref 91235)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91235, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Grave Moss - Journeyman Shears condition (Ref 91236)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91236, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Grave Moss - Artisan Shears condition (Ref 91237)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91237, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Grave Moss - Master Shears condition (Ref 91238)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91238, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Grave Moss - Grand Master Shears condition (Ref 91239)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91239, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Liferoot - Journeyman Shears condition (Ref 91240)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91240, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Liferoot - Artisan Shears condition (Ref 91241)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91241, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Liferoot - Master Shears condition (Ref 91242)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91242, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Liferoot - Grand Master Shears condition (Ref 91243)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91243, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Fadeleaf - Journeyman Shears condition (Ref 91244)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91244, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Fadeleaf - Artisan Shears condition (Ref 91245)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91245, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Fadeleaf - Master Shears condition (Ref 91246)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91246, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Fadeleaf - Grand Master Shears condition (Ref 91247)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91247, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Wintersbite - Journeyman Shears condition (Ref 91248)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91248, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Wintersbite - Artisan Shears condition (Ref 91249)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91249, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Wintersbite - Master Shears condition (Ref 91250)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91250, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Wintersbite - Grand Master Shears condition (Ref 91251)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91251, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Stranglekelp - Journeyman Shears condition (Ref 91252)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91252, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Stranglekelp - Artisan Shears condition (Ref 91253)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91253, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Stranglekelp - Master Shears condition (Ref 91254)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91254, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Stranglekelp - Grand Master Shears condition (Ref 91255)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91255, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Goldthorn - Journeyman Shears condition (Ref 91256)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91256, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Goldthorn - Artisan Shears condition (Ref 91257)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91257, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Goldthorn - Master Shears condition (Ref 91258)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91258, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Goldthorn - Grand Master Shears condition (Ref 91259)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91259, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Firebloom - Journeyman Shears condition (Ref 91260)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91260, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Firebloom - Artisan Shears condition (Ref 91261)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91261, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Firebloom - Master Shears condition (Ref 91262)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91262, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Firebloom - Grand Master Shears condition (Ref 91263)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91263, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Silverleaf - Journeyman Shears condition (Ref 91264)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91264, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Silverleaf - Artisan Shears condition (Ref 91265)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91265, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Silverleaf - Master Shears condition (Ref 91266)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91266, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Silverleaf - Grand Master Shears condition (Ref 91267)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91267, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Peacebloom - Journeyman Shears condition (Ref 91268)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91268, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Peacebloom - Artisan Shears condition (Ref 91269)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91269, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Peacebloom - Master Shears condition (Ref 91270)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91270, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Peacebloom - Grand Master Shears condition (Ref 91271)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91271, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Earthroot - Journeyman Shears condition (Ref 91272)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91272, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Earthroot - Artisan Shears condition (Ref 91273)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91273, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Earthroot - Master Shears condition (Ref 91274)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91274, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Earthroot - Grand Master Shears condition (Ref 91275)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91275, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Mageroyal - Journeyman Shears condition (Ref 91276)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91276, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Mageroyal - Artisan Shears condition (Ref 91277)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91277, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Mageroyal - Master Shears condition (Ref 91278)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91278, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Mageroyal - Grand Master Shears condition (Ref 91279)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91279, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Briarthorn - Journeyman Shears condition (Ref 91280)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91280, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Briarthorn - Artisan Shears condition (Ref 91281)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91281, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Briarthorn - Master Shears condition (Ref 91282)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91282, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Briarthorn - Grand Master Shears condition (Ref 91283)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91283, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Bruiseweed - Journeyman Shears condition (Ref 91284)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91284, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Bruiseweed - Artisan Shears condition (Ref 91285)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91285, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Bruiseweed - Master Shears condition (Ref 91286)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91286, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Bruiseweed - Grand Master Shears condition (Ref 91287)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91287, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Purple Lotus - Journeyman Shears condition (Ref 91288)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91288, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Purple Lotus - Artisan Shears condition (Ref 91289)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91289, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Purple Lotus - Master Shears condition (Ref 91290)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91290, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Purple Lotus - Grand Master Shears condition (Ref 91291)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91291, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Arthas' Tears - Journeyman Shears condition (Ref 91292)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91292, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Arthas' Tears - Artisan Shears condition (Ref 91293)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91293, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Arthas' Tears - Master Shears condition (Ref 91294)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91294, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Arthas' Tears - Grand Master Shears condition (Ref 91295)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91295, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Sungrass - Journeyman Shears condition (Ref 91296)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91296, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Sungrass - Artisan Shears condition (Ref 91297)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91297, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Sungrass - Master Shears condition (Ref 91298)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91298, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Sungrass - Grand Master Shears condition (Ref 91299)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91299, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Blindweed - Journeyman Shears condition (Ref 91300)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91300, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Blindweed - Artisan Shears condition (Ref 91301)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91301, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Blindweed - Master Shears condition (Ref 91302)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91302, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Blindweed - Grand Master Shears condition (Ref 91303)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91303, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Ghost Mushroom - Journeyman Shears condition (Ref 91304)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91304, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Ghost Mushroom - Artisan Shears condition (Ref 91305)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91305, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Ghost Mushroom - Master Shears condition (Ref 91306)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91306, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Ghost Mushroom - Grand Master Shears condition (Ref 91307)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91307, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Gromsblood - Journeyman Shears condition (Ref 91308)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91308, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Gromsblood - Artisan Shears condition (Ref 91309)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91309, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Gromsblood - Master Shears condition (Ref 91310)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91310, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Gromsblood - Grand Master Shears condition (Ref 91311)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91311, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Golden Sansam - Journeyman Shears condition (Ref 91312)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91312, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Golden Sansam - Artisan Shears condition (Ref 91313)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91313, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Golden Sansam - Master Shears condition (Ref 91314)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91314, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Golden Sansam - Grand Master Shears condition (Ref 91315)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91315, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Dreamfoil - Journeyman Shears condition (Ref 91316)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91316, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Dreamfoil - Artisan Shears condition (Ref 91317)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91317, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Dreamfoil - Master Shears condition (Ref 91318)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91318, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Dreamfoil - Grand Master Shears condition (Ref 91319)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91319, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Mountain Silversage - Journeyman Shears condition (Ref 91320)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91320, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Mountain Silversage - Artisan Shears condition (Ref 91321)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91321, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Mountain Silversage - Master Shears condition (Ref 91322)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91322, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Mountain Silversage - Grand Master Shears condition (Ref 91323)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91323, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Plaguebloom - Journeyman Shears condition (Ref 91324)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91324, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Plaguebloom - Artisan Shears condition (Ref 91325)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91325, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Plaguebloom - Master Shears condition (Ref 91326)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91326, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Plaguebloom - Grand Master Shears condition (Ref 91327)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91327, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Icecap - Journeyman Shears condition (Ref 91328)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91328, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Icecap - Artisan Shears condition (Ref 91329)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91329, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Icecap - Master Shears condition (Ref 91330)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91330, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Icecap - Grand Master Shears condition (Ref 91331)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91331, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Black Lotus - Journeyman Shears condition (Ref 91332)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91332, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Black Lotus - Artisan Shears condition (Ref 91333)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91333, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Black Lotus - Master Shears condition (Ref 91334)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91334, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Black Lotus - Grand Master Shears condition (Ref 91335)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91335, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Sungrass - Journeyman Shears condition (Ref 91336)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91336, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Sungrass - Artisan Shears condition (Ref 91337)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91337, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Sungrass - Master Shears condition (Ref 91338)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91338, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Sungrass - Grand Master Shears condition (Ref 91339)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91339, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Gromsblood - Journeyman Shears condition (Ref 91340)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91340, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Gromsblood - Artisan Shears condition (Ref 91341)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91341, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Gromsblood - Master Shears condition (Ref 91342)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91342, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Gromsblood - Grand Master Shears condition (Ref 91343)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91343, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Golden Sansam - Journeyman Shears condition (Ref 91344)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91344, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Golden Sansam - Artisan Shears condition (Ref 91345)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91345, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Golden Sansam - Master Shears condition (Ref 91346)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91346, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Golden Sansam - Grand Master Shears condition (Ref 91347)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91347, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Dreamfoil - Journeyman Shears condition (Ref 91348)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91348, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Dreamfoil - Artisan Shears condition (Ref 91349)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91349, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Dreamfoil - Master Shears condition (Ref 91350)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91350, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Dreamfoil - Grand Master Shears condition (Ref 91351)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91351, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Mountain Silversage - Journeyman Shears condition (Ref 91352)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91352, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Mountain Silversage - Artisan Shears condition (Ref 91353)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91353, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Mountain Silversage - Master Shears condition (Ref 91354)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91354, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Mountain Silversage - Grand Master Shears condition (Ref 91355)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91355, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Arthas' Tears - Journeyman Shears condition (Ref 91356)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91356, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Arthas' Tears - Artisan Shears condition (Ref 91357)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91357, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Arthas' Tears - Master Shears condition (Ref 91358)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91358, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Arthas' Tears - Grand Master Shears condition (Ref 91359)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91359, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Plaguebloom - Journeyman Shears condition (Ref 91360)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91360, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Plaguebloom - Artisan Shears condition (Ref 91361)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91361, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Plaguebloom - Master Shears condition (Ref 91362)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91362, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Plaguebloom - Grand Master Shears condition (Ref 91363)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91363, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Purple Lotus - Journeyman Shears condition (Ref 91364)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91364, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Purple Lotus - Artisan Shears condition (Ref 91365)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91365, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Purple Lotus - Master Shears condition (Ref 91366)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91366, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Purple Lotus - Grand Master Shears condition (Ref 91367)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91367, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Sungrass - Journeyman Shears condition (Ref 91368)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91368, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Sungrass - Artisan Shears condition (Ref 91369)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91369, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Sungrass - Master Shears condition (Ref 91370)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91370, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Sungrass - Grand Master Shears condition (Ref 91371)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91371, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Golden Sansam - Journeyman Shears condition (Ref 91372)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91372, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Golden Sansam - Artisan Shears condition (Ref 91373)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91373, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Golden Sansam - Master Shears condition (Ref 91374)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91374, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Golden Sansam - Grand Master Shears condition (Ref 91375)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91375, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Dreamfoil - Journeyman Shears condition (Ref 91376)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91376, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Dreamfoil - Artisan Shears condition (Ref 91377)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91377, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Dreamfoil - Master Shears condition (Ref 91378)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91378, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Dreamfoil - Grand Master Shears condition (Ref 91379)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91379, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Mountain Silversage - Journeyman Shears condition (Ref 91380)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91380, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Mountain Silversage - Artisan Shears condition (Ref 91381)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91381, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Mountain Silversage - Master Shears condition (Ref 91382)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91382, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Mountain Silversage - Grand Master Shears condition (Ref 91383)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91383, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Bloodthistle - Journeyman Shears condition (Ref 91384)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91384, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Bloodthistle - Artisan Shears condition (Ref 91385)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91385, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Bloodthistle - Master Shears condition (Ref 91386)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91386, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Bloodthistle - Grand Master Shears condition (Ref 91387)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91387, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Felweed - Journeyman Shears condition (Ref 91388)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91388, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Felweed - Artisan Shears condition (Ref 91389)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91389, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Felweed - Master Shears condition (Ref 91390)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91390, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Felweed - Grand Master Shears condition (Ref 91391)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91391, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Dreaming Glory - Journeyman Shears condition (Ref 91392)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91392, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Dreaming Glory - Artisan Shears condition (Ref 91393)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91393, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Dreaming Glory - Master Shears condition (Ref 91394)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91394, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Dreaming Glory - Grand Master Shears condition (Ref 91395)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91395, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Ragveil - Journeyman Shears condition (Ref 91396)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91396, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Ragveil - Artisan Shears condition (Ref 91397)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91397, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Ragveil - Master Shears condition (Ref 91398)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91398, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Ragveil - Grand Master Shears condition (Ref 91399)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91399, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Flame Cap - Journeyman Shears condition (Ref 91400)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91400, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Flame Cap - Artisan Shears condition (Ref 91401)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91401, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Flame Cap - Master Shears condition (Ref 91402)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91402, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Flame Cap - Grand Master Shears condition (Ref 91403)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91403, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Terocone - Journeyman Shears condition (Ref 91404)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91404, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Terocone - Artisan Shears condition (Ref 91405)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91405, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Terocone - Master Shears condition (Ref 91406)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91406, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Terocone - Grand Master Shears condition (Ref 91407)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91407, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Ancient Lichen - Journeyman Shears condition (Ref 91408)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91408, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Ancient Lichen - Artisan Shears condition (Ref 91409)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91409, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Ancient Lichen - Master Shears condition (Ref 91410)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91410, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Ancient Lichen - Grand Master Shears condition (Ref 91411)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91411, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Netherbloom - Journeyman Shears condition (Ref 91412)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91412, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Netherbloom - Artisan Shears condition (Ref 91413)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91413, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Netherbloom - Master Shears condition (Ref 91414)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91414, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Netherbloom - Grand Master Shears condition (Ref 91415)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91415, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Nightmare Vine - Journeyman Shears condition (Ref 91416)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91416, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Nightmare Vine - Artisan Shears condition (Ref 91417)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91417, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Nightmare Vine - Master Shears condition (Ref 91418)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91418, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Nightmare Vine - Grand Master Shears condition (Ref 91419)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91419, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Mana Thistle - Journeyman Shears condition (Ref 91420)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91420, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Mana Thistle - Artisan Shears condition (Ref 91421)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91421, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Mana Thistle - Master Shears condition (Ref 91422)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91422, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Mana Thistle - Grand Master Shears condition (Ref 91423)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91423, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Ragveil - Journeyman Shears condition (Ref 91424)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91424, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Ragveil - Artisan Shears condition (Ref 91425)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91425, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Ragveil - Master Shears condition (Ref 91426)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91426, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Ragveil - Grand Master Shears condition (Ref 91427)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91427, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Felweed - Journeyman Shears condition (Ref 91428)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91428, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Felweed - Artisan Shears condition (Ref 91429)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91429, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Felweed - Master Shears condition (Ref 91430)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91430, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Felweed - Grand Master Shears condition (Ref 91431)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91431, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Dreaming Glory - Journeyman Shears condition (Ref 91432)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91432, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Dreaming Glory - Artisan Shears condition (Ref 91433)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91433, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Dreaming Glory - Master Shears condition (Ref 91434)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91434, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Dreaming Glory - Grand Master Shears condition (Ref 91435)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91435, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Blindweed - Journeyman Shears condition (Ref 91436)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91436, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Blindweed - Artisan Shears condition (Ref 91437)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91437, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Blindweed - Master Shears condition (Ref 91438)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91438, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Blindweed - Grand Master Shears condition (Ref 91439)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91439, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Goldclover - Journeyman Shears condition (Ref 91440)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91440, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Goldclover - Artisan Shears condition (Ref 91441)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91441, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Goldclover - Master Shears condition (Ref 91442)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91442, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Goldclover - Grand Master Shears condition (Ref 91443)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91443, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Tiger Lily - Journeyman Shears condition (Ref 91444)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91444, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Tiger Lily - Artisan Shears condition (Ref 91445)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91445, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Tiger Lily - Master Shears condition (Ref 91446)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91446, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Tiger Lily - Grand Master Shears condition (Ref 91447)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91447, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Lichbloom - Journeyman Shears condition (Ref 91448)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91448, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Lichbloom - Artisan Shears condition (Ref 91449)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91449, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Lichbloom - Master Shears condition (Ref 91450)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91450, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Lichbloom - Grand Master Shears condition (Ref 91451)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91451, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Icethorn - Journeyman Shears condition (Ref 91452)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91452, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Icethorn - Artisan Shears condition (Ref 91453)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91453, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Icethorn - Master Shears condition (Ref 91454)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91454, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Icethorn - Grand Master Shears condition (Ref 91455)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91455, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Adder's Tongue - Journeyman Shears condition (Ref 91456)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91456, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Adder's Tongue - Artisan Shears condition (Ref 91457)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91457, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Adder's Tongue - Master Shears condition (Ref 91458)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91458, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Adder's Tongue - Grand Master Shears condition (Ref 91459)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91459, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Frozen Herb - Journeyman Shears condition (Ref 91460)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91460, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Frozen Herb - Artisan Shears condition (Ref 91461)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91461, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Frozen Herb - Master Shears condition (Ref 91462)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91462, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Frozen Herb - Grand Master Shears condition (Ref 91463)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91463, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Frozen Herb - Journeyman Shears condition (Ref 91464)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91464, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Frozen Herb - Artisan Shears condition (Ref 91465)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91465, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Frozen Herb - Master Shears condition (Ref 91466)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91466, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Frozen Herb - Grand Master Shears condition (Ref 91467)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91467, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Frozen Herb - Journeyman Shears condition (Ref 91468)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91468, 0, 0, 0, 1, 0, 91140, 1, 0);
-- Frozen Herb - Artisan Shears condition (Ref 91469)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91469, 0, 0, 0, 1, 0, 91141, 1, 0);
-- Frozen Herb - Master Shears condition (Ref 91470)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91470, 0, 0, 0, 1, 0, 91142, 1, 0);
-- Frozen Herb - Grand Master Shears condition (Ref 91471)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 91471, 0, 0, 0, 1, 0, 91143, 1, 0);

-- Done!
