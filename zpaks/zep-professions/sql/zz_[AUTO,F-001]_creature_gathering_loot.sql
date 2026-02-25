-- =====================================================
-- CREATURE GATHERING BONUS YIELD SYSTEM
-- =====================================================
-- Extends pruning shears / mining pick bonus yield to creatures
-- that are 'skinned' using herbalism or mining (type_flags)
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 96000 AND 96099;
DELETE FROM reference_loot_template WHERE Entry BETWEEN 96500 AND 96599;
DELETE FROM skinning_loot_template WHERE Reference BETWEEN 96000 AND 96099;
DELETE FROM skinning_loot_template WHERE Reference BETWEEN 96500 AND 96599;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 96000 AND 96099;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 96500 AND 96599;

-- =====================================================
-- HERBALISM CREATURES (9 unique loot tables)
-- Tool: Pruning Shears
-- =====================================================
-- Amanitar (Loot Entry: 80007)
-- Blackmoss the Fetid (Loot Entry: 100040)
-- Branch Snapper (Loot Entry: 100041)
-- Blackened Ancient (Loot Entry: 100042)
-- Barbed Lasher (Loot Entry: 100043)
-- Bloodpetal Flayer (Loot Entry: 100044)
-- Death Lash (Loot Entry: 100045)
-- Bog Giant (Loot Entry: 100046)
-- Bog Giant (1) (Loot Entry: 100047)

-- Amanitar (Entry: 80007)
-- Amanitar - Journeyman Pruning Shears Bonus (Ref 96000)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 33452, 30.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 36901, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 36902, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 36903, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 36904, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 36905, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 36906, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 36907, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 37704, 7.0, 0, 0, 1, 2, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96000, 39516, 40.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');

-- Amanitar - Artisan Pruning Shears Bonus (Ref 96001)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 33452, 30.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 36901, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 36902, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 36903, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 36904, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 36905, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 36906, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 36907, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 37704, 7.0, 0, 0, 1, 2, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96001, 39516, 40.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');

-- Amanitar - Master Pruning Shears Bonus (Ref 96002)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 33452, 30.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 36901, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 36902, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 36903, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 36904, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 36905, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 36906, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 36907, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 37704, 7.0, 0, 0, 1, 2, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96002, 39516, 40.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');

-- Amanitar - Grand Master Pruning Shears Bonus (Ref 96003)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 33452, 30.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 36901, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 36902, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 36903, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 36904, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 36905, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 36906, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 36907, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 37704, 7.0, 0, 0, 1, 2, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96003, 39516, 40.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');


-- Blackmoss the Fetid (Entry: 100040)
-- Blackmoss the Fetid - Journeyman Pruning Shears Bonus (Ref 96004)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96004, 765, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96004, 785, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96004, 2447, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96004, 2449, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96004, 2450, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96004, 2452, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96004, 23331, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Pruning Shears');

-- Blackmoss the Fetid - Artisan Pruning Shears Bonus (Ref 96005)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96005, 765, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96005, 785, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96005, 2447, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96005, 2449, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96005, 2450, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96005, 2452, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96005, 23331, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Pruning Shears');

-- Blackmoss the Fetid - Master Pruning Shears Bonus (Ref 96006)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96006, 765, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96006, 785, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96006, 2447, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96006, 2449, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96006, 2450, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96006, 2452, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96006, 23331, 0.0, 1, 0, 1, 2, 'Bonus from Master Pruning Shears');

-- Blackmoss the Fetid - Grand Master Pruning Shears Bonus (Ref 96007)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96007, 765, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96007, 785, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96007, 2447, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96007, 2449, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96007, 2450, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96007, 2452, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96007, 23331, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Pruning Shears');


-- Branch Snapper (Entry: 100041)
-- Branch Snapper - Journeyman Pruning Shears Bonus (Ref 96008)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 2450, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 2452, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 2453, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 3355, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 3356, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 3369, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 3820, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96008, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');

-- Branch Snapper - Artisan Pruning Shears Bonus (Ref 96009)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 2450, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 2452, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 2453, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 3355, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 3356, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 3369, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 3820, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96009, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');

-- Branch Snapper - Master Pruning Shears Bonus (Ref 96010)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 2450, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 2452, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 2453, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 3355, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 3356, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 3369, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 3820, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96010, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');

-- Branch Snapper - Grand Master Pruning Shears Bonus (Ref 96011)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 2450, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 2452, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 2453, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 3355, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 3356, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 3369, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 3820, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96011, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');


-- Blackened Ancient (Entry: 100042)
-- Blackened Ancient - Journeyman Pruning Shears Bonus (Ref 96012)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96012, 3356, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96012, 3357, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96012, 3358, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96012, 3818, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96012, 3821, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96012, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');

-- Blackened Ancient - Artisan Pruning Shears Bonus (Ref 96013)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96013, 3356, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96013, 3357, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96013, 3358, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96013, 3818, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96013, 3821, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96013, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');

-- Blackened Ancient - Master Pruning Shears Bonus (Ref 96014)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96014, 3356, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96014, 3357, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96014, 3358, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96014, 3818, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96014, 3821, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96014, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');

-- Blackened Ancient - Grand Master Pruning Shears Bonus (Ref 96015)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96015, 3356, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96015, 3357, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96015, 3358, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96015, 3818, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96015, 3821, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96015, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');


-- Barbed Lasher (Entry: 100043)
-- Barbed Lasher - Journeyman Pruning Shears Bonus (Ref 96016)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 3358, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 3819, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 3821, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 4625, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 8831, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 8836, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 8838, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96016, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');

-- Barbed Lasher - Artisan Pruning Shears Bonus (Ref 96017)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 3358, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 3819, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 3821, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 4625, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 8831, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 8836, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 8838, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96017, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');

-- Barbed Lasher - Master Pruning Shears Bonus (Ref 96018)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 3358, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 3819, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 3821, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 4625, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 8831, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 8836, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 8838, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96018, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');

-- Barbed Lasher - Grand Master Pruning Shears Bonus (Ref 96019)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 3358, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 3819, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 3821, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 4625, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 8831, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 8836, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 8838, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96019, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');


-- Bloodpetal Flayer (Entry: 100044)
-- Bloodpetal Flayer - Journeyman Pruning Shears Bonus (Ref 96020)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 8831, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 8836, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 8838, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 8839, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 8845, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 8846, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 13463, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 13464, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 13465, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96020, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');

