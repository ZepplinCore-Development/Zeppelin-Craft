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
-- Reference loot tables that duplicate node loot
-- Provides bonus 'second roll' when gathering with tools
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 91200 AND 91799;
DELETE FROM gameobject_loot_template WHERE Reference BETWEEN 91200 AND 91799;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 91200 AND 91799;

-- Silverleaf (Loot ID: 1414)
-- Silverleaf - Journeyman Pruning Shears Bonus (Ref 91200)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91200, 765, 100.0, 0, 1, 3, 'Silverleaf - TEST - Silverleaf with Shears bonus - Journeyman Pruning Shears');

-- Silverleaf - Artisan Pruning Shears Bonus (Ref 91201)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91201, 765, 100.0, 0, 1, 3, 'Silverleaf - TEST - Silverleaf with Shears bonus - Artisan Pruning Shears');

-- Silverleaf - Master Pruning Shears Bonus (Ref 91202)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91202, 765, 100.0, 0, 1, 3, 'Silverleaf - TEST - Silverleaf with Shears bonus - Master Pruning Shears');

-- Silverleaf - Grand Master Pruning Shears Bonus (Ref 91203)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91203, 765, 100.0, 0, 1, 3, 'Silverleaf - TEST - Silverleaf with Shears bonus - Grand Master Pruning Shears');


-- Peacebloom (Loot ID: 1415)
-- Peacebloom - Journeyman Pruning Shears Bonus (Ref 91204)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91204, 2447, 100.0, 0, 1, 3, 'Peacebloom - TEST - Peacebloom with Shears bonus - Journeyman Pruning Shears');

-- Peacebloom - Artisan Pruning Shears Bonus (Ref 91205)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91205, 2447, 100.0, 0, 1, 3, 'Peacebloom - TEST - Peacebloom with Shears bonus - Artisan Pruning Shears');

-- Peacebloom - Master Pruning Shears Bonus (Ref 91206)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91206, 2447, 100.0, 0, 1, 3, 'Peacebloom - TEST - Peacebloom with Shears bonus - Master Pruning Shears');

-- Peacebloom - Grand Master Pruning Shears Bonus (Ref 91207)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91207, 2447, 100.0, 0, 1, 3, 'Peacebloom - TEST - Peacebloom with Shears bonus - Grand Master Pruning Shears');


-- Earthroot (Loot ID: 1416)
-- Earthroot - Journeyman Pruning Shears Bonus (Ref 91208)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91208, 2449, 100.0, 0, 1, 3, 'Earthroot - Earthroot - Journeyman Pruning Shears');

-- Earthroot - Artisan Pruning Shears Bonus (Ref 91209)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91209, 2449, 100.0, 0, 1, 3, 'Earthroot - Earthroot - Artisan Pruning Shears');

-- Earthroot - Master Pruning Shears Bonus (Ref 91210)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91210, 2449, 100.0, 0, 1, 3, 'Earthroot - Earthroot - Master Pruning Shears');

-- Earthroot - Grand Master Pruning Shears Bonus (Ref 91211)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91211, 2449, 100.0, 0, 1, 3, 'Earthroot - Earthroot - Grand Master Pruning Shears');


-- Mageroyal (Loot ID: 1417)
-- Mageroyal - Journeyman Pruning Shears Bonus (Ref 91212)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91212, 785, 100.0, 0, 1, 3, 'Mageroyal - Mageroyal - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91212, 2452, 20.0, 0, 1, 2, 'Mageroyal - Swiftthistle - Journeyman Pruning Shears');

-- Mageroyal - Artisan Pruning Shears Bonus (Ref 91213)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91213, 785, 100.0, 0, 1, 3, 'Mageroyal - Mageroyal - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91213, 2452, 20.0, 0, 1, 2, 'Mageroyal - Swiftthistle - Artisan Pruning Shears');

-- Mageroyal - Master Pruning Shears Bonus (Ref 91214)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91214, 785, 100.0, 0, 1, 3, 'Mageroyal - Mageroyal - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91214, 2452, 20.0, 0, 1, 2, 'Mageroyal - Swiftthistle - Master Pruning Shears');

-- Mageroyal - Grand Master Pruning Shears Bonus (Ref 91215)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91215, 785, 100.0, 0, 1, 3, 'Mageroyal - Mageroyal - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91215, 2452, 20.0, 0, 1, 2, 'Mageroyal - Swiftthistle - Grand Master Pruning Shears');


-- Briarthorn (Loot ID: 1418)
-- Briarthorn - Journeyman Pruning Shears Bonus (Ref 91216)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91216, 2450, 100.0, 0, 1, 3, 'Briarthorn - Briarthorn - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91216, 2452, 40.0, 0, 1, 2, 'Briarthorn - Swiftthistle - Journeyman Pruning Shears');

-- Briarthorn - Artisan Pruning Shears Bonus (Ref 91217)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91217, 2450, 100.0, 0, 1, 3, 'Briarthorn - Briarthorn - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91217, 2452, 40.0, 0, 1, 2, 'Briarthorn - Swiftthistle - Artisan Pruning Shears');

-- Briarthorn - Master Pruning Shears Bonus (Ref 91218)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91218, 2450, 100.0, 0, 1, 3, 'Briarthorn - Briarthorn - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91218, 2452, 40.0, 0, 1, 2, 'Briarthorn - Swiftthistle - Master Pruning Shears');

-- Briarthorn - Grand Master Pruning Shears Bonus (Ref 91219)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91219, 2450, 100.0, 0, 1, 3, 'Briarthorn - Briarthorn - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91219, 2452, 40.0, 0, 1, 2, 'Briarthorn - Swiftthistle - Grand Master Pruning Shears');


-- Bruiseweed (Loot ID: 1419)
-- Bruiseweed - Journeyman Pruning Shears Bonus (Ref 91220)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91220, 2453, 100.0, 0, 1, 3, 'Bruiseweed - Bruiseweed - Journeyman Pruning Shears');

-- Bruiseweed - Artisan Pruning Shears Bonus (Ref 91221)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91221, 2453, 100.0, 0, 1, 3, 'Bruiseweed - Bruiseweed - Artisan Pruning Shears');

-- Bruiseweed - Master Pruning Shears Bonus (Ref 91222)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91222, 2453, 100.0, 0, 1, 3, 'Bruiseweed - Bruiseweed - Master Pruning Shears');

-- Bruiseweed - Grand Master Pruning Shears Bonus (Ref 91223)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91223, 2453, 100.0, 0, 1, 3, 'Bruiseweed - Bruiseweed - Grand Master Pruning Shears');


-- Wild Steelbloom (Loot ID: 1420)
-- Wild Steelbloom - Journeyman Pruning Shears Bonus (Ref 91224)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91224, 3355, 100.0, 0, 1, 3, 'Wild Steelbloom - Wild Steelbloom - Journeyman Pruning Shears');

-- Wild Steelbloom - Artisan Pruning Shears Bonus (Ref 91225)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91225, 3355, 100.0, 0, 1, 3, 'Wild Steelbloom - Wild Steelbloom - Artisan Pruning Shears');

-- Wild Steelbloom - Master Pruning Shears Bonus (Ref 91226)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91226, 3355, 100.0, 0, 1, 3, 'Wild Steelbloom - Wild Steelbloom - Master Pruning Shears');

-- Wild Steelbloom - Grand Master Pruning Shears Bonus (Ref 91227)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91227, 3355, 100.0, 0, 1, 3, 'Wild Steelbloom - Wild Steelbloom - Grand Master Pruning Shears');


-- Kingsblood (Loot ID: 1421)
-- Kingsblood - Journeyman Pruning Shears Bonus (Ref 91228)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91228, 3356, 100.0, 0, 1, 3, 'Kingsblood - Kingsblood - Journeyman Pruning Shears');

-- Kingsblood - Artisan Pruning Shears Bonus (Ref 91229)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91229, 3356, 100.0, 0, 1, 3, 'Kingsblood - Kingsblood - Artisan Pruning Shears');

-- Kingsblood - Master Pruning Shears Bonus (Ref 91230)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91230, 3356, 100.0, 0, 1, 3, 'Kingsblood - Kingsblood - Master Pruning Shears');

-- Kingsblood - Grand Master Pruning Shears Bonus (Ref 91231)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91231, 3356, 100.0, 0, 1, 3, 'Kingsblood - Kingsblood - Grand Master Pruning Shears');


-- Khadgar's Whisker (Loot ID: 1423)
-- Khadgar's Whisker - Journeyman Pruning Shears Bonus (Ref 91232)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91232, 3358, 100.0, 0, 1, 3, 'Khadgar''s Whisker - Khadgar''s Whisker - Journeyman Pruning Shears');

-- Khadgar's Whisker - Artisan Pruning Shears Bonus (Ref 91233)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91233, 3358, 100.0, 0, 1, 3, 'Khadgar''s Whisker - Khadgar''s Whisker - Artisan Pruning Shears');

-- Khadgar's Whisker - Master Pruning Shears Bonus (Ref 91234)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91234, 3358, 100.0, 0, 1, 3, 'Khadgar''s Whisker - Khadgar''s Whisker - Master Pruning Shears');

-- Khadgar's Whisker - Grand Master Pruning Shears Bonus (Ref 91235)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91235, 3358, 100.0, 0, 1, 3, 'Khadgar''s Whisker - Khadgar''s Whisker - Grand Master Pruning Shears');


-- Grave Moss (Loot ID: 1424)
-- Grave Moss - Journeyman Pruning Shears Bonus (Ref 91236)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91236, 3369, 100.0, 0, 1, 3, 'Grave Moss - Grave Moss - Journeyman Pruning Shears');

-- Grave Moss - Artisan Pruning Shears Bonus (Ref 91237)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91237, 3369, 100.0, 0, 1, 3, 'Grave Moss - Grave Moss - Artisan Pruning Shears');

-- Grave Moss - Master Pruning Shears Bonus (Ref 91238)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91238, 3369, 100.0, 0, 1, 3, 'Grave Moss - Grave Moss - Master Pruning Shears');

-- Grave Moss - Grand Master Pruning Shears Bonus (Ref 91239)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91239, 3369, 100.0, 0, 1, 3, 'Grave Moss - Grave Moss - Grand Master Pruning Shears');


-- Liferoot (Loot ID: 1730)
-- Liferoot - Journeyman Pruning Shears Bonus (Ref 91240)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91240, 3357, 100.0, 0, 1, 3, 'Liferoot - Liferoot - Journeyman Pruning Shears');

-- Liferoot - Artisan Pruning Shears Bonus (Ref 91241)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91241, 3357, 100.0, 0, 1, 3, 'Liferoot - Liferoot - Artisan Pruning Shears');

-- Liferoot - Master Pruning Shears Bonus (Ref 91242)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91242, 3357, 100.0, 0, 1, 3, 'Liferoot - Liferoot - Master Pruning Shears');

-- Liferoot - Grand Master Pruning Shears Bonus (Ref 91243)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91243, 3357, 100.0, 0, 1, 3, 'Liferoot - Liferoot - Grand Master Pruning Shears');


-- Fadeleaf (Loot ID: 1731)
-- Fadeleaf - Journeyman Pruning Shears Bonus (Ref 91244)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91244, 3818, 100.0, 0, 1, 3, 'Fadeleaf - Fadeleaf - Journeyman Pruning Shears');

-- Fadeleaf - Artisan Pruning Shears Bonus (Ref 91245)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91245, 3818, 100.0, 0, 1, 3, 'Fadeleaf - Fadeleaf - Artisan Pruning Shears');

-- Fadeleaf - Master Pruning Shears Bonus (Ref 91246)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91246, 3818, 100.0, 0, 1, 3, 'Fadeleaf - Fadeleaf - Master Pruning Shears');

-- Fadeleaf - Grand Master Pruning Shears Bonus (Ref 91247)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91247, 3818, 100.0, 0, 1, 3, 'Fadeleaf - Fadeleaf - Grand Master Pruning Shears');


-- Wintersbite (Loot ID: 1732)
-- Wintersbite - Journeyman Pruning Shears Bonus (Ref 91248)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91248, 3819, 100.0, 0, 1, 3, 'Wintersbite - Wintersbite - Journeyman Pruning Shears');

-- Wintersbite - Artisan Pruning Shears Bonus (Ref 91249)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91249, 3819, 100.0, 0, 1, 3, 'Wintersbite - Wintersbite - Artisan Pruning Shears');

-- Wintersbite - Master Pruning Shears Bonus (Ref 91250)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91250, 3819, 100.0, 0, 1, 3, 'Wintersbite - Wintersbite - Master Pruning Shears');

-- Wintersbite - Grand Master Pruning Shears Bonus (Ref 91251)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91251, 3819, 100.0, 0, 1, 3, 'Wintersbite - Wintersbite - Grand Master Pruning Shears');


-- Stranglekelp (Loot ID: 1733)
-- Stranglekelp - Journeyman Pruning Shears Bonus (Ref 91252)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91252, 3820, 100.0, 0, 1, 3, 'Stranglekelp - Stranglekelp - Journeyman Pruning Shears');

-- Stranglekelp - Artisan Pruning Shears Bonus (Ref 91253)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91253, 3820, 100.0, 0, 1, 3, 'Stranglekelp - Stranglekelp - Artisan Pruning Shears');

-- Stranglekelp - Master Pruning Shears Bonus (Ref 91254)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91254, 3820, 100.0, 0, 1, 3, 'Stranglekelp - Stranglekelp - Master Pruning Shears');

-- Stranglekelp - Grand Master Pruning Shears Bonus (Ref 91255)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91255, 3820, 100.0, 0, 1, 3, 'Stranglekelp - Stranglekelp - Grand Master Pruning Shears');


-- Goldthorn (Loot ID: 1734)
-- Goldthorn - Journeyman Pruning Shears Bonus (Ref 91256)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91256, 3821, 100.0, 0, 1, 3, 'Goldthorn - Goldthorn - Journeyman Pruning Shears');

-- Goldthorn - Artisan Pruning Shears Bonus (Ref 91257)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91257, 3821, 100.0, 0, 1, 3, 'Goldthorn - Goldthorn - Artisan Pruning Shears');

-- Goldthorn - Master Pruning Shears Bonus (Ref 91258)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91258, 3821, 100.0, 0, 1, 3, 'Goldthorn - Goldthorn - Master Pruning Shears');

-- Goldthorn - Grand Master Pruning Shears Bonus (Ref 91259)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91259, 3821, 100.0, 0, 1, 3, 'Goldthorn - Goldthorn - Grand Master Pruning Shears');


-- Firebloom (Loot ID: 2292)
-- Firebloom - Journeyman Pruning Shears Bonus (Ref 91260)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91260, 4625, 100.0, 0, 1, 3, 'Firebloom - Firebloom - Journeyman Pruning Shears');

-- Firebloom - Artisan Pruning Shears Bonus (Ref 91261)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91261, 4625, 100.0, 0, 1, 3, 'Firebloom - Firebloom - Artisan Pruning Shears');

-- Firebloom - Master Pruning Shears Bonus (Ref 91262)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91262, 4625, 100.0, 0, 1, 3, 'Firebloom - Firebloom - Master Pruning Shears');

-- Firebloom - Grand Master Pruning Shears Bonus (Ref 91263)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91263, 4625, 100.0, 0, 1, 3, 'Firebloom - Firebloom - Grand Master Pruning Shears');


-- Silverleaf (Loot ID: 2511)
-- Silverleaf - Journeyman Pruning Shears Bonus (Ref 91264)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91264, 765, 100.0, 0, 1, 3, 'Silverleaf - TEST - Silverleaf with Shears bonus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91264, 5056, 100.0, 0, 1, 1, 'Silverleaf - Root Sample - Journeyman Pruning Shears');

-- Silverleaf - Artisan Pruning Shears Bonus (Ref 91265)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91265, 765, 100.0, 0, 1, 3, 'Silverleaf - TEST - Silverleaf with Shears bonus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91265, 5056, 100.0, 0, 1, 1, 'Silverleaf - Root Sample - Artisan Pruning Shears');

-- Silverleaf - Master Pruning Shears Bonus (Ref 91266)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91266, 765, 100.0, 0, 1, 3, 'Silverleaf - TEST - Silverleaf with Shears bonus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91266, 5056, 100.0, 0, 1, 1, 'Silverleaf - Root Sample - Master Pruning Shears');

-- Silverleaf - Grand Master Pruning Shears Bonus (Ref 91267)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91267, 765, 100.0, 0, 1, 3, 'Silverleaf - TEST - Silverleaf with Shears bonus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91267, 5056, 100.0, 0, 1, 1, 'Silverleaf - Root Sample - Grand Master Pruning Shears');


-- Peacebloom (Loot ID: 2512)
-- Peacebloom - Journeyman Pruning Shears Bonus (Ref 91268)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91268, 2447, 100.0, 0, 1, 3, 'Peacebloom - TEST - Peacebloom with Shears bonus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91268, 5056, 100.0, 0, 1, 1, 'Peacebloom - Root Sample - Journeyman Pruning Shears');

-- Peacebloom - Artisan Pruning Shears Bonus (Ref 91269)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91269, 2447, 100.0, 0, 1, 3, 'Peacebloom - TEST - Peacebloom with Shears bonus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91269, 5056, 100.0, 0, 1, 1, 'Peacebloom - Root Sample - Artisan Pruning Shears');

-- Peacebloom - Master Pruning Shears Bonus (Ref 91270)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91270, 2447, 100.0, 0, 1, 3, 'Peacebloom - TEST - Peacebloom with Shears bonus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91270, 5056, 100.0, 0, 1, 1, 'Peacebloom - Root Sample - Master Pruning Shears');

-- Peacebloom - Grand Master Pruning Shears Bonus (Ref 91271)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91271, 2447, 100.0, 0, 1, 3, 'Peacebloom - TEST - Peacebloom with Shears bonus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91271, 5056, 100.0, 0, 1, 1, 'Peacebloom - Root Sample - Grand Master Pruning Shears');


