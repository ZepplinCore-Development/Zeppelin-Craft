-- Found 10 unique prospecting loot tables

-- =====================================================
-- JEWELER'S KIT BONUS YIELD SYSTEM (prospecting)
-- =====================================================
-- Reference loot tables that duplicate prospecting loot
-- Provides a bonus 'second roll' when prospecting with a Jeweler's Kit
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 97000 AND 97999;
DELETE FROM prospecting_loot_template WHERE Reference BETWEEN 97000 AND 97999;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 97000 AND 97999;

-- Copper Ore (Entry: 2770)
-- Copper Ore - Journeyman Jeweler's Kit Bonus (Ref 97000)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97000, 774, 0, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97000, 818, 0, 0.0, 1, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97000, 1210, 0, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');

-- Copper Ore - Artisan Jeweler's Kit Bonus (Ref 97001)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97001, 774, 0, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97001, 818, 0, 0.0, 1, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97001, 1210, 0, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');

-- Copper Ore - Master Jeweler's Kit Bonus (Ref 97002)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97002, 774, 0, 0.0, 1, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97002, 818, 0, 0.0, 1, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97002, 1210, 0, 10.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');

-- Copper Ore - Grand Master Jeweler's Kit Bonus (Ref 97003)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97003, 774, 0, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97003, 818, 0, 0.0, 1, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97003, 1210, 0, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');


-- Tin Ore (Entry: 2771)
-- Tin Ore - Journeyman Jeweler's Kit Bonus (Ref 97004)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97004, 90000000, 13000, 10.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97004, 1206, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97004, 1210, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97004, 1705, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');

-- Tin Ore - Artisan Jeweler's Kit Bonus (Ref 97005)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97005, 90000000, 13000, 10.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97005, 1206, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97005, 1210, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97005, 1705, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');

-- Tin Ore - Master Jeweler's Kit Bonus (Ref 97006)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97006, 90000000, 13000, 10.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97006, 1206, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97006, 1210, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97006, 1705, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');

-- Tin Ore - Grand Master Jeweler's Kit Bonus (Ref 97007)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97007, 90000000, 13000, 10.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97007, 1206, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97007, 1210, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97007, 1705, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');


-- Iron Ore (Entry: 2772)
-- Iron Ore - Journeyman Jeweler's Kit Bonus (Ref 97008)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97008, 1529, 0, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97008, 1705, 0, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97008, 3864, 0, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97008, 7909, 0, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97008, 7910, 0, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');

-- Iron Ore - Artisan Jeweler's Kit Bonus (Ref 97009)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97009, 1529, 0, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97009, 1705, 0, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97009, 3864, 0, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97009, 7909, 0, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97009, 7910, 0, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');

-- Iron Ore - Master Jeweler's Kit Bonus (Ref 97010)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97010, 1529, 0, 30.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97010, 1705, 0, 30.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97010, 3864, 0, 30.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97010, 7909, 0, 5.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97010, 7910, 0, 5.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');

-- Iron Ore - Grand Master Jeweler's Kit Bonus (Ref 97011)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97011, 1529, 0, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97011, 1705, 0, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97011, 3864, 0, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97011, 7909, 0, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97011, 7910, 0, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');


-- Mithril Ore (Entry: 3858)
-- Mithril Ore - Journeyman Jeweler's Kit Bonus (Ref 97012)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97012, 3864, 0, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97012, 7909, 0, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97012, 7910, 0, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97012, 12361, 0, 2.5, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97012, 12364, 0, 2.5, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97012, 12799, 0, 2.5, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97012, 12800, 0, 2.5, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');

-- Mithril Ore - Artisan Jeweler's Kit Bonus (Ref 97013)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97013, 3864, 0, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97013, 7909, 0, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97013, 7910, 0, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97013, 12361, 0, 2.5, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97013, 12364, 0, 2.5, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97013, 12799, 0, 2.5, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97013, 12800, 0, 2.5, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');