-- Bloodpetal Flayer - Artisan Pruning Shears Bonus (Ref 96021)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 8831, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 8836, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 8838, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 8839, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 8845, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 8846, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 13463, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 13464, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 13465, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96021, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Pruning Shears');

-- Bloodpetal Flayer - Master Pruning Shears Bonus (Ref 96022)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 8831, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 8836, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 8838, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 8839, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 8845, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 8846, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 13463, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 13464, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 13465, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96022, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Master Pruning Shears');

-- Bloodpetal Flayer - Grand Master Pruning Shears Bonus (Ref 96023)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 8831, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 8836, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 8838, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 8839, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 8845, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 8846, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 13463, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 13464, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 13465, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96023, 23331, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');


-- Death Lash (Entry: 100045)
-- Death Lash - Journeyman Pruning Shears Bonus (Ref 96024)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96024, 13463, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96024, 13465, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96024, 13466, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96024, 13467, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96024, 13468, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96024, 23331, 15.0, 0, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');

-- Death Lash - Artisan Pruning Shears Bonus (Ref 96025)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96025, 13463, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96025, 13465, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96025, 13466, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96025, 13467, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96025, 13468, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96025, 23331, 15.0, 0, 0, 1, 3, 'Bonus from Artisan Pruning Shears');

-- Death Lash - Master Pruning Shears Bonus (Ref 96026)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96026, 13463, 20.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96026, 13465, 20.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96026, 13466, 20.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96026, 13467, 20.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96026, 13468, 5.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96026, 23331, 15.0, 0, 0, 1, 3, 'Bonus from Master Pruning Shears');

-- Death Lash - Grand Master Pruning Shears Bonus (Ref 96027)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96027, 13463, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96027, 13465, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96027, 13466, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96027, 13467, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96027, 13468, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96027, 23331, 15.0, 0, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');


-- Bog Giant (Entry: 100046)
-- Bog Giant - Journeyman Pruning Shears Bonus (Ref 96028)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 22575, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 22785, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 22786, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 22787, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 22789, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 22790, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 22794, 1.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96028, 24401, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');

-- Bog Giant - Artisan Pruning Shears Bonus (Ref 96029)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 22575, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 22785, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 22786, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 22787, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 22789, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 22790, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 22794, 1.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96029, 24401, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');

-- Bog Giant - Master Pruning Shears Bonus (Ref 96030)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 22575, 10.0, 0, 0, 1, 2, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 22785, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 22786, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 22787, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 22789, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 22790, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 22794, 1.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96030, 24401, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');

-- Bog Giant - Grand Master Pruning Shears Bonus (Ref 96031)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 22575, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 22785, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 22786, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 22787, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 22789, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 22790, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 22794, 1.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96031, 24401, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');


-- Bog Giant (1) (Entry: 100047)
-- Bog Giant (1) - Journeyman Pruning Shears Bonus (Ref 96032)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 22575, 20.0, 0, 0, 1, 3, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 22785, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 22786, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 22787, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 22789, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 22790, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 22793, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96032, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Journeyman Pruning Shears');

-- Bog Giant (1) - Artisan Pruning Shears Bonus (Ref 96033)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 22575, 20.0, 0, 0, 1, 3, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 22785, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 22786, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 22787, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 22789, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 22790, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 22793, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96033, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Artisan Pruning Shears');

-- Bog Giant (1) - Master Pruning Shears Bonus (Ref 96034)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 22575, 20.0, 0, 0, 1, 3, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 22785, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 22786, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 22787, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 22789, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 22790, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 22793, 0.0, 1, 0, 1, 1, 'Bonus from Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96034, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Master Pruning Shears');

-- Bog Giant (1) - Grand Master Pruning Shears Bonus (Ref 96035)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 22575, 20.0, 0, 0, 1, 3, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 22785, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 22786, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 22787, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 22789, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 22790, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 22793, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96035, 22794, 2.0, 0, 0, 1, 1, 'Bonus from Grand Master Pruning Shears');


-- Link Herbalism creature references to skinning_loot_template

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80007, 20000, 96000, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80007, 20001, 96001, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80007, 20002, 96002, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80007, 20003, 96003, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100040, 20004, 96004, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100040, 20005, 96005, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100040, 20006, 96006, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100040, 20007, 96007, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100041, 20008, 96008, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100041, 20009, 96009, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100041, 20010, 96010, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100041, 20011, 96011, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100042, 20012, 96012, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100042, 20013, 96013, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100042, 20014, 96014, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100042, 20015, 96015, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100043, 20016, 96016, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100043, 20017, 96017, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100043, 20018, 96018, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100043, 20019, 96019, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100044, 20020, 96020, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100044, 20021, 96021, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100044, 20022, 96022, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100044, 20023, 96023, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100045, 20024, 96024, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100045, 20025, 96025, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100045, 20026, 96026, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100045, 20027, 96027, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100046, 20028, 96028, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100046, 20029, 96029, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100046, 20030, 96030, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100046, 20031, 96031, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100047, 20032, 96032, 10, 0, 1, 0, 1, 1, 'Journeyman Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100047, 20033, 96033, 20, 0, 1, 0, 1, 1, 'Artisan Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100047, 20034, 96034, 30, 0, 1, 0, 1, 1, 'Master Pruning Shears Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100047, 20035, 96035, 40, 0, 1, 0, 1, 1, 'Grand Master Pruning Shears Bonus');

-- Herbalism creature conditions (per-item with mutual exclusion)

-- Amanitar - Journeyman Pruning Shears conditions (Ref 96000)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 33452, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 33452, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 33452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 33452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36901, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36901, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36902, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36902, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36902, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36902, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36903, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36903, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36903, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36903, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36904, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36904, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36905, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36905, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36905, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36905, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36906, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36906, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36906, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36906, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36907, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36907, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36907, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 37704, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 37704, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 39516, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 39516, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 39516, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96000, 39516, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Amanitar');

-- Amanitar - Artisan Pruning Shears conditions (Ref 96001)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 33452, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 33452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 33452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36901, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36901, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36902, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36902, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36902, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36903, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36903, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36903, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36904, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36904, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36905, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36905, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36905, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36906, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36906, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36906, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36907, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36907, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 37704, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 37704, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 39516, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 39516, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96001, 39516, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Amanitar');