-- Earthroot (Loot ID: 2513)
-- Earthroot - Journeyman Pruning Shears Bonus (Ref 91272)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91272, 2449, 100.0, 0, 1, 3, 'Earthroot - Earthroot - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91272, 5056, 100.0, 0, 1, 1, 'Earthroot - Root Sample - Journeyman Pruning Shears');

-- Earthroot - Artisan Pruning Shears Bonus (Ref 91273)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91273, 2449, 100.0, 0, 1, 3, 'Earthroot - Earthroot - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91273, 5056, 100.0, 0, 1, 1, 'Earthroot - Root Sample - Artisan Pruning Shears');

-- Earthroot - Master Pruning Shears Bonus (Ref 91274)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91274, 2449, 100.0, 0, 1, 3, 'Earthroot - Earthroot - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91274, 5056, 100.0, 0, 1, 1, 'Earthroot - Root Sample - Master Pruning Shears');

-- Earthroot - Grand Master Pruning Shears Bonus (Ref 91275)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91275, 2449, 100.0, 0, 1, 3, 'Earthroot - Earthroot - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91275, 5056, 100.0, 0, 1, 1, 'Earthroot - Root Sample - Grand Master Pruning Shears');


-- Mageroyal (Loot ID: 2514)
-- Mageroyal - Journeyman Pruning Shears Bonus (Ref 91276)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91276, 785, 100.0, 0, 1, 3, 'Mageroyal - Mageroyal - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91276, 2452, 20.0, 0, 1, 2, 'Mageroyal - Swiftthistle - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91276, 5056, 100.0, 0, 1, 1, 'Mageroyal - Root Sample - Journeyman Pruning Shears');

-- Mageroyal - Artisan Pruning Shears Bonus (Ref 91277)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91277, 785, 100.0, 0, 1, 3, 'Mageroyal - Mageroyal - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91277, 2452, 20.0, 0, 1, 2, 'Mageroyal - Swiftthistle - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91277, 5056, 100.0, 0, 1, 1, 'Mageroyal - Root Sample - Artisan Pruning Shears');

-- Mageroyal - Master Pruning Shears Bonus (Ref 91278)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91278, 785, 100.0, 0, 1, 3, 'Mageroyal - Mageroyal - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91278, 2452, 20.0, 0, 1, 2, 'Mageroyal - Swiftthistle - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91278, 5056, 100.0, 0, 1, 1, 'Mageroyal - Root Sample - Master Pruning Shears');

-- Mageroyal - Grand Master Pruning Shears Bonus (Ref 91279)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91279, 785, 100.0, 0, 1, 3, 'Mageroyal - Mageroyal - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91279, 2452, 20.0, 0, 1, 2, 'Mageroyal - Swiftthistle - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91279, 5056, 100.0, 0, 1, 1, 'Mageroyal - Root Sample - Grand Master Pruning Shears');


-- Briarthorn (Loot ID: 2515)
-- Briarthorn - Journeyman Pruning Shears Bonus (Ref 91280)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91280, 2450, 100.0, 0, 1, 3, 'Briarthorn - Briarthorn - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91280, 2452, 40.0, 0, 1, 2, 'Briarthorn - Swiftthistle - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91280, 5056, 100.0, 0, 1, 1, 'Briarthorn - Root Sample - Journeyman Pruning Shears');

-- Briarthorn - Artisan Pruning Shears Bonus (Ref 91281)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91281, 2450, 100.0, 0, 1, 3, 'Briarthorn - Briarthorn - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91281, 2452, 40.0, 0, 1, 2, 'Briarthorn - Swiftthistle - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91281, 5056, 100.0, 0, 1, 1, 'Briarthorn - Root Sample - Artisan Pruning Shears');

-- Briarthorn - Master Pruning Shears Bonus (Ref 91282)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91282, 2450, 100.0, 0, 1, 3, 'Briarthorn - Briarthorn - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91282, 2452, 40.0, 0, 1, 2, 'Briarthorn - Swiftthistle - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91282, 5056, 100.0, 0, 1, 1, 'Briarthorn - Root Sample - Master Pruning Shears');

-- Briarthorn - Grand Master Pruning Shears Bonus (Ref 91283)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91283, 2450, 100.0, 0, 1, 3, 'Briarthorn - Briarthorn - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91283, 2452, 40.0, 0, 1, 2, 'Briarthorn - Swiftthistle - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91283, 5056, 100.0, 0, 1, 1, 'Briarthorn - Root Sample - Grand Master Pruning Shears');


-- Bruiseweed (Loot ID: 2516)
-- Bruiseweed - Journeyman Pruning Shears Bonus (Ref 91284)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91284, 2453, 100.0, 0, 1, 3, 'Bruiseweed - Bruiseweed - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91284, 5056, 100.0, 0, 1, 1, 'Bruiseweed - Root Sample - Journeyman Pruning Shears');

-- Bruiseweed - Artisan Pruning Shears Bonus (Ref 91285)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91285, 2453, 100.0, 0, 1, 3, 'Bruiseweed - Bruiseweed - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91285, 5056, 100.0, 0, 1, 1, 'Bruiseweed - Root Sample - Artisan Pruning Shears');

-- Bruiseweed - Master Pruning Shears Bonus (Ref 91286)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91286, 2453, 100.0, 0, 1, 3, 'Bruiseweed - Bruiseweed - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91286, 5056, 100.0, 0, 1, 1, 'Bruiseweed - Root Sample - Master Pruning Shears');

-- Bruiseweed - Grand Master Pruning Shears Bonus (Ref 91287)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91287, 2453, 100.0, 0, 1, 3, 'Bruiseweed - Bruiseweed - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91287, 5056, 100.0, 0, 1, 1, 'Bruiseweed - Root Sample - Grand Master Pruning Shears');


-- Purple Lotus (Loot ID: 6142)
-- Purple Lotus - Journeyman Pruning Shears Bonus (Ref 91288)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91288, 8153, 10.0, 0, 1, 1, 'Purple Lotus - Wildvine - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91288, 8831, 100.0, 0, 1, 3, 'Purple Lotus - Purple Lotus - Journeyman Pruning Shears');

-- Purple Lotus - Artisan Pruning Shears Bonus (Ref 91289)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91289, 8153, 10.0, 0, 1, 1, 'Purple Lotus - Wildvine - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91289, 8831, 100.0, 0, 1, 3, 'Purple Lotus - Purple Lotus - Artisan Pruning Shears');

-- Purple Lotus - Master Pruning Shears Bonus (Ref 91290)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91290, 8153, 10.0, 0, 1, 1, 'Purple Lotus - Wildvine - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91290, 8831, 100.0, 0, 1, 3, 'Purple Lotus - Purple Lotus - Master Pruning Shears');

-- Purple Lotus - Grand Master Pruning Shears Bonus (Ref 91291)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91291, 8153, 10.0, 0, 1, 1, 'Purple Lotus - Wildvine - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91291, 8831, 100.0, 0, 1, 3, 'Purple Lotus - Purple Lotus - Grand Master Pruning Shears');


-- Arthas' Tears (Loot ID: 6150)
-- Arthas' Tears - Journeyman Pruning Shears Bonus (Ref 91292)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91292, 8836, 100.0, 0, 1, 3, 'Arthas'' Tears - Arthas'' Tears - Journeyman Pruning Shears');

-- Arthas' Tears - Artisan Pruning Shears Bonus (Ref 91293)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91293, 8836, 100.0, 0, 1, 3, 'Arthas'' Tears - Arthas'' Tears - Artisan Pruning Shears');

-- Arthas' Tears - Master Pruning Shears Bonus (Ref 91294)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91294, 8836, 100.0, 0, 1, 3, 'Arthas'' Tears - Arthas'' Tears - Master Pruning Shears');

-- Arthas' Tears - Grand Master Pruning Shears Bonus (Ref 91295)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91295, 8836, 100.0, 0, 1, 3, 'Arthas'' Tears - Arthas'' Tears - Grand Master Pruning Shears');


-- Sungrass (Loot ID: 6151)
-- Sungrass - Journeyman Pruning Shears Bonus (Ref 91296)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91296, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Journeyman Pruning Shears');

-- Sungrass - Artisan Pruning Shears Bonus (Ref 91297)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91297, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Artisan Pruning Shears');

-- Sungrass - Master Pruning Shears Bonus (Ref 91298)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91298, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Master Pruning Shears');

-- Sungrass - Grand Master Pruning Shears Bonus (Ref 91299)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91299, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Grand Master Pruning Shears');


-- Blindweed (Loot ID: 6152)
-- Blindweed - Journeyman Pruning Shears Bonus (Ref 91300)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91300, 8839, 100.0, 0, 1, 3, 'Blindweed - Blindweed - Journeyman Pruning Shears');

-- Blindweed - Artisan Pruning Shears Bonus (Ref 91301)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91301, 8839, 100.0, 0, 1, 3, 'Blindweed - Blindweed - Artisan Pruning Shears');

-- Blindweed - Master Pruning Shears Bonus (Ref 91302)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91302, 8839, 100.0, 0, 1, 3, 'Blindweed - Blindweed - Master Pruning Shears');

-- Blindweed - Grand Master Pruning Shears Bonus (Ref 91303)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91303, 8839, 100.0, 0, 1, 3, 'Blindweed - Blindweed - Grand Master Pruning Shears');


-- Ghost Mushroom (Loot ID: 6312)
-- Ghost Mushroom - Journeyman Pruning Shears Bonus (Ref 91304)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91304, 8845, 100.0, 0, 1, 3, 'Ghost Mushroom - Ghost Mushroom - Journeyman Pruning Shears');

-- Ghost Mushroom - Artisan Pruning Shears Bonus (Ref 91305)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91305, 8845, 100.0, 0, 1, 3, 'Ghost Mushroom - Ghost Mushroom - Artisan Pruning Shears');

-- Ghost Mushroom - Master Pruning Shears Bonus (Ref 91306)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91306, 8845, 100.0, 0, 1, 3, 'Ghost Mushroom - Ghost Mushroom - Master Pruning Shears');

-- Ghost Mushroom - Grand Master Pruning Shears Bonus (Ref 91307)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91307, 8845, 100.0, 0, 1, 3, 'Ghost Mushroom - Ghost Mushroom - Grand Master Pruning Shears');


-- Gromsblood (Loot ID: 6313)
-- Gromsblood - Journeyman Pruning Shears Bonus (Ref 91308)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91308, 8846, 100.0, 0, 1, 3, 'Gromsblood - Gromsblood - Journeyman Pruning Shears');

-- Gromsblood - Artisan Pruning Shears Bonus (Ref 91309)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91309, 8846, 100.0, 0, 1, 3, 'Gromsblood - Gromsblood - Artisan Pruning Shears');

-- Gromsblood - Master Pruning Shears Bonus (Ref 91310)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91310, 8846, 100.0, 0, 1, 3, 'Gromsblood - Gromsblood - Master Pruning Shears');

-- Gromsblood - Grand Master Pruning Shears Bonus (Ref 91311)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91311, 8846, 100.0, 0, 1, 3, 'Gromsblood - Gromsblood - Grand Master Pruning Shears');


-- Golden Sansam (Loot ID: 13945)
-- Golden Sansam - Journeyman Pruning Shears Bonus (Ref 91312)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91312, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Journeyman Pruning Shears');

-- Golden Sansam - Artisan Pruning Shears Bonus (Ref 91313)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91313, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Artisan Pruning Shears');

-- Golden Sansam - Master Pruning Shears Bonus (Ref 91314)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91314, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Master Pruning Shears');

-- Golden Sansam - Grand Master Pruning Shears Bonus (Ref 91315)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91315, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Grand Master Pruning Shears');


-- Dreamfoil (Loot ID: 13946)
-- Dreamfoil - Journeyman Pruning Shears Bonus (Ref 91316)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91316, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Journeyman Pruning Shears');

-- Dreamfoil - Artisan Pruning Shears Bonus (Ref 91317)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91317, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Artisan Pruning Shears');

-- Dreamfoil - Master Pruning Shears Bonus (Ref 91318)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91318, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Master Pruning Shears');

-- Dreamfoil - Grand Master Pruning Shears Bonus (Ref 91319)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91319, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Grand Master Pruning Shears');


-- Mountain Silversage (Loot ID: 13947)
-- Mountain Silversage - Journeyman Pruning Shears Bonus (Ref 91320)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91320, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Journeyman Pruning Shears');

-- Mountain Silversage - Artisan Pruning Shears Bonus (Ref 91321)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91321, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Artisan Pruning Shears');

-- Mountain Silversage - Master Pruning Shears Bonus (Ref 91322)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91322, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Master Pruning Shears');

-- Mountain Silversage - Grand Master Pruning Shears Bonus (Ref 91323)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91323, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Grand Master Pruning Shears');


-- Plaguebloom (Loot ID: 13948)
-- Plaguebloom - Journeyman Pruning Shears Bonus (Ref 91324)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91324, 13466, 100.0, 0, 1, 3, 'Plaguebloom - Plaguebloom - Journeyman Pruning Shears');

-- Plaguebloom - Artisan Pruning Shears Bonus (Ref 91325)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91325, 13466, 100.0, 0, 1, 3, 'Plaguebloom - Plaguebloom - Artisan Pruning Shears');

-- Plaguebloom - Master Pruning Shears Bonus (Ref 91326)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91326, 13466, 100.0, 0, 1, 3, 'Plaguebloom - Plaguebloom - Master Pruning Shears');

-- Plaguebloom - Grand Master Pruning Shears Bonus (Ref 91327)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91327, 13466, 100.0, 0, 1, 3, 'Plaguebloom - Plaguebloom - Grand Master Pruning Shears');


-- Icecap (Loot ID: 13949)
-- Icecap - Journeyman Pruning Shears Bonus (Ref 91328)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91328, 13467, 100.0, 0, 1, 3, 'Icecap - Icecap - Journeyman Pruning Shears');

-- Icecap - Artisan Pruning Shears Bonus (Ref 91329)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91329, 13467, 100.0, 0, 1, 3, 'Icecap - Icecap - Artisan Pruning Shears');

-- Icecap - Master Pruning Shears Bonus (Ref 91330)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91330, 13467, 100.0, 0, 1, 3, 'Icecap - Icecap - Master Pruning Shears');

-- Icecap - Grand Master Pruning Shears Bonus (Ref 91331)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91331, 13467, 100.0, 0, 1, 3, 'Icecap - Icecap - Grand Master Pruning Shears');


-- Black Lotus (Loot ID: 13950)
-- Black Lotus - Journeyman Pruning Shears Bonus (Ref 91332)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91332, 13468, 100.0, 0, 1, 3, 'Black Lotus - Black Lotus - Journeyman Pruning Shears');

-- Black Lotus - Artisan Pruning Shears Bonus (Ref 91333)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91333, 13468, 100.0, 0, 1, 3, 'Black Lotus - Black Lotus - Artisan Pruning Shears');

-- Black Lotus - Master Pruning Shears Bonus (Ref 91334)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91334, 13468, 100.0, 0, 1, 3, 'Black Lotus - Black Lotus - Master Pruning Shears');

-- Black Lotus - Grand Master Pruning Shears Bonus (Ref 91335)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91335, 13468, 100.0, 0, 1, 3, 'Black Lotus - Black Lotus - Grand Master Pruning Shears');


-- Sungrass (Loot ID: 13965)
-- Sungrass - Journeyman Pruning Shears Bonus (Ref 91336)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91336, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91336, 11514, 50.0, 0, 1, 2, 'Sungrass - Fel Creep - Journeyman Pruning Shears');

-- Sungrass - Artisan Pruning Shears Bonus (Ref 91337)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91337, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91337, 11514, 50.0, 0, 1, 2, 'Sungrass - Fel Creep - Artisan Pruning Shears');

-- Sungrass - Master Pruning Shears Bonus (Ref 91338)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91338, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91338, 11514, 50.0, 0, 1, 2, 'Sungrass - Fel Creep - Master Pruning Shears');

-- Sungrass - Grand Master Pruning Shears Bonus (Ref 91339)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91339, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91339, 11514, 50.0, 0, 1, 2, 'Sungrass - Fel Creep - Grand Master Pruning Shears');


-- Gromsblood (Loot ID: 13966)
-- Gromsblood - Journeyman Pruning Shears Bonus (Ref 91340)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91340, 8846, 100.0, 0, 1, 3, 'Gromsblood - Gromsblood - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91340, 11514, 50.0, 0, 1, 2, 'Gromsblood - Fel Creep - Journeyman Pruning Shears');

-- Gromsblood - Artisan Pruning Shears Bonus (Ref 91341)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91341, 8846, 100.0, 0, 1, 3, 'Gromsblood - Gromsblood - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91341, 11514, 50.0, 0, 1, 2, 'Gromsblood - Fel Creep - Artisan Pruning Shears');

-- Gromsblood - Master Pruning Shears Bonus (Ref 91342)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91342, 8846, 100.0, 0, 1, 3, 'Gromsblood - Gromsblood - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91342, 11514, 50.0, 0, 1, 2, 'Gromsblood - Fel Creep - Master Pruning Shears');

-- Gromsblood - Grand Master Pruning Shears Bonus (Ref 91343)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91343, 8846, 100.0, 0, 1, 3, 'Gromsblood - Gromsblood - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91343, 11514, 50.0, 0, 1, 2, 'Gromsblood - Fel Creep - Grand Master Pruning Shears');


-- Golden Sansam (Loot ID: 13967)
-- Golden Sansam - Journeyman Pruning Shears Bonus (Ref 91344)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91344, 11514, 50.0, 0, 1, 2, 'Golden Sansam - Fel Creep - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91344, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Journeyman Pruning Shears');