-- Mithril Ore - Master Jeweler's Kit Bonus (Ref 97014)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97014, 3864, 0, 30.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97014, 7909, 0, 30.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97014, 7910, 0, 30.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97014, 12361, 0, 2.5, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97014, 12364, 0, 2.5, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97014, 12799, 0, 2.5, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97014, 12800, 0, 2.5, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');

-- Mithril Ore - Grand Master Jeweler's Kit Bonus (Ref 97015)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97015, 3864, 0, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97015, 7909, 0, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97015, 7910, 0, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97015, 12361, 0, 2.5, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97015, 12364, 0, 2.5, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97015, 12799, 0, 2.5, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97015, 12800, 0, 2.5, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');


-- Thorium Ore (Entry: 10620)
-- Thorium Ore - Journeyman Jeweler's Kit Bonus (Ref 97016)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97016, 7910, 0, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97016, 12361, 0, 15.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97016, 12364, 0, 15.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97016, 12799, 0, 15.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97016, 12800, 0, 15.0, 0, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');

-- Thorium Ore - Artisan Jeweler's Kit Bonus (Ref 97017)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97017, 7910, 0, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97017, 12361, 0, 15.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97017, 12364, 0, 15.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97017, 12799, 0, 15.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97017, 12800, 0, 15.0, 0, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');

-- Thorium Ore - Master Jeweler's Kit Bonus (Ref 97018)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97018, 7910, 0, 30.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97018, 12361, 0, 15.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97018, 12364, 0, 15.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97018, 12799, 0, 15.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97018, 12800, 0, 15.0, 0, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');

-- Thorium Ore - Grand Master Jeweler's Kit Bonus (Ref 97019)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97019, 7910, 0, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97019, 12361, 0, 15.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97019, 12364, 0, 15.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97019, 12799, 0, 15.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97019, 12800, 0, 15.0, 0, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');


-- Fel Iron Ore (Entry: 23424)
-- Fel Iron Ore - Journeyman Jeweler's Kit Bonus (Ref 97020)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 21929, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23077, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23079, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23107, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23112, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23117, 0, 0.0, 1, 0, 1, 2, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23436, 0, 4.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23437, 0, 4.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23438, 0, 4.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23439, 0, 4.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23440, 0, 4.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97020, 23441, 0, 4.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');

-- Fel Iron Ore - Artisan Jeweler's Kit Bonus (Ref 97021)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 21929, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23077, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23079, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23107, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23112, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23117, 0, 0.0, 1, 0, 1, 2, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23436, 0, 4.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23437, 0, 4.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23438, 0, 4.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23439, 0, 4.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23440, 0, 4.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97021, 23441, 0, 4.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');

-- Fel Iron Ore - Master Jeweler's Kit Bonus (Ref 97022)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 21929, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23077, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23079, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23107, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23112, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23117, 0, 0.0, 1, 0, 1, 2, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23436, 0, 4.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23437, 0, 4.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23438, 0, 4.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23439, 0, 4.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23440, 0, 4.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97022, 23441, 0, 4.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');

-- Fel Iron Ore - Grand Master Jeweler's Kit Bonus (Ref 97023)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 21929, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23077, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23079, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23107, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23112, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23117, 0, 0.0, 1, 0, 1, 2, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23436, 0, 4.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23437, 0, 4.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23438, 0, 4.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23439, 0, 4.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23440, 0, 4.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97023, 23441, 0, 4.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');


-- Adamantite Ore (Entry: 23425)
-- Adamantite Ore - Journeyman Jeweler's Kit Bonus (Ref 97024)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97024, 90000000, 13001, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97024, 90000001, 13002, 24.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97024, 90000002, 13001, 15.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97024, 24243, 0, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');

-- Adamantite Ore - Artisan Jeweler's Kit Bonus (Ref 97025)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97025, 90000000, 13001, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97025, 90000001, 13002, 24.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97025, 90000002, 13001, 15.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97025, 24243, 0, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');

-- Adamantite Ore - Master Jeweler's Kit Bonus (Ref 97026)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97026, 90000000, 13001, 100.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97026, 90000001, 13002, 24.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97026, 90000002, 13001, 15.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97026, 24243, 0, 100.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');