-- Amanitar - Master Pruning Shears conditions (Ref 96002)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 33452, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 33452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36901, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36901, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36902, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36902, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36903, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36903, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36904, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36904, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36905, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36905, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36906, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36906, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36907, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 36907, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 37704, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 37704, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 39516, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96002, 39516, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Amanitar');

-- Amanitar - Grand Master Pruning Shears conditions (Ref 96003)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 33452, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 36901, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 36902, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 36903, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 36904, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 36905, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 36906, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 36907, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 37704, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96003, 39516, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Amanitar');


-- Blackmoss the Fetid - Journeyman Pruning Shears conditions (Ref 96004)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 765, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 765, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 765, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 785, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 785, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2447, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2447, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2447, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2449, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2449, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2449, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2450, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2450, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2450, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2452, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2452, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 23331, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 23331, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96004, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackmoss the Fetid');

-- Blackmoss the Fetid - Artisan Pruning Shears conditions (Ref 96005)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 765, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 765, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 785, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2447, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2447, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2449, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2449, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2450, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2450, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2452, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 23331, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96005, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackmoss the Fetid');

-- Blackmoss the Fetid - Master Pruning Shears conditions (Ref 96006)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 765, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 765, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 785, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 2447, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 2447, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 2449, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 2449, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 2450, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 2452, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 23331, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96006, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackmoss the Fetid');

-- Blackmoss the Fetid - Grand Master Pruning Shears conditions (Ref 96007)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96007, 765, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96007, 785, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96007, 2447, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96007, 2449, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96007, 2450, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96007, 2452, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackmoss the Fetid');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96007, 23331, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackmoss the Fetid');


-- Branch Snapper - Journeyman Pruning Shears conditions (Ref 96008)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2450, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2450, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2450, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2452, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2452, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2453, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2453, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2453, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3355, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3355, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3355, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3355, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3356, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3356, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3356, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3369, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3369, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3369, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3369, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3820, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3820, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3820, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 3820, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 23331, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 23331, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96008, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Branch Snapper');

-- Branch Snapper - Artisan Pruning Shears conditions (Ref 96009)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2450, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2450, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2452, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2452, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2453, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2453, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3355, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3355, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3355, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3356, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3356, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3369, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3369, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3369, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3820, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3820, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 3820, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 23331, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96009, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Branch Snapper');

-- Branch Snapper - Master Pruning Shears conditions (Ref 96010)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 2450, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 2450, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 2452, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 2452, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 2453, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 2453, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 3355, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 3355, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 3356, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 3369, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 3369, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 3820, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 3820, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 23331, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96010, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Branch Snapper');

-- Branch Snapper - Grand Master Pruning Shears conditions (Ref 96011)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 2450, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 2452, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 2453, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 3355, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 3356, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 3369, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 3820, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Branch Snapper');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96011, 23331, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Branch Snapper');


-- Blackened Ancient - Journeyman Pruning Shears conditions (Ref 96012)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3356, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3356, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3356, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3357, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3357, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3357, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3357, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3358, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3358, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3358, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3818, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3818, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3818, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3818, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3821, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3821, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3821, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 23331, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 23331, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96012, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Blackened Ancient');

-- Blackened Ancient - Artisan Pruning Shears conditions (Ref 96013)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3356, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3356, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3357, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3357, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3357, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3358, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3358, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3818, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3818, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3818, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3821, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3821, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 23331, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96013, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Blackened Ancient');

-- Blackened Ancient - Master Pruning Shears conditions (Ref 96014)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3356, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3356, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3357, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3357, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3358, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3818, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3818, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3821, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 23331, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96014, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Blackened Ancient');

-- Blackened Ancient - Grand Master Pruning Shears conditions (Ref 96015)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96015, 3356, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96015, 3357, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96015, 3358, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96015, 3818, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96015, 3821, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackened Ancient');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96015, 23331, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Blackened Ancient');


-- Barbed Lasher - Journeyman Pruning Shears conditions (Ref 96016)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3358, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3358, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3358, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3819, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3819, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3819, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3819, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3821, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3821, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3821, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 4625, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 4625, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 4625, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 4625, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8831, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8831, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8831, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8836, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8836, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8836, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8838, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8838, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 23331, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 23331, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96016, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Barbed Lasher');

-- Barbed Lasher - Artisan Pruning Shears conditions (Ref 96017)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3358, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3358, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3819, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3819, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3819, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3821, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3821, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 4625, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 4625, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 4625, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8831, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8831, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8836, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8836, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8838, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 23331, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96017, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Barbed Lasher');

-- Barbed Lasher - Master Pruning Shears conditions (Ref 96018)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 3358, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 3358, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 3819, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 3819, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 3821, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 3821, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 4625, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 4625, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 8831, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 8836, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 8838, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 23331, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96018, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Barbed Lasher');

-- Barbed Lasher - Grand Master Pruning Shears conditions (Ref 96019)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 3358, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 3819, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 3821, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 4625, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 8831, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 8836, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 8838, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Barbed Lasher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96019, 23331, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Barbed Lasher');


-- Bloodpetal Flayer - Journeyman Pruning Shears conditions (Ref 96020)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8831, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8831, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8831, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8836, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8836, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8836, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8838, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8838, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8839, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8839, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8839, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8845, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8845, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8845, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8845, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8846, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8846, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8846, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13463, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13463, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13464, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13464, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13464, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13465, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13465, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 23331, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 23331, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96020, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bloodpetal Flayer');

-- Bloodpetal Flayer - Artisan Pruning Shears conditions (Ref 96021)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8831, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8831, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8836, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8836, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8838, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8838, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8839, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8839, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8845, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8845, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8845, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8846, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8846, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13463, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13464, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13464, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13465, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 23331, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96021, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bloodpetal Flayer');

-- Bloodpetal Flayer - Master Pruning Shears conditions (Ref 96022)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8831, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8831, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8836, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8836, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8838, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8838, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8839, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8839, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8845, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8845, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8846, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 8846, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 13463, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 13464, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 13464, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 13465, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 23331, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96022, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bloodpetal Flayer');

-- Bloodpetal Flayer - Grand Master Pruning Shears conditions (Ref 96023)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 8831, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 8836, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 8838, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 8839, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 8845, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 8846, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 13463, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 13464, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 13465, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96023, 23331, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bloodpetal Flayer');


-- Death Lash - Journeyman Pruning Shears conditions (Ref 96024)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13463, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13463, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13465, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13465, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13466, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13466, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13466, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13467, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13467, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13467, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13467, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13468, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13468, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13468, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 13468, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 23331, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 23331, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96024, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Death Lash');