-- Golden Sansam - Artisan Pruning Shears Bonus (Ref 91345)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91345, 11514, 50.0, 0, 1, 2, 'Golden Sansam - Fel Creep - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91345, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Artisan Pruning Shears');

-- Golden Sansam - Master Pruning Shears Bonus (Ref 91346)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91346, 11514, 50.0, 0, 1, 2, 'Golden Sansam - Fel Creep - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91346, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Master Pruning Shears');

-- Golden Sansam - Grand Master Pruning Shears Bonus (Ref 91347)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91347, 11514, 50.0, 0, 1, 2, 'Golden Sansam - Fel Creep - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91347, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Grand Master Pruning Shears');


-- Dreamfoil (Loot ID: 13968)
-- Dreamfoil - Journeyman Pruning Shears Bonus (Ref 91348)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91348, 11514, 50.0, 0, 1, 2, 'Dreamfoil - Fel Creep - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91348, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Journeyman Pruning Shears');

-- Dreamfoil - Artisan Pruning Shears Bonus (Ref 91349)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91349, 11514, 50.0, 0, 1, 2, 'Dreamfoil - Fel Creep - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91349, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Artisan Pruning Shears');

-- Dreamfoil - Master Pruning Shears Bonus (Ref 91350)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91350, 11514, 50.0, 0, 1, 2, 'Dreamfoil - Fel Creep - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91350, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Master Pruning Shears');

-- Dreamfoil - Grand Master Pruning Shears Bonus (Ref 91351)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91351, 11514, 50.0, 0, 1, 2, 'Dreamfoil - Fel Creep - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91351, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Grand Master Pruning Shears');


-- Mountain Silversage (Loot ID: 13969)
-- Mountain Silversage - Journeyman Pruning Shears Bonus (Ref 91352)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91352, 11514, 10.0, 0, 1, 2, 'Mountain Silversage - Fel Creep - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91352, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Journeyman Pruning Shears');

-- Mountain Silversage - Artisan Pruning Shears Bonus (Ref 91353)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91353, 11514, 10.0, 0, 1, 2, 'Mountain Silversage - Fel Creep - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91353, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Artisan Pruning Shears');

-- Mountain Silversage - Master Pruning Shears Bonus (Ref 91354)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91354, 11514, 10.0, 0, 1, 2, 'Mountain Silversage - Fel Creep - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91354, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Master Pruning Shears');

-- Mountain Silversage - Grand Master Pruning Shears Bonus (Ref 91355)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91355, 11514, 10.0, 0, 1, 2, 'Mountain Silversage - Fel Creep - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91355, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Grand Master Pruning Shears');


-- Arthas' Tears (Loot ID: 13970)
-- Arthas' Tears - Journeyman Pruning Shears Bonus (Ref 91356)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91356, 8836, 100.0, 0, 1, 3, 'Arthas'' Tears - Arthas'' Tears - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91356, 11514, 50.0, 0, 1, 3, 'Arthas'' Tears - Fel Creep - Journeyman Pruning Shears');

-- Arthas' Tears - Artisan Pruning Shears Bonus (Ref 91357)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91357, 8836, 100.0, 0, 1, 3, 'Arthas'' Tears - Arthas'' Tears - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91357, 11514, 50.0, 0, 1, 3, 'Arthas'' Tears - Fel Creep - Artisan Pruning Shears');

-- Arthas' Tears - Master Pruning Shears Bonus (Ref 91358)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91358, 8836, 100.0, 0, 1, 3, 'Arthas'' Tears - Arthas'' Tears - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91358, 11514, 50.0, 0, 1, 3, 'Arthas'' Tears - Fel Creep - Master Pruning Shears');

-- Arthas' Tears - Grand Master Pruning Shears Bonus (Ref 91359)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91359, 8836, 100.0, 0, 1, 3, 'Arthas'' Tears - Arthas'' Tears - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91359, 11514, 50.0, 0, 1, 3, 'Arthas'' Tears - Fel Creep - Grand Master Pruning Shears');


-- Plaguebloom (Loot ID: 13971)
-- Plaguebloom - Journeyman Pruning Shears Bonus (Ref 91360)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91360, 11514, 50.0, 0, 1, 3, 'Plaguebloom - Fel Creep - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91360, 13466, 100.0, 0, 1, 3, 'Plaguebloom - Plaguebloom - Journeyman Pruning Shears');

-- Plaguebloom - Artisan Pruning Shears Bonus (Ref 91361)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91361, 11514, 50.0, 0, 1, 3, 'Plaguebloom - Fel Creep - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91361, 13466, 100.0, 0, 1, 3, 'Plaguebloom - Plaguebloom - Artisan Pruning Shears');

-- Plaguebloom - Master Pruning Shears Bonus (Ref 91362)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91362, 11514, 50.0, 0, 1, 3, 'Plaguebloom - Fel Creep - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91362, 13466, 100.0, 0, 1, 3, 'Plaguebloom - Plaguebloom - Master Pruning Shears');

-- Plaguebloom - Grand Master Pruning Shears Bonus (Ref 91363)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91363, 11514, 50.0, 0, 1, 3, 'Plaguebloom - Fel Creep - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91363, 13466, 100.0, 0, 1, 3, 'Plaguebloom - Plaguebloom - Grand Master Pruning Shears');


-- Purple Lotus (Loot ID: 17200)
-- Purple Lotus - Journeyman Pruning Shears Bonus (Ref 91364)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91364, 8153, 10.0, 0, 1, 1, 'Purple Lotus - Wildvine - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91364, 8831, 100.0, 0, 1, 3, 'Purple Lotus - Purple Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91364, 19726, 15.0, 0, 1, 3, 'Purple Lotus - Bloodvine - Journeyman Pruning Shears');

-- Purple Lotus - Artisan Pruning Shears Bonus (Ref 91365)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91365, 8153, 10.0, 0, 1, 1, 'Purple Lotus - Wildvine - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91365, 8831, 100.0, 0, 1, 3, 'Purple Lotus - Purple Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91365, 19726, 15.0, 0, 1, 3, 'Purple Lotus - Bloodvine - Artisan Pruning Shears');

-- Purple Lotus - Master Pruning Shears Bonus (Ref 91366)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91366, 8153, 10.0, 0, 1, 1, 'Purple Lotus - Wildvine - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91366, 8831, 100.0, 0, 1, 3, 'Purple Lotus - Purple Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91366, 19726, 15.0, 0, 1, 3, 'Purple Lotus - Bloodvine - Master Pruning Shears');

-- Purple Lotus - Grand Master Pruning Shears Bonus (Ref 91367)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91367, 8153, 10.0, 0, 1, 1, 'Purple Lotus - Wildvine - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91367, 8831, 100.0, 0, 1, 3, 'Purple Lotus - Purple Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91367, 19726, 15.0, 0, 1, 3, 'Purple Lotus - Bloodvine - Grand Master Pruning Shears');


-- Sungrass (Loot ID: 17201)
-- Sungrass - Journeyman Pruning Shears Bonus (Ref 91368)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91368, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91368, 19726, 15.0, 0, 1, 3, 'Sungrass - Bloodvine - Journeyman Pruning Shears');

-- Sungrass - Artisan Pruning Shears Bonus (Ref 91369)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91369, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91369, 19726, 15.0, 0, 1, 3, 'Sungrass - Bloodvine - Artisan Pruning Shears');

-- Sungrass - Master Pruning Shears Bonus (Ref 91370)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91370, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91370, 19726, 15.0, 0, 1, 3, 'Sungrass - Bloodvine - Master Pruning Shears');

-- Sungrass - Grand Master Pruning Shears Bonus (Ref 91371)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91371, 8838, 100.0, 0, 1, 3, 'Sungrass - Sungrass - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91371, 19726, 15.0, 0, 1, 3, 'Sungrass - Bloodvine - Grand Master Pruning Shears');


-- Golden Sansam (Loot ID: 17202)
-- Golden Sansam - Journeyman Pruning Shears Bonus (Ref 91372)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91372, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91372, 19726, 15.0, 0, 1, 3, 'Golden Sansam - Bloodvine - Journeyman Pruning Shears');

-- Golden Sansam - Artisan Pruning Shears Bonus (Ref 91373)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91373, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91373, 19726, 15.0, 0, 1, 3, 'Golden Sansam - Bloodvine - Artisan Pruning Shears');

-- Golden Sansam - Master Pruning Shears Bonus (Ref 91374)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91374, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91374, 19726, 15.0, 0, 1, 3, 'Golden Sansam - Bloodvine - Master Pruning Shears');

-- Golden Sansam - Grand Master Pruning Shears Bonus (Ref 91375)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91375, 13464, 100.0, 0, 1, 3, 'Golden Sansam - Golden Sansam - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91375, 19726, 15.0, 0, 1, 3, 'Golden Sansam - Bloodvine - Grand Master Pruning Shears');


-- Dreamfoil (Loot ID: 17203)
-- Dreamfoil - Journeyman Pruning Shears Bonus (Ref 91376)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91376, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91376, 19726, 15.0, 0, 1, 3, 'Dreamfoil - Bloodvine - Journeyman Pruning Shears');

-- Dreamfoil - Artisan Pruning Shears Bonus (Ref 91377)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91377, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91377, 19726, 15.0, 0, 1, 3, 'Dreamfoil - Bloodvine - Artisan Pruning Shears');

-- Dreamfoil - Master Pruning Shears Bonus (Ref 91378)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91378, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91378, 19726, 15.0, 0, 1, 3, 'Dreamfoil - Bloodvine - Master Pruning Shears');

-- Dreamfoil - Grand Master Pruning Shears Bonus (Ref 91379)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91379, 13463, 100.0, 0, 1, 3, 'Dreamfoil - Dreamfoil - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91379, 19726, 15.0, 0, 1, 3, 'Dreamfoil - Bloodvine - Grand Master Pruning Shears');


-- Mountain Silversage (Loot ID: 17204)
-- Mountain Silversage - Journeyman Pruning Shears Bonus (Ref 91380)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91380, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91380, 19726, 15.0, 0, 1, 3, 'Mountain Silversage - Bloodvine - Journeyman Pruning Shears');

-- Mountain Silversage - Artisan Pruning Shears Bonus (Ref 91381)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91381, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91381, 19726, 15.0, 0, 1, 3, 'Mountain Silversage - Bloodvine - Artisan Pruning Shears');

-- Mountain Silversage - Master Pruning Shears Bonus (Ref 91382)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91382, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91382, 19726, 15.0, 0, 1, 3, 'Mountain Silversage - Bloodvine - Master Pruning Shears');

-- Mountain Silversage - Grand Master Pruning Shears Bonus (Ref 91383)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91383, 13465, 100.0, 0, 1, 3, 'Mountain Silversage - Mountain Silversage - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91383, 19726, 15.0, 0, 1, 3, 'Mountain Silversage - Bloodvine - Grand Master Pruning Shears');


-- Bloodthistle (Loot ID: 18009)
-- Bloodthistle - Journeyman Pruning Shears Bonus (Ref 91384)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91384, 22710, 100.0, 0, 1, 3, 'Bloodthistle - Bloodthistle - Journeyman Pruning Shears');

-- Bloodthistle - Artisan Pruning Shears Bonus (Ref 91385)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91385, 22710, 100.0, 0, 1, 3, 'Bloodthistle - Bloodthistle - Artisan Pruning Shears');

-- Bloodthistle - Master Pruning Shears Bonus (Ref 91386)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91386, 22710, 100.0, 0, 1, 3, 'Bloodthistle - Bloodthistle - Master Pruning Shears');

-- Bloodthistle - Grand Master Pruning Shears Bonus (Ref 91387)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91387, 22710, 100.0, 0, 1, 3, 'Bloodthistle - Bloodthistle - Grand Master Pruning Shears');


-- Felweed (Loot ID: 18111)
-- Felweed - Journeyman Pruning Shears Bonus (Ref 91388)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91388, 22575, 15.0, 0, 1, 2, 'Felweed - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91388, 22785, 100.0, 0, 1, 3, 'Felweed - Felweed - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91388, 22794, 2.0, 0, 1, 1, 'Felweed - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91388, 22795, 10.0, 0, 1, 1, 'Felweed - Fel Blossom - Journeyman Pruning Shears');

-- Felweed - Artisan Pruning Shears Bonus (Ref 91389)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91389, 22575, 15.0, 0, 1, 2, 'Felweed - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91389, 22785, 100.0, 0, 1, 3, 'Felweed - Felweed - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91389, 22794, 2.0, 0, 1, 1, 'Felweed - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91389, 22795, 10.0, 0, 1, 1, 'Felweed - Fel Blossom - Artisan Pruning Shears');

-- Felweed - Master Pruning Shears Bonus (Ref 91390)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91390, 22575, 15.0, 0, 1, 2, 'Felweed - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91390, 22785, 100.0, 0, 1, 3, 'Felweed - Felweed - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91390, 22794, 2.0, 0, 1, 1, 'Felweed - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91390, 22795, 10.0, 0, 1, 1, 'Felweed - Fel Blossom - Master Pruning Shears');

-- Felweed - Grand Master Pruning Shears Bonus (Ref 91391)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91391, 22575, 15.0, 0, 1, 2, 'Felweed - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91391, 22785, 100.0, 0, 1, 3, 'Felweed - Felweed - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91391, 22794, 2.0, 0, 1, 1, 'Felweed - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91391, 22795, 10.0, 0, 1, 1, 'Felweed - Fel Blossom - Grand Master Pruning Shears');


-- Dreaming Glory (Loot ID: 18112)
-- Dreaming Glory - Journeyman Pruning Shears Bonus (Ref 91392)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91392, 22575, 15.0, 0, 1, 3, 'Dreaming Glory - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91392, 22786, 100.0, 0, 1, 3, 'Dreaming Glory - Dreaming Glory - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91392, 22794, 2.0, 0, 1, 1, 'Dreaming Glory - Fel Lotus - Journeyman Pruning Shears');

-- Dreaming Glory - Artisan Pruning Shears Bonus (Ref 91393)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91393, 22575, 15.0, 0, 1, 3, 'Dreaming Glory - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91393, 22786, 100.0, 0, 1, 3, 'Dreaming Glory - Dreaming Glory - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91393, 22794, 2.0, 0, 1, 1, 'Dreaming Glory - Fel Lotus - Artisan Pruning Shears');

-- Dreaming Glory - Master Pruning Shears Bonus (Ref 91394)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91394, 22575, 15.0, 0, 1, 3, 'Dreaming Glory - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91394, 22786, 100.0, 0, 1, 3, 'Dreaming Glory - Dreaming Glory - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91394, 22794, 2.0, 0, 1, 1, 'Dreaming Glory - Fel Lotus - Master Pruning Shears');

-- Dreaming Glory - Grand Master Pruning Shears Bonus (Ref 91395)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91395, 22575, 15.0, 0, 1, 3, 'Dreaming Glory - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91395, 22786, 100.0, 0, 1, 3, 'Dreaming Glory - Dreaming Glory - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91395, 22794, 2.0, 0, 1, 1, 'Dreaming Glory - Fel Lotus - Grand Master Pruning Shears');


-- Ragveil (Loot ID: 18113)
-- Ragveil - Journeyman Pruning Shears Bonus (Ref 91396)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91396, 22575, 15.0, 0, 1, 3, 'Ragveil - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91396, 22787, 100.0, 0, 1, 3, 'Ragveil - Ragveil - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91396, 22794, 2.0, 0, 1, 1, 'Ragveil - Fel Lotus - Journeyman Pruning Shears');

-- Ragveil - Artisan Pruning Shears Bonus (Ref 91397)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91397, 22575, 15.0, 0, 1, 3, 'Ragveil - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91397, 22787, 100.0, 0, 1, 3, 'Ragveil - Ragveil - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91397, 22794, 2.0, 0, 1, 1, 'Ragveil - Fel Lotus - Artisan Pruning Shears');

-- Ragveil - Master Pruning Shears Bonus (Ref 91398)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91398, 22575, 15.0, 0, 1, 3, 'Ragveil - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91398, 22787, 100.0, 0, 1, 3, 'Ragveil - Ragveil - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91398, 22794, 2.0, 0, 1, 1, 'Ragveil - Fel Lotus - Master Pruning Shears');

-- Ragveil - Grand Master Pruning Shears Bonus (Ref 91399)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91399, 22575, 15.0, 0, 1, 3, 'Ragveil - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91399, 22787, 100.0, 0, 1, 3, 'Ragveil - Ragveil - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91399, 22794, 2.0, 0, 1, 1, 'Ragveil - Fel Lotus - Grand Master Pruning Shears');


-- Flame Cap (Loot ID: 18114)
-- Flame Cap - Journeyman Pruning Shears Bonus (Ref 91400)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91400, 22788, 100.0, 0, 1, 3, 'Flame Cap - Flame Cap - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91400, 22794, 2.0, 0, 1, 1, 'Flame Cap - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91400, 35229, 25.0, 0, 1, 1, 'Flame Cap - Nether Residue - Journeyman Pruning Shears');

-- Flame Cap - Artisan Pruning Shears Bonus (Ref 91401)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91401, 22788, 100.0, 0, 1, 3, 'Flame Cap - Flame Cap - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91401, 22794, 2.0, 0, 1, 1, 'Flame Cap - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91401, 35229, 25.0, 0, 1, 1, 'Flame Cap - Nether Residue - Artisan Pruning Shears');

-- Flame Cap - Master Pruning Shears Bonus (Ref 91402)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91402, 22788, 100.0, 0, 1, 3, 'Flame Cap - Flame Cap - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91402, 22794, 2.0, 0, 1, 1, 'Flame Cap - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91402, 35229, 25.0, 0, 1, 1, 'Flame Cap - Nether Residue - Master Pruning Shears');