-- Adamantite Ore - Grand Master Jeweler's Kit Bonus (Ref 97027)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97027, 90000000, 13001, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97027, 90000001, 13002, 24.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97027, 90000002, 13001, 15.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97027, 24243, 0, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');


-- Cobalt Ore (Entry: 36909)
-- Cobalt Ore - Journeyman Jeweler's Kit Bonus (Ref 97028)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97028, 90000000, 1001, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');

-- Cobalt Ore - Artisan Jeweler's Kit Bonus (Ref 97029)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97029, 90000000, 1001, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');

-- Cobalt Ore - Master Jeweler's Kit Bonus (Ref 97030)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97030, 90000000, 1001, 100.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');

-- Cobalt Ore - Grand Master Jeweler's Kit Bonus (Ref 97031)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97031, 90000000, 1001, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');


-- Titanium Ore (Entry: 36910)
-- Titanium Ore - Journeyman Jeweler's Kit Bonus (Ref 97032)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97032, 90000000, 13005, 20.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97032, 90000001, 1002, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97032, 90000002, 1003, 75.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97032, 46849, 0, 75.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');

-- Titanium Ore - Artisan Jeweler's Kit Bonus (Ref 97033)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97033, 90000000, 13005, 20.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97033, 90000001, 1002, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97033, 90000002, 1003, 75.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97033, 46849, 0, 75.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');

-- Titanium Ore - Master Jeweler's Kit Bonus (Ref 97034)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97034, 90000000, 13005, 20.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97034, 90000001, 1002, 100.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97034, 90000002, 1003, 75.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97034, 46849, 0, 75.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');

-- Titanium Ore - Grand Master Jeweler's Kit Bonus (Ref 97035)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97035, 90000000, 13005, 20.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97035, 90000001, 1002, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97035, 90000002, 1003, 75.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97035, 46849, 0, 75.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');


-- Saronite Ore (Entry: 36912)
-- Saronite Ore - Journeyman Jeweler's Kit Bonus (Ref 97036)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97036, 90000000, 1003, 85.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97036, 90000001, 1004, 100.0, 0, 0, 1, 1, 'Bonus from Journeyman Jeweler''s Kit');

-- Saronite Ore - Artisan Jeweler's Kit Bonus (Ref 97037)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97037, 90000000, 1003, 85.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97037, 90000001, 1004, 100.0, 0, 0, 1, 1, 'Bonus from Artisan Jeweler''s Kit');

-- Saronite Ore - Master Jeweler's Kit Bonus (Ref 97038)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97038, 90000000, 1003, 85.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97038, 90000001, 1004, 100.0, 0, 0, 1, 1, 'Bonus from Master Jeweler''s Kit');

-- Saronite Ore - Grand Master Jeweler's Kit Bonus (Ref 97039)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97039, 90000000, 1003, 85.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (97039, 90000001, 1004, 100.0, 0, 0, 1, 1, 'Bonus from Grand Master Jeweler''s Kit');