-- Death Lash - Artisan Pruning Shears conditions (Ref 96025)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13463, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13463, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13465, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13465, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13466, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13466, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13467, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13467, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13467, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13468, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13468, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 13468, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 23331, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 23331, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96025, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Death Lash');

-- Death Lash - Master Pruning Shears conditions (Ref 96026)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13463, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13463, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13465, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13465, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13466, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13466, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13467, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13467, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13468, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 13468, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 23331, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96026, 23331, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Death Lash');

-- Death Lash - Grand Master Pruning Shears conditions (Ref 96027)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96027, 13463, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96027, 13465, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96027, 13466, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96027, 13467, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96027, 13468, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Death Lash');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96027, 23331, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Death Lash');


-- Bog Giant - Journeyman Pruning Shears conditions (Ref 96028)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22785, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22785, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22786, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22786, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22786, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22787, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22787, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22787, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22789, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22789, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22789, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22790, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22790, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22790, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 24401, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 24401, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96028, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant');

-- Bog Giant - Artisan Pruning Shears conditions (Ref 96029)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22785, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22786, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22786, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22787, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22787, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22789, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22789, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22790, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22790, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 24401, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 24401, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96029, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant');

-- Bog Giant - Master Pruning Shears conditions (Ref 96030)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22785, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22786, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22787, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22789, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22790, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 24401, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96030, 24401, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant');

-- Bog Giant - Grand Master Pruning Shears conditions (Ref 96031)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 22785, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 22786, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 22787, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 22789, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 22790, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96031, 24401, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant');


-- Bog Giant (1) - Journeyman Pruning Shears conditions (Ref 96032)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22575, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22575, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22785, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22785, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22786, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22786, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22786, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22787, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22787, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22787, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22789, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22789, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22789, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22790, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22790, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22790, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22793, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22793, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22793, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22793, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22794, 0, 0, 1, 0, 91140, 0, 0, 0, 'Journeyman Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22794, 0, 0, 1, 0, 91141, 0, 0, 1, 'Block Journeyman if Artisan active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Journeyman if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96032, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Journeyman if Grand Master active - Bog Giant (1)');

-- Bog Giant (1) - Artisan Pruning Shears conditions (Ref 96033)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22575, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22575, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22785, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22785, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22786, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22786, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22787, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22787, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22789, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22789, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22790, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22790, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22793, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22793, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22793, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22794, 0, 0, 1, 0, 91141, 0, 0, 0, 'Artisan Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22794, 0, 0, 1, 0, 91142, 0, 0, 1, 'Block Artisan if Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96033, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Artisan if Grand Master active - Bog Giant (1)');

-- Bog Giant (1) - Master Pruning Shears conditions (Ref 96034)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22575, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22575, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22785, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22785, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22786, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22786, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22787, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22787, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22789, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22789, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22790, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22790, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22793, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22793, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22794, 0, 0, 1, 0, 91142, 0, 0, 0, 'Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96034, 22794, 0, 0, 1, 0, 91143, 0, 0, 1, 'Block Master if Grand Master active - Bog Giant (1)');

-- Bog Giant (1) - Grand Master Pruning Shears conditions (Ref 96035)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 22575, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 22785, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 22786, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 22787, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 22789, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 22790, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 22793, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant (1)');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96035, 22794, 0, 0, 1, 0, 91143, 0, 0, 0, 'Grand Master Pruning Shears - Bog Giant (1)');


-- =====================================================
-- MINING CREATURES (13 unique loot tables)
-- Tool: Mining Pick
-- =====================================================
-- Rumbling Earth-Heart (Loot Entry: 80100)
-- Tavarok (Loot Entry: 80102)
-- Brittle Revenant (Loot Entry: 80103)
-- Crystalline Ice Elemental (Loot Entry: 80104)
-- Heroic Molten Elemental (Loot Entry: 100020)
-- Boulderheart (Loot Entry: 100021)
-- Elemental Slave (Loot Entry: 100022)
-- Ambershard Crusher (Loot Entry: 100023)
-- Avalanchion (Loot Entry: 100024)
-- Firesworn (Loot Entry: 100025)
-- Crystalhide Colossus (Loot Entry: 100026)
-- Apex (Loot Entry: 100027)
-- Apexis Guardian (Loot Entry: 100028)

-- Rumbling Earth-Heart (Entry: 80100)
-- Rumbling Earth-Heart - Journeyman Mining Pick Bonus (Ref 96500)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96500, 22573, 20.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96500, 24189, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');

-- Rumbling Earth-Heart - Artisan Mining Pick Bonus (Ref 96501)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96501, 22573, 20.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96501, 24189, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');

-- Rumbling Earth-Heart - Master Mining Pick Bonus (Ref 96502)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96502, 22573, 20.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96502, 24189, 100.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');

-- Rumbling Earth-Heart - Grand Master Mining Pick Bonus (Ref 96503)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96503, 22573, 20.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96503, 24189, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');


-- Tavarok (Entry: 80102)
-- Tavarok - Journeyman Mining Pick Bonus (Ref 96504)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 21929, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23077, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23079, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23107, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23112, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23117, 0.0, 1, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23425, 100.0, 0, 0, 4, 8, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23436, 1.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23437, 1.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23438, 1.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23439, 1.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23440, 1.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96504, 23441, 1.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');

-- Tavarok - Artisan Mining Pick Bonus (Ref 96505)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 21929, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23077, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23079, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23107, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23112, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23117, 0.0, 1, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23425, 100.0, 0, 0, 4, 8, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23436, 1.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23437, 1.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23438, 1.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23439, 1.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23440, 1.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96505, 23441, 1.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');

-- Tavarok - Master Mining Pick Bonus (Ref 96506)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 21929, 0.0, 1, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23077, 0.0, 1, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23079, 0.0, 1, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23107, 0.0, 1, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23112, 0.0, 1, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23117, 0.0, 1, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23425, 100.0, 0, 0, 4, 8, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23436, 1.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23437, 1.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23438, 1.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23439, 1.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23440, 1.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96506, 23441, 1.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');

-- Tavarok - Grand Master Mining Pick Bonus (Ref 96507)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 21929, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23077, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23079, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23107, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23112, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23117, 0.0, 1, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23425, 100.0, 0, 0, 4, 8, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23436, 1.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23437, 1.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23438, 1.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23439, 1.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23440, 1.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96507, 23441, 1.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');