-- Flame Cap - Grand Master Pruning Shears Bonus (Ref 91403)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91403, 22788, 100.0, 0, 1, 3, 'Flame Cap - Flame Cap - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91403, 22794, 2.0, 0, 1, 1, 'Flame Cap - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91403, 35229, 25.0, 0, 1, 1, 'Flame Cap - Nether Residue - Grand Master Pruning Shears');


-- Terocone (Loot ID: 18115)
-- Terocone - Journeyman Pruning Shears Bonus (Ref 91404)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91404, 22575, 15.0, 0, 1, 3, 'Terocone - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91404, 22789, 100.0, 0, 1, 3, 'Terocone - Terocone - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91404, 22794, 3.0, 0, 1, 1, 'Terocone - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91404, 35229, 25.0, 0, 1, 1, 'Terocone - Nether Residue - Journeyman Pruning Shears');

-- Terocone - Artisan Pruning Shears Bonus (Ref 91405)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91405, 22575, 15.0, 0, 1, 3, 'Terocone - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91405, 22789, 100.0, 0, 1, 3, 'Terocone - Terocone - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91405, 22794, 3.0, 0, 1, 1, 'Terocone - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91405, 35229, 25.0, 0, 1, 1, 'Terocone - Nether Residue - Artisan Pruning Shears');

-- Terocone - Master Pruning Shears Bonus (Ref 91406)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91406, 22575, 15.0, 0, 1, 3, 'Terocone - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91406, 22789, 100.0, 0, 1, 3, 'Terocone - Terocone - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91406, 22794, 3.0, 0, 1, 1, 'Terocone - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91406, 35229, 25.0, 0, 1, 1, 'Terocone - Nether Residue - Master Pruning Shears');

-- Terocone - Grand Master Pruning Shears Bonus (Ref 91407)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91407, 22575, 15.0, 0, 1, 3, 'Terocone - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91407, 22789, 100.0, 0, 1, 3, 'Terocone - Terocone - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91407, 22794, 3.0, 0, 1, 1, 'Terocone - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91407, 35229, 25.0, 0, 1, 1, 'Terocone - Nether Residue - Grand Master Pruning Shears');


-- Ancient Lichen (Loot ID: 18116)
-- Ancient Lichen - Journeyman Pruning Shears Bonus (Ref 91408)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91408, 22790, 100.0, 0, 1, 3, 'Ancient Lichen - Ancient Lichen - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91408, 22794, 2.0, 0, 1, 1, 'Ancient Lichen - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91408, 35229, 25.0, 0, 1, 1, 'Ancient Lichen - Nether Residue - Journeyman Pruning Shears');

-- Ancient Lichen - Artisan Pruning Shears Bonus (Ref 91409)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91409, 22790, 100.0, 0, 1, 3, 'Ancient Lichen - Ancient Lichen - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91409, 22794, 2.0, 0, 1, 1, 'Ancient Lichen - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91409, 35229, 25.0, 0, 1, 1, 'Ancient Lichen - Nether Residue - Artisan Pruning Shears');

-- Ancient Lichen - Master Pruning Shears Bonus (Ref 91410)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91410, 22790, 100.0, 0, 1, 3, 'Ancient Lichen - Ancient Lichen - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91410, 22794, 2.0, 0, 1, 1, 'Ancient Lichen - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91410, 35229, 25.0, 0, 1, 1, 'Ancient Lichen - Nether Residue - Master Pruning Shears');

-- Ancient Lichen - Grand Master Pruning Shears Bonus (Ref 91411)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91411, 22790, 100.0, 0, 1, 3, 'Ancient Lichen - Ancient Lichen - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91411, 22794, 2.0, 0, 1, 1, 'Ancient Lichen - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91411, 35229, 25.0, 0, 1, 1, 'Ancient Lichen - Nether Residue - Grand Master Pruning Shears');


-- Netherbloom (Loot ID: 18117)
-- Netherbloom - Journeyman Pruning Shears Bonus (Ref 91412)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91412, 22576, 15.0, 0, 1, 3, 'Netherbloom - Mote of Mana - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91412, 22791, 100.0, 0, 1, 3, 'Netherbloom - Netherbloom - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91412, 22794, 3.0, 0, 1, 1, 'Netherbloom - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91412, 35229, 25.0, 0, 1, 1, 'Netherbloom - Nether Residue - Journeyman Pruning Shears');

-- Netherbloom - Artisan Pruning Shears Bonus (Ref 91413)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91413, 22576, 15.0, 0, 1, 3, 'Netherbloom - Mote of Mana - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91413, 22791, 100.0, 0, 1, 3, 'Netherbloom - Netherbloom - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91413, 22794, 3.0, 0, 1, 1, 'Netherbloom - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91413, 35229, 25.0, 0, 1, 1, 'Netherbloom - Nether Residue - Artisan Pruning Shears');

-- Netherbloom - Master Pruning Shears Bonus (Ref 91414)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91414, 22576, 15.0, 0, 1, 3, 'Netherbloom - Mote of Mana - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91414, 22791, 100.0, 0, 1, 3, 'Netherbloom - Netherbloom - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91414, 22794, 3.0, 0, 1, 1, 'Netherbloom - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91414, 35229, 25.0, 0, 1, 1, 'Netherbloom - Nether Residue - Master Pruning Shears');

-- Netherbloom - Grand Master Pruning Shears Bonus (Ref 91415)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91415, 22576, 15.0, 0, 1, 3, 'Netherbloom - Mote of Mana - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91415, 22791, 100.0, 0, 1, 3, 'Netherbloom - Netherbloom - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91415, 22794, 3.0, 0, 1, 1, 'Netherbloom - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91415, 35229, 25.0, 0, 1, 1, 'Netherbloom - Nether Residue - Grand Master Pruning Shears');


-- Nightmare Vine (Loot ID: 18118)
-- Nightmare Vine - Journeyman Pruning Shears Bonus (Ref 91416)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 22575, 10.0, 0, 1, 3, 'Nightmare Vine - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 22792, 100.0, 0, 1, 3, 'Nightmare Vine - Nightmare Vine - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 22794, 3.0, 0, 1, 1, 'Nightmare Vine - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 22797, 10.0, 0, 1, 1, 'Nightmare Vine - Nightmare Seed - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91416, 35229, 25.0, 0, 1, 1, 'Nightmare Vine - Nether Residue - Journeyman Pruning Shears');

-- Nightmare Vine - Artisan Pruning Shears Bonus (Ref 91417)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 22575, 10.0, 0, 1, 3, 'Nightmare Vine - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 22792, 100.0, 0, 1, 3, 'Nightmare Vine - Nightmare Vine - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 22794, 3.0, 0, 1, 1, 'Nightmare Vine - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 22797, 10.0, 0, 1, 1, 'Nightmare Vine - Nightmare Seed - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91417, 35229, 25.0, 0, 1, 1, 'Nightmare Vine - Nether Residue - Artisan Pruning Shears');

-- Nightmare Vine - Master Pruning Shears Bonus (Ref 91418)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 22575, 10.0, 0, 1, 3, 'Nightmare Vine - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 22792, 100.0, 0, 1, 3, 'Nightmare Vine - Nightmare Vine - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 22794, 3.0, 0, 1, 1, 'Nightmare Vine - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 22797, 10.0, 0, 1, 1, 'Nightmare Vine - Nightmare Seed - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91418, 35229, 25.0, 0, 1, 1, 'Nightmare Vine - Nether Residue - Master Pruning Shears');

-- Nightmare Vine - Grand Master Pruning Shears Bonus (Ref 91419)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 22575, 10.0, 0, 1, 3, 'Nightmare Vine - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 22792, 100.0, 0, 1, 3, 'Nightmare Vine - Nightmare Vine - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 22794, 3.0, 0, 1, 1, 'Nightmare Vine - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 22797, 10.0, 0, 1, 1, 'Nightmare Vine - Nightmare Seed - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91419, 35229, 25.0, 0, 1, 1, 'Nightmare Vine - Nether Residue - Grand Master Pruning Shears');


-- Mana Thistle (Loot ID: 18119)
-- Mana Thistle - Journeyman Pruning Shears Bonus (Ref 91420)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91420, 22575, 15.0, 0, 1, 3, 'Mana Thistle - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91420, 22793, 100.0, 0, 1, 3, 'Mana Thistle - Mana Thistle - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91420, 22794, 3.0, 0, 1, 1, 'Mana Thistle - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91420, 35229, 25.0, 0, 1, 1, 'Mana Thistle - Nether Residue - Journeyman Pruning Shears');

-- Mana Thistle - Artisan Pruning Shears Bonus (Ref 91421)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91421, 22575, 15.0, 0, 1, 3, 'Mana Thistle - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91421, 22793, 100.0, 0, 1, 3, 'Mana Thistle - Mana Thistle - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91421, 22794, 3.0, 0, 1, 1, 'Mana Thistle - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91421, 35229, 25.0, 0, 1, 1, 'Mana Thistle - Nether Residue - Artisan Pruning Shears');

-- Mana Thistle - Master Pruning Shears Bonus (Ref 91422)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91422, 22575, 15.0, 0, 1, 3, 'Mana Thistle - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91422, 22793, 100.0, 0, 1, 3, 'Mana Thistle - Mana Thistle - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91422, 22794, 3.0, 0, 1, 1, 'Mana Thistle - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91422, 35229, 25.0, 0, 1, 1, 'Mana Thistle - Nether Residue - Master Pruning Shears');

-- Mana Thistle - Grand Master Pruning Shears Bonus (Ref 91423)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91423, 22575, 15.0, 0, 1, 3, 'Mana Thistle - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91423, 22793, 100.0, 0, 1, 3, 'Mana Thistle - Mana Thistle - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91423, 22794, 3.0, 0, 1, 1, 'Mana Thistle - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91423, 35229, 25.0, 0, 1, 1, 'Mana Thistle - Nether Residue - Grand Master Pruning Shears');


-- Ragveil (Loot ID: 19627)
-- Ragveil - Journeyman Pruning Shears Bonus (Ref 91424)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91424, 22575, 15.0, 0, 1, 3, 'Ragveil - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91424, 22787, 100.0, 0, 1, 3, 'Ragveil - Ragveil - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91424, 22794, 2.0, 0, 1, 1, 'Ragveil - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91424, 24401, 10.0, 0, 1, 3, 'Ragveil - Unidentified Plant Parts - Journeyman Pruning Shears');

-- Ragveil - Artisan Pruning Shears Bonus (Ref 91425)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91425, 22575, 15.0, 0, 1, 3, 'Ragveil - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91425, 22787, 100.0, 0, 1, 3, 'Ragveil - Ragveil - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91425, 22794, 2.0, 0, 1, 1, 'Ragveil - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91425, 24401, 10.0, 0, 1, 3, 'Ragveil - Unidentified Plant Parts - Artisan Pruning Shears');

-- Ragveil - Master Pruning Shears Bonus (Ref 91426)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91426, 22575, 15.0, 0, 1, 3, 'Ragveil - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91426, 22787, 100.0, 0, 1, 3, 'Ragveil - Ragveil - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91426, 22794, 2.0, 0, 1, 1, 'Ragveil - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91426, 24401, 10.0, 0, 1, 3, 'Ragveil - Unidentified Plant Parts - Master Pruning Shears');

-- Ragveil - Grand Master Pruning Shears Bonus (Ref 91427)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91427, 22575, 15.0, 0, 1, 3, 'Ragveil - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91427, 22787, 100.0, 0, 1, 3, 'Ragveil - Ragveil - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91427, 22794, 2.0, 0, 1, 1, 'Ragveil - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91427, 24401, 10.0, 0, 1, 3, 'Ragveil - Unidentified Plant Parts - Grand Master Pruning Shears');


-- Felweed (Loot ID: 19628)
-- Felweed - Journeyman Pruning Shears Bonus (Ref 91428)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91428, 22575, 15.0, 0, 1, 2, 'Felweed - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91428, 22785, 100.0, 0, 1, 3, 'Felweed - Felweed - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91428, 22794, 2.0, 0, 1, 1, 'Felweed - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91428, 24401, 10.0, 0, 1, 3, 'Felweed - Unidentified Plant Parts - Journeyman Pruning Shears');

-- Felweed - Artisan Pruning Shears Bonus (Ref 91429)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91429, 22575, 15.0, 0, 1, 2, 'Felweed - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91429, 22785, 100.0, 0, 1, 3, 'Felweed - Felweed - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91429, 22794, 2.0, 0, 1, 1, 'Felweed - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91429, 24401, 10.0, 0, 1, 3, 'Felweed - Unidentified Plant Parts - Artisan Pruning Shears');

-- Felweed - Master Pruning Shears Bonus (Ref 91430)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91430, 22575, 15.0, 0, 1, 2, 'Felweed - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91430, 22785, 100.0, 0, 1, 3, 'Felweed - Felweed - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91430, 22794, 2.0, 0, 1, 1, 'Felweed - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91430, 24401, 10.0, 0, 1, 3, 'Felweed - Unidentified Plant Parts - Master Pruning Shears');

-- Felweed - Grand Master Pruning Shears Bonus (Ref 91431)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91431, 22575, 15.0, 0, 1, 2, 'Felweed - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91431, 22785, 100.0, 0, 1, 3, 'Felweed - Felweed - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91431, 22794, 2.0, 0, 1, 1, 'Felweed - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91431, 24401, 10.0, 0, 1, 3, 'Felweed - Unidentified Plant Parts - Grand Master Pruning Shears');


-- Dreaming Glory (Loot ID: 19629)
-- Dreaming Glory - Journeyman Pruning Shears Bonus (Ref 91432)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91432, 22575, 15.0, 0, 1, 3, 'Dreaming Glory - Mote of Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91432, 22786, 100.0, 0, 1, 3, 'Dreaming Glory - Dreaming Glory - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91432, 22794, 2.0, 0, 1, 1, 'Dreaming Glory - Fel Lotus - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91432, 24401, 10.0, 0, 1, 3, 'Dreaming Glory - Unidentified Plant Parts - Journeyman Pruning Shears');

-- Dreaming Glory - Artisan Pruning Shears Bonus (Ref 91433)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91433, 22575, 15.0, 0, 1, 3, 'Dreaming Glory - Mote of Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91433, 22786, 100.0, 0, 1, 3, 'Dreaming Glory - Dreaming Glory - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91433, 22794, 2.0, 0, 1, 1, 'Dreaming Glory - Fel Lotus - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91433, 24401, 10.0, 0, 1, 3, 'Dreaming Glory - Unidentified Plant Parts - Artisan Pruning Shears');

-- Dreaming Glory - Master Pruning Shears Bonus (Ref 91434)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91434, 22575, 15.0, 0, 1, 3, 'Dreaming Glory - Mote of Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91434, 22786, 100.0, 0, 1, 3, 'Dreaming Glory - Dreaming Glory - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91434, 22794, 2.0, 0, 1, 1, 'Dreaming Glory - Fel Lotus - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91434, 24401, 10.0, 0, 1, 3, 'Dreaming Glory - Unidentified Plant Parts - Master Pruning Shears');

-- Dreaming Glory - Grand Master Pruning Shears Bonus (Ref 91435)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91435, 22575, 15.0, 0, 1, 3, 'Dreaming Glory - Mote of Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91435, 22786, 100.0, 0, 1, 3, 'Dreaming Glory - Dreaming Glory - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91435, 22794, 2.0, 0, 1, 1, 'Dreaming Glory - Fel Lotus - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91435, 24401, 10.0, 0, 1, 3, 'Dreaming Glory - Unidentified Plant Parts - Grand Master Pruning Shears');


-- Blindweed (Loot ID: 19630)
-- Blindweed - Journeyman Pruning Shears Bonus (Ref 91436)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91436, 8839, 100.0, 0, 1, 3, 'Blindweed - Blindweed - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91436, 24401, 10.0, 0, 1, 3, 'Blindweed - Unidentified Plant Parts - Journeyman Pruning Shears');

-- Blindweed - Artisan Pruning Shears Bonus (Ref 91437)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91437, 8839, 100.0, 0, 1, 3, 'Blindweed - Blindweed - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91437, 24401, 10.0, 0, 1, 3, 'Blindweed - Unidentified Plant Parts - Artisan Pruning Shears');

-- Blindweed - Master Pruning Shears Bonus (Ref 91438)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91438, 8839, 100.0, 0, 1, 3, 'Blindweed - Blindweed - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91438, 24401, 10.0, 0, 1, 3, 'Blindweed - Unidentified Plant Parts - Master Pruning Shears');

-- Blindweed - Grand Master Pruning Shears Bonus (Ref 91439)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91439, 8839, 100.0, 0, 1, 3, 'Blindweed - Blindweed - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91439, 24401, 10.0, 0, 1, 3, 'Blindweed - Unidentified Plant Parts - Grand Master Pruning Shears');


-- Goldclover (Loot ID: 24093)
-- Goldclover - Journeyman Pruning Shears Bonus (Ref 91440)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91440, 36901, 100.0, 0, 1, 3, 'Goldclover - Goldclover - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91440, 37704, 20.0, 0, 1, 3, 'Goldclover - Crystallized Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91440, 37921, 35.0, 0, 1, 3, 'Goldclover - Deadnettle - Journeyman Pruning Shears');

-- Goldclover - Artisan Pruning Shears Bonus (Ref 91441)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91441, 36901, 100.0, 0, 1, 3, 'Goldclover - Goldclover - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91441, 37704, 20.0, 0, 1, 3, 'Goldclover - Crystallized Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91441, 37921, 35.0, 0, 1, 3, 'Goldclover - Deadnettle - Artisan Pruning Shears');

-- Goldclover - Master Pruning Shears Bonus (Ref 91442)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91442, 36901, 100.0, 0, 1, 3, 'Goldclover - Goldclover - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91442, 37704, 20.0, 0, 1, 3, 'Goldclover - Crystallized Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91442, 37921, 35.0, 0, 1, 3, 'Goldclover - Deadnettle - Master Pruning Shears');