-- =====================================================
-- LINK REFERENCES TO PROSPECTING_LOOT_TEMPLATE
-- =====================================================

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2770, 10000, 97000, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2770, 10001, 97001, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2770, 10002, 97002, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2770, 10003, 97003, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2771, 10004, 97004, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2771, 10005, 97005, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2771, 10006, 97006, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2771, 10007, 97007, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2772, 10008, 97008, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2772, 10009, 97009, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2772, 10010, 97010, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (2772, 10011, 97011, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3858, 10012, 97012, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3858, 10013, 97013, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3858, 10014, 97014, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (3858, 10015, 97015, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (10620, 10016, 97016, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (10620, 10017, 97017, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (10620, 10018, 97018, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (10620, 10019, 97019, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (23424, 10020, 97020, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (23424, 10021, 97021, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (23424, 10022, 97022, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (23424, 10023, 97023, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (23425, 10024, 97024, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (23425, 10025, 97025, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (23425, 10026, 97026, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (23425, 10027, 97027, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36909, 10028, 97028, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36909, 10029, 97029, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36909, 10030, 97030, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36909, 10031, 97031, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36910, 10032, 97032, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36910, 10033, 97033, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36910, 10034, 97034, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36910, 10035, 97035, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36912, 10036, 97036, 10, 0, 1, 0, 1, 1, 'Journeyman Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36912, 10037, 97037, 20, 0, 1, 0, 1, 1, 'Artisan Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36912, 10038, 97038, 30, 0, 1, 0, 1, 1, 'Master Jeweler''s Kit Bonus');
INSERT INTO prospecting_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
    (36912, 10039, 97039, 40, 0, 1, 0, 1, 1, 'Grand Master Jeweler''s Kit Bonus');

-- =====================================================
-- CONDITIONS (Check for active Jeweler's Kit auras)
-- Mutually exclusive: a tier bonus rolls only if that tier
-- is active AND no higher tier is active (no stacking).
-- =====================================================

-- Copper Ore - Journeyman Jeweler's Kit conditions (Ref 97000)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 774, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 774, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 774, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 774, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 818, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 818, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 818, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 818, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 1210, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 1210, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 1210, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97000, 1210, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Ore');

-- Copper Ore - Artisan Jeweler's Kit conditions (Ref 97001)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 774, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 774, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 774, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 818, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 818, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 818, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 1210, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 1210, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97001, 1210, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Ore');

-- Copper Ore - Master Jeweler's Kit conditions (Ref 97002)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97002, 774, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97002, 774, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97002, 818, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97002, 818, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97002, 1210, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97002, 1210, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Copper Ore');

-- Copper Ore - Grand Master Jeweler's Kit conditions (Ref 97003)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97003, 774, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97003, 818, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Copper Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97003, 1210, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Copper Ore');


-- Tin Ore - Journeyman Jeweler's Kit conditions (Ref 97004)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 90000000, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 90000000, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1206, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1206, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1206, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1206, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1210, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1210, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1210, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1210, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1705, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1705, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1705, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97004, 1705, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Ore');

-- Tin Ore - Artisan Jeweler's Kit conditions (Ref 97005)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 90000000, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1206, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1206, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1206, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1210, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1210, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1210, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1705, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1705, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97005, 1705, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Ore');

-- Tin Ore - Master Jeweler's Kit conditions (Ref 97006)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97006, 90000000, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97006, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97006, 1206, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97006, 1206, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97006, 1210, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97006, 1210, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97006, 1705, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97006, 1705, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Tin Ore');

-- Tin Ore - Grand Master Jeweler's Kit conditions (Ref 97007)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97007, 90000000, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97007, 1206, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97007, 1210, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Tin Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97007, 1705, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Tin Ore');


-- Iron Ore - Journeyman Jeweler's Kit conditions (Ref 97008)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 1529, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 1529, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 1529, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 1529, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 1705, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 1705, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 1705, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 1705, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 3864, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 3864, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 3864, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 3864, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 7909, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 7909, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 7909, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 7909, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 7910, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 7910, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 7910, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97008, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Ore');

-- Iron Ore - Artisan Jeweler's Kit conditions (Ref 97009)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 1529, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 1529, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 1529, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 1705, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 1705, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 1705, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 3864, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 3864, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 3864, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 7909, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 7909, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 7909, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 7910, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 7910, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97009, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Ore');

-- Iron Ore - Master Jeweler's Kit conditions (Ref 97010)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 1529, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 1529, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 1705, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 1705, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 3864, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 3864, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 7909, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 7909, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 7910, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97010, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Iron Ore');

-- Iron Ore - Grand Master Jeweler's Kit conditions (Ref 97011)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97011, 1529, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97011, 1705, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97011, 3864, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97011, 7909, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97011, 7910, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Iron Ore');


-- Mithril Ore - Journeyman Jeweler's Kit conditions (Ref 97012)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 3864, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 3864, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 3864, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 3864, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 7909, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 7909, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 7909, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 7909, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 7910, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 7910, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 7910, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12361, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12361, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12361, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12361, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12364, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12364, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12364, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12364, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12799, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12799, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12799, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12799, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12800, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12800, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12800, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97012, 12800, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Ore');

-- Mithril Ore - Artisan Jeweler's Kit conditions (Ref 97013)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 3864, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 3864, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 3864, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 7909, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 7909, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 7909, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 7910, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 7910, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12361, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12361, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12361, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12364, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12364, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12364, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12799, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12799, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12799, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12800, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12800, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97013, 12800, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Ore');