-- Brittle Revenant (Entry: 80103)
-- Brittle Revenant - Journeyman Mining Pick Bonus (Ref 96508)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96508, 37701, 5.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96508, 39220, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');

-- Brittle Revenant - Artisan Mining Pick Bonus (Ref 96509)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96509, 37701, 5.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96509, 39220, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');

-- Brittle Revenant - Master Mining Pick Bonus (Ref 96510)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96510, 37701, 5.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96510, 39220, 100.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');

-- Brittle Revenant - Grand Master Mining Pick Bonus (Ref 96511)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96511, 37701, 5.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96511, 39220, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');


-- Crystalline Ice Elemental (Entry: 80104)
-- Crystalline Ice Elemental - Journeyman Mining Pick Bonus (Ref 96512)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96512, 36728, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96512, 37701, 5.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96512, 39220, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');

-- Crystalline Ice Elemental - Artisan Mining Pick Bonus (Ref 96513)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96513, 36728, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96513, 37701, 5.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96513, 39220, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');

-- Crystalline Ice Elemental - Master Mining Pick Bonus (Ref 96514)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96514, 36728, 100.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96514, 37701, 5.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96514, 39220, 100.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');

-- Crystalline Ice Elemental - Grand Master Mining Pick Bonus (Ref 96515)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96515, 36728, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96515, 37701, 5.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96515, 39220, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');


-- Heroic Molten Elemental (Entry: 100020)
-- Heroic Molten Elemental - Journeyman Mining Pick Bonus (Ref 96516)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96516, 774, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96516, 818, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96516, 1210, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96516, 2770, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96516, 2771, 20.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96516, 2835, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96516, 2836, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');

-- Heroic Molten Elemental - Artisan Mining Pick Bonus (Ref 96517)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96517, 774, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96517, 818, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96517, 1210, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96517, 2770, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96517, 2771, 20.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96517, 2835, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96517, 2836, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');

-- Heroic Molten Elemental - Master Mining Pick Bonus (Ref 96518)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96518, 774, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96518, 818, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96518, 1210, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96518, 2770, 50.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96518, 2771, 20.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96518, 2835, 50.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96518, 2836, 50.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');

-- Heroic Molten Elemental - Grand Master Mining Pick Bonus (Ref 96519)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96519, 774, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96519, 818, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96519, 1210, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96519, 2770, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96519, 2771, 20.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96519, 2835, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96519, 2836, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');


-- Boulderheart (Entry: 100021)
-- Boulderheart - Journeyman Mining Pick Bonus (Ref 96520)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 1206, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 1210, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 1705, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 2770, 40.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 2771, 20.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 2775, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 2836, 70.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 3857, 20.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96520, 7067, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');

-- Boulderheart - Artisan Mining Pick Bonus (Ref 96521)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 1206, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 1210, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 1705, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 2770, 40.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 2771, 20.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 2775, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 2836, 70.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 3857, 20.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96521, 7067, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');

-- Boulderheart - Master Mining Pick Bonus (Ref 96522)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 1206, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 1210, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 1705, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 2770, 40.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 2771, 20.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 2775, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 2836, 70.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 3857, 20.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96522, 7067, 10.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');

-- Boulderheart - Grand Master Mining Pick Bonus (Ref 96523)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 1206, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 1210, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 1705, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 2770, 40.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 2771, 20.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 2775, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 2836, 70.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 3857, 20.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96523, 7067, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');


-- Elemental Slave (Entry: 100022)
-- Elemental Slave - Journeyman Mining Pick Bonus (Ref 96524)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96524, 1206, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96524, 1529, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96524, 1705, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96524, 2772, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96524, 2776, 20.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96524, 2838, 90.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96524, 7067, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');

-- Elemental Slave - Artisan Mining Pick Bonus (Ref 96525)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96525, 1206, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96525, 1529, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96525, 1705, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96525, 2772, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96525, 2776, 20.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96525, 2838, 90.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96525, 7067, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');

-- Elemental Slave - Master Mining Pick Bonus (Ref 96526)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96526, 1206, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96526, 1529, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96526, 1705, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96526, 2772, 50.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96526, 2776, 20.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96526, 2838, 90.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96526, 7067, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');

-- Elemental Slave - Grand Master Mining Pick Bonus (Ref 96527)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96527, 1206, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96527, 1529, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96527, 1705, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96527, 2772, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96527, 2776, 20.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96527, 2838, 90.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96527, 7067, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');


-- Ambershard Crusher (Entry: 100023)
-- Ambershard Crusher - Journeyman Mining Pick Bonus (Ref 96528)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96528, 3858, 60.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96528, 3864, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96528, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96528, 7909, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96528, 7911, 20.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96528, 7912, 90.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');

-- Ambershard Crusher - Artisan Mining Pick Bonus (Ref 96529)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96529, 3858, 60.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96529, 3864, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96529, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96529, 7909, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96529, 7911, 20.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96529, 7912, 90.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');

-- Ambershard Crusher - Master Mining Pick Bonus (Ref 96530)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96530, 3858, 60.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96530, 3864, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96530, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96530, 7909, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96530, 7911, 20.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96530, 7912, 90.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');

-- Ambershard Crusher - Grand Master Mining Pick Bonus (Ref 96531)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96531, 3858, 60.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96531, 3864, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96531, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96531, 7909, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96531, 7911, 20.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96531, 7912, 90.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');


-- Avalanchion (Entry: 100024)
-- Avalanchion - Journeyman Mining Pick Bonus (Ref 96532)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 7076, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 10620, 50.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 11370, 10.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 12361, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 12363, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 12364, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 12365, 80.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 12799, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 12800, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96532, 19774, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');

-- Avalanchion - Artisan Mining Pick Bonus (Ref 96533)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 7076, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 10620, 50.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 11370, 10.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 12361, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 12363, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 12364, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 12365, 80.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 12799, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 12800, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96533, 19774, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');

-- Avalanchion - Master Mining Pick Bonus (Ref 96534)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 7076, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 10620, 50.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 11370, 10.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 12361, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 12363, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 12364, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 12365, 80.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 12799, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 12800, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96534, 19774, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');

-- Avalanchion - Grand Master Mining Pick Bonus (Ref 96535)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 7076, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 10620, 50.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 11370, 10.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 12361, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 12363, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 12364, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 12365, 80.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 12799, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 12800, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96535, 19774, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');