-- Goldclover - Grand Master Pruning Shears Bonus (Ref 91443)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91443, 36901, 100.0, 0, 1, 3, 'Goldclover - Goldclover - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91443, 37704, 20.0, 0, 1, 3, 'Goldclover - Crystallized Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91443, 37921, 35.0, 0, 1, 3, 'Goldclover - Deadnettle - Grand Master Pruning Shears');


-- Tiger Lily (Loot ID: 24224)
-- Tiger Lily - Journeyman Pruning Shears Bonus (Ref 91444)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91444, 36904, 100.0, 0, 1, 3, 'Tiger Lily - Tiger Lily - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91444, 37704, 20.0, 0, 1, 3, 'Tiger Lily - Crystallized Life - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91444, 37921, 35.0, 0, 1, 3, 'Tiger Lily - Deadnettle - Journeyman Pruning Shears');

-- Tiger Lily - Artisan Pruning Shears Bonus (Ref 91445)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91445, 36904, 100.0, 0, 1, 3, 'Tiger Lily - Tiger Lily - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91445, 37704, 20.0, 0, 1, 3, 'Tiger Lily - Crystallized Life - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91445, 37921, 35.0, 0, 1, 3, 'Tiger Lily - Deadnettle - Artisan Pruning Shears');

-- Tiger Lily - Master Pruning Shears Bonus (Ref 91446)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91446, 36904, 100.0, 0, 1, 3, 'Tiger Lily - Tiger Lily - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91446, 37704, 20.0, 0, 1, 3, 'Tiger Lily - Crystallized Life - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91446, 37921, 35.0, 0, 1, 3, 'Tiger Lily - Deadnettle - Master Pruning Shears');

-- Tiger Lily - Grand Master Pruning Shears Bonus (Ref 91447)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91447, 36904, 100.0, 0, 1, 3, 'Tiger Lily - Tiger Lily - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91447, 37704, 20.0, 0, 1, 3, 'Tiger Lily - Crystallized Life - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91447, 37921, 35.0, 0, 1, 3, 'Tiger Lily - Deadnettle - Grand Master Pruning Shears');


-- Lichbloom (Loot ID: 24226)
-- Lichbloom - Journeyman Pruning Shears Bonus (Ref 91448)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91448, 36905, 100.0, 0, 1, 3, 'Lichbloom - Lichbloom - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91448, 37704, 25.0, 0, 1, 3, 'Lichbloom - Crystallized Life - Journeyman Pruning Shears');

-- Lichbloom - Artisan Pruning Shears Bonus (Ref 91449)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91449, 36905, 100.0, 0, 1, 3, 'Lichbloom - Lichbloom - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91449, 37704, 25.0, 0, 1, 3, 'Lichbloom - Crystallized Life - Artisan Pruning Shears');

-- Lichbloom - Master Pruning Shears Bonus (Ref 91450)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91450, 36905, 100.0, 0, 1, 3, 'Lichbloom - Lichbloom - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91450, 37704, 25.0, 0, 1, 3, 'Lichbloom - Crystallized Life - Master Pruning Shears');

-- Lichbloom - Grand Master Pruning Shears Bonus (Ref 91451)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91451, 36905, 100.0, 0, 1, 3, 'Lichbloom - Lichbloom - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91451, 37704, 25.0, 0, 1, 3, 'Lichbloom - Crystallized Life - Grand Master Pruning Shears');


-- Icethorn (Loot ID: 24227)
-- Icethorn - Journeyman Pruning Shears Bonus (Ref 91452)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91452, 36906, 100.0, 0, 1, 3, 'Icethorn - Icethorn - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91452, 37704, 25.0, 0, 1, 3, 'Icethorn - Crystallized Life - Journeyman Pruning Shears');

-- Icethorn - Artisan Pruning Shears Bonus (Ref 91453)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91453, 36906, 100.0, 0, 1, 3, 'Icethorn - Icethorn - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91453, 37704, 25.0, 0, 1, 3, 'Icethorn - Crystallized Life - Artisan Pruning Shears');

-- Icethorn - Master Pruning Shears Bonus (Ref 91454)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91454, 36906, 100.0, 0, 1, 3, 'Icethorn - Icethorn - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91454, 37704, 25.0, 0, 1, 3, 'Icethorn - Crystallized Life - Master Pruning Shears');

-- Icethorn - Grand Master Pruning Shears Bonus (Ref 91455)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91455, 36906, 100.0, 0, 1, 3, 'Icethorn - Icethorn - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91455, 37704, 25.0, 0, 1, 3, 'Icethorn - Crystallized Life - Grand Master Pruning Shears');


-- Adder's Tongue (Loot ID: 25093)
-- Adder's Tongue - Journeyman Pruning Shears Bonus (Ref 91456)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91456, 36903, 100.0, 0, 1, 3, 'Adder''s Tongue - Adder''s Tongue - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91456, 37704, 25.0, 0, 1, 3, 'Adder''s Tongue - Crystallized Life - Journeyman Pruning Shears');

-- Adder's Tongue - Artisan Pruning Shears Bonus (Ref 91457)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91457, 36903, 100.0, 0, 1, 3, 'Adder''s Tongue - Adder''s Tongue - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91457, 37704, 25.0, 0, 1, 3, 'Adder''s Tongue - Crystallized Life - Artisan Pruning Shears');

-- Adder's Tongue - Master Pruning Shears Bonus (Ref 91458)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91458, 36903, 100.0, 0, 1, 3, 'Adder''s Tongue - Adder''s Tongue - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91458, 37704, 25.0, 0, 1, 3, 'Adder''s Tongue - Crystallized Life - Master Pruning Shears');

-- Adder's Tongue - Grand Master Pruning Shears Bonus (Ref 91459)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91459, 36903, 100.0, 0, 1, 3, 'Adder''s Tongue - Adder''s Tongue - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91459, 37704, 25.0, 0, 1, 3, 'Adder''s Tongue - Crystallized Life - Grand Master Pruning Shears');


-- Frozen Herb (Loot ID: 25094)
-- Frozen Herb - Journeyman Pruning Shears Bonus (Ref 91460)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91460, 36901, 0.0, 0, 1, 4, 'Frozen Herb - Goldclover - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91460, 36904, 0.0, 0, 1, 4, 'Frozen Herb - Tiger Lily - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91460, 36907, 0.0, 0, 1, 4, 'Frozen Herb - Talandra''s Rose - Journeyman Pruning Shears');

-- Frozen Herb - Artisan Pruning Shears Bonus (Ref 91461)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91461, 36901, 0.0, 0, 1, 4, 'Frozen Herb - Goldclover - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91461, 36904, 0.0, 0, 1, 4, 'Frozen Herb - Tiger Lily - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91461, 36907, 0.0, 0, 1, 4, 'Frozen Herb - Talandra''s Rose - Artisan Pruning Shears');

-- Frozen Herb - Master Pruning Shears Bonus (Ref 91462)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91462, 36901, 0.0, 0, 1, 4, 'Frozen Herb - Goldclover - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91462, 36904, 0.0, 0, 1, 4, 'Frozen Herb - Tiger Lily - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91462, 36907, 0.0, 0, 1, 4, 'Frozen Herb - Talandra''s Rose - Master Pruning Shears');

-- Frozen Herb - Grand Master Pruning Shears Bonus (Ref 91463)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91463, 36901, 0.0, 0, 1, 4, 'Frozen Herb - Goldclover - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91463, 36904, 0.0, 0, 1, 4, 'Frozen Herb - Tiger Lily - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91463, 36907, 0.0, 0, 1, 4, 'Frozen Herb - Talandra''s Rose - Grand Master Pruning Shears');


-- Frozen Herb (Loot ID: 25095)
-- Frozen Herb - Journeyman Pruning Shears Bonus (Ref 91464)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91464, 36901, 0.0, 0, 1, 4, 'Frozen Herb - Goldclover - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91464, 36904, 0.0, 0, 1, 4, 'Frozen Herb - Tiger Lily - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91464, 36907, 0.0, 0, 1, 4, 'Frozen Herb - Talandra''s Rose - Journeyman Pruning Shears');

-- Frozen Herb - Artisan Pruning Shears Bonus (Ref 91465)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91465, 36901, 0.0, 0, 1, 4, 'Frozen Herb - Goldclover - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91465, 36904, 0.0, 0, 1, 4, 'Frozen Herb - Tiger Lily - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91465, 36907, 0.0, 0, 1, 4, 'Frozen Herb - Talandra''s Rose - Artisan Pruning Shears');

-- Frozen Herb - Master Pruning Shears Bonus (Ref 91466)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91466, 36901, 0.0, 0, 1, 4, 'Frozen Herb - Goldclover - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91466, 36904, 0.0, 0, 1, 4, 'Frozen Herb - Tiger Lily - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91466, 36907, 0.0, 0, 1, 4, 'Frozen Herb - Talandra''s Rose - Master Pruning Shears');

-- Frozen Herb - Grand Master Pruning Shears Bonus (Ref 91467)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91467, 36901, 0.0, 0, 1, 4, 'Frozen Herb - Goldclover - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91467, 36904, 0.0, 0, 1, 4, 'Frozen Herb - Tiger Lily - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91467, 36907, 0.0, 0, 1, 4, 'Frozen Herb - Talandra''s Rose - Grand Master Pruning Shears');


-- Frozen Herb (Loot ID: 25096)
-- Frozen Herb - Journeyman Pruning Shears Bonus (Ref 91468)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91468, 36901, 60.0, 0, 2, 6, 'Frozen Herb - Goldclover - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91468, 36904, 20.0, 0, 2, 6, 'Frozen Herb - Tiger Lily - Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91468, 36907, 20.0, 0, 2, 6, 'Frozen Herb - Talandra''s Rose - Journeyman Pruning Shears');

-- Frozen Herb - Artisan Pruning Shears Bonus (Ref 91469)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91469, 36901, 60.0, 0, 2, 6, 'Frozen Herb - Goldclover - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91469, 36904, 20.0, 0, 2, 6, 'Frozen Herb - Tiger Lily - Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91469, 36907, 20.0, 0, 2, 6, 'Frozen Herb - Talandra''s Rose - Artisan Pruning Shears');

-- Frozen Herb - Master Pruning Shears Bonus (Ref 91470)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91470, 36901, 60.0, 0, 2, 6, 'Frozen Herb - Goldclover - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91470, 36904, 20.0, 0, 2, 6, 'Frozen Herb - Tiger Lily - Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91470, 36907, 20.0, 0, 2, 6, 'Frozen Herb - Talandra''s Rose - Master Pruning Shears');

-- Frozen Herb - Grand Master Pruning Shears Bonus (Ref 91471)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91471, 36901, 60.0, 0, 2, 6, 'Frozen Herb - Goldclover - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91471, 36904, 20.0, 0, 2, 6, 'Frozen Herb - Tiger Lily - Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (91471, 36907, 20.0, 0, 2, 6, 'Frozen Herb - Talandra''s Rose - Grand Master Pruning Shears');


-- =====================================================
-- LINK REFERENCES TO GAMEOBJECTS
-- =====================================================