-- Mithril Ore - Master Jeweler's Kit conditions (Ref 97014)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 3864, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 3864, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 7909, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 7909, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 7910, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 12361, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 12361, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 12364, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 12364, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 12799, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 12799, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 12800, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97014, 12800, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Mithril Ore');

-- Mithril Ore - Grand Master Jeweler's Kit conditions (Ref 97015)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97015, 3864, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97015, 7909, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97015, 7910, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97015, 12361, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97015, 12364, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97015, 12799, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Mithril Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97015, 12800, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Mithril Ore');


-- Thorium Ore - Journeyman Jeweler's Kit conditions (Ref 97016)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 7910, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 7910, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 7910, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12361, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12361, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12361, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12361, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12364, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12364, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12364, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12364, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12799, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12799, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12799, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12799, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12800, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12800, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12800, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97016, 12800, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Thorium Ore');

-- Thorium Ore - Artisan Jeweler's Kit conditions (Ref 97017)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 7910, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 7910, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12361, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12361, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12361, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12364, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12364, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12364, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12799, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12799, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12799, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12800, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12800, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97017, 12800, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Thorium Ore');

-- Thorium Ore - Master Jeweler's Kit conditions (Ref 97018)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 7910, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 7910, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 12361, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 12361, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 12364, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 12364, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 12799, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 12799, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 12800, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97018, 12800, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Thorium Ore');

-- Thorium Ore - Grand Master Jeweler's Kit conditions (Ref 97019)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97019, 7910, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97019, 12361, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97019, 12364, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97019, 12799, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Thorium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97019, 12800, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Thorium Ore');


-- Fel Iron Ore - Journeyman Jeweler's Kit conditions (Ref 97020)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 21929, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 21929, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 21929, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 21929, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23077, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23077, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23077, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23077, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23079, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23079, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23079, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23079, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23107, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23107, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23107, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23107, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23112, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23112, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23112, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23112, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23117, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23117, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23117, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23117, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23436, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23436, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23436, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23436, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23437, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23437, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23437, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23437, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23438, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23438, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23438, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23438, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23439, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23439, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23439, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23439, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23440, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23440, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23440, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23440, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23441, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23441, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23441, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97020, 23441, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Ore');

-- Fel Iron Ore - Artisan Jeweler's Kit conditions (Ref 97021)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 21929, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 21929, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 21929, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23077, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23077, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23077, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23079, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23079, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23079, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23107, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23107, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23107, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23112, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23112, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23112, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23117, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23117, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23117, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23436, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23436, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23436, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23437, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23437, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23437, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23438, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23438, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23438, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23439, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23439, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23439, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23440, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23440, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23440, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23441, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23441, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97021, 23441, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Ore');

-- Fel Iron Ore - Master Jeweler's Kit conditions (Ref 97022)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 21929, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 21929, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23077, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23077, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23079, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23079, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23107, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23107, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23112, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23112, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23117, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23117, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23436, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23436, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23437, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23437, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23438, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23438, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23439, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23439, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23440, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23440, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23441, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97022, 23441, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Ore');

-- Fel Iron Ore - Grand Master Jeweler's Kit conditions (Ref 97023)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 21929, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23077, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23079, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23107, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23112, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23117, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23436, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23437, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23438, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23439, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23440, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97023, 23441, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Fel Iron Ore');


-- Adamantite Ore - Journeyman Jeweler's Kit conditions (Ref 97024)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000000, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000000, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000001, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000001, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000001, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000002, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000002, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000002, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 90000002, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 24243, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 24243, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 24243, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97024, 24243, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Adamantite Ore');