-- Firesworn (Entry: 100025)
-- Firesworn - Journeyman Mining Pick Bonus (Ref 96536)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 7076, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 10620, 40.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 11370, 10.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 12361, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 12363, 15.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 12364, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 12365, 60.0, 0, 0, 1, 3, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 12799, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 12800, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 17011, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96536, 19774, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Mining Pick');

-- Firesworn - Artisan Mining Pick Bonus (Ref 96537)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 7076, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 10620, 40.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 11370, 10.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 12361, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 12363, 15.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 12364, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 12365, 60.0, 0, 0, 1, 3, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 12799, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 12800, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 17011, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96537, 19774, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Mining Pick');

-- Firesworn - Master Mining Pick Bonus (Ref 96538)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 7076, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 10620, 40.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 11370, 10.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 12361, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 12363, 15.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 12364, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 12365, 60.0, 0, 0, 1, 3, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 12799, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 12800, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 17011, 10.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96538, 19774, 5.0, 0, 0, 1, 1, 'Bonus from Master Mining Pick');

-- Firesworn - Grand Master Mining Pick Bonus (Ref 96539)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 7075, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 7076, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 10620, 40.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 11370, 10.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 12361, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 12363, 15.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 12364, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 12365, 60.0, 0, 0, 1, 3, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 12799, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 12800, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 17011, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96539, 19774, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Mining Pick');


-- Crystalhide Colossus (Entry: 100026)
-- Crystalhide Colossus - Journeyman Mining Pick Bonus (Ref 96540)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96540, 22573, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96540, 22574, 20.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96540, 23424, 95.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96540, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');

-- Crystalhide Colossus - Artisan Mining Pick Bonus (Ref 96541)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96541, 22573, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96541, 22574, 20.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96541, 23424, 95.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96541, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');

-- Crystalhide Colossus - Master Mining Pick Bonus (Ref 96542)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96542, 22573, 10.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96542, 22574, 20.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96542, 23424, 95.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96542, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');

-- Crystalhide Colossus - Grand Master Mining Pick Bonus (Ref 96543)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96543, 22573, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96543, 22574, 20.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96543, 23424, 95.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96543, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');


-- Apex (Entry: 100027)
-- Apex - Journeyman Mining Pick Bonus (Ref 96544)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96544, 22573, 20.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96544, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96544, 23425, 95.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96544, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');

-- Apex - Artisan Mining Pick Bonus (Ref 96545)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96545, 22573, 20.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96545, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96545, 23425, 95.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96545, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');

-- Apex - Master Mining Pick Bonus (Ref 96546)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96546, 22573, 20.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96546, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96546, 23425, 95.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96546, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');

-- Apex - Grand Master Mining Pick Bonus (Ref 96547)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96547, 22573, 20.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96547, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96547, 23425, 95.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96547, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');


-- Apexis Guardian (Entry: 100028)
-- Apexis Guardian - Journeyman Mining Pick Bonus (Ref 96548)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96548, 22573, 20.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96548, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96548, 23425, 85.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96548, 23426, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96548, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Journeyman Mining Pick');

-- Apexis Guardian - Artisan Mining Pick Bonus (Ref 96549)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96549, 22573, 20.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96549, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96549, 23425, 85.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96549, 23426, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96549, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Artisan Mining Pick');

-- Apexis Guardian - Master Mining Pick Bonus (Ref 96550)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96550, 22573, 20.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96550, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96550, 23425, 85.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96550, 23426, 10.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96550, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Master Mining Pick');