-- Journeyman bonus for loot table 1414 (GOs: 1617)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1414, 9000, 91200, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1414 (GOs: 1617)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1414, 9001, 91201, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1414 (GOs: 1617)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1414, 9002, 91202, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1414 (GOs: 1617)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1414, 9003, 91203, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1415 (GOs: 1618)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1415, 9004, 91204, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1415 (GOs: 1618)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1415, 9005, 91205, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1415 (GOs: 1618)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1415, 9006, 91206, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1415 (GOs: 1618)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1415, 9007, 91207, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1416 (GOs: 1619)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1416, 9008, 91208, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1416 (GOs: 1619)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1416, 9009, 91209, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1416 (GOs: 1619)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1416, 9010, 91210, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1416 (GOs: 1619)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1416, 9011, 91211, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1417 (GOs: 1620)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1417, 9012, 91212, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1417 (GOs: 1620)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1417, 9013, 91213, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1417 (GOs: 1620)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1417, 9014, 91214, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1417 (GOs: 1620)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1417, 9015, 91215, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1418 (GOs: 1621)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1418, 9016, 91216, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1418 (GOs: 1621)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1418, 9017, 91217, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1418 (GOs: 1621)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1418, 9018, 91218, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1418 (GOs: 1621)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1418, 9019, 91219, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1419 (GOs: 1622)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1419, 9020, 91220, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1419 (GOs: 1622)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1419, 9021, 91221, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1419 (GOs: 1622)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1419, 9022, 91222, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1419 (GOs: 1622)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1419, 9023, 91223, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1420 (GOs: 1623)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1420, 9024, 91224, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1420 (GOs: 1623)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1420, 9025, 91225, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1420 (GOs: 1623)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1420, 9026, 91226, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1420 (GOs: 1623)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1420, 9027, 91227, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1421 (GOs: 1624)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1421, 9028, 91228, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1421 (GOs: 1624)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1421, 9029, 91229, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1421 (GOs: 1624)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1421, 9030, 91230, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1421 (GOs: 1624)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1421, 9031, 91231, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1423 (GOs: 2043)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1423, 9032, 91232, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1423 (GOs: 2043)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1423, 9033, 91233, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1423 (GOs: 2043)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1423, 9034, 91234, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1423 (GOs: 2043)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1423, 9035, 91235, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1424 (GOs: 1628)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1424, 9036, 91236, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1424 (GOs: 1628)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1424, 9037, 91237, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1424 (GOs: 1628)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1424, 9038, 91238, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1424 (GOs: 1628)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1424, 9039, 91239, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1730 (GOs: 2041)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1730, 9040, 91240, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1730 (GOs: 2041)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1730, 9041, 91241, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1730 (GOs: 2041)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1730, 9042, 91242, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1730 (GOs: 2041)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1730, 9043, 91243, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1731 (GOs: 2042)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1731, 9044, 91244, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1731 (GOs: 2042)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1731, 9045, 91245, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1731 (GOs: 2042)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1731, 9046, 91246, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1731 (GOs: 2042)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1731, 9047, 91247, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1732 (GOs: 2044)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1732, 9048, 91248, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1732 (GOs: 2044)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1732, 9049, 91249, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1732 (GOs: 2044)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1732, 9050, 91250, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1732 (GOs: 2044)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1732, 9051, 91251, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1733 (GOs: 2045)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1733, 9052, 91252, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1733 (GOs: 2045)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1733, 9053, 91253, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1733 (GOs: 2045)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1733, 9054, 91254, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1733 (GOs: 2045)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1733, 9055, 91255, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 1734 (GOs: 2046)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1734, 9056, 91256, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 1734 (GOs: 2046)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1734, 9057, 91257, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 1734 (GOs: 2046)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1734, 9058, 91258, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 1734 (GOs: 2046)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1734, 9059, 91259, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 2292 (GOs: 2866)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2292, 9060, 91260, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 2292 (GOs: 2866)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2292, 9061, 91261, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 2292 (GOs: 2866)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2292, 9062, 91262, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 2292 (GOs: 2866)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2292, 9063, 91263, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 2511 (GOs: 3725)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2511, 9064, 91264, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 2511 (GOs: 3725)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2511, 9065, 91265, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 2511 (GOs: 3725)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2511, 9066, 91266, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 2511 (GOs: 3725)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2511, 9067, 91267, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 2512 (GOs: 3724)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2512, 9068, 91268, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 2512 (GOs: 3724)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2512, 9069, 91269, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 2512 (GOs: 3724)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2512, 9070, 91270, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 2512 (GOs: 3724)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2512, 9071, 91271, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 2513 (GOs: 3726)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2513, 9072, 91272, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 2513 (GOs: 3726)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2513, 9073, 91273, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 2513 (GOs: 3726)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2513, 9074, 91274, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 2513 (GOs: 3726)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2513, 9075, 91275, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 2514 (GOs: 3727)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2514, 9076, 91276, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 2514 (GOs: 3727)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2514, 9077, 91277, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 2514 (GOs: 3727)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2514, 9078, 91278, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 2514 (GOs: 3727)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2514, 9079, 91279, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 2515 (GOs: 3729)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2515, 9080, 91280, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 2515 (GOs: 3729)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2515, 9081, 91281, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 2515 (GOs: 3729)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2515, 9082, 91282, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 2515 (GOs: 3729)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2515, 9083, 91283, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 2516 (GOs: 3730)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2516, 9084, 91284, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 2516 (GOs: 3730)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2516, 9085, 91285, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 2516 (GOs: 3730)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2516, 9086, 91286, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 2516 (GOs: 3730)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2516, 9087, 91287, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 6142 (GOs: 142140)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6142, 9088, 91288, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 6142 (GOs: 142140)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6142, 9089, 91289, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 6142 (GOs: 142140)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6142, 9090, 91290, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 6142 (GOs: 142140)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6142, 9091, 91291, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 6150 (GOs: 142141)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6150, 9092, 91292, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 6150 (GOs: 142141)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6150, 9093, 91293, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 6150 (GOs: 142141)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6150, 9094, 91294, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 6150 (GOs: 142141)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6150, 9095, 91295, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 6151 (GOs: 142142)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6151, 9096, 91296, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 6151 (GOs: 142142)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6151, 9097, 91297, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 6151 (GOs: 142142)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6151, 9098, 91298, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 6151 (GOs: 142142)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6151, 9099, 91299, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 6152 (GOs: 142143)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6152, 9100, 91300, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 6152 (GOs: 142143)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6152, 9101, 91301, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 6152 (GOs: 142143)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6152, 9102, 91302, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 6152 (GOs: 142143)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6152, 9103, 91303, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 6312 (GOs: 142144)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6312, 9104, 91304, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 6312 (GOs: 142144)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6312, 9105, 91305, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 6312 (GOs: 142144)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6312, 9106, 91306, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 6312 (GOs: 142144)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6312, 9107, 91307, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 6313 (GOs: 142145)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6313, 9108, 91308, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 6313 (GOs: 142145)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6313, 9109, 91309, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 6313 (GOs: 142145)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6313, 9110, 91310, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 6313 (GOs: 142145)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (6313, 9111, 91311, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13945 (GOs: 176583)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13945, 9112, 91312, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13945 (GOs: 176583)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13945, 9113, 91313, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13945 (GOs: 176583)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13945, 9114, 91314, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13945 (GOs: 176583)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13945, 9115, 91315, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13946 (GOs: 176584)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13946, 9116, 91316, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13946 (GOs: 176584)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13946, 9117, 91317, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13946 (GOs: 176584)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13946, 9118, 91318, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13946 (GOs: 176584)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13946, 9119, 91319, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13947 (GOs: 176586)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13947, 9120, 91320, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13947 (GOs: 176586)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13947, 9121, 91321, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13947 (GOs: 176586)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13947, 9122, 91322, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13947 (GOs: 176586)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13947, 9123, 91323, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13948 (GOs: 176587)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13948, 9124, 91324, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13948 (GOs: 176587)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13948, 9125, 91325, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13948 (GOs: 176587)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13948, 9126, 91326, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13948 (GOs: 176587)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13948, 9127, 91327, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13949 (GOs: 176588)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13949, 9128, 91328, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13949 (GOs: 176588)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13949, 9129, 91329, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13949 (GOs: 176588)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13949, 9130, 91330, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13949 (GOs: 176588)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13949, 9131, 91331, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13950 (GOs: 176589)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13950, 9132, 91332, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13950 (GOs: 176589)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13950, 9133, 91333, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13950 (GOs: 176589)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13950, 9134, 91334, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13950 (GOs: 176589)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13950, 9135, 91335, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13965 (GOs: 176636)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13965, 9136, 91336, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13965 (GOs: 176636)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13965, 9137, 91337, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13965 (GOs: 176636)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13965, 9138, 91338, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13965 (GOs: 176636)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13965, 9139, 91339, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13966 (GOs: 176637)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13966, 9140, 91340, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13966 (GOs: 176637)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13966, 9141, 91341, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13966 (GOs: 176637)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13966, 9142, 91342, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13966 (GOs: 176637)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13966, 9143, 91343, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13967 (GOs: 176638)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13967, 9144, 91344, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13967 (GOs: 176638)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13967, 9145, 91345, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13967 (GOs: 176638)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13967, 9146, 91346, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13967 (GOs: 176638)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13967, 9147, 91347, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13968 (GOs: 176639)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13968, 9148, 91348, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13968 (GOs: 176639)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13968, 9149, 91349, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13968 (GOs: 176639)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13968, 9150, 91350, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13968 (GOs: 176639)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13968, 9151, 91351, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13969 (GOs: 176640)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13969, 9152, 91352, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13969 (GOs: 176640)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13969, 9153, 91353, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13969 (GOs: 176640)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13969, 9154, 91354, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13969 (GOs: 176640)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13969, 9155, 91355, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13970 (GOs: 176642)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13970, 9156, 91356, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13970 (GOs: 176642)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13970, 9157, 91357, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13970 (GOs: 176642)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13970, 9158, 91358, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13970 (GOs: 176642)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13970, 9159, 91359, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 13971 (GOs: 176641)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13971, 9160, 91360, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 13971 (GOs: 176641)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13971, 9161, 91361, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 13971 (GOs: 176641)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13971, 9162, 91362, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 13971 (GOs: 176641)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13971, 9163, 91363, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 17200 (GOs: 180165)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17200, 9164, 91364, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 17200 (GOs: 180165)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17200, 9165, 91365, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 17200 (GOs: 180165)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17200, 9166, 91366, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 17200 (GOs: 180165)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17200, 9167, 91367, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 17201 (GOs: 180164)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17201, 9168, 91368, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 17201 (GOs: 180164)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17201, 9169, 91369, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 17201 (GOs: 180164)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17201, 9170, 91370, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 17201 (GOs: 180164)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17201, 9171, 91371, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 17202 (GOs: 180167)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17202, 9172, 91372, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 17202 (GOs: 180167)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17202, 9173, 91373, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 17202 (GOs: 180167)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17202, 9174, 91374, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 17202 (GOs: 180167)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17202, 9175, 91375, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 17203 (GOs: 180168)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17203, 9176, 91376, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 17203 (GOs: 180168)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17203, 9177, 91377, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 17203 (GOs: 180168)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17203, 9178, 91378, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 17203 (GOs: 180168)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17203, 9179, 91379, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 17204 (GOs: 180166)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17204, 9180, 91380, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 17204 (GOs: 180166)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17204, 9181, 91381, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 17204 (GOs: 180166)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17204, 9182, 91382, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 17204 (GOs: 180166)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17204, 9183, 91383, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18009 (GOs: 181166)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18009, 9184, 91384, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18009 (GOs: 181166)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18009, 9185, 91385, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18009 (GOs: 181166)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18009, 9186, 91386, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18009 (GOs: 181166)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18009, 9187, 91387, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18111 (GOs: 181270)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18111, 9188, 91388, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18111 (GOs: 181270)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18111, 9189, 91389, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18111 (GOs: 181270)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18111, 9190, 91390, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18111 (GOs: 181270)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18111, 9191, 91391, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18112 (GOs: 181271)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18112, 9192, 91392, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18112 (GOs: 181271)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18112, 9193, 91393, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18112 (GOs: 181271)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18112, 9194, 91394, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18112 (GOs: 181271)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18112, 9195, 91395, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18113 (GOs: 181275)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18113, 9196, 91396, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18113 (GOs: 181275)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18113, 9197, 91397, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18113 (GOs: 181275)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18113, 9198, 91398, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18113 (GOs: 181275)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18113, 9199, 91399, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18114 (GOs: 181276)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18114, 9200, 91400, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18114 (GOs: 181276)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18114, 9201, 91401, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18114 (GOs: 181276)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18114, 9202, 91402, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18114 (GOs: 181276)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18114, 9203, 91403, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18115 (GOs: 181277)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18115, 9204, 91404, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18115 (GOs: 181277)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18115, 9205, 91405, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18115 (GOs: 181277)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18115, 9206, 91406, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18115 (GOs: 181277)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18115, 9207, 91407, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18116 (GOs: 181278)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18116, 9208, 91408, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18116 (GOs: 181278)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18116, 9209, 91409, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18116 (GOs: 181278)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18116, 9210, 91410, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18116 (GOs: 181278)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18116, 9211, 91411, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18117 (GOs: 181279)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18117, 9212, 91412, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18117 (GOs: 181279)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18117, 9213, 91413, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18117 (GOs: 181279)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18117, 9214, 91414, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18117 (GOs: 181279)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18117, 9215, 91415, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18118 (GOs: 181280)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18118, 9216, 91416, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18118 (GOs: 181280)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18118, 9217, 91417, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18118 (GOs: 181280)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18118, 9218, 91418, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18118 (GOs: 181280)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18118, 9219, 91419, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 18119 (GOs: 181281)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18119, 9220, 91420, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 18119 (GOs: 181281)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18119, 9221, 91421, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 18119 (GOs: 181281)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18119, 9222, 91422, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 18119 (GOs: 181281)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18119, 9223, 91423, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 19627 (GOs: 183043)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19627, 9224, 91424, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 19627 (GOs: 183043)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19627, 9225, 91425, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 19627 (GOs: 183043)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19627, 9226, 91426, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 19627 (GOs: 183043)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19627, 9227, 91427, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 19628 (GOs: 183044)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19628, 9228, 91428, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 19628 (GOs: 183044)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19628, 9229, 91429, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 19628 (GOs: 183044)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19628, 9230, 91430, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 19628 (GOs: 183044)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19628, 9231, 91431, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 19629 (GOs: 183045)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19629, 9232, 91432, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 19629 (GOs: 183045)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19629, 9233, 91433, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 19629 (GOs: 183045)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19629, 9234, 91434, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 19629 (GOs: 183045)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19629, 9235, 91435, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 19630 (GOs: 183046)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19630, 9236, 91436, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 19630 (GOs: 183046)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19630, 9237, 91437, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 19630 (GOs: 183046)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19630, 9238, 91438, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 19630 (GOs: 183046)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (19630, 9239, 91439, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 24093 (GOs: 189973)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24093, 9240, 91440, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 24093 (GOs: 189973)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24093, 9241, 91441, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 24093 (GOs: 189973)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24093, 9242, 91442, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 24093 (GOs: 189973)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24093, 9243, 91443, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 24224 (GOs: 190169)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24224, 9244, 91444, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 24224 (GOs: 190169)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24224, 9245, 91445, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 24224 (GOs: 190169)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24224, 9246, 91446, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 24224 (GOs: 190169)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24224, 9247, 91447, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 24226 (GOs: 190171)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24226, 9248, 91448, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 24226 (GOs: 190171)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24226, 9249, 91449, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 24226 (GOs: 190171)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24226, 9250, 91450, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 24226 (GOs: 190171)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24226, 9251, 91451, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 24227 (GOs: 190172)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24227, 9252, 91452, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 24227 (GOs: 190172)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24227, 9253, 91453, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 24227 (GOs: 190172)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24227, 9254, 91454, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 24227 (GOs: 190172)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24227, 9255, 91455, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 25093 (GOs: 191019)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25093, 9256, 91456, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 25093 (GOs: 191019)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25093, 9257, 91457, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 25093 (GOs: 191019)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25093, 9258, 91458, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 25093 (GOs: 191019)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25093, 9259, 91459, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 25094 (GOs: 190173)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25094, 9260, 91460, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 25094 (GOs: 190173)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25094, 9261, 91461, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 25094 (GOs: 190173)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25094, 9262, 91462, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 25094 (GOs: 190173)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25094, 9263, 91463, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 25095 (GOs: 190175)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25095, 9264, 91464, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 25095 (GOs: 190175)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25095, 9265, 91465, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 25095 (GOs: 190175)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25095, 9266, 91466, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 25095 (GOs: 190175)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25095, 9267, 91467, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Journeyman bonus for loot table 25096 (GOs: 190174)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25096, 9268, 91468, 10, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
-- Artisan bonus for loot table 25096 (GOs: 190174)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25096, 9269, 91469, 20, 0, 1, 1, 'Artisan Pruning Shears Bonus');
-- Master bonus for loot table 25096 (GOs: 190174)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25096, 9270, 91470, 30, 0, 1, 1, 'Master Pruning Shears Bonus');
-- Grand Master bonus for loot table 25096 (GOs: 190174)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (25096, 9271, 91471, 40, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- =====================================================
-- CONDITIONS (Check for active Pruning Shears auras)
-- =====================================================
-- IMPORTANT: Uses mutually exclusive conditions to prevent bonus stacking
-- Each tier bonus ONLY triggers if that specific tier is active
-- AND no higher tier is active (prevents multiple bonuses)
-- =====================================================

-- Silverleaf - Journeyman Pruning Shears conditions (Ref 91200)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91200, 765, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91200, 765, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91200, 765, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91200, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');

-- Silverleaf - Artisan Pruning Shears conditions (Ref 91201)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91201, 765, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91201, 765, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91201, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');

-- Silverleaf - Master Pruning Shears conditions (Ref 91202)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91202, 765, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91202, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');

-- Silverleaf - Grand Master Pruning Shears conditions (Ref 91203)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91203, 765, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Silverleaf');


-- Peacebloom - Journeyman Pruning Shears conditions (Ref 91204)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91204, 2447, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91204, 2447, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91204, 2447, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91204, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');

-- Peacebloom - Artisan Pruning Shears conditions (Ref 91205)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91205, 2447, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91205, 2447, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91205, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');

-- Peacebloom - Master Pruning Shears conditions (Ref 91206)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91206, 2447, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91206, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');

-- Peacebloom - Grand Master Pruning Shears conditions (Ref 91207)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91207, 2447, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Peacebloom');


-- Earthroot - Journeyman Pruning Shears conditions (Ref 91208)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91208, 2449, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91208, 2449, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91208, 2449, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91208, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');

-- Earthroot - Artisan Pruning Shears conditions (Ref 91209)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91209, 2449, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91209, 2449, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91209, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');

-- Earthroot - Master Pruning Shears conditions (Ref 91210)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91210, 2449, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91210, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');

-- Earthroot - Grand Master Pruning Shears conditions (Ref 91211)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91211, 2449, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Earthroot');


-- Mageroyal - Journeyman Pruning Shears conditions (Ref 91212)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91212, 785, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91212, 785, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91212, 785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91212, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91212, 2452, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91212, 2452, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91212, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91212, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');

-- Mageroyal - Artisan Pruning Shears conditions (Ref 91213)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91213, 785, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91213, 785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91213, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91213, 2452, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91213, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91213, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');

-- Mageroyal - Master Pruning Shears conditions (Ref 91214)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91214, 785, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91214, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91214, 2452, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91214, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');

-- Mageroyal - Grand Master Pruning Shears conditions (Ref 91215)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91215, 785, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91215, 2452, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mageroyal');


-- Briarthorn - Journeyman Pruning Shears conditions (Ref 91216)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91216, 2450, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91216, 2450, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91216, 2450, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91216, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91216, 2452, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91216, 2452, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91216, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91216, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');

-- Briarthorn - Artisan Pruning Shears conditions (Ref 91217)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91217, 2450, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91217, 2450, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91217, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91217, 2452, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91217, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91217, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');

-- Briarthorn - Master Pruning Shears conditions (Ref 91218)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91218, 2450, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91218, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91218, 2452, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91218, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');

-- Briarthorn - Grand Master Pruning Shears conditions (Ref 91219)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91219, 2450, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91219, 2452, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Briarthorn');


-- Bruiseweed - Journeyman Pruning Shears conditions (Ref 91220)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91220, 2453, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91220, 2453, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91220, 2453, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91220, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');

-- Bruiseweed - Artisan Pruning Shears conditions (Ref 91221)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91221, 2453, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91221, 2453, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91221, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');

-- Bruiseweed - Master Pruning Shears conditions (Ref 91222)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91222, 2453, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91222, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');

-- Bruiseweed - Grand Master Pruning Shears conditions (Ref 91223)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91223, 2453, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bruiseweed');


-- Wild Steelbloom - Journeyman Pruning Shears conditions (Ref 91224)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91224, 3355, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91224, 3355, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91224, 3355, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91224, 3355, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Artisan Pruning Shears conditions (Ref 91225)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91225, 3355, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91225, 3355, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91225, 3355, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Master Pruning Shears conditions (Ref 91226)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91226, 3355, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Wild Steelbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91226, 3355, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Wild Steelbloom');

-- Wild Steelbloom - Grand Master Pruning Shears conditions (Ref 91227)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91227, 3355, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Wild Steelbloom');


-- Kingsblood - Journeyman Pruning Shears conditions (Ref 91228)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91228, 3356, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91228, 3356, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91228, 3356, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91228, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Kingsblood');

-- Kingsblood - Artisan Pruning Shears conditions (Ref 91229)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91229, 3356, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91229, 3356, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91229, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Kingsblood');

-- Kingsblood - Master Pruning Shears conditions (Ref 91230)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91230, 3356, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Kingsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91230, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Kingsblood');

-- Kingsblood - Grand Master Pruning Shears conditions (Ref 91231)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91231, 3356, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Kingsblood');


-- Khadgar's Whisker - Journeyman Pruning Shears conditions (Ref 91232)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91232, 3358, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91232, 3358, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91232, 3358, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91232, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Artisan Pruning Shears conditions (Ref 91233)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91233, 3358, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91233, 3358, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91233, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Master Pruning Shears conditions (Ref 91234)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91234, 3358, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Khadgar''s Whisker');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91234, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Khadgar''s Whisker');

-- Khadgar's Whisker - Grand Master Pruning Shears conditions (Ref 91235)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91235, 3358, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Khadgar''s Whisker');


-- Grave Moss - Journeyman Pruning Shears conditions (Ref 91236)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91236, 3369, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91236, 3369, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91236, 3369, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91236, 3369, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Grave Moss');

-- Grave Moss - Artisan Pruning Shears conditions (Ref 91237)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91237, 3369, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91237, 3369, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91237, 3369, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Grave Moss');

-- Grave Moss - Master Pruning Shears conditions (Ref 91238)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91238, 3369, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Grave Moss');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91238, 3369, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Grave Moss');

-- Grave Moss - Grand Master Pruning Shears conditions (Ref 91239)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91239, 3369, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Grave Moss');


-- Liferoot - Journeyman Pruning Shears conditions (Ref 91240)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91240, 3357, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91240, 3357, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91240, 3357, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91240, 3357, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Liferoot');

-- Liferoot - Artisan Pruning Shears conditions (Ref 91241)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91241, 3357, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91241, 3357, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91241, 3357, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Liferoot');

-- Liferoot - Master Pruning Shears conditions (Ref 91242)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91242, 3357, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Liferoot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91242, 3357, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Liferoot');

-- Liferoot - Grand Master Pruning Shears conditions (Ref 91243)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91243, 3357, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Liferoot');


-- Fadeleaf - Journeyman Pruning Shears conditions (Ref 91244)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91244, 3818, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91244, 3818, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91244, 3818, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91244, 3818, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Fadeleaf');

-- Fadeleaf - Artisan Pruning Shears conditions (Ref 91245)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91245, 3818, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91245, 3818, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91245, 3818, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Fadeleaf');

-- Fadeleaf - Master Pruning Shears conditions (Ref 91246)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91246, 3818, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Fadeleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91246, 3818, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Fadeleaf');

-- Fadeleaf - Grand Master Pruning Shears conditions (Ref 91247)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91247, 3818, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Fadeleaf');


-- Wintersbite - Journeyman Pruning Shears conditions (Ref 91248)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91248, 3819, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91248, 3819, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91248, 3819, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91248, 3819, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Wintersbite');