-- Adamantite Ore - Artisan Jeweler's Kit conditions (Ref 97025)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000000, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000001, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000001, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000002, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000002, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 90000002, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 24243, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 24243, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97025, 24243, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Adamantite Ore');

-- Adamantite Ore - Master Jeweler's Kit conditions (Ref 97026)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97026, 90000000, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97026, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97026, 90000001, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97026, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97026, 90000002, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97026, 90000002, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97026, 24243, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97026, 24243, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Adamantite Ore');

-- Adamantite Ore - Grand Master Jeweler's Kit conditions (Ref 97027)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97027, 90000000, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97027, 90000001, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97027, 90000002, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Adamantite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97027, 24243, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Adamantite Ore');


-- Cobalt Ore - Journeyman Jeweler's Kit conditions (Ref 97028)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97028, 90000000, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Cobalt Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97028, 90000000, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Cobalt Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97028, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Cobalt Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97028, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Cobalt Ore');

-- Cobalt Ore - Artisan Jeweler's Kit conditions (Ref 97029)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97029, 90000000, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Cobalt Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97029, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Cobalt Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97029, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Cobalt Ore');

-- Cobalt Ore - Master Jeweler's Kit conditions (Ref 97030)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97030, 90000000, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Cobalt Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97030, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Cobalt Ore');

-- Cobalt Ore - Grand Master Jeweler's Kit conditions (Ref 97031)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97031, 90000000, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Cobalt Ore');


-- Titanium Ore - Journeyman Jeweler's Kit conditions (Ref 97032)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000000, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000000, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000001, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000001, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000001, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000002, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000002, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000002, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 90000002, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 46849, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 46849, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 46849, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97032, 46849, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Ore');

-- Titanium Ore - Artisan Jeweler's Kit conditions (Ref 97033)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000000, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000001, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000001, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000002, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000002, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 90000002, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 46849, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 46849, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97033, 46849, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Ore');

-- Titanium Ore - Master Jeweler's Kit conditions (Ref 97034)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97034, 90000000, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97034, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97034, 90000001, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97034, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97034, 90000002, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97034, 90000002, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97034, 46849, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97034, 46849, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Titanium Ore');

-- Titanium Ore - Grand Master Jeweler's Kit conditions (Ref 97035)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97035, 90000000, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97035, 90000001, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97035, 90000002, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Titanium Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97035, 46849, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Titanium Ore');


-- Saronite Ore - Journeyman Jeweler's Kit conditions (Ref 97036)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97036, 90000000, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97036, 90000000, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97036, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97036, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97036, 90000001, 0, 0, 1, 0, 91244, 0, 0, 0, 'Journeyman Jeweler''s Kit - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97036, 90000001, 0, 0, 1, 0, 91245, 0, 0, 1, 'Block Journeyman if Artisan active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97036, 90000001, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Journeyman if Master active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97036, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Journeyman if Grand Master active - Saronite Ore');

-- Saronite Ore - Artisan Jeweler's Kit conditions (Ref 97037)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97037, 90000000, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97037, 90000000, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97037, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97037, 90000001, 0, 0, 1, 0, 91245, 0, 0, 0, 'Artisan Jeweler''s Kit - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97037, 90000001, 0, 0, 1, 0, 91246, 0, 0, 1, 'Block Artisan if Master active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97037, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Artisan if Grand Master active - Saronite Ore');

-- Saronite Ore - Master Jeweler's Kit conditions (Ref 97038)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97038, 90000000, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97038, 90000000, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97038, 90000001, 0, 0, 1, 0, 91246, 0, 0, 0, 'Master Jeweler''s Kit - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97038, 90000001, 0, 0, 1, 0, 91247, 0, 0, 1, 'Block Master if Grand Master active - Saronite Ore');

-- Saronite Ore - Grand Master Jeweler's Kit conditions (Ref 97039)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97039, 90000000, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Saronite Ore');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 97039, 90000001, 0, 0, 1, 0, 91247, 0, 0, 0, 'Grand Master Jeweler''s Kit - Saronite Ore');


-- Done!