-- Apexis Guardian - Grand Master Mining Pick Bonus (Ref 96551)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96551, 22573, 20.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96551, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96551, 23425, 85.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96551, 23426, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (96551, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Grand Master Mining Pick');


-- Link Mining creature references to skinning_loot_template

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80100, 20500, 96500, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80100, 20501, 96501, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80100, 20502, 96502, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80100, 20503, 96503, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80102, 20504, 96504, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80102, 20505, 96505, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80102, 20506, 96506, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80102, 20507, 96507, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80103, 20508, 96508, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80103, 20509, 96509, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80103, 20510, 96510, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80103, 20511, 96511, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80104, 20512, 96512, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80104, 20513, 96513, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80104, 20514, 96514, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (80104, 20515, 96515, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100020, 20516, 96516, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100020, 20517, 96517, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100020, 20518, 96518, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100020, 20519, 96519, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100021, 20520, 96520, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100021, 20521, 96521, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100021, 20522, 96522, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100021, 20523, 96523, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100022, 20524, 96524, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100022, 20525, 96525, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100022, 20526, 96526, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100022, 20527, 96527, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100023, 20528, 96528, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100023, 20529, 96529, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100023, 20530, 96530, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100023, 20531, 96531, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100024, 20532, 96532, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100024, 20533, 96533, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100024, 20534, 96534, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100024, 20535, 96535, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100025, 20536, 96536, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100025, 20537, 96537, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100025, 20538, 96538, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100025, 20539, 96539, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100026, 20540, 96540, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100026, 20541, 96541, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100026, 20542, 96542, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100026, 20543, 96543, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100027, 20544, 96544, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100027, 20545, 96545, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100027, 20546, 96546, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100027, 20547, 96547, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100028, 20548, 96548, 10, 0, 1, 0, 1, 1, 'Journeyman Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100028, 20549, 96549, 20, 0, 1, 0, 1, 1, 'Artisan Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100028, 20550, 96550, 30, 0, 1, 0, 1, 1, 'Master Mining Pick Bonus');
INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (100028, 20551, 96551, 40, 0, 1, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Mining creature conditions (per-item with mutual exclusion)

-- Rumbling Earth-Heart - Journeyman Mining Pick conditions (Ref 96500)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96500, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96500, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96500, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96500, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96500, 24189, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96500, 24189, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96500, 24189, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96500, 24189, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rumbling Earth-Heart');

-- Rumbling Earth-Heart - Artisan Mining Pick conditions (Ref 96501)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96501, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96501, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96501, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96501, 24189, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96501, 24189, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96501, 24189, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rumbling Earth-Heart');

-- Rumbling Earth-Heart - Master Mining Pick conditions (Ref 96502)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96502, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96502, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96502, 24189, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96502, 24189, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rumbling Earth-Heart');

-- Rumbling Earth-Heart - Grand Master Mining Pick conditions (Ref 96503)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96503, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rumbling Earth-Heart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96503, 24189, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rumbling Earth-Heart');


-- Tavarok - Journeyman Mining Pick conditions (Ref 96504)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 21929, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 21929, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 21929, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 21929, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23077, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23077, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23077, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23077, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23079, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23079, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23079, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23079, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23107, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23107, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23107, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23107, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23112, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23112, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23112, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23112, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23117, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23117, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23117, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23117, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23425, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23425, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23436, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23436, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23436, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23436, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23437, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23437, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23437, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23437, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23438, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23438, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23438, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23438, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23439, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23439, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23439, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23439, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23440, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23440, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23440, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23440, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23441, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23441, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23441, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96504, 23441, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tavarok');

-- Tavarok - Artisan Mining Pick conditions (Ref 96505)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 21929, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 21929, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 21929, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23077, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23077, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23077, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23079, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23079, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23079, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23107, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23107, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23107, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23112, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23112, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23112, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23117, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23117, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23117, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23425, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23436, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23436, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23436, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23437, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23437, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23437, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23438, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23438, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23438, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23439, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23439, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23439, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23440, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23440, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23440, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23441, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23441, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96505, 23441, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tavarok');

-- Tavarok - Master Mining Pick conditions (Ref 96506)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 21929, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 21929, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23077, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23077, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23079, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23079, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23107, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23107, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23112, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23112, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23117, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23117, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23425, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23436, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23436, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23437, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23437, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23438, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23438, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23439, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23439, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23440, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23440, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23441, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96506, 23441, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tavarok');

-- Tavarok - Grand Master Mining Pick conditions (Ref 96507)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 21929, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23077, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23079, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23107, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23112, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23117, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23425, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23436, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23437, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23438, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23439, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23440, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96507, 23441, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tavarok');


-- Brittle Revenant - Journeyman Mining Pick conditions (Ref 96508)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96508, 37701, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96508, 37701, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96508, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96508, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96508, 39220, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96508, 39220, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96508, 39220, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96508, 39220, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Brittle Revenant');

-- Brittle Revenant - Artisan Mining Pick conditions (Ref 96509)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96509, 37701, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96509, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96509, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96509, 39220, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96509, 39220, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96509, 39220, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Brittle Revenant');

-- Brittle Revenant - Master Mining Pick conditions (Ref 96510)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96510, 37701, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96510, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96510, 39220, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96510, 39220, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Brittle Revenant');

-- Brittle Revenant - Grand Master Mining Pick conditions (Ref 96511)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96511, 37701, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Brittle Revenant');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96511, 39220, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Brittle Revenant');


-- Crystalline Ice Elemental - Journeyman Mining Pick conditions (Ref 96512)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 36728, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 36728, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 36728, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 36728, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 37701, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 37701, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 39220, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 39220, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 39220, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96512, 39220, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Crystalline Ice Elemental');

-- Crystalline Ice Elemental - Artisan Mining Pick conditions (Ref 96513)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 36728, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 36728, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 36728, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 37701, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 39220, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 39220, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96513, 39220, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Crystalline Ice Elemental');

-- Crystalline Ice Elemental - Master Mining Pick conditions (Ref 96514)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96514, 36728, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96514, 36728, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96514, 37701, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96514, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96514, 39220, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96514, 39220, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Crystalline Ice Elemental');

-- Crystalline Ice Elemental - Grand Master Mining Pick conditions (Ref 96515)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96515, 36728, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96515, 37701, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Crystalline Ice Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96515, 39220, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Crystalline Ice Elemental');


-- Heroic Molten Elemental - Journeyman Mining Pick conditions (Ref 96516)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 774, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 774, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 818, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 818, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2770, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2770, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2771, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2771, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2835, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2835, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2836, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2836, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96516, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Heroic Molten Elemental');

-- Heroic Molten Elemental - Artisan Mining Pick conditions (Ref 96517)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 774, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 818, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2770, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2771, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2835, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2836, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96517, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Heroic Molten Elemental');

-- Heroic Molten Elemental - Master Mining Pick conditions (Ref 96518)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 774, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 818, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 2770, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 2771, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 2835, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 2836, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96518, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Heroic Molten Elemental');

-- Heroic Molten Elemental - Grand Master Mining Pick conditions (Ref 96519)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96519, 774, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96519, 818, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96519, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96519, 2770, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96519, 2771, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96519, 2835, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Heroic Molten Elemental');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96519, 2836, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Heroic Molten Elemental');


-- Boulderheart - Journeyman Mining Pick conditions (Ref 96520)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1206, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1206, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2770, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2770, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2771, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2771, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2775, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2775, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2775, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2775, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2836, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2836, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 3857, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 3857, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 3857, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 3857, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 7067, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 7067, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 7067, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96520, 7067, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Boulderheart');

-- Boulderheart - Artisan Mining Pick conditions (Ref 96521)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1206, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2770, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2771, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2775, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2775, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2775, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2836, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 3857, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 3857, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 3857, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 7067, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 7067, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96521, 7067, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Boulderheart');

-- Boulderheart - Master Mining Pick conditions (Ref 96522)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 1206, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 2770, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 2771, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 2775, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 2775, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 2836, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 3857, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 3857, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 7067, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96522, 7067, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Boulderheart');

-- Boulderheart - Grand Master Mining Pick conditions (Ref 96523)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 1206, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 2770, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 2771, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 2775, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 2836, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 3857, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96523, 7067, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Boulderheart');


-- Elemental Slave - Journeyman Mining Pick conditions (Ref 96524)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1206, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1206, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1529, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1529, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2772, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2772, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2772, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2772, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2776, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2776, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2776, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2838, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2838, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2838, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 2838, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 7067, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 7067, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 7067, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96524, 7067, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Elemental Slave');

-- Elemental Slave - Artisan Mining Pick conditions (Ref 96525)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1206, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1529, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2772, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2772, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2772, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2776, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2776, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2838, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2838, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 2838, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 7067, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 7067, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96525, 7067, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Elemental Slave');

-- Elemental Slave - Master Mining Pick conditions (Ref 96526)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 1206, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 1529, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 2772, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 2772, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 2776, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 2838, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 2838, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 7067, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96526, 7067, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Elemental Slave');

-- Elemental Slave - Grand Master Mining Pick conditions (Ref 96527)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96527, 1206, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96527, 1529, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96527, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96527, 2772, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96527, 2776, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96527, 2838, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Elemental Slave');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96527, 7067, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Elemental Slave');