-- Wintersbite - Artisan Pruning Shears conditions (Ref 91249)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91249, 3819, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91249, 3819, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91249, 3819, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Wintersbite');

-- Wintersbite - Master Pruning Shears conditions (Ref 91250)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91250, 3819, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Wintersbite');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91250, 3819, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Wintersbite');

-- Wintersbite - Grand Master Pruning Shears conditions (Ref 91251)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91251, 3819, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Wintersbite');


-- Stranglekelp - Journeyman Pruning Shears conditions (Ref 91252)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91252, 3820, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91252, 3820, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91252, 3820, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91252, 3820, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Stranglekelp');

-- Stranglekelp - Artisan Pruning Shears conditions (Ref 91253)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91253, 3820, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91253, 3820, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91253, 3820, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Stranglekelp');

-- Stranglekelp - Master Pruning Shears conditions (Ref 91254)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91254, 3820, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Stranglekelp');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91254, 3820, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Stranglekelp');

-- Stranglekelp - Grand Master Pruning Shears conditions (Ref 91255)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91255, 3820, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Stranglekelp');


-- Goldthorn - Journeyman Pruning Shears conditions (Ref 91256)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91256, 3821, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91256, 3821, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91256, 3821, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91256, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldthorn');

-- Goldthorn - Artisan Pruning Shears conditions (Ref 91257)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91257, 3821, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91257, 3821, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91257, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Goldthorn');

-- Goldthorn - Master Pruning Shears conditions (Ref 91258)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91258, 3821, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Goldthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91258, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Goldthorn');

-- Goldthorn - Grand Master Pruning Shears conditions (Ref 91259)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91259, 3821, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Goldthorn');


-- Firebloom - Journeyman Pruning Shears conditions (Ref 91260)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91260, 4625, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91260, 4625, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91260, 4625, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91260, 4625, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Firebloom');

-- Firebloom - Artisan Pruning Shears conditions (Ref 91261)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91261, 4625, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91261, 4625, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91261, 4625, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Firebloom');

-- Firebloom - Master Pruning Shears conditions (Ref 91262)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91262, 4625, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Firebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91262, 4625, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Firebloom');

-- Firebloom - Grand Master Pruning Shears conditions (Ref 91263)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91263, 4625, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Firebloom');


-- Silverleaf - Journeyman Pruning Shears conditions (Ref 91264)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91264, 765, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91264, 765, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91264, 765, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91264, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91264, 5056, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91264, 5056, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91264, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91264, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Silverleaf');

-- Silverleaf - Artisan Pruning Shears conditions (Ref 91265)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91265, 765, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91265, 765, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91265, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91265, 5056, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91265, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91265, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Silverleaf');

-- Silverleaf - Master Pruning Shears conditions (Ref 91266)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91266, 765, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91266, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91266, 5056, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91266, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Silverleaf');

-- Silverleaf - Grand Master Pruning Shears conditions (Ref 91267)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91267, 765, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Silverleaf');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91267, 5056, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Silverleaf');


-- Peacebloom - Journeyman Pruning Shears conditions (Ref 91268)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91268, 2447, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91268, 2447, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91268, 2447, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91268, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91268, 5056, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91268, 5056, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91268, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91268, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Peacebloom');

-- Peacebloom - Artisan Pruning Shears conditions (Ref 91269)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91269, 2447, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91269, 2447, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91269, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91269, 5056, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91269, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91269, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Peacebloom');

-- Peacebloom - Master Pruning Shears conditions (Ref 91270)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91270, 2447, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91270, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91270, 5056, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91270, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Peacebloom');

-- Peacebloom - Grand Master Pruning Shears conditions (Ref 91271)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91271, 2447, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Peacebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91271, 5056, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Peacebloom');


-- Earthroot - Journeyman Pruning Shears conditions (Ref 91272)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91272, 2449, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91272, 2449, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91272, 2449, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91272, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91272, 5056, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91272, 5056, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91272, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91272, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Earthroot');

-- Earthroot - Artisan Pruning Shears conditions (Ref 91273)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91273, 2449, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91273, 2449, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91273, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91273, 5056, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91273, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91273, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Earthroot');

-- Earthroot - Master Pruning Shears conditions (Ref 91274)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91274, 2449, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91274, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91274, 5056, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91274, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Earthroot');

-- Earthroot - Grand Master Pruning Shears conditions (Ref 91275)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91275, 2449, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Earthroot');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91275, 5056, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Earthroot');


-- Mageroyal - Journeyman Pruning Shears conditions (Ref 91276)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 785, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 785, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 2452, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 2452, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 5056, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 5056, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91276, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mageroyal');

-- Mageroyal - Artisan Pruning Shears conditions (Ref 91277)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 785, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 2452, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 5056, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91277, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mageroyal');

-- Mageroyal - Master Pruning Shears conditions (Ref 91278)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91278, 785, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91278, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91278, 2452, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91278, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91278, 5056, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91278, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mageroyal');

-- Mageroyal - Grand Master Pruning Shears conditions (Ref 91279)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91279, 785, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91279, 2452, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mageroyal');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91279, 5056, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mageroyal');


-- Briarthorn - Journeyman Pruning Shears conditions (Ref 91280)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 2450, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 2450, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 2450, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 2452, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 2452, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 5056, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 5056, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91280, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Briarthorn');

-- Briarthorn - Artisan Pruning Shears conditions (Ref 91281)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 2450, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 2450, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 2452, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 5056, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91281, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Briarthorn');

-- Briarthorn - Master Pruning Shears conditions (Ref 91282)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91282, 2450, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91282, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91282, 2452, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91282, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91282, 5056, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91282, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Briarthorn');

-- Briarthorn - Grand Master Pruning Shears conditions (Ref 91283)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91283, 2450, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91283, 2452, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Briarthorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91283, 5056, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Briarthorn');


-- Bruiseweed - Journeyman Pruning Shears conditions (Ref 91284)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91284, 2453, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91284, 2453, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91284, 2453, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91284, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91284, 5056, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91284, 5056, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91284, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91284, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bruiseweed');

-- Bruiseweed - Artisan Pruning Shears conditions (Ref 91285)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91285, 2453, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91285, 2453, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91285, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91285, 5056, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91285, 5056, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91285, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bruiseweed');

-- Bruiseweed - Master Pruning Shears conditions (Ref 91286)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91286, 2453, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91286, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91286, 5056, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91286, 5056, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bruiseweed');

-- Bruiseweed - Grand Master Pruning Shears conditions (Ref 91287)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91287, 2453, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bruiseweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91287, 5056, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bruiseweed');


-- Purple Lotus - Journeyman Pruning Shears conditions (Ref 91288)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91288, 8153, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91288, 8153, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91288, 8153, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91288, 8153, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91288, 8831, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91288, 8831, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91288, 8831, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91288, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');

-- Purple Lotus - Artisan Pruning Shears conditions (Ref 91289)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91289, 8153, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91289, 8153, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91289, 8153, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91289, 8831, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91289, 8831, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91289, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');

-- Purple Lotus - Master Pruning Shears conditions (Ref 91290)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91290, 8153, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91290, 8153, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91290, 8831, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91290, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');

-- Purple Lotus - Grand Master Pruning Shears conditions (Ref 91291)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91291, 8153, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91291, 8831, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Purple Lotus');


-- Arthas' Tears - Journeyman Pruning Shears conditions (Ref 91292)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91292, 8836, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91292, 8836, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91292, 8836, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91292, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Artisan Pruning Shears conditions (Ref 91293)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91293, 8836, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91293, 8836, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91293, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Master Pruning Shears conditions (Ref 91294)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91294, 8836, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91294, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Grand Master Pruning Shears conditions (Ref 91295)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91295, 8836, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Arthas'' Tears');


-- Sungrass - Journeyman Pruning Shears conditions (Ref 91296)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91296, 8838, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91296, 8838, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91296, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91296, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');

-- Sungrass - Artisan Pruning Shears conditions (Ref 91297)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91297, 8838, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91297, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91297, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');

-- Sungrass - Master Pruning Shears conditions (Ref 91298)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91298, 8838, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91298, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');

-- Sungrass - Grand Master Pruning Shears conditions (Ref 91299)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91299, 8838, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Sungrass');


-- Blindweed - Journeyman Pruning Shears conditions (Ref 91300)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91300, 8839, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91300, 8839, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91300, 8839, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91300, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');

-- Blindweed - Artisan Pruning Shears conditions (Ref 91301)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91301, 8839, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91301, 8839, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91301, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');

-- Blindweed - Master Pruning Shears conditions (Ref 91302)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91302, 8839, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91302, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');

-- Blindweed - Grand Master Pruning Shears conditions (Ref 91303)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91303, 8839, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blindweed');


-- Ghost Mushroom - Journeyman Pruning Shears conditions (Ref 91304)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91304, 8845, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91304, 8845, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91304, 8845, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91304, 8845, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Artisan Pruning Shears conditions (Ref 91305)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91305, 8845, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91305, 8845, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91305, 8845, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Master Pruning Shears conditions (Ref 91306)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91306, 8845, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ghost Mushroom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91306, 8845, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ghost Mushroom');

-- Ghost Mushroom - Grand Master Pruning Shears conditions (Ref 91307)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91307, 8845, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ghost Mushroom');


-- Gromsblood - Journeyman Pruning Shears conditions (Ref 91308)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91308, 8846, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91308, 8846, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91308, 8846, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91308, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');

-- Gromsblood - Artisan Pruning Shears conditions (Ref 91309)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91309, 8846, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91309, 8846, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91309, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');

-- Gromsblood - Master Pruning Shears conditions (Ref 91310)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91310, 8846, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91310, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');

-- Gromsblood - Grand Master Pruning Shears conditions (Ref 91311)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91311, 8846, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Gromsblood');


-- Golden Sansam - Journeyman Pruning Shears conditions (Ref 91312)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91312, 13464, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91312, 13464, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91312, 13464, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91312, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');

-- Golden Sansam - Artisan Pruning Shears conditions (Ref 91313)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91313, 13464, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91313, 13464, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91313, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');

-- Golden Sansam - Master Pruning Shears conditions (Ref 91314)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91314, 13464, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91314, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');

-- Golden Sansam - Grand Master Pruning Shears conditions (Ref 91315)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91315, 13464, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Golden Sansam');


-- Dreamfoil - Journeyman Pruning Shears conditions (Ref 91316)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91316, 13463, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91316, 13463, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91316, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91316, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');

-- Dreamfoil - Artisan Pruning Shears conditions (Ref 91317)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91317, 13463, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91317, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91317, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');

-- Dreamfoil - Master Pruning Shears conditions (Ref 91318)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91318, 13463, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91318, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');

-- Dreamfoil - Grand Master Pruning Shears conditions (Ref 91319)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91319, 13463, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreamfoil');


-- Mountain Silversage - Journeyman Pruning Shears conditions (Ref 91320)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91320, 13465, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91320, 13465, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91320, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91320, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Artisan Pruning Shears conditions (Ref 91321)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91321, 13465, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91321, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91321, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Master Pruning Shears conditions (Ref 91322)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91322, 13465, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91322, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Grand Master Pruning Shears conditions (Ref 91323)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91323, 13465, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mountain Silversage');


-- Plaguebloom - Journeyman Pruning Shears conditions (Ref 91324)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91324, 13466, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91324, 13466, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91324, 13466, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91324, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');

-- Plaguebloom - Artisan Pruning Shears conditions (Ref 91325)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91325, 13466, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91325, 13466, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91325, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');

-- Plaguebloom - Master Pruning Shears conditions (Ref 91326)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91326, 13466, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91326, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');

-- Plaguebloom - Grand Master Pruning Shears conditions (Ref 91327)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91327, 13466, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Plaguebloom');


-- Icecap - Journeyman Pruning Shears conditions (Ref 91328)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91328, 13467, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91328, 13467, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91328, 13467, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91328, 13467, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Icecap');

-- Icecap - Artisan Pruning Shears conditions (Ref 91329)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91329, 13467, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91329, 13467, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91329, 13467, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Icecap');

-- Icecap - Master Pruning Shears conditions (Ref 91330)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91330, 13467, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Icecap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91330, 13467, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Icecap');

-- Icecap - Grand Master Pruning Shears conditions (Ref 91331)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91331, 13467, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Icecap');


-- Black Lotus - Journeyman Pruning Shears conditions (Ref 91332)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91332, 13468, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Black Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91332, 13468, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Black Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91332, 13468, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Black Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91332, 13468, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Black Lotus');

-- Black Lotus - Artisan Pruning Shears conditions (Ref 91333)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91333, 13468, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Black Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91333, 13468, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Black Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91333, 13468, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Black Lotus');

-- Black Lotus - Master Pruning Shears conditions (Ref 91334)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91334, 13468, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Black Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91334, 13468, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Black Lotus');

-- Black Lotus - Grand Master Pruning Shears conditions (Ref 91335)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91335, 13468, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Black Lotus');


-- Sungrass - Journeyman Pruning Shears conditions (Ref 91336)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91336, 8838, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91336, 8838, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91336, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91336, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91336, 11514, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91336, 11514, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91336, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91336, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');

-- Sungrass - Artisan Pruning Shears conditions (Ref 91337)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91337, 8838, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91337, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91337, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91337, 11514, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91337, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91337, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');

-- Sungrass - Master Pruning Shears conditions (Ref 91338)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91338, 8838, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91338, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91338, 11514, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91338, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');

-- Sungrass - Grand Master Pruning Shears conditions (Ref 91339)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91339, 8838, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91339, 11514, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Sungrass');


-- Gromsblood - Journeyman Pruning Shears conditions (Ref 91340)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91340, 8846, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91340, 8846, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91340, 8846, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91340, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91340, 11514, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91340, 11514, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91340, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91340, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Gromsblood');

-- Gromsblood - Artisan Pruning Shears conditions (Ref 91341)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91341, 8846, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91341, 8846, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91341, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91341, 11514, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91341, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91341, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Gromsblood');

-- Gromsblood - Master Pruning Shears conditions (Ref 91342)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91342, 8846, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91342, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91342, 11514, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91342, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Gromsblood');

-- Gromsblood - Grand Master Pruning Shears conditions (Ref 91343)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91343, 8846, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Gromsblood');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91343, 11514, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Gromsblood');


-- Golden Sansam - Journeyman Pruning Shears conditions (Ref 91344)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91344, 11514, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91344, 11514, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91344, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91344, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91344, 13464, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91344, 13464, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91344, 13464, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91344, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');

-- Golden Sansam - Artisan Pruning Shears conditions (Ref 91345)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91345, 11514, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91345, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91345, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91345, 13464, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91345, 13464, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91345, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');

-- Golden Sansam - Master Pruning Shears conditions (Ref 91346)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91346, 11514, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91346, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91346, 13464, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91346, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');

-- Golden Sansam - Grand Master Pruning Shears conditions (Ref 91347)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91347, 11514, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91347, 13464, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Golden Sansam');


-- Dreamfoil - Journeyman Pruning Shears conditions (Ref 91348)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91348, 11514, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91348, 11514, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91348, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91348, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91348, 13463, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91348, 13463, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91348, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91348, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');

-- Dreamfoil - Artisan Pruning Shears conditions (Ref 91349)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91349, 11514, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91349, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91349, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91349, 13463, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91349, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91349, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');

-- Dreamfoil - Master Pruning Shears conditions (Ref 91350)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91350, 11514, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91350, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91350, 13463, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91350, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');

-- Dreamfoil - Grand Master Pruning Shears conditions (Ref 91351)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91351, 11514, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91351, 13463, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreamfoil');


-- Mountain Silversage - Journeyman Pruning Shears conditions (Ref 91352)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91352, 11514, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91352, 11514, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91352, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91352, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91352, 13465, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91352, 13465, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91352, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91352, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Artisan Pruning Shears conditions (Ref 91353)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91353, 11514, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91353, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91353, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91353, 13465, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91353, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91353, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Master Pruning Shears conditions (Ref 91354)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91354, 11514, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91354, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91354, 13465, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91354, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Grand Master Pruning Shears conditions (Ref 91355)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91355, 11514, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91355, 13465, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mountain Silversage');


-- Arthas' Tears - Journeyman Pruning Shears conditions (Ref 91356)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91356, 8836, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91356, 8836, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91356, 8836, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91356, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91356, 11514, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91356, 11514, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91356, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91356, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Artisan Pruning Shears conditions (Ref 91357)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91357, 8836, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91357, 8836, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91357, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91357, 11514, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91357, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91357, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Master Pruning Shears conditions (Ref 91358)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91358, 8836, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91358, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91358, 11514, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91358, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Arthas'' Tears');

-- Arthas' Tears - Grand Master Pruning Shears conditions (Ref 91359)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91359, 8836, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Arthas'' Tears');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91359, 11514, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Arthas'' Tears');


-- Plaguebloom - Journeyman Pruning Shears conditions (Ref 91360)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91360, 11514, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91360, 11514, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91360, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91360, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91360, 13466, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91360, 13466, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91360, 13466, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91360, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Plaguebloom');

-- Plaguebloom - Artisan Pruning Shears conditions (Ref 91361)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91361, 11514, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91361, 11514, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91361, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91361, 13466, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91361, 13466, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91361, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Plaguebloom');

-- Plaguebloom - Master Pruning Shears conditions (Ref 91362)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91362, 11514, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91362, 11514, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91362, 13466, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91362, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Plaguebloom');

-- Plaguebloom - Grand Master Pruning Shears conditions (Ref 91363)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91363, 11514, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Plaguebloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91363, 13466, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Plaguebloom');


-- Purple Lotus - Journeyman Pruning Shears conditions (Ref 91364)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 8153, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 8153, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 8153, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 8153, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 8831, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 8831, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 8831, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 19726, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 19726, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91364, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Purple Lotus');