-- Ambershard Crusher - Journeyman Mining Pick conditions (Ref 96528)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 3858, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 3858, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 3858, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 3864, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 3864, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7075, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7075, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7911, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7911, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7911, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7912, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7912, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96528, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ambershard Crusher');

-- Ambershard Crusher - Artisan Mining Pick conditions (Ref 96529)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 3858, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 3858, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 3864, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7075, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7911, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7911, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7912, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96529, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ambershard Crusher');

-- Ambershard Crusher - Master Mining Pick conditions (Ref 96530)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 3858, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 3864, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 7075, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 7909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 7911, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 7912, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96530, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ambershard Crusher');

-- Ambershard Crusher - Grand Master Mining Pick conditions (Ref 96531)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96531, 3858, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96531, 3864, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96531, 7075, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96531, 7909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96531, 7911, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ambershard Crusher');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96531, 7912, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ambershard Crusher');


-- Avalanchion - Journeyman Mining Pick conditions (Ref 96532)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7075, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7075, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7076, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7076, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7076, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7076, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7910, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7910, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 10620, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 10620, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 11370, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 11370, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 11370, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 11382, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 11382, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 11382, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12361, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12361, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12361, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12361, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12363, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12363, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12363, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12363, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12364, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12364, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12364, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12364, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12365, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12365, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12799, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12799, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12799, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12799, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12800, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12800, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12800, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 12800, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 19774, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 19774, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 19774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96532, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Avalanchion');

-- Avalanchion - Artisan Mining Pick conditions (Ref 96533)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7075, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7076, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7076, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7076, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7910, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 10620, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 11370, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 11370, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 11382, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 11382, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12361, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12361, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12361, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12363, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12363, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12363, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12364, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12364, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12364, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12365, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12799, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12799, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12799, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12800, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12800, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 12800, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 19774, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 19774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96533, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Avalanchion');

-- Avalanchion - Master Mining Pick conditions (Ref 96534)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 7075, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 7076, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 7076, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 7910, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 10620, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 11370, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 11382, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12361, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12361, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12363, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12363, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12364, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12364, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12365, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12799, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12799, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12800, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 12800, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 19774, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96534, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Avalanchion');

-- Avalanchion - Grand Master Mining Pick conditions (Ref 96535)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 7075, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 7076, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 7910, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 10620, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 11370, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 11382, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 12361, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 12363, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 12364, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 12365, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 12799, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 12800, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96535, 19774, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Avalanchion');


-- Firesworn - Journeyman Mining Pick conditions (Ref 96536)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7075, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7075, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7076, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7076, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7076, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7076, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7910, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7910, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 10620, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 10620, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 11370, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 11370, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 11370, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 11382, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 11382, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 11382, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12361, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12361, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12361, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12361, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12363, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12363, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12363, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12363, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12364, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12364, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12364, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12364, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12365, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12365, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12799, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12799, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12799, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12799, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12800, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12800, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12800, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 12800, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 17011, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 17011, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 17011, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 17011, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 19774, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 19774, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 19774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96536, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Firesworn');

-- Firesworn - Artisan Mining Pick conditions (Ref 96537)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7075, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7076, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7076, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7076, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7910, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 10620, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 11370, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 11370, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 11382, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 11382, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12361, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12361, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12361, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12363, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12363, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12363, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12364, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12364, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12364, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12365, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12799, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12799, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12799, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12800, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12800, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 12800, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 17011, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 17011, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 17011, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 19774, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 19774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96537, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Firesworn');

-- Firesworn - Master Mining Pick conditions (Ref 96538)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 7075, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 7075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 7076, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 7076, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 7910, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 10620, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 11370, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 11382, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12361, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12361, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12363, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12363, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12364, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12364, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12365, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12799, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12799, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12800, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 12800, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 17011, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 17011, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 19774, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96538, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Firesworn');

-- Firesworn - Grand Master Mining Pick conditions (Ref 96539)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 7075, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 7076, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 7910, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 10620, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 11370, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 11382, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 12361, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 12363, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 12364, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 12365, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 12799, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 12800, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 17011, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96539, 19774, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Firesworn');


-- Crystalhide Colossus - Journeyman Mining Pick conditions (Ref 96540)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 22574, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 22574, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 23424, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 23424, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 23424, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 23424, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 23427, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 23427, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96540, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Crystalhide Colossus');

-- Crystalhide Colossus - Artisan Mining Pick conditions (Ref 96541)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 22574, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 23424, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 23424, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 23424, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 23427, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96541, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Crystalhide Colossus');

-- Crystalhide Colossus - Master Mining Pick conditions (Ref 96542)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96542, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96542, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96542, 22574, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96542, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96542, 23424, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96542, 23424, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96542, 23427, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96542, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Crystalhide Colossus');

-- Crystalhide Colossus - Grand Master Mining Pick conditions (Ref 96543)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96543, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96543, 22574, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96543, 23424, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Crystalhide Colossus');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96543, 23427, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Crystalhide Colossus');


-- Apex - Journeyman Mining Pick conditions (Ref 96544)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 22574, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 22574, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 23425, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 23425, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 23427, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 23427, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96544, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apex');

-- Apex - Artisan Mining Pick conditions (Ref 96545)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 22574, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 23425, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 23427, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96545, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apex');

-- Apex - Master Mining Pick conditions (Ref 96546)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96546, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96546, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96546, 22574, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96546, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96546, 23425, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96546, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96546, 23427, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96546, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apex');

-- Apex - Grand Master Mining Pick conditions (Ref 96547)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96547, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96547, 22574, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96547, 23425, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apex');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96547, 23427, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apex');


-- Apexis Guardian - Journeyman Mining Pick conditions (Ref 96548)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 22574, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 22574, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23425, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23425, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23426, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23426, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23426, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23426, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23427, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23427, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96548, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Apexis Guardian');

-- Apexis Guardian - Artisan Mining Pick conditions (Ref 96549)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 22574, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23425, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23426, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23426, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23426, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23427, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96549, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Apexis Guardian');

-- Apexis Guardian - Master Mining Pick conditions (Ref 96550)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 22574, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 23425, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 23426, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 23426, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 23427, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96550, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Apexis Guardian');

-- Apexis Guardian - Grand Master Mining Pick conditions (Ref 96551)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96551, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96551, 22574, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96551, 23425, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96551, 23426, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apexis Guardian');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 96551, 23427, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Apexis Guardian');


-- Done!