-- Purple Lotus - Artisan Pruning Shears conditions (Ref 91365)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 8153, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 8153, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 8153, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 8831, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 8831, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 19726, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91365, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Purple Lotus');

-- Purple Lotus - Master Pruning Shears conditions (Ref 91366)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91366, 8153, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91366, 8153, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91366, 8831, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91366, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91366, 19726, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91366, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Purple Lotus');

-- Purple Lotus - Grand Master Pruning Shears conditions (Ref 91367)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91367, 8153, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91367, 8831, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Purple Lotus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91367, 19726, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Purple Lotus');


-- Sungrass - Journeyman Pruning Shears conditions (Ref 91368)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91368, 8838, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91368, 8838, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91368, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91368, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91368, 19726, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91368, 19726, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91368, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91368, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Sungrass');

-- Sungrass - Artisan Pruning Shears conditions (Ref 91369)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91369, 8838, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91369, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91369, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91369, 19726, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91369, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91369, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Sungrass');

-- Sungrass - Master Pruning Shears conditions (Ref 91370)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91370, 8838, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91370, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91370, 19726, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91370, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Sungrass');

-- Sungrass - Grand Master Pruning Shears conditions (Ref 91371)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91371, 8838, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Sungrass');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91371, 19726, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Sungrass');


-- Golden Sansam - Journeyman Pruning Shears conditions (Ref 91372)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91372, 13464, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91372, 13464, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91372, 13464, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91372, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91372, 19726, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91372, 19726, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91372, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91372, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Golden Sansam');

-- Golden Sansam - Artisan Pruning Shears conditions (Ref 91373)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91373, 13464, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91373, 13464, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91373, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91373, 19726, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91373, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91373, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Golden Sansam');

-- Golden Sansam - Master Pruning Shears conditions (Ref 91374)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91374, 13464, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91374, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91374, 19726, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91374, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Golden Sansam');

-- Golden Sansam - Grand Master Pruning Shears conditions (Ref 91375)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91375, 13464, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Golden Sansam');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91375, 19726, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Golden Sansam');


-- Dreamfoil - Journeyman Pruning Shears conditions (Ref 91376)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91376, 13463, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91376, 13463, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91376, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91376, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91376, 19726, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91376, 19726, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91376, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91376, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreamfoil');

-- Dreamfoil - Artisan Pruning Shears conditions (Ref 91377)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91377, 13463, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91377, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91377, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91377, 19726, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91377, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91377, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreamfoil');

-- Dreamfoil - Master Pruning Shears conditions (Ref 91378)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91378, 13463, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91378, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91378, 19726, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91378, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreamfoil');

-- Dreamfoil - Grand Master Pruning Shears conditions (Ref 91379)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91379, 13463, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreamfoil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91379, 19726, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreamfoil');


-- Mountain Silversage - Journeyman Pruning Shears conditions (Ref 91380)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91380, 13465, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91380, 13465, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91380, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91380, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91380, 19726, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91380, 19726, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91380, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91380, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Artisan Pruning Shears conditions (Ref 91381)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91381, 13465, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91381, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91381, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91381, 19726, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91381, 19726, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91381, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Master Pruning Shears conditions (Ref 91382)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91382, 13465, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91382, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91382, 19726, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91382, 19726, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mountain Silversage');

-- Mountain Silversage - Grand Master Pruning Shears conditions (Ref 91383)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91383, 13465, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mountain Silversage');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91383, 19726, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mountain Silversage');


-- Bloodthistle - Journeyman Pruning Shears conditions (Ref 91384)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91384, 22710, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91384, 22710, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91384, 22710, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91384, 22710, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodthistle');

-- Bloodthistle - Artisan Pruning Shears conditions (Ref 91385)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91385, 22710, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91385, 22710, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91385, 22710, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodthistle');

-- Bloodthistle - Master Pruning Shears conditions (Ref 91386)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91386, 22710, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodthistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91386, 22710, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodthistle');

-- Bloodthistle - Grand Master Pruning Shears conditions (Ref 91387)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91387, 22710, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodthistle');


-- Felweed - Journeyman Pruning Shears conditions (Ref 91388)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22785, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22785, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22795, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22795, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22795, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91388, 22795, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');

-- Felweed - Artisan Pruning Shears conditions (Ref 91389)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22785, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22795, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22795, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91389, 22795, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');

-- Felweed - Master Pruning Shears conditions (Ref 91390)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91390, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91390, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91390, 22785, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91390, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91390, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91390, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91390, 22795, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91390, 22795, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Felweed');

-- Felweed - Grand Master Pruning Shears conditions (Ref 91391)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91391, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91391, 22785, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91391, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91391, 22795, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Felweed');


-- Dreaming Glory - Journeyman Pruning Shears conditions (Ref 91392)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22786, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22786, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22786, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91392, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Artisan Pruning Shears conditions (Ref 91393)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22786, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22786, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91393, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Master Pruning Shears conditions (Ref 91394)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91394, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91394, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91394, 22786, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91394, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91394, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91394, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Grand Master Pruning Shears conditions (Ref 91395)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91395, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91395, 22786, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91395, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreaming Glory');


-- Ragveil - Journeyman Pruning Shears conditions (Ref 91396)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22787, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22787, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22787, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91396, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');

-- Ragveil - Artisan Pruning Shears conditions (Ref 91397)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22787, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22787, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91397, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');

-- Ragveil - Master Pruning Shears conditions (Ref 91398)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91398, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91398, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91398, 22787, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91398, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91398, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91398, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');

-- Ragveil - Grand Master Pruning Shears conditions (Ref 91399)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91399, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91399, 22787, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91399, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ragveil');


-- Flame Cap - Journeyman Pruning Shears conditions (Ref 91400)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 22788, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 22788, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 22788, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 22788, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 35229, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 35229, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91400, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Flame Cap');

-- Flame Cap - Artisan Pruning Shears conditions (Ref 91401)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 22788, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 22788, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 22788, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 35229, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91401, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Flame Cap');

-- Flame Cap - Master Pruning Shears conditions (Ref 91402)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91402, 22788, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91402, 22788, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91402, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91402, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91402, 35229, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91402, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Flame Cap');

-- Flame Cap - Grand Master Pruning Shears conditions (Ref 91403)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91403, 22788, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91403, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Flame Cap');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91403, 35229, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Flame Cap');


-- Terocone - Journeyman Pruning Shears conditions (Ref 91404)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22789, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22789, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22789, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 35229, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 35229, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91404, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Terocone');

-- Terocone - Artisan Pruning Shears conditions (Ref 91405)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22789, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22789, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 35229, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91405, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Terocone');

-- Terocone - Master Pruning Shears conditions (Ref 91406)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91406, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91406, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91406, 22789, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91406, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91406, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91406, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91406, 35229, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91406, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Terocone');

-- Terocone - Grand Master Pruning Shears conditions (Ref 91407)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91407, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91407, 22789, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91407, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Terocone');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91407, 35229, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Terocone');


-- Ancient Lichen - Journeyman Pruning Shears conditions (Ref 91408)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 22790, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 22790, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 22790, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 35229, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 35229, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91408, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Artisan Pruning Shears conditions (Ref 91409)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 22790, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 22790, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 35229, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91409, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Master Pruning Shears conditions (Ref 91410)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91410, 22790, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91410, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91410, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91410, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91410, 35229, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91410, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ancient Lichen');

-- Ancient Lichen - Grand Master Pruning Shears conditions (Ref 91411)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91411, 22790, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91411, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ancient Lichen');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91411, 35229, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ancient Lichen');


-- Netherbloom - Journeyman Pruning Shears conditions (Ref 91412)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22576, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22576, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22576, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22576, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22791, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22791, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22791, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22791, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 35229, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 35229, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91412, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Netherbloom');

-- Netherbloom - Artisan Pruning Shears conditions (Ref 91413)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22576, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22576, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22576, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22791, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22791, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22791, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 35229, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91413, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Netherbloom');

-- Netherbloom - Master Pruning Shears conditions (Ref 91414)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91414, 22576, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91414, 22576, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91414, 22791, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91414, 22791, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91414, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91414, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91414, 35229, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91414, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Netherbloom');

-- Netherbloom - Grand Master Pruning Shears conditions (Ref 91415)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91415, 22576, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91415, 22791, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91415, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Netherbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91415, 35229, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Netherbloom');


-- Nightmare Vine - Journeyman Pruning Shears conditions (Ref 91416)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22792, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22792, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22792, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22792, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22797, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22797, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22797, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 22797, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 35229, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 35229, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91416, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Artisan Pruning Shears conditions (Ref 91417)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22792, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22792, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22792, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22797, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22797, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 22797, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 35229, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91417, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Master Pruning Shears conditions (Ref 91418)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 22792, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 22792, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 22797, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 22797, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 35229, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91418, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Nightmare Vine');

-- Nightmare Vine - Grand Master Pruning Shears conditions (Ref 91419)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91419, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91419, 22792, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91419, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91419, 22797, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Nightmare Vine');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91419, 35229, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Nightmare Vine');


-- Mana Thistle - Journeyman Pruning Shears conditions (Ref 91420)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22793, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22793, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22793, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22793, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 35229, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 35229, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91420, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Mana Thistle');

-- Mana Thistle - Artisan Pruning Shears conditions (Ref 91421)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22793, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22793, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22793, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 35229, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 35229, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91421, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Mana Thistle');

-- Mana Thistle - Master Pruning Shears conditions (Ref 91422)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91422, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91422, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91422, 22793, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91422, 22793, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91422, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91422, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91422, 35229, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91422, 35229, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Mana Thistle');

-- Mana Thistle - Grand Master Pruning Shears conditions (Ref 91423)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91423, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91423, 22793, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91423, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mana Thistle');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91423, 35229, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Mana Thistle');


-- Ragveil - Journeyman Pruning Shears conditions (Ref 91424)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22787, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22787, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22787, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 24401, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 24401, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91424, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Ragveil');

-- Ragveil - Artisan Pruning Shears conditions (Ref 91425)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22787, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22787, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 24401, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91425, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Ragveil');

-- Ragveil - Master Pruning Shears conditions (Ref 91426)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91426, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91426, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91426, 22787, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91426, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91426, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91426, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91426, 24401, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91426, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Ragveil');

-- Ragveil - Grand Master Pruning Shears conditions (Ref 91427)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91427, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91427, 22787, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91427, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ragveil');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91427, 24401, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Ragveil');


-- Felweed - Journeyman Pruning Shears conditions (Ref 91428)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22785, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22785, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 24401, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 24401, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91428, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Felweed');

-- Felweed - Artisan Pruning Shears conditions (Ref 91429)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22785, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 24401, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91429, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Felweed');

-- Felweed - Master Pruning Shears conditions (Ref 91430)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91430, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91430, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91430, 22785, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91430, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91430, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91430, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91430, 24401, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91430, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Felweed');

-- Felweed - Grand Master Pruning Shears conditions (Ref 91431)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91431, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91431, 22785, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91431, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Felweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91431, 24401, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Felweed');


-- Dreaming Glory - Journeyman Pruning Shears conditions (Ref 91432)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22786, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22786, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22786, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 24401, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 24401, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91432, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Artisan Pruning Shears conditions (Ref 91433)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22786, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22786, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 24401, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91433, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Master Pruning Shears conditions (Ref 91434)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91434, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91434, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91434, 22786, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91434, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91434, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91434, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91434, 24401, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91434, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Dreaming Glory');

-- Dreaming Glory - Grand Master Pruning Shears conditions (Ref 91435)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91435, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91435, 22786, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91435, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreaming Glory');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91435, 24401, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Dreaming Glory');


-- Blindweed - Journeyman Pruning Shears conditions (Ref 91436)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91436, 8839, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91436, 8839, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91436, 8839, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91436, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91436, 24401, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91436, 24401, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91436, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91436, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blindweed');

-- Blindweed - Artisan Pruning Shears conditions (Ref 91437)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91437, 8839, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91437, 8839, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91437, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91437, 24401, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91437, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91437, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blindweed');

-- Blindweed - Master Pruning Shears conditions (Ref 91438)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91438, 8839, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91438, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91438, 24401, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91438, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blindweed');

-- Blindweed - Grand Master Pruning Shears conditions (Ref 91439)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91439, 8839, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blindweed');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91439, 24401, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blindweed');


-- Goldclover - Journeyman Pruning Shears conditions (Ref 91440)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 36901, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 36901, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 37704, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 37704, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 37921, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 37921, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 37921, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91440, 37921, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Goldclover');

-- Goldclover - Artisan Pruning Shears conditions (Ref 91441)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 36901, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 37704, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 37921, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 37921, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91441, 37921, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Goldclover');

-- Goldclover - Master Pruning Shears conditions (Ref 91442)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91442, 36901, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91442, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91442, 37704, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91442, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91442, 37921, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91442, 37921, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Goldclover');

-- Goldclover - Grand Master Pruning Shears conditions (Ref 91443)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91443, 36901, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91443, 37704, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Goldclover');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91443, 37921, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Goldclover');


-- Tiger Lily - Journeyman Pruning Shears conditions (Ref 91444)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 36904, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 36904, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 37704, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 37704, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 37921, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 37921, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 37921, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91444, 37921, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Tiger Lily');

-- Tiger Lily - Artisan Pruning Shears conditions (Ref 91445)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 36904, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 37704, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 37921, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 37921, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91445, 37921, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Tiger Lily');

-- Tiger Lily - Master Pruning Shears conditions (Ref 91446)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91446, 36904, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91446, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91446, 37704, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91446, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91446, 37921, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91446, 37921, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Tiger Lily');

-- Tiger Lily - Grand Master Pruning Shears conditions (Ref 91447)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91447, 36904, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91447, 37704, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Tiger Lily');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91447, 37921, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Tiger Lily');


-- Lichbloom - Journeyman Pruning Shears conditions (Ref 91448)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91448, 36905, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91448, 36905, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91448, 36905, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91448, 36905, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91448, 37704, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91448, 37704, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91448, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91448, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Lichbloom');

-- Lichbloom - Artisan Pruning Shears conditions (Ref 91449)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91449, 36905, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91449, 36905, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91449, 36905, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91449, 37704, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91449, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91449, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Lichbloom');

-- Lichbloom - Master Pruning Shears conditions (Ref 91450)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91450, 36905, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91450, 36905, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91450, 37704, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91450, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Lichbloom');

-- Lichbloom - Grand Master Pruning Shears conditions (Ref 91451)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91451, 36905, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Lichbloom');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91451, 37704, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Lichbloom');


-- Icethorn - Journeyman Pruning Shears conditions (Ref 91452)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91452, 36906, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91452, 36906, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91452, 36906, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91452, 36906, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91452, 37704, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91452, 37704, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91452, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91452, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Icethorn');

-- Icethorn - Artisan Pruning Shears conditions (Ref 91453)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91453, 36906, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91453, 36906, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91453, 36906, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91453, 37704, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91453, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91453, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Icethorn');

-- Icethorn - Master Pruning Shears conditions (Ref 91454)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91454, 36906, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91454, 36906, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91454, 37704, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91454, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Icethorn');

-- Icethorn - Grand Master Pruning Shears conditions (Ref 91455)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91455, 36906, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Icethorn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91455, 37704, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Icethorn');


-- Adder's Tongue - Journeyman Pruning Shears conditions (Ref 91456)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91456, 36903, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91456, 36903, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91456, 36903, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91456, 36903, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91456, 37704, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91456, 37704, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91456, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91456, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Artisan Pruning Shears conditions (Ref 91457)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91457, 36903, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91457, 36903, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91457, 36903, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91457, 37704, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91457, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91457, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Master Pruning Shears conditions (Ref 91458)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91458, 36903, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91458, 36903, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91458, 37704, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91458, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Adder''s Tongue');

-- Adder's Tongue - Grand Master Pruning Shears conditions (Ref 91459)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91459, 36903, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Adder''s Tongue');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91459, 37704, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Adder''s Tongue');


-- Frozen Herb - Journeyman Pruning Shears conditions (Ref 91460)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36901, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36901, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36904, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36904, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36907, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36907, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36907, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91460, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');

-- Frozen Herb - Artisan Pruning Shears conditions (Ref 91461)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36901, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36904, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36907, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36907, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91461, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');

-- Frozen Herb - Master Pruning Shears conditions (Ref 91462)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91462, 36901, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91462, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91462, 36904, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91462, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91462, 36907, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91462, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');

-- Frozen Herb - Grand Master Pruning Shears conditions (Ref 91463)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91463, 36901, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91463, 36904, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91463, 36907, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');


-- Frozen Herb - Journeyman Pruning Shears conditions (Ref 91464)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36901, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36901, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36904, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36904, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36907, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36907, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36907, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91464, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');

-- Frozen Herb - Artisan Pruning Shears conditions (Ref 91465)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36901, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36904, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36907, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36907, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91465, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');

-- Frozen Herb - Master Pruning Shears conditions (Ref 91466)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91466, 36901, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91466, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91466, 36904, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91466, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91466, 36907, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91466, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');

-- Frozen Herb - Grand Master Pruning Shears conditions (Ref 91467)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91467, 36901, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91467, 36904, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91467, 36907, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');


-- Frozen Herb - Journeyman Pruning Shears conditions (Ref 91468)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36901, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36901, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36904, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36904, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36907, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36907, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36907, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91468, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Frozen Herb');

-- Frozen Herb - Artisan Pruning Shears conditions (Ref 91469)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36901, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36904, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36907, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36907, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91469, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Frozen Herb');

-- Frozen Herb - Master Pruning Shears conditions (Ref 91470)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91470, 36901, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91470, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91470, 36904, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91470, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91470, 36907, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91470, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Frozen Herb');

-- Frozen Herb - Grand Master Pruning Shears conditions (Ref 91471)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91471, 36901, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91471, 36904, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 91471, 36907, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Frozen Herb');


-- Done!
